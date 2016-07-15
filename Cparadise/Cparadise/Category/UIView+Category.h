//
//  UIView+Category.h
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/16.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.

/*
 *这个分类的主要功能就是
 *给UIView 增加frame的setter、getter方法
 **/

#import <UIKit/UIKit.h>

@interface UIView (Category)

//该分类 给UIView增加的功能
-(void)setX:(CGFloat)x;
-(CGFloat)x;
-(void)setY:(CGFloat)y;
-(CGFloat)y;
-(void)setWidth:(CGFloat)width;
-(CGFloat)width;
-(void)setHeight:(CGFloat)height;
-(CGFloat)height;

@end
