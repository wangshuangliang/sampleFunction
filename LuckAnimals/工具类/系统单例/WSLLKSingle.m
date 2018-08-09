//
//  WSLLKSingle.m
//  LuckAnimals
//
//  Created by wsl 王 on 2018/8/6.
//  Copyright © 2018年 wsl 王. All rights reserved.
//

#import "WSLLKSingle.h"

@implementation WSLLKSingle

+ (instancetype)share
{
    static dispatch_once_t onceToken;
    static WSLLKSingle * model = nil;
    dispatch_once(&onceToken, ^{
        
        if(model == nil) {
            
            model = [[WSLLKSingle alloc] init];
        }
    });
    return model;
}

@end
