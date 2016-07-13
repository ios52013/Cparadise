//
//  HYRRootViewController.m
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/14.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
//

#import "HYRRootViewController.h"

@interface HYRRootViewController ()

@end

@implementation HYRRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView * tempView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:tempView];
    //设置导航栏的颜色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.91f green:0.47f blue:0.21f alpha:1.00f];
    //设置tabbar的颜色
    self.tabBarController.tabBar.tintColor = [UIColor colorWithRed:0.91f green:0.47f blue:0.21f alpha:1.00f];
    //创建设置返回按钮
    [self setNavBackButton];
}

//
-(void)setNavBackButton
{
    //返回按钮
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 30, 30);
    backButton.backgroundColor = [UIColor clearColor];
    [backButton setImage:[UIImage imageNamed:@"fanhui"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"fanhui"] forState:UIControlStateSelected];
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    _backButton = backButton;
    UIBarButtonItem * backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_backButton];
    backBarButtonItem.style = UIBarButtonItemStylePlain;
    //    self.navigationItem.leftBarButtonItem = backBarButtonItem;
    
    UIBarButtonItem *flexSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                               target:self
                                                                               action:nil];
    flexSpacer.width =-10;
    [self.navigationItem setLeftBarButtonItems:[NSArray arrayWithObjects:flexSpacer,backBarButtonItem, nil]];
    //    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:backBarButtonItem,[[UIBarButtonItem alloc]initWithCustomView:[UIButton buttonWithType:UIButtonTypeContactAdd]], nil];
    
}



-(void)backButtonClick:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
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
