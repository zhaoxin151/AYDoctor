//
//  UIView+SWExtension.m
//  NTOFFICE_TS
//
//  Created by Naton on 2017/8/8.
//  Copyright © 2017年 natonAir. All rights reserved.
//

#import "UIView+SWExtension.h"

@implementation UIView (SWExtension)
/// 获取视图控制器
- (UIViewController*)sw_currentViewController {
  for (UIView* next = [self superview]; next; next = next.superview) {
    UIResponder* nextResponder = [next nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
      return (UIViewController*)nextResponder;
    }
  }
  return nil;
}

/// 获取导航控制器
- (UINavigationController*)sw_currentNavigationController {
  for (UIView* next = [self superview]; next; next = next.superview) {
    UIResponder* nextResponder = [next nextResponder];
    if ([nextResponder isKindOfClass:[UINavigationController class]]) {
      return (UINavigationController*)nextResponder;
    }
  }
  return nil;
}

/// 获取视图控制器
+ (UIViewController*)sw_currentViewController:(UIView *)view {
  for (UIView* next = [view superview]; next; next = next.superview) {
    UIResponder* nextResponder = [next nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
      return (UIViewController*)nextResponder;
    }
  }
  return nil;
}



/// 获取导航控制器
+ (UINavigationController*)sw_currentNavigationController:(UIView *)view {
  for (UIView* next = [view superview]; next; next = next.superview) {
    UIResponder* nextResponder = [next nextResponder];
    if ([nextResponder isKindOfClass:[UINavigationController class]]) {
      return (UINavigationController*)nextResponder;
    }
  }
  return nil;
}

@end
