//
//  WSLLKZDCELLHeadView.h
//  LuckAnimals
//
//  Created by wsl 王 on 2018/8/9.
//  Copyright © 2018年 wsl 王. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TouchChooseBlock)(NSIndexPath * indexPath);

@interface WSLLKZDCELLHeadView : UITableViewHeaderFooterView

@property (nonatomic,copy) TouchChooseBlock touchChooseBlock;

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
                              indexPath:(NSIndexPath *)indexPath;

@end
