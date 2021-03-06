//
//  HYRCategoryViewController.m
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/14.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
//

#import "HYRCategoryViewController.h"
#import "HYRCategoryButton.h"
#import "HYRHttpTool.h"
#import "HYRMenusViewController.h"


@interface HYRCategoryViewController ()
//声明属性
@property (strong,nonatomic) NSMutableArray * categories;
@property (nonatomic,strong) NSMutableArray * buttons;
@property (nonatomic,strong) NSArray * images;



@end

@implementation HYRCategoryViewController

//显示tabbar
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

//
- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化数据
    [self initData];
    
    //创建界面
    [self createUI];
    
    //发起网络请求
    [self sendRequest];
}

//初始化数据
-(void)initData{
    _categories = [NSMutableArray array];
    _buttons = [NSMutableArray array];
    _images = @[@"caishi",@"time",@"tiandian",@"changjianshicai",@"zhushi",@"jiankang",@"changjing",@"fangshi",@"renqun"];
#pragma something to do
    //
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
        //自定义分类标签的按钮
       HYRCategoryButton * button = [[HYRCategoryButton alloc]initWithFrame:CGRectMake(30 + i%3 *(buttonWidth + kGap), 100 + i/3 * (buttonWidth + kGap), buttonWidth, buttonWidth)];
        //这是标签的图片 应该放到网络请求标签里面去  但是后台实际上没有返回这个字段，所以只能在这里实现了
        button.img = _images[i];
        
        //每次创建好一个分类标签的按钮 就添加到数组中
        [_buttons addObject:button];

        
        //实现标签类里面的block属性 以便传参
        button.clickAction = ^(id obj){
        
            HYRCategory *category = obj;
            
            if (obj) {
                NSLog(@"点击某个标签后block能够传参数回来吗？%@",category.categoryName);
                //根据故事版里面segue的标识符来跳转界面 并传参
                [self performSegueWithIdentifier:@"index" sender:obj];
            }
            
            
        };
        
        [self.view addSubview:button];
    }
    
}


//发送网络请求-获取分类标签的信息
-(void)sendRequest{
    [HYRHttpTool fetchCategoryInfoSuccess:^(id obj) {
        //返回的obj里面 是请求回来所有 标签 的字典
        _categories = obj;
        
        //给每一个标签按钮赋值
        for (int i = 0; i<_categories.count; i++) {
            //拿到每一个分类标签按钮
            HYRCategoryButton *button = _buttons[i];
            //给每一个分类标签按钮 赋值一个标签
            button.category = _categories[i];
            
            //分类标签的图片名字也应该在这里赋值的,奈何后台没有数据
            //button.img = _images[i];
        }
        
        
    } andFailure:^(id obj) {
        
        NSLog(@"请求失败的原因是:%@",obj);
        
    }];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// 通过segue跳转界面 都需要来这里传参
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //
    HYRMenusViewController *menusVC = [segue destinationViewController];
    menusVC.category = sender;
    
    //
}


@end
