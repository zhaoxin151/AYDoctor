//
//  AlertViewShow.m
//  NTOFFICE
//
//  Created by natonAir on 15/8/7.
//  Copyright (c) 2015年 natonAir. All rights reserved.
//

#import "AlertViewShow.h"

@interface AlertViewShow () <UIAlertViewDelegate>

@end

@implementation AlertViewShow

-(id)init
{
    self = [super init];
    if(self)
    {
        
    }
    return self;
}

- (void) showAlert: (NSString *) message
{
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:g_appName message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [av show];
    //[self showMsg:message];
}

- (void) showAlert: (NSString *) message delegate:(id)delegate
{
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:g_appName message:message delegate:delegate cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [av show];
}


- (void)showAlert:(NSString*)message delegate:(id)delegate tag:(NSInteger)tag {
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:g_appName message:message delegate:delegate cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    av.tag = tag;
    [av show];
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (self.alertViewDidDismissblock) {
        self.alertViewDidDismissblock();
    }
}

@end
