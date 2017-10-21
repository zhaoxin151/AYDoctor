//
//  NSString+DG.m
//  NTOFFICE_TS
//
//  Created by naton on 15/12/23.
//  Copyright © 2015年 natonAir. All rights reserved.
//

#import "NSString+DG.h"

@implementation NSString (DG)

- (BOOL)isValidPassWord0 {
    NSString *regex = @"((?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{6,999})";
    NSPredicate *PawordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [PawordPredicate evaluateWithObject:self];
    
}

- (BOOL)isValidPassWord1 {
    NSString *regex = @"((?=.*[0-9])(?=.*[a-z])(?=.*[`~!@#$%^&*()+=|{}':;',//[//].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]).{6,999})";
    NSPredicate *PawordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [PawordPredicate evaluateWithObject:self];
    
}

- (BOOL)isValidPassWord2 {
    NSString *regex = @"((?=.*[0-9])(?=.*[A-Z])(?=.*[`~!@#$%^&*()+=|{}':;',//[//].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]).{6,999})";;
    NSPredicate *PawordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [PawordPredicate evaluateWithObject:self];
    
}

- (BOOL)isValidPassWord3 {
    NSString *regex = @"((?=.*[a-z])(?=.*[A-Z])(?=.*[`~!@#$%^&*()+=|{}':;',//[//].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]).{6,999})";
    NSPredicate *PawordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [PawordPredicate evaluateWithObject:self];
    
}

- (BOOL)isContainWorkCode:(NSString *)workCode And:(NSString *)passWord {
    return [passWord containsString:workCode] ? YES: NO;
}


// Checking if String is Empty
-(BOOL)isBlank
{
    return ([[self removeWhiteSpacesFromString] isEqualToString:@""]) ? YES : NO;
}
//Checking if String is empty or nil
-(BOOL)isValid
{
    return ([[self removeWhiteSpacesFromString] isEqualToString:@""] || self == nil || [self isEqualToString:@"(null)"]) ? NO :YES;
}

// remove white spaces from String
- (NSString *)removeWhiteSpacesFromString
{
    NSString *trimmedString = [self stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return trimmedString;
}

// Counts number of Words in String
- (NSUInteger)countNumberOfWords
{
    NSScanner *scanner = [NSScanner scannerWithString:self];
    NSCharacterSet *whiteSpace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    
    NSUInteger count = 0;
    while ([scanner scanUpToCharactersFromSet: whiteSpace  intoString: nil]) {
        count++;
    }
    
    return count;
}

// If string contains substring
- (BOOL)containsString:(NSString *)subString
{
    return ([self rangeOfString:subString].location == NSNotFound) ? NO : YES;
}

// If my string starts with given string
- (BOOL)isBeginsWith:(NSString *)string
{
    return ([self hasPrefix:string]) ? YES : NO;
}

// If my string ends with given string
- (BOOL)isEndssWith:(NSString *)string
{
    return ([self hasSuffix:string]) ? YES : NO;
}



// Replace particular characters in my string with new character
- (NSString *)replaceCharcter:(NSString *)olderChar withCharcter:(NSString *)newerChar
{
    return  [self stringByReplacingOccurrencesOfString:olderChar withString:newerChar];
}

// Get Substring from particular location to given lenght
- (NSString*)getSubstringFrom:(NSInteger)begin to:(NSInteger)end
{
    NSRange r;
    r.location = begin;
    r.length = end - begin;
    return [self substringWithRange:r];
}

// Add substring to main String
- (NSString *)addString:(NSString *)string
{
    if(!string || string.length == 0)
        return self;
    
    return [self stringByAppendingString:string];
}

// Remove particular sub string from main string
-(NSString *)removeSubString:(NSString *)subString
{
    if ([self containsString:subString])
    {
        NSRange range = [self rangeOfString:subString];
        return  [self stringByReplacingCharactersInRange:range withString:@""];
    }
    return self;
}


// If my string contains ony letters
- (BOOL)containsOnlyLetters
{
    NSCharacterSet *letterCharacterset = [[NSCharacterSet letterCharacterSet] invertedSet];
    return ([self rangeOfCharacterFromSet:letterCharacterset].location == NSNotFound);
}

// If my string contains only numbers
- (BOOL)containsOnlyNumbers
{
    NSCharacterSet *numbersCharacterSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    return ([self rangeOfCharacterFromSet:numbersCharacterSet].location == NSNotFound);
}

// If my string contains letters and numbers
- (BOOL)containsOnlyNumbersAndLetters
{
    NSCharacterSet *numAndLetterCharSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    return ([self rangeOfCharacterFromSet:numAndLetterCharSet].location == NSNotFound);
}

// If my string is available in particular array
- (BOOL)isInThisarray:(NSArray*)array
{
    for(NSString *string in array) {
        if([self isEqualToString:string]) {
            return YES;
        }
    }
    return NO;
}

// Get String from array
+ (NSString *)getStringFromArray:(NSArray *)array
{
    return [array componentsJoinedByString:@" "];
}

// Convert Array from my String
- (NSArray *)getArray
{
    return [self componentsSeparatedByString:@" "];
}

// Get My Application Version number
+ (NSString *)getMyApplicationVersion
{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [info objectForKey:@"CFBundleVersion"];
    return version;
}

// Get My Application name
+ (NSString *)getMyApplicationName
{
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *name = [info objectForKey:@"CFBundleDisplayName"];
    return name;
}


// Convert string to NSData
- (NSData *)convertToData
{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

// Get String from NSData
+ (NSString *)getStringFromData:(NSData *)data
{
    return [[NSString alloc] initWithData:data
                                 encoding:NSUTF8StringEncoding];
    
}

//Get String From NSDictionary
+ (NSString *)getjsonStringFromDic:(NSDictionary *)dic {
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    //Data转换为JSON
    NSString* jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

//get dictionary from json str
+ (NSDictionary *)getDicFromJsonStr:(NSString *)jsonStr
{
    if(jsonStr == nil)
    {
        return nil;
    }
    NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        return nil;
    }
    return dic;
}

//get json str from array
+ (NSString *)getJsonStringFromArr:(NSArray *)arr
{
    NSError* error = nil;
    id result = [NSJSONSerialization dataWithJSONObject:arr options:NSJSONWritingPrettyPrinted error:&error];
    //Data转换为JSON
    NSString* jsonString = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
    return jsonString;
}

//get array from json string
+ (NSArray *)getArrFromJsonStr:(NSString *)jsonStr
{
    if(jsonStr == nil)
    {
        return nil;
    }
    NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:jsonData
                                                   options:NSJSONReadingMutableContainers
                                                     error:&err];
    if(err)
    {
        return nil;
    }
    return arr;
    
}

// Is Valid Email

- (BOOL)isValidEmail
{
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTestPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [emailTestPredicate evaluateWithObject:self];
}

// Is Valid Phone
// ^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$
// [235689][0-9]{6}([0-9]{3})?
- (BOOL)isVAlidPhoneNumber
{
    NSString *regex = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$";
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [test evaluateWithObject:self];
}

// Is Valid URL

- (BOOL)isValidUrl
{
    NSString *regex =@"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [urlTest evaluateWithObject:self];
}


// Get String from NSDate
+ (NSString *)stringFromDate:(NSDate *)valueDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *strDate = [dateFormatter stringFromDate:valueDate];
    return strDate;
}

