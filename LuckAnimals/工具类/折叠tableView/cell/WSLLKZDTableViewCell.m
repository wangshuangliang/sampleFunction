//
//  WSLLKZDTableViewCell.m
//  LuckAnimals
//
//  Created by wsl 王 on 2018/8/9.
//  Copyright © 2018年 wsl 王. All rights reserved.
//

#import "WSLLKZDTableViewCell.h"

@interface WSLLKZDTableViewCell()


@end

@implementation WSLLKZDTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)clickMeBtnAction:(UIButton *)sender {
    
    CGPoint btnCenterPoint = sender.center;
    CGPoint point = [self convertPoint:btnCenterPoint toView:self.superview];
    if (self.centerPointBlock) {
        
        self.centerPointBlock(point);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
