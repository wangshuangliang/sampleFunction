//
//  WSLLKBaseModel.m
//  LuckAnimals
//
//  Created by wsl 王 on 2018/8/6.
//  Copyright © 2018年 wsl 王. All rights reserved.
//

#import "WSLLKBaseModel.h"

@implementation WSLLKBaseModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}


+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"name" : @"name"};
}

@end
