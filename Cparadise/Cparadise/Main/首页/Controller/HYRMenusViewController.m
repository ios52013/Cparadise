//
//  HYRMenusViewController.m
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/28.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
//

#import "HYRMenusViewController.h"
#import "HYRMenu.h"
#import "HYRHttpTool.h"
#import "HYRMenuCell.h"
#import "HYRMenuDetailVC.h"


@interface HYRMenusViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
//请求回来的每一道菜
@property (strong, nonatomic) NSMutableArray * menus;
/*
 pn		数据返回起始下标，默认0
 rn	    数据返回条数，最大30，默认10
 */
@property (nonatomic,assign) NSInteger rn;
@property (nonatomic,assign)NSInteger pn;
@end





@implementation HYRMenusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    [self createUI];
    [self initData];
    [self sendRequest];
}

//隐藏tabbar
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}


#pragma -mark 自定义方法
-(void)createUI{
    //创建列表 设置位置和宽高
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kWidth, kHeight - 64) style:UITableViewStylePlain];
    //设置列表的代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
    //每一行的分割线风格  无
    //_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //把表格添加到当前视图当中
    [self.view addSubview:_tableView];
    
}


-(void)initData{
    //初始化数组 准备接收请求得到的所有菜
    _menus = [NSMutableArray array];
    
    //系列菜的系列名字
    self.title = self.category.categoryName;
    
    
    _pn = 0;
    _rn = 30;

    //注册列表的cell
   // [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"HYRMenuCell" bundle:nil] forCellReuseIdentifier:@"menuCell"];
}

//根据传过来的标签 发起请求菜谱

-(void)sendRequest{
    [HYRHttpTool fetchMenusWithCategoryID:_category.categoryId andPn:_pn andSeccess:^(id obj) {
        //请求成功
        if (_pn == 0) {//如果是第0次  数据返回起始下标
            _menus = obj;
        }
        
        //刷新表格
        [_tableView reloadData];
        
    } andFailure:^(id obj) {
        //按标签检索菜谱 请求失败
        
    }];
    
    
}






#pragma -mark tableView 代理方法
//每一个分区有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _menus.count;
}
//每一行长什么样
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HYRMenuCell * cell = [tableView dequeueReusableCellWithIdentifier:@"menuCell" forIndexPath:indexPath];
    
    HYRMenu *menu = _menus[indexPath.row];
    
    cell.menu = menu;
    
    return cell;
}


//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0;
}

//点中某一行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //跳转到这道菜的详情页面 并 把这道菜传过去
    [self performSegueWithIdentifier:@"detail" sender:_menus[indexPath.row]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 通过Segue跳转界面的 都是在这里传参数
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //
    HYRMenuDetailVC *menuDetailVC = segue.destinationViewController;
    menuDetailVC.menu = sender;
    
}


@end
