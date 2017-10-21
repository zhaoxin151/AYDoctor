//
//  NSString+FileSize.m
//  NTOFFICE_TS
//
//  Created by Naton on 16/10/20.
//  Copyright © 2016年 natonAir. All rights reserved.
//

#import "NSString+FileSize.h"

@implementation NSString (FileSize)
+ (long long) nt_fileSizeAtPath:(NSString*) filePath{
    
    NSFileManager* manager = [NSFileManager defaultManager];
    
    if ([manager fileExistsAtPath:filePath]){
        
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}
- (long long) nt_fileSizeAtPath{
    
    NSFileManager* manager = [NSFileManager defaultManager];
    
    if ([manager fileExistsAtPath:self]){
        
        return [[manager attributesOfItemAtPath:self error:nil] fileSize];
    }
    return 0;
}

- (NSString *)nt_displayHandleTotalBtytes;
{
    if(self.length < 7)
    {
        return [NSString stringWithFormat:@"%.2fKB",[self doubleValue]/1000];
    }
    else
    {
        return [NSString stringWithFormat:@"%.2fMB",[self doubleValue]/1000000];
    }
}


- (NSString*) nt_pathExtensionIncludingDot {
    return [NSString stringWithFormat:@".%@", self.pathExtension];
}


- (NSDictionary *)nt_getParametersDictFromUrlQuery
{
    NSMutableDictionary * parametersDictionary = [NSMutableDictionary dictionary];
    NSArray * queryComponents = [self componentsSeparatedByString:@"&"];
    for (NSString * queryComponent in queryComponents) {
        NSString * key = [queryComponent componentsSeparatedByString:@"="].firstObject;
        NSString * value = [queryComponent substringFromIndex:(key.length + 1)];
        [parametersDictionary setObject:value forKey:key];
    }
    return parametersDictionary.copy;
}



@end
