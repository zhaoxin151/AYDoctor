//
//  AYLoginView.h
//  AYDoctor
//
//  Created by WHB_NATON on 2017/10/21.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AYLoginViewDelegate;
@interface AYLoginView : UIView

@property (nonatomic , weak) id<AYLoginViewDelegate> delegate;

@end

@protocol AYLoginViewDelegate <NSObject>

- (void)loginButtonPress:(NSString *)userName passWord:(NSString *)passWord;
- (void)forgetPWButtonPress;

@end
