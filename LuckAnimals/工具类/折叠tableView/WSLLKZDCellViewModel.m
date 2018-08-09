//
//  WSLLKZDCellViewModel.m
//  LuckAnimals
//
//  Created by wsl 王 on 2018/8/9.
//  Copyright © 2018年 wsl 王. All rights reserved.
//

#import "WSLLKZDCellViewModel.h"

@implementation WSLLKZDCellViewModel

- (instancetype)initWithBlock:(SetValueDoBlock)setValueDoBlock
{
    if (self = [super init]) {
        
        self.setValueDoBlock = setValueDoBlock;
        
    }
    return self;
}

- (void)setSaveDataArr:(NSMutableArray *)saveDataArr
{
    _saveDataArr = saveDataArr;
    for (int i = 0; i < saveDataArr.count; i ++) {
        
        [self.saveStatusArr addObject:@(NO)];
    }
    
    if (self.setValueDoBlock) {
        
        self.setValueDoBlock();
    }
}

- (NSMutableArray *)saveStatusArr
{
    if (!_saveStatusArr) {
        
        self.saveStatusArr = [[NSMutableArray alloc] init];
    }
    return _saveStatusArr;
}

@end
