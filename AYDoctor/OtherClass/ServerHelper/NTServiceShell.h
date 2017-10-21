//
//   NTServiceShell.h
//   XAPP
//
//   Created by 佳 程 on 6/2/15.
//   Copyright (c) 2015 Naton. All rights reserved.
//
//   网络请求方法AF封装的第二层

#import <Foundation/Foundation.h>


typedef void(^finshedWithBool)(BOOL);
typedef void(^finshedWithStr)(NSString *);
typedef void(^finshedWithDictionary)(NSDictionary *);
typedef void(^finshed)(BOOL);
typedef void(^err1) (NSString*);
typedef void(^compeletion)(NSString *);
typedef void(^finshedWithObject)(NSObject *);
typedef void(^finshedWithArray)(NSArray *);
typedef void(^finshedWithData) (NSData *);

@interface NTServiceShell : NSObject
///  登录
+ (void)UserLogin:(NSDictionary*)params completion:(finshedWithDictionary)blk withError:(err1) error;

///  获取部门信息
+ (void)UserGetDepartment:(NSDictionary *)params completion:(finshedWithArray)blk withError:(err1)error;

@end
