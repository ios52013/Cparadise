//
//  HYRMenusViewController.m
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/28.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
//

#import "HYRMenusViewController.h"
#import "HYRMenu.h"


@interface HYRMenusViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
//请求回来的每一道菜
@property (strong, nonatomic) NSMutableArray * menus;

@end





@implementation HYRMenusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    [self createUI];
    [self initData];
}



#pragma -mark 自定义方法
-(void)createUI{
    //创建列表 设置位置和宽高
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kWidth, kHeight - 64) style:UITableViewStylePlain];
    //设置列表的代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //把表格添加到当前视图当中
    [self.view addSubview:_tableView];
    
}


-(void)initData{
    
    self.title = self.category.categoryName;
    
    //注册列表的cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
}

#pragma -mark tableView 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _menus.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    HYRMenu *menu = _menus[indexPath.row];
    
    cell.textLabel.text = menu.title;
    
    return cell;
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
