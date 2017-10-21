//
//  NSString+MD5Encrypt.m
//  NTOFFICE
//
//  Created by natonAir on 15/8/6.
//  Copyright (c) 2015年 natonAir. All rights reserved.
//

#import "NSString+MD5Encrypt.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MD5Encrypt)

-(NSString *) md5HexDigest
{
    
    const char *original_str = [self UTF8String];
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(original_str, strlen(original_str), result);
    
    NSMutableString *hash = [NSMutableString string];
    
    for (int i = 0; i < 16; i++)
        
        [hash appendFormat:@"%02X", result[i]];
    
    return [hash lowercaseString];
}
@end
