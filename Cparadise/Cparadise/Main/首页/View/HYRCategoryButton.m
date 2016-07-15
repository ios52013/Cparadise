//
//  HYRCategoryButton.m
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/14.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
//

#import "HYRCategoryButton.h"
#import "UIView+Category.h"


@interface HYRCategoryButton ()
@property (nonatomic,strong)UIImageView * customImageView;
@property (nonatomic,strong)UILabel * customLabel;

@end


@implementation HYRCategoryButton


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.99f green:0.99f blue:0.99f alpha:1.00f];
        //设置阴影
        [self.layer setShadowOffset:CGSizeMake(1, 1)];
        [self.layer setShadowOpacity:1];
        [self.layer setShadowRadius:3];
        [self.layer setShadowColor:[UIColor grayColor].CGColor];
        //圆角
        [self.layer setCornerRadius:5];
        //画出界面
        [self setupUI];
    }
    return self;
}

//
-(void)setupUI{
    //准备创建的图片只有这个控件本身的一半大小
    //由于这本身self是一个UIView，所以可以通过分类的方法得到宽
    CGFloat imageWidth = self.width / 2;
    
    //创建一个图片对象 用来显示菜分类的图片
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, imageWidth, imageWidth)];
    imageView.center = CGPointMake(self.width/2, 8 + imageWidth/2);
    //imageView.backgroundColor = [UIColor redColor];
    //打开图片的用户交互功能
    imageView.userInteractionEnabled = YES;
    [self addSubview:imageView];
    self.customImageView = imageView;
    
    //创建一个label 用来显示菜的分类名字
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, imageView.y+imageView.height + 8, self.width, 20)];
    //label.backgroundColor = [UIColor cyanColor];
    //设置label的字体对齐方式  居中
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    self.customLabel = label;
}


//设置图片属性img的 setter方法
-(void)setImg:(NSString *)img{
    _img = img;
    self.customImageView.image = [UIImage imageNamed:img];
}

//设置 分类标签 的 setter方法
-(void)setCategory:(HYRCategory *)category{
    _category = category;
    //分类标签的类型名字
    self.customLabel.text = category.categoryName;
}


//点击开始
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.backgroundColor = [UIColor colorWithRed:0.90f green:0.90f blue:0.90f alpha:1.00f];
}

//点击结束
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    //判断某个矩形范围 是否包含着某点
    //也就是判断点中的是哪一个View
    if (CGRectContainsPoint(self.bounds, point)) {
        
        //如果是点中了我，那我就把该分类的标签 返回出去到控制器
#pragma mark - 反向传值的问题
        //怎么返回出去？  通知？委托？block？ 都可以
        
        //这个block属性 会在控制器内创建标签的时候 实现
        self.clickAction(_category);
    }
    
    
    self.backgroundColor = [UIColor colorWithRed:0.99f green:0.99f blue:0.99f alpha:1.00f];
}

@end
