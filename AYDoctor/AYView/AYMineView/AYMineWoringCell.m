//
//  AYMineWoringCell.m
//  AYDoctor
//
//  Created by WHB_NATON on 2017/10/21.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import "AYMineWoringCell.h"

@implementation AYMineWoringCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//我的主页按钮的点击事件
- (IBAction)myMineViewBtnHandler:(UIButton *)sender {
    if(self.delegate) {
        [self.delegate myInfoBtnHandler:sender];
    }
}

//我的排班表按钮的点击事件
- (IBAction)myWorkTimeBtnHandler:(UIButton *)sender {
    if(self.delegate) {
        [self.delegate myWorkingBtnHandler:sender];
    }
}

@end
