//
//  HYRCategoryButton.m
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/14.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
//

#import "HYRCategoryButton.h"

@interface HYRCategoryButton ()
@property (nonatomic,strong)UIImageView * customImageView;
@property (nonatomic,strong)UILabel * customLabel;

@end


@implementation HYRCategoryButton


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.99f green:0.99f blue:0.99f alpha:1.00f];
        [self.layer setShadowOffset:CGSizeMake(1, 1)];
        [self.layer setShadowOpacity:1];
        [self.layer setShadowRadius:3];
        [self.layer setShadowColor:[UIColor grayColor].CGColor];
        //圆角
        [self.layer setCornerRadius:5];
        //
    }
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
