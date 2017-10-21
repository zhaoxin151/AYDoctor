//
//  UIBarButtonItem+SWExtension.m
//
//
//  Created by iMcG33k on 15/8/16.
//  Copyright (c) 2015年 iMcG33k. All rights reserved.
//

#import "UIBarButtonItem+SWExtension.h"

@implementation UIBarButtonItem (SWExtension)

/**
 *  通过UIBarButtonItem 的 initWithCustomView 创建一个自定义的item
 */
+ (instancetype)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage {
  UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
  [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
  [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
  [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
  [button sizeToFit];
  

  return [[self alloc] initWithCustomView:button];
}

@end
