//
//  UIPasteboard+Extension.m
//  NTOFFICE_TS
//
//  Created by Naton on 2016/11/17.
//  Copyright © 2016年 natonAir. All rights reserved.
//

#import "UIPasteboard+Extension.h"

@implementation UIPasteboard (Extension)

+ (NSString *)firstItemFromPasteboard {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    NSArray *dataArray = [pasteboard items];
    //    NSLog(@"123 %@", dataArray);
    
    if (dataArray.count == 0 || !dataArray) {  // 防止剪贴板数组为空
        return @"";
    }

    NSDictionary *dict;
    @try {
       dict = (NSDictionary *)[dataArray objectAtIndex:0];
    } @catch (NSException *exception) {
        
        return @"";
    } @finally {
        NSString *pastedText;
        if ([dict objectForKey:@"public.utf8-plain-text"]  || [dict objectForKey:@"public.text"] ) {
            // this is a text paste
            pastedText = (NSString *)[dict objectForKey:@"public.utf8-plain-text"] ? [dict objectForKey:@"public.utf8-plain-text"] : [dict objectForKey:@"public.text"]; // 优先复制utf8-plain-text (ntoffice)
        }
        if([pastedText isKindOfClass:[NSString class]])
        {
            return pastedText ? pastedText : @"";
        }
        else
        {
            return @"";
        }
    }
    
    
}
@end
