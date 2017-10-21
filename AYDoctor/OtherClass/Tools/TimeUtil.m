//
//  TimeUtil.m
//  wq
//
//  Created by berwin on 13-7-20.
//  Copyright (c) 2013年 Weqia. All rights reserved.
//

#import "TimeUtil.h"

@implementation TimeUtil


+ (NSString*)getTimeStr:(long) createdAt
{
    // Calculate distance time string
    //
    NSString *timestamp;
    time_t now;
    time(&now);
    
    int distance = (int)difftime(now, createdAt);
    if (distance < 0) distance = 0;
    
    if (distance < 60) {
        timestamp = [NSString stringWithFormat:@"%d %s", distance, (distance == 1) ? "second ago" : "seconds ago"];
    }
    else if (distance < 60 * 60) {
        distance = distance / 60;
        timestamp = [NSString stringWithFormat:@"%d %s", distance, (distance == 1) ? "minute ago" : "minutes ago"];
    }
    else if (distance < 60 * 60 * 24) {
        distance = distance / 60 / 60;
        timestamp = [NSString stringWithFormat:@"%d %s", distance, (distance == 1) ? "hour ago" : "hours ago"];
    }
    else if (distance < 60 * 60 * 24 * 7) {
        distance = distance / 60 / 60 / 24;
        timestamp = [NSString stringWithFormat:@"%d %s", distance, (distance == 1) ? "day ago" : "days ago"];
    }
    else if (distance < 60 * 60 * 24 * 7 * 4) {
        distance = distance / 60 / 60 / 24 / 7;
        timestamp = [NSString stringWithFormat:@"%d %s", distance, (distance == 1) ? "week ago" : "weeks ago"];
    }
    else {
        static NSDateFormatter *dateFormatter = nil;
        if (dateFormatter == nil) {
            dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateStyle:NSDateFormatterShortStyle];
            [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
        }
        
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:createdAt]; 
        timestamp = [dateFormatter stringFromDate:date];
    }
    return timestamp;
}

+ (NSString*)getTimeStr1:(long long)time
{
    NSDate * date=[NSDate dateWithTimeIntervalSince1970:time];
    NSCalendar * calendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit|NSYearCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit;
    NSDateComponents * component=[calendar components:unitFlags fromDate:date];
    NSString * string=[NSString stringWithFormat:@"%04d-%02d-%02d %02d:%02d",[component year],[component month],[component day],[component hour],[component minute]];
    return string;
}

+ (NSString*)getTimeStr2:(long long)time
{
    NSDate * date=[NSDate dateWithTimeIntervalSince1970:time];
    NSCalendar * calendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit;
    NSDateComponents * component=[calendar components:unitFlags fromDate:date];
    NSString * string=[NSString stringWithFormat:@"%02d月%02d日 %02d:%02d",[component month],[component day],[component hour],[component minute]];
    return string;
}


+ (NSString*)getTimeStr1Short:(long long)time
{
    NSDate * date=[NSDate dateWithTimeIntervalSince1970:time];
    NSCalendar * calendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit|NSYearCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit;
    NSDateComponents * component=[calendar components:unitFlags fromDate:date];
    NSString * string=[NSString stringWithFormat:@"%04d-%02d-%02d",[component year],[component month],[component day]];
    return string;
}

+ (NSString*)getMDStr:(long long)time
{
    NSDate * date=[NSDate dateWithTimeIntervalSince1970:time];
    NSCalendar * calendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit|NSYearCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit;
    NSDateComponents * component=[calendar components:unitFlags fromDate:date];
    NSString * string=[NSString stringWithFormat:@"%d月%d日",[component month],[component day]];
    return string;
}

+ (NSString*) getMDWStrByToday{
    NSDate * today=[NSDate date];
    return [TimeUtil getMDWStrByTimeInterval:[today timeIntervalSince1970]];
}

