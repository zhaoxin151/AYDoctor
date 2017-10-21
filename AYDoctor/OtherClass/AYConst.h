//
//  AYConst.h
//  AYDoctor
//
//  Created by WHB_NATON on 2017/10/21.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AYConst : NSObject

#define g_window [UIApplication sharedApplication].keyWindow
#define g_App ((AppDelegate*)[[UIApplication sharedApplication] delegate])
#define g_default [NSUserDefaults standardUserDefaults]
#define g_config ((AppDelegate*)[[UIApplication sharedApplication] delegate]).config
#define g_alert [[AlertViewShow alloc] init]
#define g_notify [NSNotificationCenter defaultCenter]
#define g_mainTBC ((AppDelegate*)[[UIApplication sharedApplication] delegate]).mainTBC
#define g_loginUser [AYLoginUser sharedInstance]
#define g_appName [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define g_appVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define g_appDeviceBoundle [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleURLTypes"];

#define DEVICEWIDTH [UIScreen mainScreen].bounds.size.width
#define DEVICEHIGHT [UIScreen mainScreen].bounds.size.height
#define WidthScale(number) ([UIScreen mainScreen].bounds.size.width / 320 * (number))
#define HeightScale(number) ([UIScreen mainScreen].bounds.size.height / NORMAL_HEIGHT * (number))

//判断是否是iOS7
#define isIOS7AndLater ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.1 ? YES : NO)
// 判断是否大于等于
#define isIOS9AndLater ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0 ? YES : NO)
#define isIOS10AndLater ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0 ? YES : NO)
#define isIOS11AndLater ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0 ? YES : NO)
#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

//导航栏和按钮颜色
#define naviBarAndButtonColor [UIColor colorWithRed:0.0 / 255 green:129.0 / 255.0 blue:209.0 / 255.0 alpha:1.0]
#define silderSegmentColor [UIColor colorWithRed:0.0 / 255 green:129.0 / 255.0 blue:209.0 / 255.0 alpha:1.0]
//朋友圈中按钮颜色
#define TimeLineCellHighlightedColor [UIColor colorWithRed:92.0 / 255.0 green:140.0 / 255.0 blue:193.0 / 255.0 alpha:1.0]
/**
 *  弱引用
 */
//
#define AYWeakself __weak typeof(self) weakself = self;
#define AYStrongself __strong typeof(weakself) strongself = weakself;

//获取宽高度
#define AY_MULTILINE_TEXTSIZE(text, font, maxSize, mode) [text length] > 0 ? [text boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{ NSFontAttributeName : font } context:nil].size : CGSizeZero;

#define navigationbarColorKey @"navigationbarColorKey"

#define AY_USER_USERID @"com.AY.userId"
#define AY_USER_PASSWORD @"com.AY.password"
#define AY_USER_USERNAME @"com.AY.userName"
#define AY_USER_TOKEN @"com.AY.token"

@end
