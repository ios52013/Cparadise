//
//  HYRStepCell.m
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/29.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
//

#import "HYRStepCell.h"
#import <UIImageView+WebCache.h>
#import "UIView+Category.h"

@interface HYRStepCell ()
@property (nonatomic, strong) UILabel *stepLabel;

@end


@implementation HYRStepCell
//初始化方法
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return  self;
}

//设置界面
-(void)setupUI{
    UIImageView * stepImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 135, 85)];
    stepImageView.userInteractionEnabled = YES;
    //添加点击手势
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [stepImageView addGestureRecognizer:tap];
    [self.contentView addSubview:stepImageView];
    _stepImageView = stepImageView;
    
    //创建一个label
    UILabel * stepL = [[UILabel alloc]initWithFrame:CGRectMake(stepImageView.x + stepImageView.width + 5, 5, kWidth - (stepImageView.x + stepImageView.width + 25), 0)];
    stepL.font = DETAILFONT;
    stepL.numberOfLines = 0;
    _stepLabel = stepL;
    [self.contentView addSubview:stepL];
}

//step步骤的setter方法
-(void)setStep:(HYRStep *)step{
    _step = step;
    _stepLabel.text = step.step;
    _stepLabel.height = [HYRStepCell getCellHeightWithStep:step.step];
    if(_stepLabel.height > 85)
        _stepImageView.height = _stepLabel.height;
    [_stepImageView sd_setImageWithURL:[NSURL URLWithString:step.img] placeholderImage:nil];
}

+(CGFloat)getCellHeightWithStep:(NSString *)step{
    CGSize size = [step boundingRectWithSize:CGSizeMake(LWIDTH, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:DETAILFONT} context:nil].size;
    return size.height;
}

//手势触发的方法
-(void)tapAction:(UITapGestureRecognizer*)tap{
    [[NSNotificationCenter defaultCenter]postNotificationName:StepImageClickNotification object:nil userInfo:@{@"img":_step.img,@"num":_num,@"view":self}];
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
