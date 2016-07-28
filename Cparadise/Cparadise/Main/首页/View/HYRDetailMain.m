//
//  HYRDetailMain.m
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/28.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
//

#import "HYRDetailMain.h"
#import "HYRHeaderImageView.h"
#import "UIView+Category.h"


@interface HYRDetailMain ()
@property (nonatomic,strong) HYRHeaderImageView * mainImageView;

@end




@implementation HYRDetailMain

//初始化方法
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor colorWithRed:0.90f green:0.90f blue:0.90f alpha:1.00f];
        [self setupUI];
    }
    return self;
}

//设置界面
-(void)setupUI{
    HYRHeaderImageView * mainImageView = [[HYRHeaderImageView alloc]initWithFrame:CGRectMake(kGap, kGap, self.width - 2*kGap, 150)];
    [self addSubview:mainImageView];
    self.mainImageView = mainImageView;
    
   
}

//setter
-(void)setMenu:(HYRMenu *)menu{
    _menu = menu;
    _mainImageView.img = _menu.albums[0];
    _mainImageView.text = _menu.imtro;
    
      
}



@end
