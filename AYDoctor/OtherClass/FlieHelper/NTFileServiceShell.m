//
//  NTFileServiceShell.m
//  NTOFFICE_TS
//
//  Created by naton on 16/7/20.
//  Copyright © 2016年 natonAir. All rights reserved.
//

#import "NTFileServiceShell.h"
#import "NSString+DG.h"

@implementation NTFileServiceShell

+ (NSString*)myDocPath {
    NSArray* cachesArr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString* cachesPath = [cachesArr objectAtIndex:0];
    return [cachesPath stringByAppendingPathComponent:@"MyDocuments"];
}

+ (NSString*)tmpPathInMyDoc {
    return [[self myDocPath] stringByAppendingPathComponent:@"tmp"];
}

+ (NSString*)cachesPath {
    NSArray* cachesArr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString* cachesPath = [cachesArr objectAtIndex:0];
    return cachesPath;
}

+ (void)confirmOAAttachmentDirCreated {
    NSFileManager* fm = [NSFileManager defaultManager];
    NSString* myDocPath = [self myDocPath];
    if (![fm fileExistsAtPath:myDocPath]) {
        [fm createDirectoryAtPath:myDocPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
}

//+ (void)moveToMyDocDir {
//    
//}


+ (void)clearCaches
{
    [[[NSOperationQueue alloc] init] addOperationWithBlock:^{
        NSFileManager* fm = [NSFileManager defaultManager];
        NSString* caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        NSArray* tmpArr = [fm contentsOfDirectoryAtPath:caches error:nil];
        
        [tmpArr enumerateObjectsUsingBlock:^(NSString* _Nonnull obj, NSUInteger idx, BOOL* _Nonnull stop) {
            [[NSFileManager defaultManager] removeItemAtPath:[caches stringByAppendingPathComponent:obj] error:nil];
        }];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [HUDNotificationCenter showMessage:@"清除成功" hideAfter:2.0f];
        }];
    }];
}

// 删除Caches目录中除了MyDocuments(OAAttachment子目录)的部分
+ (void)clearCachesExceptMyDocuments
{
    NSFileManager* fm = [NSFileManager defaultManager];
    NSString* caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSArray* tmpArr = [fm contentsOfDirectoryAtPath:caches error:nil];
    
    [tmpArr enumerateObjectsUsingBlock:^(NSString* _Nonnull obj, NSUInteger idx, BOOL* _Nonnull stop) {
        if (![obj isEqualToString:@"MyDocuments"]) {
            [[NSFileManager defaultManager] removeItemAtPath:[caches stringByAppendingPathComponent:obj] error:nil];
        }
    }];
}

// 只删除MyDocuments文件
+ (void)clearMyDocuments
{
    NSString* caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    [[NSFileManager defaultManager] removeItemAtPath:[caches stringByAppendingPathComponent:@"MyDocuments"] error:nil];
}

// 删除OA附件和通知公告附件和流程附件
+ (void)removeOAAttachment
{
    NSString* caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSString* cachOADirectory = [caches stringByAppendingPathComponent:@"MyDocuments"];
    [[NSFileManager defaultManager] removeItemAtPath:cachOADirectory error:nil];
}

// 判断是否有重名文件
+ (BOOL)hasDuplicationFileName:(NSString*)fileName {
    NSFileManager* fm = [NSFileManager defaultManager];
    NSArray* contentsOfMydocDir = [fm contentsOfDirectoryAtPath:[self myDocPath] error:nil];
    __block int count = 0;
    [contentsOfMydocDir enumerateObjectsUsingBlock:^(NSString* _Nonnull obj, NSUInteger idx, BOOL* _Nonnull stop) {
        if ([obj isEqualToString:fileName]) {
            count++;
        }
    }];
    return count?YES:NO;
}

+ (NSString*)suggestDuplicationFileName:(NSString*)fileName {
    NSFileManager* fm = [NSFileManager defaultManager];
    NSString* tmpFileName = @"suggestDuplicationFileName方法异常";
    // 去除后缀名后加index
    NSString* pathExtension = [NSString stringWithFormat:@".%@", fileName.pathExtension];
    NSString* fileNameWithoutExtension = [fileName removeSubString:pathExtension];
    BOOL isDir;
    for (int i = 1; i<=1024; i++) {
        tmpFileName = [NSString stringWithFormat:@"%@-%d%@", fileNameWithoutExtension, i,pathExtension];
        if (![fm fileExistsAtPath:[[self myDocPath] stringByAppendingPathComponent:tmpFileName] isDirectory:&isDir]) {
            break;
        }
    }
    return tmpFileName;
    
}
@end
