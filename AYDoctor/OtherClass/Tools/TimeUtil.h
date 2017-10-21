//
//  TimeUtil.h
//  wq
//
//  Created by berwin on 13-7-20.
//  Copyright (c) 2013年 Weqia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeUtil : NSObject

//+ (NSString*)getTimeStr:(long) createdAt;

+ (NSString*)getTimeStr1:(long long)time;
+ (NSString*)getTimeStr2:(long long)time;

+ (NSString*) getMDWStrByToday;
+ (NSString*)getMDStr:(long long)time;
//
//+(NSDateComponents*) getComponent:(long long)time;

+(NSString*) getTimeStrStyle1:(long long)time;
+ (NSString*)getTimeStr1Short:(long long)time;

+(NSString*) getTimeStrStyle2:(long long)time;
+(NSString*) getTimeStrStyle3:(long long)time;
+(NSString*)getTimeShort:(long long)t;

+(NSString*)getDateStr:(long long)time;

+(int)dayCountForMonth:(int)month andYear:(int)year;

+(BOOL)isLeapYear:(int)year;

+(NSDate*)dateFromString:(NSString*)s format:(NSString*)str;
+(NSString*)formatDateFromStr:(NSString*)s format:(NSString*)str;
+(NSString*)formatDate:(NSDate*)d format:(NSString*)str;

+ (NSString *)getHHDDStrFromInterval:(long long)time;

//通过时间戳获取 “一月14日  星期四”这种格式
+ (NSString*) getMDWStrByTimeInterval:(long long)time;

//通过字符串日期转化为时间获取需要的字符串日期
+ (NSString *)strFormateStrByDateStr:(NSString *)dateStr willFormat:(NSString *)format strFormat:(NSString *)strFormat;

@end
