//
//  AppDelegate.m
//  AYDoctor
//
//  Created by WHB_NATON on 2017/10/20.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import "AppDelegate.h"
#import "AYLoginViewController.h"
#import "IQKeyboardManager.h"


@interface AppDelegate ()<AYLoginDelegate>

@property (nonatomic, strong)AYLoginViewController *loginCR;

@property (nonatomic, strong)NSString *userName;
@property (nonatomic, strong)NSString *password;
@property (nonatomic, assign)BOOL isUpdateVer;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //去自动登录或者跳转到登录界面
    self.config = [[AYConfig alloc]init];
    
    [self checkUpdate:nil];
    [self GoToMainViewORLogin];
    [self p_setupKeyBoardManager];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//去自动登录或者跳转到登录界面
- (void)GoToMainViewORLogin {
    if([self isHaveToken])
    {
        //自动登录
        [self autoLogin];
    }
    else
    {
        //登录界面初始化
        [self goLoginVC];
    }
}

//判断token值是否存在
- (BOOL)isHaveToken
{
    if(g_loginUser.token && g_loginUser.token.length > 0)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

//同步请求自动登陆
-(void)autoLogin
{
//    NSString *apiUrl = @"user/login/nt";
//    NSString *strUrl = [g_config.apiUrl stringByAppendingString:apiUrl];
//    NSURL *url = [NSURL URLWithString:strUrl];
//
//    NSString *appSerial = [[DeviceInfo deviceIdentifierUUID] md5HexDigest];
//    NSString *post = [NSString stringWithFormat:@"access_token=%@&userId=%@&serial=%@",g_loginUser.token,g_loginUser.userId,appSerial];
//    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding];
//
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:4.0f];
//    [request setHTTPMethod:@"POST"];
//    [request setHTTPBody:postData];
//
//    NSError *error;
//    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
//    if(data == nil)
//    {
//        [self loginSuccessed:nil];
//    }
//    NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
//    int code=[[resDict objectForKey:@"resultCode"] intValue];
//    if (code==1)
//    {
//        NSDictionary *response = [resDict objectForKey:@"data"];
//        NSInteger tokenValid = [[response objectForKey:@"tokenValid"] integerValue];
//        if(tokenValid == 1)
//        {
//            g_loginUser.token = [response objectForKey:@"newToken"];
//            [self loginSuccessed:nil];
//        }
//        else
//        {
//            [self goLoginVC];
//        }
//    }
//    else
//    {
//        [self goLoginVC];
//        //[HUDNotificationCenter showMessage:[error description] hideAfter:2.0f];
//    }
}

//跳转到登录界面
- (void)goLoginVC {
    self.loginCR = [[AYLoginViewController alloc]init];
    self.loginCR.delegate = self;
    
    UINavigationController *naviCR = [[UINavigationController alloc]initWithRootViewController:self.loginCR];
    self.window.rootViewController = naviCR;
    [self.window makeKeyAndVisible];
}

//登录成功
-(void)loginSuccessed:(NSObject *)obj {
    [self showMainUIWithIndex:0];
}

-(void)showMainUIWithIndex:(int)index
{
    _mainTBC = [[AYTabBarController alloc] init];
    [_mainTBC.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_backGround"]];
    _mainTBC.index = index;
    self.window.rootViewController = _mainTBC;
    [self.window makeKeyAndVisible];
}

#pragma mark - checkUpdate
-(void)checkUpdate:(NSObject *)obj
{
//    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
//    NSString *appVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
//
//    //请求服务器检查版本
//    NSDictionary *dic = @{@"os":@"ios", @"version":appVersion,@"userNum":g_loginUser.userNum};
//    [NTServiceShell CheckUpdateInfo:dic completion:^(NSDictionary *response) {
//        NSString *ret = nil;
//        NSString *newNote = @"";
//        NSString *titleStr = @"更新内容";
//        if (response != nil) {
//            if (response[@"ret"]) {
//                ret = response[@"ret"];
//                newNote = response[@"newNote"] ? response[@"newNote"] : @"";
//                NSString *newVer = [NSString stringWithFormat:@"%@",response[@"newVer"]];
//                NSString *lastStr = [[newVer componentsSeparatedByString:@"."] lastObject];
//                if(lastStr && lastStr.length > 2){
//                    self.isUpdateVer = YES;
//                }
//                titleStr = [NSString stringWithFormat:@"%@(V%@)",titleStr,newVer];
//            }
//        }
//        if ([ret isEqualToString:@"0"]) {
//            [self setup_CustomUpdateViewWithStatus:NO titleStr:titleStr contentStr:newNote];
//        } else if ([ret isEqualToString:@"-1"]) {
//            [self setup_CustomUpdateViewWithStatus:YES titleStr:titleStr contentStr:newNote];
//        }
//    } withError:^(NSString *error) {
//    }];
}

//设置键盘遮盖问题
- (void)p_setupKeyBoardManager {
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES; // 控制整个功能是否启用。
    manager.enableAutoToolbar = NO; // 控制是否显示键盘上的工具条
    manager.shouldResignOnTouchOutside =YES; // 控制点击背景是否收起键盘
    [manager setToolbarManageBehaviour:IQAutoToolbarBySubviews];
    manager.enableDebugging = YES;
}


@end
