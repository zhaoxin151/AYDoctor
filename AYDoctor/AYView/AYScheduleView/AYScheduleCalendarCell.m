//
//  AYScheduleCalendarCell.m
//  AYDoctor
//
//  Created by WHB_NATON on 2017/10/23.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import "AYScheduleCalendarCell.h"
#import "FSCalendar.h"

@interface AYScheduleCalendarCell() <FSCalendarDelegate, FSCalendarDataSource>

@property (weak, nonatomic) FSCalendar *calendar;
@property (weak, nonatomic) UIButton *previousButton;
@property (weak, nonatomic) UIButton *nextButton;

@property (strong, nonatomic) NSCalendar *gregorian;

@end
@implementation AYScheduleCalendarCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    CGFloat height =  300;
    FSCalendar *calendar = [[FSCalendar alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, height)];
    calendar.dataSource = self;
    calendar.delegate = self;
    calendar.backgroundColor = [UIColor whiteColor];
    calendar.appearance.headerMinimumDissolvedAlpha = 0;
    calendar.appearance.caseOptions = FSCalendarCaseOptionsHeaderUsesUpperCase;
    calendar.appearance.weekdayTextColor = [UIColor colorWithHexString:@"#2C93D3"];
    calendar.appearance.headerTitleColor = [UIColor colorWithHexString:@"#2C93D3"];
    calendar.appearance.todayColor = naviBarAndButtonColor;
    calendar.appearance.selectionColor = [UIColor lightGrayColor];
    calendar.appearance.subtitleDefaultColor = [UIColor redColor];
    calendar.appearance.subtitleSelectionColor = [UIColor redColor];
    [self addSubview:calendar];
    self.calendar = calendar;
    
    UIButton *previousButton = [UIButton buttonWithType:UIButtonTypeCustom];
    previousButton.frame = CGRectMake(0, 5, 95, 34);
    previousButton.backgroundColor = [UIColor whiteColor];
    previousButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [previousButton setImage:[UIImage imageNamed:@"AYSchedule_Calendar_Prev"] forState:UIControlStateNormal];
    [previousButton addTarget:self action:@selector(previousClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:previousButton];
    self.previousButton = previousButton;
    
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.frame = CGRectMake(DEVICEWIDTH-95, 5, 95, 34);
    nextButton.backgroundColor = [UIColor whiteColor];
    nextButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [nextButton setImage:[UIImage imageNamed:@"AYSchedule_Calendar_Next"] forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(nextClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:nextButton];
    self.nextButton = nextButton;
}

- (void)previousClicked:(id)sender
{
    NSDate *currentMonth = self.calendar.currentPage;
    NSDate *previousMonth = [self.gregorian dateByAddingUnit:NSCalendarUnitMonth value:-1 toDate:currentMonth options:0];
    [self.calendar setCurrentPage:previousMonth animated:YES];
}

- (void)nextClicked:(id)sender
{
    NSDate *currentMonth = self.calendar.currentPage;
    NSDate *nextMonth = [self.gregorian dateByAddingUnit:NSCalendarUnitMonth value:1 toDate:currentMonth options:0];
    [self.calendar setCurrentPage:nextMonth animated:YES];
}

- (void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition {
    NSTimeInterval selectTime = [date timeIntervalSince1970];
    if(self.delegate) {
        [self.delegate scheduleCanlendarSelectDayWithTimeInterval:selectTime];
    }
}

- (NSString *)calendar:(FSCalendar *)calendar subtitleForDate:(NSDate *)date {
    return @"(2)";
}


@end
