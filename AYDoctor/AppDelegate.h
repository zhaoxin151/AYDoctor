//
//  AppDelegate.h
//  AYDoctor
//
//  Created by WHB_NATON on 2017/10/20.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AYTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) AYTabBarController *mainTBC;
@property (nonatomic, strong) AYConfig *config;

//同步请求登陆
-(void)autoLogin;

//去往登录视图
- (void)goLoginVC;

//去往指定tabbar子页面
-(void)showMainUIWithIndex:(int)index;


@end

