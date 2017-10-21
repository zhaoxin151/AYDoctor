//
//  NSString+FileSize.h
//  NTOFFICE_TS
//
//  Created by Naton on 16/10/20.
//  Copyright © 2016年 natonAir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FileSize)
+ (long long) nt_fileSizeAtPath:(NSString*) filePath;
- (long long) nt_fileSizeAtPath;
- (NSString *) nt_displayHandleTotalBtytes;

/// 获取路径中文件后缀名（包含.）
- (NSString*) nt_pathExtensionIncludingDot;

/// 通过url.query 获取 参数字典
- (NSDictionary *)nt_getParametersDictFromUrlQuery;
@end
