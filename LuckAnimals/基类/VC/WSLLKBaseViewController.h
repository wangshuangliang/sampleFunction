//
//  WSLLKBaseViewController.h
//  LuckAnimals
//
//  Created by wsl 王 on 2018/8/6.
//  Copyright © 2018年 wsl 王. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, Direction) {
  
    DirectionLeft = 0,//左侧
    DirectionRight,//右侧
};
@interface WSLLKBaseViewController : UIViewController

//修改导航栏颜色
- (void)setNeedsNavigationBackground:(CGFloat)alpha;
//添加左右按钮
- (void)barButtonWithTitle:(NSString *)title
                  imgeName:(NSString *)imageName
                 direction:(Direction)direction
               optionBlock:(void(^)(void))optionBlock;
//判断输入是否为空
- (BOOL)checkEmptyStr:(NSString *)str;
//push下一个界面
- (void)pushNextVCWithVC:(UIViewController *)VC
                  animate:(BOOL)animate;
@end
