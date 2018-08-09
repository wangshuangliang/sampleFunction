//
//  UITableViewCell+WSLLKCell.m
//  LuckAnimals
//
//  Created by wsl 王 on 2018/8/6.
//  Copyright © 2018年 wsl 王. All rights reserved.
//

#import "UITableViewCell+WSLLKCell.h"

@implementation UITableViewCell (WSLLKCell)

/**  runtime进行赋值 **/
- (void)setValueRuntimeWithModel:(id)model
{
    u_int count = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &count);

    for (int i = 0; i < count; i++) {
        const char *propertyName = property_getName(properties[i]);
        NSString *str = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
        NSString *strP = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
        id pStr = [model valueForKeyPath:[NSString stringWithFormat:@"_%@",[strP stringByReplacingOccurrencesOfString:@"Lab" withString:@""]]];
        if (pStr) {
            [self setValue:pStr forKeyPath:[NSString stringWithFormat:@"_%@.text",str]];
        }
    }
}

@end
