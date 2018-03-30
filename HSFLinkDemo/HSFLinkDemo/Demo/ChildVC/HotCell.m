//
//  HotCell.m
//  HSFLinkDemo
//
//  Created by 黄山锋 on 2018/3/30.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "HotCell.h"

@implementation HotCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.icon.layer.masksToBounds = YES;
    self.icon.layer.cornerRadius = 30;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
