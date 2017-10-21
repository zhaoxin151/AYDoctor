//
//  HUDNotificationCenter.m
//  baihuicrm
//
//  Created by Wang GuangHui on 15/10/14.
//  Copyright © 2015年 baihui. All rights reserved.
//

#import "HUDNotificationCenter.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"

@implementation HUDNotificationCenter


+ (void)showMessage:(NSString *)text {
    if(text.length == 0)
        return;
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:appDelegate.window animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = text;
    hud.margin = 10.f;
    hud.yOffset = 150.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1];
}

+ (void)showMessageTitle:(NSString *)title detail:(NSString *)detail {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:appDelegate.window animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = title;
    hud.detailsLabelText = detail;
    hud.margin = 10.f;
    hud.yOffset = 150.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1];
}

+ (void)showMessage:(NSString *)text hideAfter:(NSTimeInterval)interval {
    if(text.length == 0)
        return;
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:appDelegate.window animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = text;
    hud.margin = 10.f;
    hud.yOffset = 150.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:interval];
}

+ (void)showMessageCenter:(NSString *)text hideAfter:(NSTimeInterval)interval
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:appDelegate.window animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = text;
    hud.margin = 10.f;
    hud.yOffset = -50.0f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:interval];
}

+ (void)showMessageTitle:(NSString *)title detail:(NSString *)detail hideAfter:(NSTimeInterval)interval {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:appDelegate.window animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = title;
    hud.detailsLabelText = detail;
    hud.margin = 10.f;
    hud.yOffset = 150.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:interval];
}

+ (void)showLoading:(NSString *)text
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:appDelegate.window animated:YES];
    hud.labelText = text;
}

+ (void)showLoading:(NSString *)text forBackView:(UIView *)backView{
    //    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:backView animated:YES];
    hud.labelText = text;
}

+ (void)showLoadingAndDimBackground:(NSString *)text {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:appDelegate.window animated:YES];
    hud.dimBackground = YES;
    hud.labelText = text;
}

+ (void)hideLoading {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [MBProgressHUD hideHUDForView:appDelegate.window animated:YES];
}

+ (void)hideLoading:(UIView *)backView
{
    [MBProgressHUD hideHUDForView:backView animated:YES];
}

+ (void)showLoadingAndDimBackground:(NSString *)text hideAfter:(NSTimeInterval)interval {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:appDelegate.window animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = text;
    hud.dimBackground = YES;
    hud.margin = 10.f;
    hud.yOffset = 150.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:interval];
}

+ (void)showExclamationTitle:(NSString *)title detail:(NSString *)detail {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:appDelegate.window];
    [appDelegate.window addSubview:HUD];
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"al_exclamation.png"]] ;
    HUD.mode = MBProgressHUDModeCustomView;
    //	HUD.delegate = appDelegate;
    HUD.labelText = title;
    HUD.detailsLabelText = detail;
    [HUD show:YES];
    [HUD hide:YES afterDelay:1];
}

+ (void)showExclamation:(NSString *)title {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:appDelegate.window];
    [appDelegate.window addSubview:HUD];
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"al_exclamation.png"]];
    HUD.mode = MBProgressHUDModeCustomView;
    //	HUD.delegate = appDelegate;
    HUD.labelText = title;
    [HUD show:YES];
    [HUD hide:YES afterDelay:1];
}



+(void)showMessage:(NSString *)text toView:(UIView *)view hideAfter:(NSTimeInterval)interval keyBoardHide:(BOOL)visible
{
    if(text.length == 0 || view==nil)  return;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = text;
    hud.margin = 10.f;
    hud.yOffset = visible?150.f:0.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:interval];
}

+(void)hideForView:(UIView *)view
{
    if (view==nil) return;
    [MBProgressHUD hideHUDForView:view animated:YES];
}


+(void)showLoadingAndTranslucentBackground:(NSString *)text
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.window.backgroundColor = [UIColor blackColor];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:appDelegate.window animated:YES];
    //    hud.dimBackground = NO;
    hud.labelText = text;
    hud.color = [UIColor clearColor];
    //    hud.minSize = CGSizeMake(300, 200);
    hud.margin = 30;
    hud.labelFont = [UIFont systemFontOfSize:21.0f];
    hud.alpha = 0.5f;
    hud.backgroundColor = [UIColor blackColor];
}

+ (MBProgressHUD *)showCustomView:(UIView *)customView toView:(UIView *)view {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:(view == nil)?appDelegate.window:view animated:YES];
    hud.customView = customView;
    hud.color = [UIColor clearColor];
    hud.mode = MBProgressHUDModeCustomView;
    return hud;
}





@end
