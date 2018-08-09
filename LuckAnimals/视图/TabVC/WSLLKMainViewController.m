//
//  WSLLKMainViewController.m
//  LuckAnimals
//
//  Created by wsl 王 on 2018/8/6.
//  Copyright © 2018年 wsl 王. All rights reserved.
//

#import "WSLLKMainViewController.h"
#import "ViewController.h"

@interface WSLLKMainViewController ()

@end

@implementation WSLLKMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray * childVCClasses = @[@{@"className":@"WSLLHomeKViewController",@"image":@"",@"selectImage":@"",@"title":@"Lucky Club",@"tabbarTitle":@"首页"},@{@"className":@"WSLLKMineViewController",@"image":@"",@"selectImage":@"",@"title":@"我的导航栏不见了",@"tabbarTitle":@"我的"}];
    for (int i = 0; i < childVCClasses.count; i ++) {
        
        NSDictionary * dic = childVCClasses[i];
        [self creatChildVCWithClassName:dic[@"className"] image:dic[@"image"] selectImage:dic[@"selectImage"] title:dic[@"title"] tabbarTitle:dic[@"tabbarTitle"]];
    }
}

#pragma mark - 创建子视图
- (void)creatChildVCWithClassName:(NSString *)className
                            image:(NSString *)image
                      selectImage:(NSString *)selectImage
                            title:(NSString *)title
                      tabbarTitle:(NSString *)tabbarTitle
{
    Class C = NSClassFromString(className);
    id VC = [[C alloc] init];
    UIViewController * UVC = (UIViewController *)VC;
    UVC.title = title;
    UINavigationController * NVC = [[UINavigationController alloc] initWithRootViewController:UVC];
    NVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:tabbarTitle image:[UIImage imageNamed:image] selectedImage:[UIImage imageNamed:selectImage]];
    [self addChildViewController:NVC];
    
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
