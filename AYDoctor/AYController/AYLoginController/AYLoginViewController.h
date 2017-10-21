//
//  ViewController.h
//  AYDoctor
//
//  Created by WHB_NATON on 2017/10/20.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AYLoginView;
@protocol AYLoginDelegate;
@interface AYLoginViewController : UIViewController

@property (nonatomic, strong) AYLoginView *loginView;
@property (nonatomic, weak)   id<AYLoginDelegate> delegate;

@end

@protocol AYLoginDelegate <NSObject>

- (void)loginSuccessed:(NSObject*)obj;
//- (void)loginError:(NSError*)error;

@end

