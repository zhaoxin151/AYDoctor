//
//  NTDatabaseHelper.m
//  NTOFFICE
//
//  Created by a004779 on 15/8/10.
//  Copyright (c) 2015年 natonAir. All rights reserved.
//

#import "AYDatabaseHelper.h"
//#import "AYFMEncryptDatabase.h"
#import <FMDatabaseAdditions.h>

@implementation AYDatabaseHelper

- (id)init
{
    self = [super init];
    if (self) {
//        [AYFMEncryptDatabase setEncryptKey:@"wanghaibo"];
        NSString* path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString* dbpath = [NSString stringWithFormat:@"/%@/%@.db", path, g_loginUser.token];
        
//#if NT_OFFICIAL_IDENTIFIER
//       queue = [NTFMEncryptDatabaseQueue databaseQueueWithPath:dbpath];
//#else
        queue = [FMDatabaseQueue databaseQueueWithPath:dbpath];
//#endif
    }
    return self;
}

+ (AYDatabaseHelper*)sharedInstance
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (void)inDatabase:(void (^)(FMDatabase*))block
{
    [queue inDatabase:^(FMDatabase* db) {
        block(db);
    }];
}

//更换用户数据库

+ (void)refreshDatabase
{
    AYDatabaseHelper* instance = [self sharedInstance];
    [instance Refresh];
}

- (void)Refresh
{
//    [AYFMEncryptDatabase setEncryptKey:@"wanghaibo"];
    NSString* path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString* dbpath = [NSString stringWithFormat:@"/%@/%@.db", path, g_loginUser.userId];
//#if NT_OFFICIAL_IDENTIFIER
//    queue = [NTFMEncryptDatabaseQueue databaseQueueWithPath:dbpath];
//#else
    queue = [FMDatabaseQueue databaseQueueWithPath:dbpath];
//#endif
}

//删除数据库
- (void)deleteDatabase:(NSString*)oldPath
{
    NSError* error;
    [[NSFileManager defaultManager] removeItemAtPath:oldPath error:&error];
}

@end
