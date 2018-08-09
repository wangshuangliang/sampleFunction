//
//  WSLLKTableViewCell.m
//  LuckAnimals
//
//  Created by wsl 王 on 2018/8/6.
//  Copyright © 2018年 wsl 王. All rights reserved.
//

#import "WSLLKTableViewCell.h"

@interface WSLLKTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *describLab;

@end

@implementation WSLLKTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
