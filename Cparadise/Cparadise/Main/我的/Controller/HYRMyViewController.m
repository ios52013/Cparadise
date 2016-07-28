//
//  HYRMyViewController.m
//  Cparadise
//
//  Created by HYRLoveQi on 16/7/29.
//  Copyright © 2016年 HYRLoveQi. All rights reserved.
//

#import "HYRMyViewController.h"

@interface HYRMyViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSArray * dataSourceArray;
@property (nonatomic,strong)UITableView * tableView;

@end

@implementation HYRMyViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self createTabelView];
    self.navigationItem.leftBarButtonItems = nil;
}
-(void)createTabelView{
    //    self.view.backgroundColor = [UIColor lightGrayColor];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(10, 64 + 10 , kWidth-20, kHeight - 64 - 49 - 20) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.backgroundColor = [UIColor colorWithRed:0.99f green:0.99f blue:0.99f alpha:1.00f];
    [_tableView.layer setShadowOffset:CGSizeMake(1, 1)];
    [_tableView.layer setShadowOpacity:1];
    [_tableView.layer setShadowRadius:3];
    [_tableView.layer setShadowColor:[UIColor grayColor].CGColor];
    [_tableView.layer setCornerRadius:10];
    _tableView.layer.borderColor = [UIColor grayColor].CGColor;
    _tableView.layer.borderWidth = 1.0;
    _tableView.scrollEnabled = NO;
    [self.view addSubview:_tableView];
}
-(void)initData{
    _dataSourceArray = @[@[@"我的浏览",@"我的收藏",@"我的作品"],@[@"关于我们",@"给我评论"],@[@"期待ing"]];
}

#pragma - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataSourceArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray * array = _dataSourceArray[section];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"my"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"my"];
    }
    cell.textLabel.text = _dataSourceArray[indexPath.section][indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

//
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        if (indexPath.row == 2) {
            [self performSegueWithIdentifier:@"article" sender:nil];
        }else{
            //
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"相关功能码农正在熬夜拼命开发中..." preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
            
            [alertController addAction:cancelAction];
            [alertController addAction:okAction];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
    }
    
    
    if (indexPath.section == 2) {
        //
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"相关功能码农正在熬夜拼命开发中..." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
        
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
}


//
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
