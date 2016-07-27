//
//  HYRMenusViewController.h
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/28.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
//

#import "HYRRootViewController.h"
#import "HYRCategory.h"


@interface HYRMenusViewController : HYRRootViewController
//上一个界面点击分类的时候 把这个分类传过来的
@property (nonatomic, strong) HYRCategory *category;


@end
