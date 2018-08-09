//
//  WSLLKZDCellViewModel.h
//  LuckAnimals
//
//  Created by wsl 王 on 2018/8/9.
//  Copyright © 2018年 wsl 王. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SetValueDoBlock)(void);
@interface WSLLKZDCellViewModel : NSObject

//分组保存对象
@property (nonatomic,strong) NSMutableArray * saveDataArr;
@property (nonatomic,strong) NSMutableArray * saveStatusArr;
@property (nonatomic,copy) SetValueDoBlock setValueDoBlock;

- (instancetype)initWithBlock:(SetValueDoBlock)setValueDoBlock;

@end
