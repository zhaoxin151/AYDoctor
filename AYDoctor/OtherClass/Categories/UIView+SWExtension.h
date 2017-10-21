//
//  UIView+SWExtension.h
//  NTOFFICE_TS
//
//  Created by Naton on 2017/8/8.
//  Copyright © 2017年 natonAir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SWExtension)

/// 获取视图控制器
- (UIViewController*)sw_currentViewController;
/// 获取导航控制器
- (UINavigationController*)sw_currentNavigationController;

/// 获取视图控制器
+ (UIViewController*)sw_currentViewController:(UIView *)view;
/// 获取导航控制器
+ (UINavigationController*)sw_currentNavigationController:(UIView *)view;

@end