+ (NSString*) getMDWStrByTimeInterval:(long long)time {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    NSCalendar * calendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit|NSYearCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit;
    NSDateComponents * component=[calendar components:unitFlags fromDate:date];
    component=[calendar components:unitFlags fromDate:date];
    
    NSInteger t_month=[component month];
    NSInteger t_day=[component day];
    NSInteger t_week=[component weekday];
    
    NSString*string=nil;
    NSString * daystr=nil;
    switch (t_week) {
        case 1:
            daystr=@"日";
            break;
        case 2:
            daystr=@"一";
            break;
        case 3:
            daystr=@"二";
            break;
        case 4:
            daystr=@"三";
            break;
        case 5:
            daystr=@"四";
            break;
        case 6:
            daystr=@"五";
            break;
        case 7:
            daystr=@"六";
            break;
        default:
            break;
    }
    string=[NSString stringWithFormat:@"%ld月%ld日 星期%@",(long)t_month,(long)t_day,daystr];
    return string;
}

+(NSDateComponents*) getComponent:(long long)time
{
    NSDate * date=[NSDate dateWithTimeIntervalSince1970:time];
    NSCalendar * calendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit|NSYearCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit;
    NSDateComponents * component=[calendar components:unitFlags fromDate:date];
    return component;
}


+(NSString*) getTimeStrStyle1:(long long)time
{
    NSDate * date=[NSDate dateWithTimeIntervalSince1970:time];
    NSCalendar * calendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit|NSYearCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit;
    NSDateComponents * component=[calendar components:unitFlags fromDate:date];

    NSInteger year=[component year];
    NSInteger month=[component month];
    NSInteger day=[component day];
    
    NSInteger hour=[component hour];
    NSInteger minute=[component minute];
    
    NSDate * today=[NSDate date];
    component=[calendar components:unitFlags fromDate:today];
    
    NSInteger t_year=[component year];
    
    NSString*string=nil;
    
    long long now=[today timeIntervalSince1970];
    
    long distance=now-time;
    if(distance<60)
        string=@"刚刚";
    else if(distance<60*60)
        string=[NSString stringWithFormat:@"%ld分钟前",distance/60];
    else if(distance<60*60*24)
        string=[NSString stringWithFormat:@"%ld小时前",distance/60/60];
    else if(distance<60*60*24*7)
        string=[NSString stringWithFormat:@"%ld天前",distance/60/60/24];
    else if(year==t_year)
        string=[NSString stringWithFormat:@"%02ld-%02ld %02ld:%02ld",(long)month,(long)day,(long)hour,(long)minute];
    else
        string=[NSString stringWithFormat:@"%ld-%ld-%ld",(long)year,(long)month,(long)day];
    
    return string;   
    
}
+(NSString*) getTimeStrStyle2:(long long)time
{
    
    NSDate * date=[NSDate dateWithTimeIntervalSince1970:time];
    NSCalendar * calendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit|NSYearCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit;
    NSDateComponents * component=[calendar components:unitFlags fromDate:date];
    
    NSInteger year=[component year];
    NSInteger month=[component month];
    NSInteger day=[component day];
    NSInteger hour=[component hour];
    NSInteger minute=[component minute];
    NSInteger week=[component week];
    NSInteger weekday=[component weekday];
    
    NSDate * today=[NSDate date];
    component=[calendar components:unitFlags fromDate:today];
    
    NSInteger t_year=[component year];
    NSInteger t_month=[component month];
    NSInteger t_day=[component day];
    NSInteger t_week=[component week];
    
    NSString*string=nil;
    if(year==t_year&&month==t_month&&day==t_day)
    {
        if(hour<6&&hour>=0)
            string=[NSString stringWithFormat:@"凌晨 %ld:%02ld",(long)hour,(long)minute];
        else if(hour>=6&&hour<12)
            string=[NSString stringWithFormat:@"上午 %ld:%02ld",(long)hour,(long)minute];
        else if(hour>=12&&hour<18)
            string=[NSString stringWithFormat:@"下午 %ld:%02ld",(long)hour,(long)minute];
        else
            string=[NSString stringWithFormat:@"晚上 %ld:%02ld",(long)hour,(long)minute];
    }
    else if(year==t_year&&week==t_week)
    {
        NSString * daystr=nil;
        switch (weekday) {
            case 1:
                daystr=@"日";
                break;
            case 2:
                daystr=@"一";
                break;
            case 3:
                daystr=@"二";
                break;
            case 4:
                daystr=@"三";
                break;
            case 5:
                daystr=@"四";
                break;
            case 6:
                daystr=@"五";
                break;
            case 7:
                daystr=@"六";
                break;
            default:
                break;
        }
        string=[NSString stringWithFormat:@"周%@ %ld:%02ld",daystr,(long)hour,(long)minute];
    }
    else if(year==t_year)
        string=[NSString stringWithFormat:@"%ld月%ld日",(long)month,(long)day];
    else
        string=[NSString stringWithFormat:@"%d年%ld月%ld日",year,(long)month,(long)day];
    
    return string;
}

