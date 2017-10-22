//
//  AYWeekSelectCell.m
//  AYDoctor
//
//  Created by naton on 2017/10/22.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import "AYWeekSelectCell.h"

@interface AYWeekSelectCell()

@end
@implementation AYWeekSelectCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)weekBtnChangeHandler:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    NSInteger btnTag = sender.tag;
}

@end
