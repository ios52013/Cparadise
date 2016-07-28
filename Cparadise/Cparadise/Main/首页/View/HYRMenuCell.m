//
//  HYRMenuCell.m
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/28.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
//

#import "HYRMenuCell.h"
#import <UIImageView+WebCache.h>

@interface HYRMenuCell ()
@property (weak, nonatomic) IBOutlet UIImageView *menuImageView;
@property (weak, nonatomic) IBOutlet UILabel *menuNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *menuTagsLabel;

@end



@implementation HYRMenuCell

//setter方法
-(void)setMenu:(HYRMenu *)menu{
    _menu = menu;
    _menuNameLabel.text = menu.title;
    _menuTagsLabel.text = menu.tags;
    
    //设置图片的圆角显示
    _menuImageView.layer.cornerRadius = 10;
    _menuImageView.layer.masksToBounds = YES;
    _menuImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _menuImageView.layer.borderWidth = 1;
    
    //一行异步显示图片
    [_menuImageView sd_setImageWithURL:[NSURL URLWithString:menu.albums[0]] placeholderImage:[UIImage imageNamed:@"girl"]];
    
    
    /*异步下载图片
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL * imageUrl = [NSURL URLWithString:menu.albums[0]];
        NSData * imageData = [NSData dataWithContentsOfURL:imageUrl];
        dispatch_async(dispatch_get_main_queue(), ^{
            _menuImageView.image = [UIImage imageWithData:imageData];
            NSLog(@"%@",NSStringFromCGSize([UIImage imageWithData:imageData].size));
        });
    });
    */
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
