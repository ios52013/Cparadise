//
//  HYRCategoryViewController.m
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/14.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
//

#import "HYRCategoryViewController.h"
#import "HYRCategoryButton.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kGap 10

@interface HYRCategoryViewController ()
//声明属性
@property (strong,nonatomic) NSMutableArray * categories;
@property (nonatomic,strong) NSMutableArray * buttons;
@property (nonatomic,strong) NSArray * images;



@end

@implementation HYRCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化数据
    [self initData];
    
    //创建界面
    [self createUI];
}

//初始化数据
-(void)initData{
    _categories = [NSMutableArray array];
    _buttons = [NSMutableArray array];
    _images = @[@"caishi",@"time",@"tiandian",@"changjianshicai",@"zhushi",@"jiankang",@"changjing",@"fangshi",@"renqun"];
#pragma something to do
    //_plistUtilities = [WYHPlistUtilities sharePlisthUtilities];
}

//创建界面
-(void)createUI{
    self.navigationItem.leftBarButtonItems = nil;
    
    //创建搜索框
   // [self createSearchBar];
    
    //创建分类的按钮
    [self createCategoryButtons];
    //创建历史记录的列表
    //[self createSearchHistoryTableView];
}

//创建分类的按钮
-(void)createCategoryButtons{
    //每个按钮的长宽
    CGFloat buttonWidth = (kWidth - 60 - kGap * 2)/3;
    
#pragma 九宫格的样式
    for (int i = 0; i < 9; i++) {
        //自定义分类的按钮
       HYRCategoryButton * button = [[HYRCategoryButton alloc]initWithFrame:CGRectMake(30 + i%3 *(buttonWidth + kGap), 100 + i/3 * (buttonWidth + kGap), buttonWidth, buttonWidth)];
        [_buttons addObject:button];

        [self.view addSubview:button];
    }
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
