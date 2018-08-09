//
//  ViewController.m
//  LuckAnimals
//
//  Created by wsl 王 on 2018/8/6.
//  Copyright © 2018年 wsl 王. All rights reserved.
//

#import "ViewController.h"
#import "WSLLKTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,WSLScrollViewDelegate>

@property (nonatomic,strong) UITableView * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self creatUI];
}

#pragma mark - 创建视图
- (void)creatUI
{
   
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStyleGrouped)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"WSLLKTableViewCell" bundle:nil] forCellReuseIdentifier:@"CELL"];
    self.tableView.estimatedRowHeight = 80;
    [self.view addSubview:self.tableView];
    self.tableView.wSLScrollViewDelegate = self;
    [self.tableView beginRefreshWithNeedLoadMore:YES WarmingStr:@"暂无数据"];
}

- (NSDictionary *)getRequestParaSet:(UIScrollView *)scrollView refreshType:(RefreshType)refreshType
{
    return @{@"":@""};
}

- (NSString *)getModelClass:(UIScrollView *)scrollView
{
    return @"WSLLKBaseModel";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableView.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WSLLKTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    [cell setValueRuntimeWithModel:tableView.dataArr[indexPath.row]];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
