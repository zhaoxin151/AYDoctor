//
//  NSString+DG.h
//  NTOFFICE_TS
//
//  Created by naton on 15/12/23.
//  Copyright © 2015年 natonAir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DG)

- (BOOL)isValidPassWord0;
- (BOOL)isValidPassWord1;
- (BOOL)isValidPassWord2;
- (BOOL)isValidPassWord3;
- (BOOL)isContainWorkCode:(NSString *)workCode And:(NSString *)passWord;

-(BOOL)isBlank;
-(BOOL)isValid;
- (NSString *)removeWhiteSpacesFromString;


- (NSUInteger)countNumberOfWords;
- (BOOL)containsString:(NSString *)subString;
- (BOOL)isBeginsWith:(NSString *)string;
- (BOOL)isEndssWith:(NSString *)string;

- (NSString *)replaceCharcter:(NSString *)olderChar withCharcter:(NSString *)newerChar;
- (NSString*)getSubstringFrom:(NSInteger)begin to:(NSInteger)end;
- (NSString *)addString:(NSString *)string;
- (NSString *)removeSubString:(NSString *)subString;

- (BOOL)containsOnlyLetters;
- (BOOL)containsOnlyNumbers;
- (BOOL)containsOnlyNumbersAndLetters;
- (BOOL)isInThisarray:(NSArray*)array;

+ (NSString *)getStringFromArray:(NSArray *)array;
- (NSArray *)getArray;

+ (NSString *)getMyApplicationVersion;
+ (NSString *)getMyApplicationName;

- (NSData *)convertToData;
+ (NSString *)getStringFromData:(NSData *)data;
+ (NSString *)getjsonStringFromDic:(NSDictionary *)dic;
+ (NSDictionary *)getDicFromJsonStr:(NSString *)jsonStr;
+ (NSString *)getJsonStringFromArr:(NSArray *)arr;
+ (NSArray *)getArrFromJsonStr:(NSString *)jsonStr;

- (BOOL)isValidEmail;
- (BOOL)isVAlidPhoneNumber;
- (BOOL)isValidUrl;


+ (NSString*)stringFromDate:(NSDate*)valueDate;
+ (NSString *)GetYMDStingFromDate:(NSDate *)valueDate;
+ (NSDate*)dateFromString:(NSString*)valueString;
+ (NSString *)stringFromStringToDate:(NSString *)valueString;

//手机号码验证
+ (BOOL) validateMobile:(NSString *)mobile;

//用户名
+ (BOOL) validateUserName:(NSString *)name;

//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard;

//判断字符是数字或者字母
- (BOOL) validateNumberAndLetters;

/**
 *  通过服务器图片路径获取下载路径
 */
+ (NSString *)downloadImageUrlFromServerUrl:(NSString *)serverUrl;

/**
 *  处理来自于CRM调用本app时，传来的字符串信息类似于[ntoffice-ts://im/newchat?userName=A005232&touserName=A002213],获取两个人的员工编号
 */
+ (NSMutableDictionary *)getChatPersonsUserName:(NSString *)infoStr;

@end
