//
//  HYRMenuDetailVC.m
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/28.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
//

#import "HYRMenuDetailVC.h"
#import "HYRDetailScrollView.h"


@interface HYRMenuDetailVC ()

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
   
    self.title = self.menu.title;
    UIView * temp = [[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:temp];
    
}

//创建界面
-(void)createUI{
    
    [self createMainView];
}



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
