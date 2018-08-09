//
//  WSLLKZDTableViewCell.h
//  LuckAnimals
//
//  Created by wsl 王 on 2018/8/9.
//  Copyright © 2018年 wsl 王. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CenterPointBlock)(CGPoint center);

@interface WSLLKZDTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *contentLab;
@property (nonatomic,copy) CenterPointBlock centerPointBlock;

@end
