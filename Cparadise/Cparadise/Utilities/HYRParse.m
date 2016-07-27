//
//  HYRParse.m
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/16.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
//

#import "HYRParse.h"
#import "HYRCategory.h"
#import <MJExtension.h>


@implementation HYRParse

+(NSMutableArray*)parseCategoryInfoWithDic:(NSDictionary *)dic{
    NSMutableArray * array = [NSMutableArray array];
    NSLog(@"解析的时候%@",dic[@"result"]);
    NSArray * tempArray = dic[@"result"];
    
    if ([tempArray isKindOfClass:[NSNull class]]) {
        return nil;
    }
    
    NSDictionary *resDict = tempArray[0];
    
    NSArray *resArr = resDict[@"list"];
    
    
    //一句话解析json，相当于下面for循环的代码
    [HYRCategory mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"categoryId" : @"id",
                 @"categoryName" : @"name"
                 };
    }];
    
    array = [HYRCategory mj_objectArrayWithKeyValuesArray:resArr];
    
    return array;
}



@end
