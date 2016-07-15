//
//  HYRCategoryButton.h
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/14.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
/*
 *分类标签的按钮
 */

#import <UIKit/UIKit.h>
#import "HYRCategory.h"

//声明一个block
typedef void (^ClickAction)(id obj);


@interface HYRCategoryButton : UIView

//标签
@property(nonatomic,strong)HYRCategory *category;
//图片的名称
@property (nonatomic,strong)NSString *img;
//
@property (nonatomic,strong)ClickAction clickAction;


@end
