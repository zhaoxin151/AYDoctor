//
//  AYForgetPasswordController.m
//  AYDoctor
//
//  Created by WHB_NATON on 2017/10/21.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import "AYForgetPasswordController.h"

@interface AYForgetPasswordController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *verifyBtn;
@property (weak, nonatomic) IBOutlet UIButton *commitBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *verifyTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation AYForgetPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    _phoneTextField.delegate = self;
    _verifyTextField.delegate = self;
    _passwordTextField.delegate = self;
    _phoneTextField.returnKeyType = UIReturnKeyDone;
    _verifyTextField.returnKeyType = UIReturnKeyDone;
    _passwordTextField.returnKeyType = UIReturnKeyDone;
    
    _commitBtn.layer.masksToBounds = YES;
    _commitBtn.layer.cornerRadius = 6.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//获取验证码
- (IBAction)verifyBtnHandler:(UIButton *)sender {
}

//提交
- (IBAction)commitBtnHandler:(UIButton *)sender {
}

#pragma mark -- UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.view endEditing:YES];
    return YES;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
