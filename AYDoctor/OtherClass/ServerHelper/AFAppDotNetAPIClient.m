// AFAppDotNetAPIClient.h
//
// Copyright (c) 2012 Mattt Thompson (http://mattt.me/)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "AFAppDotNetAPIClient.h"

//static NSString * const AFAppDotNetAPIBaseURLString = g_config.apiUrl;

@implementation AFAppDotNetAPIClient

+ (instancetype)sharedClient {
    static AFAppDotNetAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFAppDotNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:g_config.apiUrl]];
       
        //TODO: 有了.cer(crt文件钥匙串导出成cer加入到项目中)证书后 AFSSLPinningModeNone 改为 AFSSLPinningModeCertificate
        AFSecurityPolicy* policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
//        policy.allowInvalidCertificates = YES;
        _sharedClient.securityPolicy = policy;
        
        [_sharedClient.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        _sharedClient.requestSerializer.timeoutInterval = 30.0f;
        [_sharedClient.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    });
    
    return _sharedClient;
}

+ (instancetype)sharedClientFile {
    static AFAppDotNetAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFAppDotNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:g_config.apiUrl]];
        
        //TODO: 有了.cer(crt文件钥匙串导出成cer加入到项目中)证书后 AFSSLPinningModeNone 改为 AFSSLPinningModeCertificate
        AFSecurityPolicy* policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
//        policy.allowInvalidCertificates = YES;
        _sharedClient.securityPolicy = policy;
        
        [_sharedClient.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        _sharedClient.requestSerializer.timeoutInterval = 7.0f;
        [_sharedClient.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    });
    
    return _sharedClient;
}


-(void)postRequest:(NSString *)requestName isShowTokenList:(BOOL)isShow parameters:(NSDictionary*)params completionWithDictionary:(finshedWithDictionary) blk withError:(err0) error
{
    
    [self POST:requestName parameters:params success:^(NSURLSessionDataTask *__unused task, id JSON)
     {
         
         NSDictionary *dict=JSON;
         int code=[[dict objectForKey:@"resultCode"] intValue];
         NSString *message=[dict objectForKey:@"resultMsg"];
         if (code==1)
         {
             blk([dict objectForKey:@"data"]);
         }
         else
         {
             if(isShow)
             {
                 if(code == 1030101 || code == 1030102)
                 {
                     //账户在其他地方登陆
                 }
             }
             if([message length] <= 0)
             {
                 error(message);
             }
             else
             {
                 error(message);
             }
         }
     } failure:^(NSURLSessionDataTask *task, NSError *err) {
         error([err localizedDescription ]);
     }];
    
    
}

//////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////

-(void)getRequest:(NSString *)requestName parameters:(NSDictionary*)params completionWithString:(finshedWithStr) blk withError:(err0) error
{
    [self GET:requestName parameters:params success:^(NSURLSessionDataTask *__unused task, id JSON)
     {
         NSDictionary *dict=JSON;
         int code=[[dict objectForKey:@"code"] intValue];
         NSString *message=[dict objectForKey:@"message"];
         if (code==1)
         {
             blk(message);
         }
         else
         {
             error(message);
         }
     } failure:^(NSURLSessionDataTask *task, NSError *err) {
         error([err localizedDescription ]);
     }];
}
-(void)getRequest:(NSString *)requestName parameters:(NSDictionary*)params completionWithBool:(finshedWithBool) blk withError:(err0) error
{
    [self GET:requestName parameters:params success:^(NSURLSessionDataTask *__unused task, id JSON)
     {
         NSDictionary *dict=JSON;
         int code=[[dict objectForKey:@"code"] intValue];
         NSString *message=[dict objectForKey:@"message"];
         if (code==1)
         {
             blk(true);
         }
         else
         {
             error(message);
         }
     } failure:^(NSURLSessionDataTask *task, NSError *err) {
         error([err localizedDescription ]);
     }];
}
-(void)getRequest:(NSString *)requestName parameters:(NSDictionary*)params completionWithDictionary:(finshedWithDictionary) blk withError:(err0) error
{
    [self GET:requestName parameters:params success:^(NSURLSessionDataTask *__unused task, id JSON)
     {
         NSDictionary *dict=JSON;
         int code=[[dict objectForKey:@"code"] intValue];
         NSString *message=[dict objectForKey:@"message"];
         if (code==1)
         {
             blk([dict objectForKey:@"result_data"]);
         }
         else
         {
             error(message);
         }
     } failure:^(NSURLSessionDataTask *task, NSError *err) {
         error([err localizedDescription ]);
     }];
}
-(void)postRequest:(NSString *)requestName parameters:(NSDictionary*)params completionWithString:(finshedWithStr) blk withError:(err0) error
{
    [self POST:requestName parameters:params success:^(NSURLSessionDataTask *__unused task, id JSON)
     {
         NSDictionary *dict=JSON;
         int code=[[dict objectForKey:@"resultCode"] intValue];
         NSString * resultMessage = [dict objectForKey:@"resultMsg"];
         NSString *message=[dict objectForKey:@"data"];
         if (code==1)
         {
             blk(message);
         }
         else
         {
             error(resultMessage);
         }
     } failure:^(NSURLSessionDataTask *task, NSError *err) {
         error([err localizedDescription ]);
     }];
}

