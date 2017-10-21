//
//  AYMineSpecialityController.m
//  AYDoctor
//
//  Created by naton on 2017/10/21.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import "AYMineSpecialityController.h"

#define addressText @"请输入就诊地点，患者预约成功后将就此抵达加号，如北京人民医院门诊楼三楼分诊台"
#define specialityText @"请输入您的擅长，最多100字"
#define detailText     @"请输入您的简介，最多500字"
@interface AYMineSpecialityController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *addressTextView;
@property (weak, nonatomic) IBOutlet UITextView *specialityTextView;
@property (weak, nonatomic) IBOutlet UITextView *detailTextView;

@end

@implementation AYMineSpecialityController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置就诊地点/擅长/简介";
    [self setupNaviBar];
    [self setupTextViewConfig];
}

- (void)setupNaviBar {
    UIBarButtonItem *completBtn = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(completBtnHandler:)];
    self.navigationItem.rightBarButtonItem = completBtn;
}

- (void)setupTextViewConfig {
    self.addressTextView.delegate = self;
    self.addressTextView.tag = 1;
    self.addressTextView.text = addressText;
    self.addressTextView.textColor = [UIColor grayColor];
    
    self.specialityTextView.delegate = self;
    self.specialityTextView.tag = 2;
    self.specialityTextView.text = specialityText;
    self.specialityTextView.textColor = [UIColor grayColor];
    
    self.detailTextView.delegate = self;
    self.detailTextView.tag = 3;
    self.detailTextView.text = detailText;
    self.detailTextView.textColor = [UIColor grayColor];
}

#pragma mark - UITextViewDelegate
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if(textView.text.length < 1){
        if(textView.tag == 1){
            textView.text = addressText;
        }else if (textView.tag == 2) {
            textView.text = specialityText;
        }else if (textView.tag == 3) {
            textView.text = detailText;
        }
        textView.textColor = [UIColor grayColor];
    }
    [textView resignFirstResponder];
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if([textView.text isEqualToString:addressText] || [textView.text isEqualToString:specialityText] || [textView.text isEqualToString:detailText]){
        textView.text=@"";
        textView.textColor=[UIColor blackColor];
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    if(!textView.isFirstResponder) {
        [textView becomeFirstResponder];
    }
    if ([textView.text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
    }
    textView.textColor = [UIColor blackColor];
    if(textView.tag == 2) {
        //限制100字
        //字数限制操作
        if (textView.text.length >= 100) {
            textView.text = [textView.text substringToIndex:100];
        }
    }else if (textView.tag == 3) {
        //限制500字
        if (textView.text.length >= 500) {
            textView.text = [textView.text substringToIndex:100];
        }
    }
}

#pragma mark -- @selector
//完成按钮被点击
- (void)completBtnHandler:(UIButton *)sender {
    [self.view endEditing:YES];
}

//点击空白去除键盘
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