+ (NSString *)GetYMDStingFromDate:(NSDate *)valueDate {
    NSCalendar * calendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit|NSYearCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit;
    NSDateComponents * component=[calendar components:unitFlags fromDate:valueDate];
    
    NSInteger year=[component year];
    NSInteger month=[component month];
    NSInteger day=[component day];
    
    NSInteger week = [component weekday];
    NSString *weekStr = nil;
    switch (week) {
        case 1:
            weekStr = @"星期天";
            break;
        case 2:
            weekStr = @"星期一";
            break;
        case 3:
            weekStr = @"星期二";
            break;
        case 4:
            weekStr = @"星期三";
            break;
        case 5:
            weekStr = @"星期四";
            break;
        case 6:
            weekStr = @"星期五";
            break;
        case 7:
            weekStr = @"星期六";
            break;
        default:
            weekStr = @"";
            break;
    }
    return [NSString stringWithFormat:@"%d年%d月%d日 %@",year,month,day,weekStr];
}

+ (NSString *)stringFromStringToDate:(NSString *)valueString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:valueString];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}


// Get Date from NSString
+(NSDate *)dateFromString:(NSString *)valueString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:valueString];
    return date;
}


// Is validEmail
+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

//Is validPhoneNum
+ (BOOL) validateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

//Is validUserName
+ (BOOL) validateUserName:(NSString *)name
{
    NSString *userNameRegex = @"^[A-Za-z0-9]{6,20}+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    BOOL B = [userNamePredicate evaluateWithObject:name];
    return B;
}

//Is validIdCard
+ (BOOL) validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

//判断字符是数字获取字母
- (BOOL)validateNumberAndLetters
{
    NSString *regex = @"^[a-zA-Z0-9]+$";
    NSPredicate *PawordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL ismatch = [PawordPredicate evaluateWithObject:self];
    return !ismatch;
}

+ (NSString *)downloadImageUrlFromServerUrl:(NSString *)serverUrl
{
    NSString * fileNameStr = serverUrl;
    NSRange range = [serverUrl rangeOfString:@"8001/" options:NSForcedOrderingSearch];
    if (range.location != NSNotFound)
    {
        fileNameStr = [serverUrl substringFromIndex:range.location+4];
    }
    return fileNameStr;
}


//[ntoffice-ts://im/newchat?userName=A005232&touserName=A002213]
+ (NSMutableDictionary *)getChatPersonsUserName:(NSString *)infoStr {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    if (infoStr) {
        NSArray *tmpArr = [NSArray array];
        tmpArr = [infoStr componentsSeparatedByString:@"?"];
        NSString *chatPersonStr = tmpArr[1];
        tmpArr = [chatPersonStr componentsSeparatedByString:@"&"];
        for (NSString *chatUserNameStr in tmpArr) {
            NSString *tmpUserKey = [chatUserNameStr componentsSeparatedByString:@"="][0];
            NSString *tmpUserValue = [chatUserNameStr componentsSeparatedByString:@"="][1];
            [dic setObject:tmpUserValue forKey:tmpUserKey];
        }
        
    }
    
    return dic;
}


@end

