//
//  AYLoginUser.m
//  AYDoctor
//
//  Created by WHB_NATON on 2017/10/21.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import "AYLoginUser.h"

@implementation AYLoginUser

static AYLoginUser *sharedUser;

+ (AYLoginUser *)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUser = [[AYLoginUser alloc]init];
    });
    return sharedUser;
}

+ (void)saveLoginUserInfoDic:(NSDictionary *)userInfo
{
    [g_default setObject:userInfo[@"userId"] forKey:AY_USER_USERID];
    [g_default setObject:userInfo[@"access_token"] forKey:AY_USER_TOKEN];
}

+ (void)clearUserInfo
{
    [g_default removeObjectForKey:AY_USER_TOKEN];
    [g_default removeObjectForKey:AY_USER_USERID];
}

- (NSString *)token
{
    NSString *tokenStr = [g_default objectForKey:AY_USER_TOKEN];
    return tokenStr = tokenStr == nil?@"":tokenStr;
}

-(NSString *)userId
{
    NSString *userIdStr = [g_default objectForKey:AY_USER_USERID];
    return userIdStr = userIdStr == nil?@"":userIdStr;
}


@end
