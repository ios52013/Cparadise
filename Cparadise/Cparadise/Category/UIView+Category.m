//
//  UIView+Category.m
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/16.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)


//x的 setter和getter
-(void)setX:(CGFloat)x{
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}
-(CGFloat)x{
    return self.frame.origin.x;
}


//y的 setter和getter
-(void)setY:(CGFloat)y{
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
}
-(CGFloat)y{
    return self.frame.origin.y;
}


//宽的 setter和getter
-(void)setWidth:(CGFloat)width{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y,width, self.frame.size.height);
}
-(CGFloat)width{
    return self.frame.size.width;
}

//高的 setter和getter
-(void)setHeight:(CGFloat)height{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
}
-(CGFloat)height{
    return self.frame.size.height;
}


@end
