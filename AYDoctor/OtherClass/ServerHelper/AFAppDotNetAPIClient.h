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

//此类定义不同返回类型的网络请求方法AF封装的第一层

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

typedef void(^finshedWithBool)(BOOL);
typedef void(^err0) (NSString*);
typedef void(^finshedWithStr)(NSString *);
typedef void(^finshedWithDictionary)(NSDictionary *);
typedef void(^finshedWithObject)(NSObject *);
typedef void(^finshedWithArray)(NSArray *);

@interface AFAppDotNetAPIClient : AFHTTPSessionManager

// 常用接口
+ (instancetype)sharedClient;

// 文件接口
+ (instancetype)sharedClientFile;


-(void)getRequest:(NSString *)requestName parameters:(NSDictionary*)params completionWithString:(finshedWithStr) blk withError:(err0) error;
-(void)getRequest:(NSString *)requestName parameters:(NSDictionary*)params completionWithBool:(finshedWithBool) blk withError:(err0) error;
-(void)getRequest:(NSString *)requestName parameters:(NSDictionary*)params completionWithDictionary:(finshedWithDictionary) blk withError:(err0) error;
-(void)postRequest:(NSString *)requestName parameters:(NSDictionary*)params completionWithString:(finshedWithStr) blk withError:(err0) error;
-(void)postRequest:(NSString *)requestName parameters:(NSDictionary*)params completionWithBool:(finshedWithBool) blk withError:(err0) error;
-(void)postRequest:(NSString *)requestName isShowTokenList:(BOOL)isShow parameters:(NSDictionary*)params completionWithDictionary:(finshedWithDictionary) blk withError:(err0) error;
-(void)postRequest:(NSString *)requestName parameters:(NSDictionary*)params completionWithObject:(finshedWithObject) blk withError:(err0) error;
-(void)postRequest:(NSString *)requestName parameters:(NSDictionary*)params completionWithArray:(finshedWithArray) blk withError:(err0) error;

-(NSURLSessionTask *)postRequestWithReturn:(NSString *)requestName parameters:(NSDictionary*)params completionWithObject:(finshedWithObject) blk withError:(err0) error;
-(void)prodoctScanPostRequest:(NSString *)requestName parameters:(NSDictionary*)params completionWithDictionary:(finshedWithDictionary)blk withError:(err0)error;
@end
