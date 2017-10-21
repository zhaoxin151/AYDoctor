//
//  NSDictionary+null.m
//  NTOFFICE
//
//  Created by a004779 on 15/8/7.
//  Copyright (c) 2015年 natonAir. All rights reserved.
//

#import "NSDictionary+null.h"

@implementation NSDictionary (null)


-(id)ntObjectForKey:(id)aKey
{
    id obj=[self objectForKey:aKey];
    if ([obj isKindOfClass:[NSNull class]] || !obj)
    {
        return @"";
    }
    else
        return obj;
}


@end
