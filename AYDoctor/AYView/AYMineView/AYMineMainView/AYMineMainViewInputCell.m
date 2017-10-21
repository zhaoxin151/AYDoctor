//
//  AYMineMainViewInputCell.m
//  AYDoctor
//
//  Created by WHB_NATON on 2017/10/21.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import "AYMineMainViewInputCell.h"

#define addressText @"请输入就诊地点，患者预约成功后将就此抵达加号，如北京人民医院门诊楼三楼分诊台"
#define specialityText @"请输入您的擅长，最多100字"
#define detailText     @"请输入您的简介，最多500字"
@interface AYMineMainViewInputCell()<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *detalTextView;

@end
@implementation AYMineMainViewInputCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _detalTextView.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//设置tag,用来区分三个textView 1.就诊地点 2.擅长 3.简介
- (void)setTextViewTag:(NSInteger)textViewTag {
    if(4 > textViewTag > 0 ) {
        self.detalTextView.tag = textViewTag;
        self.detalTextView.textColor = [UIColor grayColor];
        if(textViewTag == 1) {
            self.detalTextView.text = addressText;
        }else if (textViewTag == 2){
            self.detalTextView.text = specialityText;
        }else if (textViewTag == 3) {
            self.detalTextView.text = detailText;
        }
    }
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
        [self textViewEndEditingWithText:@"" textViewTag:textView.tag];
    }else {
        [self textViewEndEditingWithText:textView.text textViewTag:textView.tag];
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

//block 回调
- (void)textViewEndEditingWithText:(NSString *)text textViewTag:(NSInteger)tag{
    if(self.textViewEndEditing) {
        self.textViewEndEditing(text, tag);
    }
}


@end
