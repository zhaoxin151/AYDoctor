//
//  NSString+URLEncodingAdditions.m
//  NTOFFICE_TS
//
//  Created by NATON on 2017/5/22.
//  Copyright © 2017年 natonAir. All rights reserved.
//

#import "NSString+URLEncodingAdditions.h"

@implementation NSString (URLEncodingAdditions)


- (NSString *)URLEncodedString {
    // Encode all the reserved characters, per RFC 3986
    // (<http://www.ietf.org/rfc/rfc3986.txt>)
    CFStringRef escaped =
    CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                            (CFStringRef)self,
                                            NULL,
                                            (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                            kCFStringEncodingUTF8);
#if defined(__has_feature) && __has_feature(objc_arc)
    return CFBridgingRelease(escaped);
#else
    return [(NSString *)escaped autorelease];
#endif
}

- (NSString *)URLDecodedString {
    NSMutableString *resultString = [NSMutableString stringWithString:self];
    [resultString replaceOccurrencesOfString:@"+"
                                  withString:@" "
                                     options:NSLiteralSearch
                                       range:NSMakeRange(0, [resultString length])];
    return [resultString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}


@end
