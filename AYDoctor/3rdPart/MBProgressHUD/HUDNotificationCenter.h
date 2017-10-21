//
//  HUDNotificationCenter.h
//  baihuicrm
//
//  Created by Wang GuangHui on 15/10/14.
//  Copyright © 2015年 baihui. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MBProgressHUD;
@interface HUDNotificationCenter : NSObject




+ (void)showMessage:(NSString *)text;
+ (void)showMessage:(NSString *)text hideAfter:(NSTimeInterval)interval;

+ (void)showMessageCenter:(NSString *)text hideAfter:(NSTimeInterval)interval;

+ (void)showLoading:(NSString *)text;
+ (void)showLoading:(NSString *)text forBackView:(UIView *)backView;
+ (void)showLoadingAndDimBackground:(NSString *)text;
+ (void)hideLoading;
+ (void)hideLoading:(UIView *)backView;
+ (void)showLoadingAndDimBackground:(NSString *)text hideAfter:(NSTimeInterval)interval;

+ (void)showMessageTitle:(NSString *)text detail:(NSString *)text;
+ (void)showMessageTitle:(NSString *)text detail:(NSString *)text hideAfter:(NSTimeInterval)interval;

+ (void)showExclamationTitle:(NSString *)title detail:(NSString *)detail;
+ (void)showExclamation:(NSString *)title;

/* show or hide in xxx view */
+ (void)showMessage:(NSString*)text toView:(UIView*)view hideAfter:(NSTimeInterval)interval keyBoardHide:(BOOL)visible;
+ (void)hideForView:(UIView*)view;


/* background  color only one */
+ (void)showLoadingAndTranslucentBackground:(NSString*)text;

/**
 *自定义
 *view 默认window
 */
+ (MBProgressHUD *)showCustomView:(UIView *)customView toView:(UIView *)view;




@end
