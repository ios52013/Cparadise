//
//  HYRHttpTool.h
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/16.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
/*
 *该工具类主要封装了负责网络请求的方法
 */

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

//声明了一个 block 用于把请求得到的数据 返回出去
typedef void(^MyCallBack)(id obj);



@interface HYRHttpTool : NSObject

//公共调用AF的方法
+(void)requestDataWithUrl:(NSString * )url andSuccess:(MyCallBack)success andFailure:(MyCallBack)failure;

//获取分类标签信息
+(void)fetchCategoryInfoSuccess:(MyCallBack) success andFailure:(MyCallBack) failure;



@end
