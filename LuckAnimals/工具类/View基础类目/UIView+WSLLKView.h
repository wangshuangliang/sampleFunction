//
//  UIView+WSLLKView.h
//  LuckAnimals
//
//  Created by wsl 王 on 2018/8/7.
//  Copyright © 2018年 wsl 王. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WSLLKView)

//添加索引属性
@property (nonatomic,strong) NSIndexPath * indexPath;
//返回美元格式数字
- (NSString *)getMoneyStringWithMoneyNumber:(NSString *)money;
//复制到剪切板
- (void)addPasteboardWithText:(NSString *)text;
//保存图片到相册
- (void)saveImage:(UIImage *)image;
//修改lab文字的部分文字字体
- (void)changeFontSizeWithStr:(NSString *)str
                     fontSize:(float)fontSize;
@end
