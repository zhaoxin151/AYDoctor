//
//  AYScheduleCalendarCell.h
//  AYDoctor
//
//  Created by WHB_NATON on 2017/10/23.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AYScheduleCalendarCellDelegate;
@interface AYScheduleCalendarCell : UITableViewCell

@property (nonatomic, weak)id <AYScheduleCalendarCellDelegate> delegate;

@end

@protocol AYScheduleCalendarCellDelegate <NSObject>

- (void)scheduleCanlendarSelectDayWithTimeInterval:(NSTimeInterval)dateInterval;

@end
