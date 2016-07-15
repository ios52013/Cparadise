//
//  HYRCategory.h
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/16.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
/*
 *菜谱的所有分类，如菜系、口味等
 *
 "id": "3",
 "name": "创意菜",
 "parentId": "10001"
 **/

#import <Foundation/Foundation.h>

@interface HYRCategory : NSObject
//该实体类 对应着网络请求回来的数据模型
@property (nonatomic,copy)NSString * categoryId;   //标签ID
@property (nonatomic,copy)NSString * categoryName;  //标签名称
@property (nonatomic,copy)NSString * parentId;   //分类ID

@end
