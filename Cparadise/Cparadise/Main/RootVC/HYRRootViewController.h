//
//  HYRRootViewController.h
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/14.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYRRootViewController : UIViewController
//声明属性
@property (nonatomic, strong)UIButton * backButton;
//刷新按钮
@property (nonatomic, strong)UIButton * refreshButton;

//设置导航栏的按钮
-(void)setNavBackButton;
//刷新的按钮
//-(void)setNavRefreshButton;


@end
