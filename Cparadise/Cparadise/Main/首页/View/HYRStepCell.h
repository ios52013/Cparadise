//
//  HYRStepCell.h
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/29.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYRStep.h"


@interface HYRStepCell : UITableViewCell
@property(nonatomic, strong) HYRStep *step;
@property (nonatomic,copy)NSString * num;
@property (strong, nonatomic)  UIImageView *stepImageView;
+(CGFloat)getCellHeightWithStep:(NSString *)step;

@end
