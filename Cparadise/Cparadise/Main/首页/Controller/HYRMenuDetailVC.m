//
//  HYRMenuDetailVC.m
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/28.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
//

#import "HYRMenuDetailVC.h"
#import "HYRDetailScrollView.h"
#import "HYRStep.h"
#import "HYRStepCell.h"
#import <UIImageView+WebCache.h>
#import "UIView+Category.h"


@interface HYRMenuDetailVC ()<UIScrollViewDelegate>

@property (nonatomic,strong)UIButton * collectButton;
@property (nonatomic,strong)UIBarButtonItem * collectButtonItem;
@property (nonatomic,strong)UIScrollView * stepsScrollView;
@property (nonatomic,strong)UITextView * stepTV;
@property (nonatomic,strong)UILabel * stepCountLabel;
@property (nonatomic,strong)UIView * blackView;
@property (nonatomic,strong)UIView * shadowView;
@property (nonatomic,assign,getter=isCollected)BOOL collected;

@end

@implementation HYRMenuDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    [self initData];
    [self createUI];
}

//初始化数据
-(void)initData{
    //监听通知
   [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(stepImageClick:) name:StepImageClickNotification object:nil];
    //
    self.title = self.menu.title;
    UIView * temp = [[UIView alloc]initWithFrame:CGRectZero];
    //[self.view addSubview:temp];
    
}

//创建界面
-(void)createUI{
    
    [self createMainView];
}

//
-(void)createMainView{
    HYRDetailScrollView * scrollView = [[HYRDetailScrollView alloc]initWithFrame:CGRectMake(0, 64, kWidth, kHeight - 64)];
    [self.view addSubview:scrollView];
    scrollView.menu = _menu;
    
    _shadowView = [[UIView alloc]initWithFrame:self.view.bounds];
    _shadowView.backgroundColor = [UIColor blackColor];
    _shadowView.hidden = YES;
    [self.view addSubview:_shadowView];
    
    //用来装 步骤的描述 和 步骤的数量的
    _blackView = [[UIView alloc]initWithFrame:self.view.bounds];
    _blackView.backgroundColor = [UIColor blackColor];
    _blackView.hidden = YES;
    [self.view addSubview:_blackView];
    
    //显示步骤的描述
    _stepTV = [[UITextView alloc]initWithFrame:CGRectMake(10, kHeight - 100, kWidth - 20, 90)];
    _stepTV.editable = NO;
    _stepTV.selectable = NO;
    _stepTV.textAlignment = NSTextAlignmentLeft;
    _stepTV.font = [UIFont boldSystemFontOfSize:16];
    _stepTV.textColor = [UIColor whiteColor];
    _stepTV.backgroundColor = [UIColor clearColor];
    [_blackView addSubview:_stepTV];
    
    //步骤的数量
    _stepCountLabel = [[UILabel alloc]initWithFrame:CGRectMake(10,20, kWidth - 20, 30)];
    _stepCountLabel.backgroundColor = [UIColor clearColor];
    _stepCountLabel.textAlignment = NSTextAlignmentCenter;
    _stepCountLabel.font = [UIFont boldSystemFontOfSize:16];
    _stepCountLabel.textColor = [UIColor whiteColor];
    [_blackView addSubview:_stepCountLabel];
}


//点击某一个步骤的图片 发生的通知调用的方法
-(void)stepImageClick:(NSNotification*)noti{
    NSLog(@"%@",noti.userInfo);
    HYRStepCell * cell = noti.userInfo[@"view"];
    CGRect frame = [cell convertRect:cell.stepImageView.frame toView:self.view];
    __block UIImageView * tempImageView = [[UIImageView alloc]initWithFrame:frame];
    [tempImageView sd_setImageWithURL:[NSURL URLWithString:noti.userInfo[@"img"]]];
    self.navigationController.navigationBarHidden = YES;
    [self.view addSubview:tempImageView];
    
    _stepCountLabel.text = [NSString stringWithFormat:@"%d/%ld",[noti.userInfo[@"num"]intValue]+1,_menu.steps.count];
    HYRStep * step =_menu.steps[[noti.userInfo[@"num"]integerValue]] ;
    _stepTV.text = step.step;
    _shadowView.hidden= NO;
    
    //动画
    [UIView animateWithDuration:0.5 animations:^{
        tempImageView.width = kWidth;
        tempImageView.height = kWidth * tempImageView.image.size.height / tempImageView.image.size.width;
        tempImageView.center = self.view.center;
    } completion:^(BOOL finished) {
        _blackView.hidden = NO;
        [tempImageView removeFromSuperview];
        tempImageView = nil;
        [self createStepsScrollViewWithDict:noti.userInfo];
    }];
}

//
-(void)createStepsScrollViewWithDict:(NSDictionary*)dic{
    if (_stepsScrollView) {
        //        _stepsScrollView.hidden = NO;
        _stepsScrollView.contentOffset = CGPointMake(kWidth * [dic[@"num"] integerValue], 0);
    }
    else{
        _stepsScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 100, kWidth, kHeight - 100 - 100)];
        //        _stepsScrollView.backgroundColor = [UIColor redColor];
        for (int i = 0; i < _menu.steps.count; i ++) {
            
            HYRStep * step = _menu.steps[i];
            UIImageView * imageView =[[UIImageView alloc]initWithFrame:CGRectMake(i * kWidth, 0, kWidth, 0)];
            [imageView sd_setImageWithURL:[NSURL URLWithString:step.img]];
            imageView.height = kWidth * imageView.image.size.height / imageView.image.size.width;
            imageView.y = (_stepsScrollView.height - imageView.height)/2;
            imageView.userInteractionEnabled = YES;
            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
            [imageView addGestureRecognizer:tap];
            [_stepsScrollView addSubview:imageView];
        }
        _stepsScrollView.contentSize = CGSizeMake(kWidth * _menu.steps.count, 0);
        _stepsScrollView.contentOffset = CGPointMake(kWidth * [dic[@"num"] integerValue], 0);
        _stepsScrollView.pagingEnabled = YES;
        _stepsScrollView.delegate = self;
        _stepsScrollView.showsHorizontalScrollIndicator = NO;
        _stepsScrollView.showsVerticalScrollIndicator = NO;
        [self.blackView addSubview:_stepsScrollView];
    }
}


-(void)tapAction:(UITapGestureRecognizer*)tap{
    _shadowView.hidden = YES;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = [NSNumber numberWithFloat:1.0];
    animation.toValue = [NSNumber numberWithFloat:0.1];
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:2 * M_PI];
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 0.5;
    group.repeatCount = 1;
    group.animations = [NSArray arrayWithObjects:animation, rotateAnimation, nil];
    [_blackView.layer addAnimation:group forKey:@"scale-rotate-layer"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        _blackView.hidden = YES;
        
    });
    self.navigationController.navigationBarHidden = NO;
}


#pragma -mark scrollDelegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (decelerate == NO) {
        int num =   scrollView.contentOffset.x / kWidth;
        HYRStep * step = _menu.steps[num];
        _stepCountLabel.text = [NSString stringWithFormat:@"%d/%ld",num+1,_menu.steps.count];
        _stepTV.text = step.step;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int num =   scrollView.contentOffset.x / kWidth;
    HYRStep * step = _menu.steps[num];
    _stepCountLabel.text = [NSString stringWithFormat:@"%d/%ld",num+1,_menu.steps.count];
    _stepTV.text = step.step;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
