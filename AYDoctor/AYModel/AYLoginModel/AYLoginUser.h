//
//  AYLoginUser.h
//  AYDoctor
//
//  Created by WHB_NATON on 2017/10/21.
//  Copyright © 2017年 WHB_NATON. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AYLoginUser : NSObject

/** token信息*/
@property (nonatomic, strong)NSString *token;
@property (nonatomic, strong)NSString *userId;

//单例
+ (AYLoginUser *)sharedInstance;

//保存登录用户信息
+ (void)saveLoginUserInfoDic:(NSDictionary *)userInfo;

//清空所有用户信息
+ (void)clearUserInfo;

@end
