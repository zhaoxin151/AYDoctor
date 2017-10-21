//
//  HBKeyChainHelper.h
//  kanglian
//
//  Created by tato on 14-7-31.
//  Copyright (c) 2014年 tato. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBKeyChainHelper : NSObject

+(void)saveUserName:(NSString *)userName
    userNameService:(NSString *)userNameService
           password:(NSString *)pwd
    passwordService:(NSString *)pwdService;


+(void)deleteWithUserNameService:(NSString *)userNameService
                 passwordService:(NSString *)pwdService;

+(void)deletepasswordService:(NSString *)pwdService;

+(NSString *)getUserNameWithService:(NSString *)userNameService;

+(NSString *)getPasswordWithService:(NSString *)pwdService;

@end
