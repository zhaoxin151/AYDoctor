//
//  AYConfig.m
//  AYDoctor
//
//  Created by WHB_NATON on 2017/10/21.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import "AYConfig.h"

@implementation AYConfig
-(id)init{
    self = [super init];
    if(self){
        [self getDefaultValue];
    }
    return self;
}

- (void)getDefaultValue {
    self.apiUrl = @"";
}
@end
