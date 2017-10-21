//
//  UIBarButtonItem+SWExtension.h
//
//
//  Created by iMcG33k on 15/8/16.
//  Copyright (c) 2015年 iMcG33k. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (SWExtension)

+ (instancetype)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;

@end
