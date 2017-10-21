//
//  NTFileServiceShell.h
//  NTOFFICE_TS
//
//  Created by naton on 16/7/20.
//  Copyright © 2016年 natonAir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NTFileServiceShell : NSObject

/// 是否存在OAAttachment && OAAttachment/tmp目录
+ (void)confirmOAAttachmentDirCreated;



/// 清除Caches目录下所有文件
+ (void)clearCaches;
/// 删除Caches目录中除了MyDocuments(OAAttachment子目录)的部分
+ (void)clearCachesExceptMyDocuments;
/// 只删除MyDocuments文件
+ (void)clearMyDocuments;
/// 删除OA附件和通知公告附件， 目前和clearMyDocuments相同（带修复）
+ (void)removeOAAttachment;

+ (NSString*)cachesPath;
+ (NSString*)myDocPath;
+ (NSString*)tmpPathInMyDoc;

+ (BOOL)hasDuplicationFileName:(NSString*)fileName;
+ (NSString*)suggestDuplicationFileName:(NSString*)fileName;
@end