-(void)postRequest:(NSString *)requestName parameters:(NSDictionary*)params completionWithBool:(finshedWithBool) blk withError:(err0) error
{
    [self POST:requestName parameters:params success:^(NSURLSessionDataTask *__unused task, id JSON)
     {
         NSDictionary *dict=JSON;
         int code=[[dict objectForKey:@"resultCode"] intValue];
         NSString *message=[dict objectForKey:@"resultMsg"];
         if (code==1)
         {
             if ([[dict objectForKey:@"data"] intValue] == 1) {
                 blk(true);
             } else {
                 blk(false);
             }
             
         }
         else
         {
             error(message);
         }
     } failure:^(NSURLSessionDataTask *task, NSError *err) {
         error([err localizedDescription ]);
     }];
}

-(void)postRequest:(NSString *)requestName parameters:(NSDictionary*)params completionWithArray:(finshedWithArray)blk withError:(err0)error
{
    [self POST:requestName parameters:params success:^(NSURLSessionDataTask *__unused task, id JSON)
     {
         NSDictionary *dict=JSON;
         int code=[[dict objectForKey:@"resultCode"] intValue];
         NSString *message=[dict objectForKey:@"resultMsg"];
         if (code==1)
         {
             blk([dict objectForKey:@"data"]);
         }
         else
         {
             if(code == 1030101 || code == 1030102)
             {
                 //账户在其他地方登陆
                 //[g_App tokenLostEvent:YES];
             }
             else if([message length] <= 0)
             {
                 error(message);
             }
             else
             {
                 error(message);
             }
         }
     } failure:^(NSURLSessionDataTask *task, NSError *err) {
         error([err localizedDescription ]);
     }];
    
}

-(void)prodoctScanPostRequest:(NSString *)requestName parameters:(NSDictionary*)params completionWithDictionary:(finshedWithDictionary)blk withError:(err0)error
{
    [self POST:requestName parameters:params success:^(NSURLSessionDataTask *__unused task, id JSON)
     {
         NSDictionary *dict=JSON;
         int code=[[dict objectForKey:@"resultCode"] intValue];
         NSString *message=[dict objectForKey:@"resultMsg"];
         if (code==1)
         {
             blk([dict objectForKey:@"resultData"]);
         }
         else
         {
//             if(code == 1030101 || code == 1030102)
//             {
//                 //账户在其他地方登陆
//                 [g_App tokenLostEvent:YES];
//             }
             if([message length] <= 0)
             {
                 error(message);
             }
             else
             {
                 error(message);
             }
         }
     } failure:^(NSURLSessionDataTask *task, NSError *err) {
         error([err localizedDescription ]);
     }];
    
}


-(void)postRequest:(NSString *)requestName parameters:(NSDictionary*)params completionWithObject:(finshedWithObject) blk withError:(err0) error
{
    [self POST:requestName parameters:params success:^(NSURLSessionDataTask *__unused task, id JSON)
     {
         NSDictionary *dict=JSON;
         int code=[[dict objectForKey:@"code"] intValue];
         NSString *message=[dict objectForKey:@"message"];
         if (code==1)
         {
             blk([dict objectForKey:@"result_data"]);
         }
         else
         {
             error(message);
         }
     } failure:^(NSURLSessionDataTask *task, NSError *err) {
         error([err localizedDescription ]);
     }];
}

-(NSURLSessionTask *)postRequestWithReturn:(NSString *)requestName parameters:(NSDictionary*)params completionWithObject:(finshedWithObject) blk withError:(err0) error
{
    return [self POST:requestName parameters:params success:^(NSURLSessionDataTask *__unused task, id JSON)
            {
                NSDictionary *dict=JSON;
                int code=[[dict objectForKey:@"code"] intValue];
                NSString *message=[dict objectForKey:@"message"];
                if (code==1)
                {
                    blk([dict objectForKey:@"result_data"]);
                }
                else
                {
                    error(message);
                }
            } failure:^(NSURLSessionDataTask *task, NSError *err) {
                error([err localizedDescription ]);
            }];
}
@end
