
//
//  HYRDetailScrollView.m
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/28.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
//

#import "HYRDetailScrollView.h"
#import "UIView+Category.h"


@interface HYRDetailScrollView ()
@property(nonatomic, strong) HYRDetailMain *mainView;
@end

@implementation HYRDetailScrollView

//初始化
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setupUI];
    }
    return self;
}

//设置界面
-(void)setupUI{
    HYRDetailMain * mainView = [[HYRDetailMain alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    [self addSubview:mainView];
    self.mainView = mainView;
}

//setter方法
-(void)setMenu:(HYRMenu *)menu{
    _menu = menu;
    _mainView.menu = menu;
    self.contentSize = CGSizeMake(0, _mainView.y + _mainView.height);
}


@end
