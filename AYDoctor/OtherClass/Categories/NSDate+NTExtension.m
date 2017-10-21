//
//  NSDate+NTExtension.m
//  NTOFFICE_TS
//
//  Created by Naton on 2016/11/4.
//  Copyright © 2016年 natonAir. All rights reserved.
//

#import "NSDate+NTExtension.h"

@implementation NSDate (NTExtension)


+ (long long)currentUnixTime {
    return (long long)([NSDate date].timeIntervalSince1970 * 1000);
}

@end
