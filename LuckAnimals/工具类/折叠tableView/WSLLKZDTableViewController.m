//
//  WSLLKZDTableViewController.m
//  LuckAnimals
//
//  Created by wsl 王 on 2018/8/9.
//  Copyright © 2018年 wsl 王. All rights reserved.
//

#import "WSLLKZDTableViewController.h"
//折叠头部视图
#import "WSLLKZDCELLHeadView.h"
//折叠ViewModel
#import "WSLLKZDCellViewModel.h"
//折叠cell
#import "WSLLKZDTableViewCell.h"

@interface WSLLKZDTableViewController ()<UITableViewDelegate,UITableViewDataSource,CAAnimationDelegate>

@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) WSLLKZDCellViewModel * viewModel;

@end

@implementation WSLLKZDTableViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navBarBgAlpha = @"1.0";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatUI];
}

#pragma mark - 创建UI
- (void)creatUI
{
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:(UITableViewStyleGrouped)];
    [self.tableView registerNib:[UINib nibWithNibName:@"WSLLKZDTableViewCell" bundle:nil] forCellReuseIdentifier:@"CELL"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    //创建viewModel
    @weakify(self);
    self.viewModel = [[WSLLKZDCellViewModel alloc] initWithBlock:^{
        
        @strongify(self);
        [self.tableView reloadData];
    }];
    
    self.viewModel.saveDataArr = @[@[@"1",@"2"],@[@"3",@"4"],@[@"5",@"6"]].mutableCopy;
}

#pragma mark - tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray * dataArr = self.viewModel.saveDataArr[section];
    BOOL isShow = [self.viewModel.saveStatusArr[section] boolValue];
    return isShow ? dataArr.count : 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.viewModel.saveDataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WSLLKZDTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    NSArray * dataArr = self.viewModel.saveDataArr[indexPath.section];
    cell.contentLab.text = dataArr[indexPath.row];
    cell.centerPointBlock = ^(CGPoint center) {
        
        [self berWithStartPoint:center endPoint:CGPointMake(30, [UIScreen mainScreen].bounds.size.height - 40)];
    };
    return cell;
}

//执行贝塞尔曲线
- (void)berWithStartPoint:(CGPoint)startPoint
                 endPoint:(CGPoint)endPoint
{
    //控制点
    CGPoint controllPoint = CGPointMake(endPoint.x, startPoint.y);
    CALayer * layer = [[CALayer alloc] init];
    layer.frame = CGRectMake(startPoint.x - 15, startPoint.y - 15, 30, 30);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.masksToBounds = YES;
    layer.position = startPoint;
    layer.cornerRadius = layer.frame.size.width / 2.0;
    [self.view.layer addSublayer:layer];
    
    //规划弧线
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.delegate = self;
    animation.duration = 0.6;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    //btn中心
    CGPoint btnCenter = [self.tableView convertPoint:startPoint toView:self.view];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, btnCenter.x, btnCenter.y);
    CGPathAddQuadCurveToPoint(path, NULL, controllPoint.x, controllPoint.y, endPoint.x, endPoint.y);
    animation.path = path;
    [layer addAnimation:animation forKey:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [layer removeFromSuperlayer];
    });
    
    //释放路径
    CGPathRelease(path);
}

//动画结束
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
    
}


//返回头部视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *viewIdentfier = @"headView";
    
    WSLLKZDCELLHeadView *sectionHeadView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:viewIdentfier];
    
    if(!sectionHeadView){
        
        sectionHeadView = [[WSLLKZDCELLHeadView alloc] initWithReuseIdentifier:viewIdentfier indexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
    }
    //展开及折叠
    sectionHeadView.touchChooseBlock = ^(NSIndexPath *indexPath) {
      
        BOOL isShow = [self.viewModel.saveStatusArr[section] boolValue];
        isShow = !isShow;
        [self.viewModel.saveStatusArr replaceObjectAtIndex:section withObject:@(isShow)];
        //刷新列表
        NSIndexSet * index = [NSIndexSet indexSetWithIndex:indexPath.section];
        [tableView reloadSections:index withRowAnimation:UITableViewRowAnimationFade];
    };
    return sectionHeadView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
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
