//
//  WSLLKBaseViewController.m
//  LuckAnimals
//
//  Created by wsl 王 on 2018/8/6.
//  Copyright © 2018年 wsl 王. All rights reserved.
//

#import "WSLLKBaseViewController.h"

@interface WSLLKBaseViewController ()

@end

@implementation WSLLKBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//修改导航栏颜色
- (void)setNeedsNavigationBackground:(CGFloat)alpha {
    // 导航栏背景透明度设置
    UIView *barBackgroundView = [[self.navigationController.navigationBar subviews] objectAtIndex:0];// _UIBarBackground
    UIImageView *backgroundImageView = [[barBackgroundView subviews] objectAtIndex:0];// UIImageView
    if (self.navigationController.navigationBar.isTranslucent) {
        if (backgroundImageView != nil && backgroundImageView.image != nil) {
            barBackgroundView.alpha = alpha;
        } else {
            UIView *backgroundEffectView = [[barBackgroundView subviews] objectAtIndex:1];// UIVisualEffectView
            if (backgroundEffectView != nil) {
                backgroundEffectView.alpha = alpha;
            }
        }
    } else {
        barBackgroundView.alpha = alpha;
    }
    //取消导航栏下面的线
    self.navigationController.navigationBar.clipsToBounds = alpha == 0.0;
}

//添加左右按钮
- (void)barButtonWithTitle:(NSString *)title
                  imgeName:(NSString *)imageName
                 direction:(Direction)direction
               optionBlock:(void(^)(void))optionBlock
{
    UIButton * barBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    barBtn.frame = CGRectMake(0, 0, 50, 30);
    if ([self checkEmptyStr:title]) {
        
        [barBtn setTitle:title forState:(UIControlStateNormal)];
        [barBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    } else {
        
        [barBtn setImage:[UIImage imageNamed:imageName] forState:(UIControlStateNormal)];
    }
    [[barBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        optionBlock();
    }];
    
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:barBtn];
    switch (direction) {
        case DirectionLeft:
        {
            self.navigationItem.leftBarButtonItem = barButtonItem;
            
        }
            break;
        case DirectionRight:
        {
            self.navigationItem.rightBarButtonItem = barButtonItem;
            
        }
            break;
            
        default:
            break;
    }
}


//判断输入是否为空
- (BOOL)checkEmptyStr:(NSString *)str
{
    BOOL judge = NO;
    str = [NSString stringWithFormat:@"%@",str];
    if (str != nil && str.length != 0 && [str isKindOfClass:[NSNull class]] == NO && [str isEqualToString:@"(null)"] == NO) {
        
        judge = YES;
    }
    return judge;
}

//push下一个界面
- (void)pushNextVCWithVC:(UIViewController *)VC
                 animate:(BOOL)animate
{
    NSAssert(self.navigationController, @"不存在NVC!,无法推出下一界面");
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:VC animated:animate];
    self.hidesBottomBarWhenPushed=NO;
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
