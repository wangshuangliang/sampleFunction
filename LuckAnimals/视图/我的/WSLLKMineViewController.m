//
//  WSLLKMineViewController.m
//  LuckAnimals
//
//  Created by wsl 王 on 2018/8/8.
//  Copyright © 2018年 wsl 王. All rights reserved.
//

#import "WSLLKMineViewController.h"
//折叠中奖信息页面
#import "WSLLKZDTableViewController.h"

@interface WSLLKMineViewController ()

@end

@implementation WSLLKMineViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navBarBgAlpha = @"0.0";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView * headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 200)];
    headImageView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:headImageView];
    
    @weakify(self)
    [self barButtonWithTitle:@"查看" imgeName:nil direction:(DirectionRight) optionBlock:^{
        
        @strongify(self)
        WSLLKZDTableViewController * vc = [[WSLLKZDTableViewController alloc] init];
        [self pushNextVCWithVC:vc animate:YES];
        
    }];
    
    [self barButtonWithTitle:@"返回" imgeName:nil direction:(DirectionLeft) optionBlock:^{
        
        NSLog(@"222");
    }];
    
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
