//
//  AYMineWoringCell.h
//  AYDoctor
//
//  Created by WHB_NATON on 2017/10/21.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AYMineWorkingCellDelegate;
@interface AYMineWoringCell : UITableViewCell

@property (nonatomic, weak) id<AYMineWorkingCellDelegate> delegate;

@end

@protocol AYMineWorkingCellDelegate <NSObject>

- (void)myInfoBtnHandler:(UIButton *)btn;
- (void)myWorkingBtnHandler:(UIButton *)btn;

@end
