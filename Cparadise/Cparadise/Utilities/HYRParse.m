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
#import "HYRMenu.h"


@implementation HYRParse

+(NSMutableArray*)parseCategoryInfoWithDic:(NSDictionary *)dic{
    NSMutableArray * array = [NSMutableArray array];
    NSLog(@"解析标签的时候%@",dic[@"result"]);
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
    
    //字典数组 转 模型数组
    array = [HYRCategory mj_objectArrayWithKeyValuesArray:resArr];
    
    return array;
}



//解析菜谱
+(NSMutableArray*)parseMenusWithDic:(NSDictionary *)dic{
    NSMutableArray * array = [NSMutableArray array];
    NSLog(@"解析菜谱的时候：%@",dic[@"result"]);
    NSDictionary * tempDict = dic[@"result"];
    
    if ([tempDict isKindOfClass:[NSNull class]]) {
        return nil;
    }
    
    NSArray *tempArray = tempDict[@"data"];
    
    [HYRMenu mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        //我的模型层属性叫做MenuId  而后台返回的数据里面是 id 所以需要用这个方法修改替换一下
        return @{
                 @"MenuId" : @"id"
                 };
    }];
    
    //字典数组 转 模型数组
    array = [HYRMenu mj_objectArrayWithKeyValuesArray:tempArray];
    
    return array;
}


@end
