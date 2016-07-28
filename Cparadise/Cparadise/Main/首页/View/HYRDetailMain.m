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
#import "HYRDetailSubView.h"

@interface HYRDetailMain ()
@property (nonatomic,strong) HYRHeaderImageView * mainImageView;
//食材的子视图
@property (nonatomic,strong) HYRDetailSubView * ingredientsView;
//调料的子视图
@property (nonatomic,strong) HYRDetailSubView * burdenView;
//做法步骤的子视图
@property (nonatomic,strong) HYRDetailSubView * stepsView;


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
    //头视图的子视图
    HYRHeaderImageView * mainImageView = [[HYRHeaderImageView alloc]initWithFrame:CGRectMake(kGap, kGap, self.width - 2*kGap, 150)];
    [self addSubview:mainImageView];
    self.mainImageView = mainImageView;
    
    //食材的子视图
    HYRDetailSubView * ingredientsView = [[HYRDetailSubView alloc]initWithFrame:CGRectMake(kGap, 0, self.width - 2*kGap, 0)];
    ingredientsView.type = 1;
    _ingredientsView = ingredientsView;
    [self addSubview:ingredientsView];
    
    //调料的子视图
    HYRDetailSubView * burdenView = [[HYRDetailSubView alloc]initWithFrame:CGRectMake(kGap, 0, self.width - 2*kGap, 0)];
    burdenView.type = 2;
    _burdenView = burdenView;
    [self addSubview:burdenView];
    
    
    //做法步骤的子视图
    HYRDetailSubView * stepsView = [[HYRDetailSubView alloc]initWithFrame:CGRectMake(kGap, 0, self.width - 2*kGap, 100)];
    stepsView.type = 3;
    _stepsView = stepsView;
    [self addSubview:stepsView];
}


//setter
-(void)setMenu:(HYRMenu *)menu{
    _menu = menu;
    _mainImageView.img = _menu.albums[0];
    _mainImageView.text = _menu.imtro;
    
    _ingredientsView.text = _menu.ingredients;
    _ingredientsView.y =  _mainImageView.y + _mainImageView.height + kGap;
    
    _burdenView.text = _menu.burden;
    _burdenView.y = _ingredientsView.y + _ingredientsView.height + kGap;
    
    _stepsView.steps = _menu.steps;
    _stepsView.y = _burdenView.y + _burdenView.height + kGap;
    
    self.height = _stepsView.y + _stepsView.height + kGap;
      
}



@end
