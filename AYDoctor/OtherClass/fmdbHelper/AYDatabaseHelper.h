//
//  NTDatabaseHelper.h
//  NTOFFICE
//
//  Created by a004779 on 15/8/10.
//  Copyright (c) 2015年 natonAir. All rights reserved.
//

//#import "AYFMEncryptDatabaseQueue.h"
#import <Foundation/Foundation.h>


#define ATTENTIONTABLE @"NT_Attention_02" //通讯录表  //SWNotes: 2017-6-26 星期一 11:28:13  3.50版本 为修改User表结构（列名）, 将表名由NT_Attention_01 改为 NT_Attention_02

//typedef void(^err) (NSString*err);
typedef void (^compeletion)(NSString* result);
typedef void (^finshedBool)(BOOL resultBool);
typedef void (^finshedString)(NSString* resultStr);
typedef void (^finshedDictionary)(NSDictionary* resultDict);
typedef void (^finshedObject)(NSObject* resultObj);
typedef void (^finshedArray)(NSArray* resultArr);
typedef void (^finshedMutableArray)(NSArray* resultArr);

@class NTCOACustomVisibleScopeModel;
@class NTInvoiceModel;
@interface AYDatabaseHelper : NSObject {
    
//#if NT_OFFICIAL_IDENTIFIER
//    NTFMEncryptDatabaseQueue* queue;
//#else
    FMDatabaseQueue* queue;
//#endif
}

//实例化对象
+ (AYDatabaseHelper*)sharedInstance;

//更换用户数据库
+ (void)refreshDatabase;

//删除数据库表
- (void)deleteDatabase:(NSString*)oldPath;


@end
