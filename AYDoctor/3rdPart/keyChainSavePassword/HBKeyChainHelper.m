//
//  HBKeyChainHelper.m
//  kanglian
//
//  Created by tato on 14-7-31.
//  Copyright (c) 2014年 tato. All rights reserved.
//

#import "HBKeyChainHelper.h"

@implementation HBKeyChainHelper

+(NSMutableDictionary *)getKeyChainQuery:(NSString *)service
{
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (__bridge id)kSecClassGenericPassword,(__bridge id)kSecClass,
            service,(__bridge id)kSecAttrService,
            service,(__bridge id)kSecAttrAccount,
            (__bridge id)kSecAttrAccessibleAfterFirstUnlock,(__bridge id)kSecAttrAccessible,
            nil];
}

+(void)saveUserName:(NSString *)userName
    userNameService:(NSString *)userNameService
           password:(NSString *)pwd
    passwordService:(NSString *)pwdService
{
    NSMutableDictionary *keychainQuery = [self getKeyChainQuery:userNameService];
    SecItemDelete((__bridge CFDictionaryRef)keychainQuery);
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:userName] forKey:(__bridge id)kSecValueData];
    SecItemAdd((__bridge CFDictionaryRef)keychainQuery, NULL);
    
    keychainQuery = [self getKeyChainQuery:pwdService];
    SecItemDelete((__bridge CFDictionaryRef)keychainQuery);
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:pwd] forKey:(__bridge id)kSecValueData];
    SecItemAdd((__bridge CFDictionaryRef)keychainQuery, NULL);
}

+(void)deleteWithUserNameService:(NSString *)userNameService
                 passwordService:(NSString *)pwdService
{
    NSMutableDictionary *keychainQuery = [self getKeyChainQuery:userNameService];
    SecItemDelete((__bridge CFDictionaryRef)keychainQuery);
    
    keychainQuery = [self getKeyChainQuery:pwdService];
    SecItemDelete((__bridge CFDictionaryRef)keychainQuery);
}

+(void)deletepasswordService:(NSString *)pwdService
{
    NSMutableDictionary *keychainQuery = [self getKeyChainQuery:pwdService];
    SecItemDelete((__bridge CFDictionaryRef)keychainQuery);
}

+(NSString *)getUserNameWithService:(NSString *)userNameService
{
    NSString *ret=nil;
    NSMutableDictionary *keychainQuery = [self getKeyChainQuery:userNameService];
    [keychainQuery setObject:(__bridge id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
    [keychainQuery setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    CFDataRef keyData=NULL;
    if(SecItemCopyMatching((__bridge CFDictionaryRef)keychainQuery, (CFTypeRef*)&keyData)==noErr)
    {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        }
        @catch (NSException *exception) {
            NSLog(@"unarchive of %@ failed :%@",userNameService,exception);
        }
        @finally {
            
        }
    }
    if(keyData)
        CFRelease(keyData);
    return ret;
}

+(NSString *)getPasswordWithService:(NSString *)pwdService
{
    NSString *ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeyChainQuery:pwdService];
    [keychainQuery setObject:(__bridge id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
    [keychainQuery setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if(SecItemCopyMatching((__bridge CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData)==noErr)
    {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        }
        @catch (NSException *exception) {
            NSLog(@"Unarchive of %@ failed: %@",pwdService,exception);
        }
        @finally {
            
        }
    }
    if(keyData)
        CFRelease(keyData);
    return ret;
}

@end
