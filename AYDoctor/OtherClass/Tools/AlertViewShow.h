//
//  AlertViewShow.h
//  NTOFFICE
//
//  Created by natonAir on 15/8/7.
//  Copyright (c) 2015年 natonAir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlertViewShow : NSObject

/** 完成后的回调block */
@property (nonatomic, strong) void (^alertViewDidDismissblock)();

- (void)showAlert:(NSString*)message;
- (void)showAlert:(NSString*)message delegate:(id)delegate;
- (void)showAlert:(NSString*)message delegate:(id)delegate tag:(NSInteger)tag;


@end
