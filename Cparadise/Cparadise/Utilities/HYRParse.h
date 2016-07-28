//
//  HYRParse.h
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/16.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
/*
 *网络数据 解析 类
 **/

#import <Foundation/Foundation.h>

@interface HYRParse : NSObject
//解析标签
+(NSMutableArray*)parseCategoryInfoWithDic:(NSDictionary *)dic;
//解析菜谱
+(NSMutableArray*)parseMenusWithDic:(NSDictionary *)dic;

@end
