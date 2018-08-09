//
//  WSLLKZDCELLHeadView.m
//  LuckAnimals
//
//  Created by wsl 王 on 2018/8/9.
//  Copyright © 2018年 wsl 王. All rights reserved.
//

#import "WSLLKZDCELLHeadView.h"

@interface WSLLKZDCELLHeadView()

@property (nonatomic,strong) UILabel * textLab;

@end;

@implementation WSLLKZDCELLHeadView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
                              indexPath:(NSIndexPath *)indexPath
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.indexPath = indexPath;
        [self creatUI];
    }
    return self;
}

//创建视图
- (void)creatUI
{
    self.textLab = [[UILabel alloc] init];
    self.textLab.text = @"点我";
    self.textLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.textLab];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 写子控件的frame值
    self.textLab.frame = self.bounds;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.touchChooseBlock) {
        
        self.touchChooseBlock(self.indexPath);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
