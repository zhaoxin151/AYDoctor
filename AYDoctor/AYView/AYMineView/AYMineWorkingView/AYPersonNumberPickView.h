//
//  AYPersonNumberPickView.h
//  AYDoctor
//
//  Created by naton on 2017/10/22.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AYPersonNumberPickView : UIView

+ (instancetype)showOnView:(UIView *)view;

@property (nonatomic , copy) void (^datePickComplet)(NSInteger selectIndex); /// 范围选择 回调

@end
