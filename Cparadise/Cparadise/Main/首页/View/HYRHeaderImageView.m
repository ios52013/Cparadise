//
//  HYRHeaderImageView.m
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/28.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
//

#import "HYRHeaderImageView.h"
#import <UIImageView+WebCache.h>
#import "UIView+Category.h"


@interface HYRHeaderImageView ()
@property (nonatomic,strong)UIImageView * imageView;
@property (nonatomic,strong)UITextView  * textView;
@end



@implementation HYRHeaderImageView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    return self;
}
//设置界面
-(void)setupUI{
    UITextView * textView = [[UITextView alloc]initWithFrame:CGRectMake(kGap, kGap, self.width - 2*kGap, self.height - 2*kGap)];
    textView.userInteractionEnabled = NO;
    textView.font = [UIFont boldSystemFontOfSize:15];
    [self addSubview:textView];
    _textView = textView;
    UIBezierPath * rectPath=[UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 180, self.height)];
    
    //创建图片
    UIImageView * imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 180, self.height)];
    [_textView addSubview:imageView];
    _imageView = imageView;
    
    _textView.textContainer.exclusionPaths=@[rectPath]; //设定为排除
    _textView.textContainerInset = UIEdgeInsetsMake(0, -5, 0, -5);
}

//setter方法
-(void)setImg:(NSString *)img{
    _img = img;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:img] placeholderImage:nil];
}
-(void)setText:(NSString *)text{
    _text =text;
    _textView.text = text;
    [self figureHeight];
}


-(void)figureHeight{
    NSString * string = @"呵";
    //求出字体高度
    CGFloat fontHeight = [string boundingRectWithSize:CGSizeMake(320, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_textView.font} context:nil].size.height;
    //求出如果text只在一行展示的size
    CGSize textSize = [_text boundingRectWithSize:CGSizeMake(MAXFLOAT, fontHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_textView.font} context:nil].size;
    //计算出图片+text的总面积
    CGFloat totalArea = _imageView.width * _imageView.height + textSize.height * textSize.width;
    //求出多出来的行数
    CGFloat  numberOfLines = (totalArea - _textView.width * _textView.height) / _textView.width / fontHeight;
    //如果多出来的行数>0，改变_textView的高度
    if(numberOfLines > 0){
        CGFloat addHeight = ((int)numberOfLines + 2) * fontHeight;
        _textView.height += addHeight;
        self.height += addHeight;
    }
    
}



@end
