//
//  AYSelectPickView.h
//  AYDoctor
//
//  Created by naton on 2017/10/21.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import <UIKit/UIKit.h>

#define AYYEARARRAY @[@"1年",@"2年",@"3年",@"4年",@"5年",@"6年",@"7年",@"8年",@"9年",@"10年",@"10年以上"]
@interface AYSelectPickView : UIView

+ (instancetype)showOnView:(UIView *)view;

@property (nonatomic , copy) void (^datePickComplet)(NSInteger selectIndex); /// 范围选择 回调


@end
