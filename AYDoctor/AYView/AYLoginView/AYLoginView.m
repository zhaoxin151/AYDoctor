//
//  AYLoginView.m
//  AYDoctor
//
//  Created by WHB_NATON on 2017/10/21.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import "AYLoginView.h"
#import "AlertViewShow.h"

#define LINEBACKGROUD_S [UIColor colorWithRed:8.0/255 green:132.0/255 blue:206.0/255 alpha:1.0f]
#define LINEBACKGROUD   [UIColor colorWithRed:204.0/255 green:204.0/255 blue:204.0/255 alpha:1.0f]

@interface AYLoginView()<UITextFieldDelegate>
{
    UIImageView *userIcon;
    UIImageView *pswIcon;
    UIView *userSeperateView;
    UIView *pwdSeperateView;
}

@property (nonatomic , strong) UIImageView *iconImageView;
@property (nonatomic , strong) UITextField *userName;
@property (nonatomic , strong) UITextField *password;
@property (nonatomic , strong) UIButton *loginButton;
@property (nonatomic , strong) UIButton *forgetPWButton;
@property (nonatomic , strong) UIButton *loginExceptionBtn;

@end
@implementation AYLoginView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor whiteColor];
        [self initUI];
    }
    return self;
}

-(void)initUI
{
    self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width/2-30, 100, 60, 60)];
    self.iconImageView.image = [UIImage imageNamed:@"AY_Login_Icon"];
    self.iconImageView.backgroundColor = [UIColor clearColor];
    self.iconImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:self.iconImageView];
    
    userIcon = [[UIImageView alloc]initWithFrame:CGRectMake(30, 193, 25, 25)];
    userIcon.backgroundColor = [UIColor clearColor];
    userIcon.contentMode = UIViewContentModeScaleAspectFit;
    userIcon.image = [UIImage imageNamed:@"AY_Login_userName"];
    [self addSubview:userIcon];
    
    self.userName = [[UITextField alloc]initWithFrame:CGRectMake(63, 191, self.frame.size.width-93, 31)];
    self.userName.placeholder = @"请输入员工编号";
    self.userName.font = [UIFont systemFontOfSize:15.0f];
    self.userName.textAlignment = NSTextAlignmentLeft;
    self.userName.borderStyle = UITextBorderStyleNone;
    self.userName.backgroundColor = [UIColor clearColor];
    self.userName.enablesReturnKeyAutomatically = YES;
    self.userName.returnKeyType = UIReturnKeyDone;
    self.userName.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.userName.userInteractionEnabled = YES;
    self.userName.secureTextEntry = NO;
    self.userName.delegate = self;
    self.userName.tag = 1;
    [self addSubview:self.userName];
    
    userSeperateView = [[UIView alloc]initWithFrame:CGRectMake(30, 222, self.frame.size.width-60, 0.5f)];
    userSeperateView.backgroundColor = LINEBACKGROUD;
    [self addSubview:userSeperateView];
    
    pswIcon = [[UIImageView alloc]initWithFrame:CGRectMake(30, 233, 25, 25)];
    pswIcon.backgroundColor = [UIColor clearColor];
    pswIcon.contentMode = UIViewContentModeScaleAspectFit;
    pswIcon.image = [UIImage imageNamed:@"AY_Login_Password"];
    [self addSubview:pswIcon];
    
    self.password = [[UITextField alloc]initWithFrame:CGRectMake(63, 230, self.frame.size.width-93, 31)];
    self.password.placeholder = @"请输入密码";
    self.password.font = [UIFont systemFontOfSize:15.0f];
    self.password.textAlignment = NSTextAlignmentLeft;
    self.password.borderStyle = UITextBorderStyleNone;
    self.password.backgroundColor = [UIColor clearColor];
    self.password.enablesReturnKeyAutomatically = YES;
    self.password.returnKeyType = UIReturnKeyDone;
    self.password.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.password.secureTextEntry = YES;
    self.password.userInteractionEnabled = YES;
    self.password.delegate = self;
    self.password.tag = 2;
    [self addSubview:self.password];
    
    pwdSeperateView = [[UIView alloc]initWithFrame:CGRectMake(30, 262, self.frame.size.width-60, 0.5f)];
    pwdSeperateView.backgroundColor = LINEBACKGROUD;
    [self addSubview:pwdSeperateView];
    
    self.loginButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 301.0, self.frame.size.width-60, 40)];
    //[self.loginButton setBackgroundImage:[UIImage imageNamed:@"LgButton"] forState:UIControlStateNormal];
    [self.loginButton setBackgroundColor:naviBarAndButtonColor];
    self.loginButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.loginButton.layer.masksToBounds = YES;
    self.loginButton.layer.cornerRadius = 5.0f;
    [self addSubview:self.loginButton];
    
    self.forgetPWButton = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH-120, CGRectGetMaxY(self.loginButton.frame)+5, 110, 30)];
    [self.forgetPWButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    [self.forgetPWButton setTitleColor:naviBarAndButtonColor forState:UIControlStateNormal];
    self.forgetPWButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.forgetPWButton addTarget:self action:@selector(forgetPWButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.forgetPWButton];
}

-(void)loginButtonClick:(UIButton *)sender
{
    NSLog(@"loginButton Click");
    AlertViewShow *alert = [[AlertViewShow alloc] init];
    
    NSInteger nameLen = [self.userName.text length];
    NSInteger passLen = [self.password.text length];
    
//    if ([self.userName.text length] <= 0 && [self.password.text length] <= 0) {
//        [alert showAlert:@"请输入账号和密码"];
//        return;
//    }
//    if(nameLen <= 0)
//    {
//        [alert showAlert:@"请输入账号"];
//        return;
//    }
//    if((nameLen > 0 && nameLen < 7) || nameLen > 11) {
//        [alert showAlert:@"请重新输入账号"];
//        return;
//    }
//    if(passLen <= 0)
//    {
//        [alert showAlert:@"请输入密码"];
//        return;
//    }
    
    [self endEditing:YES];
    if(self.delegate !=nil)
    {
        [self.delegate loginButtonPress:self.userName.text passWord:self.password.text];
    }
}

- (void)forgetPWButtonClick:(UIButton *)button {
    if ([self.delegate respondsToSelector:@selector(forgetPWButtonPress)]) {
        [self.delegate performSelector:@selector(forgetPWButtonPress)];
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(textField.tag == 1)
    {
        userSeperateView.backgroundColor = LINEBACKGROUD_S;
    }
    else
    {
        pwdSeperateView.backgroundColor = LINEBACKGROUD_S;
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField.tag == 1)
    {
        userSeperateView.backgroundColor = LINEBACKGROUD;
    }
    else
    {
        pwdSeperateView.backgroundColor = LINEBACKGROUD;
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self textFieldResignResponder];
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self textFieldResignResponder];
}

-(void)textFieldResignResponder
{
    [self.userName resignFirstResponder];
    [self.password resignFirstResponder];
}

@end
