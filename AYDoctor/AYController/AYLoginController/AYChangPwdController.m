//
//  AYChangPwdController.m
//  AYDoctor
//
//  Created by WHB_NATON on 2017/10/21.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import "AYChangPwdController.h"

@interface AYChangPwdController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *oldPwdTextField;  //旧密码
@property (weak, nonatomic) IBOutlet UITextField *pwdTextFiled;     //新密码
@property (weak, nonatomic) IBOutlet UITextField *aginPwdTextField; //再次输入
@property (weak, nonatomic) IBOutlet UIButton *commitBtn;

@end

@implementation AYChangPwdController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改密码";
    
    [self setupUI];
}

- (void)setupUI {
    _oldPwdTextField.delegate = self;
    _pwdTextFiled.delegate = self;
    _aginPwdTextField.delegate = self;
    
    _commitBtn.layer.masksToBounds = YES;
    _commitBtn.layer.cornerRadius = 6.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//提交按钮被按下
- (IBAction)commitBtnHandler:(id)sender {
    
}



@end
