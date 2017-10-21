//
//  ViewController.m
//  AYDoctor
//
//  Created by WHB_NATON on 2017/10/20.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import "AYLoginViewController.h"
#import "AYLoginView.h"
#import "AYForgetPasswordController.h"

@interface AYLoginViewController ()<AYLoginViewDelegate>

@end

@implementation AYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置push过后的返回按钮
    [self setupNaviBar];
    
    self.loginView = [[AYLoginView alloc]initWithFrame:self.view.frame];
    self.loginView.delegate = self;
    [self.view addSubview:self.loginView];
}

- (void)setupNaviBar {
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backBtn;
}

#pragma mark -- AYLoginViewDelegate
/*
*  登陆界面View的按钮点击事件的delegate
*
*  @return nil
*/
-(void)loginButtonPress:(NSString *)userName passWord:(NSString *)passWord
{
    [HUDNotificationCenter showLoading:@"正在登录" forBackView:self.view];
    AYWeakself;
    
//    NSString *appSerial = [[DeviceInfo deviceIdentifierUUID] md5HexDigest];
//    NSDictionary *dic = @{@"telephone":userNameStr,@"password":md5Password,@"grant_type":@"client_credentials",@"serial":appSerial};
//    [NTServiceShell UserLogin:dic completion:^(NSDictionary *response) {
//        NTLog(@"loginSuccess %@",dic);
//        [g_default setValue:[NSNumber numberWithInt:0] forKey:NT_USER_GESTURECOUNT];
//        if (![response[@"userKey"] isEqualToString:g_loginUser.userKey]){
//            [NTCircleViewModel saveGesture:nil Key:gestureFinalSaveKey];
//        }
//
//        [NTLoginUser saveLoginUserInfoDic:response];
//        [HUDNotificationCenter hideLoading:self.view];
//
//        if(weakself.delegate != nil)
//        {
//            [weakself.delegate loginSuccessed:nil];
//        }
//
//    } withError:^(NSString *error) {
//        NTLog(@"error:%@",error);
//        [HUDNotificationCenter hideLoading:self.view];
//        [HUDNotificationCenter showMessage:error hideAfter:2.0f];
//    }];
    [self.delegate loginSuccessed:nil];
}

- (void)forgetPWButtonPress {
    NSLog(@"点击忘记密码按钮");
    AYForgetPasswordController *forgetPwdCR = [[AYForgetPasswordController alloc] initWithNibName:@"AYForgetPasswordController" bundle:nil];
    forgetPwdCR.title = @"找回登录密码";
    [self.navigationController pushViewController:forgetPwdCR animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
