//
//  HYRDetailSubView.m
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/28.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
//

#import "HYRDetailSubView.h"
#import "UIView+Category.h"
#import "HYRStepCell.h"
#import "HYRStep.h"

@interface HYRDetailSubView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UILabel * headerL;
@property (nonatomic,strong)UIView * detailView;
@end



@implementation HYRDetailSubView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        [self.layer setShadowRadius:3];
        self.layer.masksToBounds = YES;
        [self setupUI];
    }
    return self;
}

//设置界面
-(void)setupUI{
    UILabel * headerL = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.width, LABELHEIGHT)];
    headerL.textColor = [UIColor whiteColor];
    headerL.font = [UIFont boldSystemFontOfSize:17];
    [self addSubview:headerL];
    self.headerL = headerL;
    
    UIView * detailView = [[UIView alloc]initWithFrame:CGRectMake(0, headerL.y+headerL.height, self.width, 0)];
    [self addSubview:detailView];
    _detailView = detailView;
}

//setter方法
-(void)setText:(NSString *)text{
    _text = text;
    UILabel * detailLabel = [[UILabel alloc]init];
    detailLabel.text = text;
    
    CGSize burdenSize = [text boundingRectWithSize:CGSizeMake(self.width - 2*kGap, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:DETAILFONT} context:nil].size;
    
    detailLabel.frame = CGRectMake(kGap, 0, self.width - 2*kGap , burdenSize.height + 2*kGap);
    
    detailLabel.font = DETAILFONT;
    detailLabel.numberOfLines = 0;
    [_detailView addSubview:detailLabel];
    _detailView.height = detailLabel.y + detailLabel.height;
    
    self.height = _detailView.y + _detailView.height;
}


-(void)setType:(NSInteger)type{
    _type = type;
    switch (type) {
        case 1:
            _headerL.backgroundColor = [UIColor colorWithRed:0.35f green:0.78f blue:0.89f alpha:1.00f];
            _headerL.text = @"  食材：";
            break;
        case 2:
            _headerL.backgroundColor = [UIColor colorWithRed:0.93f green:0.52f blue:0.71f alpha:1.00f];
            _headerL.text = @"  调料：";
            break;
        case 3:
            _headerL.backgroundColor = [UIColor colorWithRed:0.96f green:0.65f blue:0.14f alpha:1.00f];
            _headerL.text = @"  做法步骤：";
            break;
        default:
            break;
    }
}


//显示步骤
-(void)setSteps:(NSArray *)steps{
    _steps = steps;
    CGFloat allHeight = 0;
   //遍历所有的步骤 
    for (HYRStep * step in steps) {
        CGFloat height = [HYRStepCell getCellHeightWithStep:step.step];
        if (height > 85) {
            allHeight += (height + 10);
        }
        else{
            allHeight += 95;
        }
    }
    //
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.width, allHeight) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.scrollEnabled = NO;
    //    tableView.userInteractionEnabled = NO;
    [_detailView addSubview:tableView];
    _detailView.height = tableView.height;
    self.height = _detailView.y + _detailView.height;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _steps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HYRStepCell * cell = [tableView dequeueReusableCellWithIdentifier:@"step"];
    if (!cell) {
        cell = [[HYRStepCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"step"];
    }
    
    cell.step = _steps[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.num = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    HYRStep *step = _steps[indexPath.row];
    CGFloat height = [HYRStepCell getCellHeightWithStep:step.step];
    //
    if (height > 85) {
        return (height + 10);
    }
    else{
        return 95;
    }
}



@end