+(NSString*) getTimeStrStyle3:(long long)time
{
    NSDate * date=[NSDate dateWithTimeIntervalSince1970:time];
    NSCalendar * calendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit|NSYearCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit;
    NSDateComponents * component=[calendar components:unitFlags fromDate:date];
    
    NSInteger year=[component year];
    NSInteger month=[component month];
    NSInteger day=[component day];
    
    NSDate * today=[NSDate date];
    component=[calendar components:unitFlags fromDate:today];
    
    NSString*string=nil;
    
    long long now=[today timeIntervalSince1970];
    
    long distance=now-time;
    if(distance<60)
        string=@"刚刚";
    else if(distance<60*60)
        string=[NSString stringWithFormat:@"%ld分钟前",distance/60];
    else if(distance<60*60*24)
        string=[NSString stringWithFormat:@"%ld小时前",distance/60/60];
    else
        string=[NSString stringWithFormat:@"%ld-%ld-%ld",(long)year,(long)month,(long)day];
    return string;
    
}


+(int)dayCountForMonth:(int)month andYear:(int)year
{
    if (month==1||month==3||month==5||month==7||month==8||month==10||month==12) {
        return 31;
    }else if(month==4||month==6||month==9||month==11){
        return 30;
    }else if([self isLeapYear:year]){
        return 29;
    }else{
        return 28;
    }
}
+(BOOL)isLeapYear:(int)year
{
    if (year%400==0) {
        return YES;
    }else{
        if (year%4==0&&year%100!=0) {
            return YES;
        }else{
            return NO;
        }
    }
}

+(NSString*)getTimeShort:(long long)t{
    if(t<0)
        t = 0;
    int m = t/60;
    int n = t%60;
    return [NSString stringWithFormat:@"%.2d:%.2d",m,n];
}

+(NSDate*)dateFromString:(NSString*)s format:(NSString*)str{
    NSDateFormatter* f=[[NSDateFormatter alloc]init];
    if(str==nil)
        str = @"yyyy-MM-dd";
    [f setDateFormat:str];
    NSDate* d = [f dateFromString:s];
    return d;
}

+(NSString*)formatDateFromStr:(NSString*)s format:(NSString*)str{
    NSDateFormatter* f=[[NSDateFormatter alloc]init];
    if(!str)
        str = @"yyyy-MM-dd HH:mm:ss";
    [f setDateFormat:str];
    NSDate* d = [f dateFromString:s];
    
    f.dateFormat = str;
    NSString* s1 = [f stringFromDate:d];
//    [f release];
    return  s1;
}

+(NSString*)formatDate:(NSDate*)d format:(NSString*)str{
    NSDateFormatter* f=[[NSDateFormatter alloc]init];
    f.dateFormat = str;
    NSString* s = [f stringFromDate:d];
//    [f release];
    return  s;
}

+(NSString*)getDateStr:(long long)time{
    NSDateFormatter* f=[[NSDateFormatter alloc]init];
    f.dateFormat = @"yyyy-MM-dd";
    NSString* s = [f stringFromDate:[NSDate dateWithTimeIntervalSince1970:time]];
    //    [f release];
    return  s;
}

+ (NSString *)getHHDDStrFromInterval:(long long)time {
    NSDateFormatter* f=[[NSDateFormatter alloc]init];
    f.dateFormat = @"HH:mm";
    NSString* s = [f stringFromDate:[NSDate dateWithTimeIntervalSince1970:time]];
    //    [f release];
    return  s;
}


+ (NSString *)strFormateStrByDateStr:(NSString *)dateStr willFormat:(NSString *)format strFormat:(NSString *)strFormat; {
    NSDateFormatter* f=[[NSDateFormatter alloc]init];
    [f setDateFormat:strFormat];
    NSDate* d = [f dateFromString:dateStr];
    
    f.dateFormat = format;
    NSString* s1 = [f stringFromDate:d];
    //    [f release];
    return  s1;
}

@end
