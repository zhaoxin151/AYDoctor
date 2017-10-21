//
//  NTServiceShell.m
//  XAPP
//
//  Created by 佳 程 on 6/2/15.
//  Copyright (c) 2015 Naton. All rights reserved.
//

#import "NTServiceShell.h"
#import "AFAppDotNetAPIClient.h"
#import "AFHTTPRequestOperationManager.h"

@interface NTServiceShell ()


@end

@implementation NTServiceShell

//登录
+(void)UserLogin:(NSDictionary *)params completion:(finshedWithDictionary)blk withError:(err1)error
{
    [[AFAppDotNetAPIClient sharedClient] postRequest:@"/user/login" isShowTokenList:NO parameters:params completionWithDictionary:blk withError:error];
}


//获取下属打卡信息列表
+ (void)UserGetDepartment:(NSDictionary *)params completion:(finshedWithArray)blk withError:(err1)error
{
//    NSString *request = [NSString stringWithFormat:@"%@/api/Clock/GetSubListClock",OAREQUEST_URL];
//    [[AFAppDotNetAPIClient sharedClient] postRequest:request parameters:params completionWithArray:blk withError:error];
}

@end
