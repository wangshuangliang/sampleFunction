//
//  UIView+WSLLKView.m
//  LuckAnimals
//
//  Created by wsl 王 on 2018/8/7.
//  Copyright © 2018年 wsl 王. All rights reserved.
//

#import "UIView+WSLLKView.h"
#import <objc/runtime.h>

static const void *indexPathKey = "indexPathKey";
@implementation UIView (WSLLKView)

#pragma mark - 类目属性keyPath

//设置indexPath
- (NSIndexPath *)indexPath
{
    return objc_getAssociatedObject(self, indexPathKey);
}

- (void)setIndexPath:(NSIndexPath *)indexPath
{
    objc_setAssociatedObject(self, indexPathKey, indexPath, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//设置倒角
- (void)setR:(float)r
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = r;
}

//设置圆角
- (void)setYR:(BOOL)yr
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.frame.size.height / 2.0;
}

#pragma mark - 类目方法
//返回美元格式数字
- (NSString *)getMoneyStringWithMoneyNumber:(NSString *)money{
    
    
    NSArray * sepArr = [money componentsSeparatedByString:@"."];
    double moneyD = [sepArr.firstObject doubleValue];
    //保留小数位数
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    // 设置格式
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSString *formattedNumberString = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:moneyD]];
    if ([money containsString:@"."] == NO) {

        //没有小数
        formattedNumberString = [NSString stringWithFormat:@"%@.0000",formattedNumberString];
    } else {

        //有小数
        NSString * secStr = [NSString stringWithFormat:@"0.%@",sepArr.lastObject];
        float f = [secStr floatValue];
        secStr = [NSString stringWithFormat:@"%.4f",f];
        secStr = [secStr substringWithRange:NSMakeRange(1, secStr.length - 1)];
        
        formattedNumberString = [NSString stringWithFormat:@"%@%@",formattedNumberString,secStr];
    }
    return formattedNumberString;
}

//复制到剪切板
- (void)addPasteboardWithText:(NSString *)text
{
    UIPasteboard * pastboard = [UIPasteboard generalPasteboard];
    pastboard.string = text;
    [SVProgressHUD showSuccessWithStatus:@"复制成功"];
}

//保存图片到相册
- (void)saveImage:(UIImage *)image{
    
    if (image) {
        
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(savedPhotoImage:didFinishSavingWithError:contextInfo:), nil);
        
    };
}

//保存完成后调用的方法
- (void)savedPhotoImage:(UIImage*)image didFinishSavingWithError: (NSError *)error contextInfo: (void *)contextInfo {
    if (error) {
        
        [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"图片保存出错%@", error.localizedDescription]];
    }
    else {
        
        [SVProgressHUD showSuccessWithStatus:@"图片保存成功"];
    }
}

//修改lab文字的部分文字字体
- (void)changeFontSizeWithStr:(NSString *)str
                     fontSize:(float)fontSize
{
    NSAssert([self isKindOfClass:[UILabel class]], @"操作对象应该为UILable类型!");
    UILabel * theLab = (UILabel *)self;
    NSString *tempStr = theLab.text;
    NSMutableAttributedString *strAtt = [[NSMutableAttributedString alloc] initWithString:tempStr];
    NSRange markRange = [tempStr rangeOfString:str];
    [strAtt addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue" size:fontSize] range:markRange];
    theLab.attributedText = strAtt;
}
@end
