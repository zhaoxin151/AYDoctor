//
//  NSString+URLEncodingAdditions.h
//  NTOFFICE_TS
//
//  Created by NATON on 2017/5/22.
//  Copyright © 2017年 natonAir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URLEncodingAdditions)

- (NSString *)URLEncodedString;
- (NSString *)URLDecodedString;

@end
