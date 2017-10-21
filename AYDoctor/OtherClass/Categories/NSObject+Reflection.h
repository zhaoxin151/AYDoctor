//
//  NSObject+Reflection.h
//  NSObject-Reflection
//
//  Created by Jakey on 15/12/22.
//  Copyright © 2015年 Jakey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Reflection)
//类名
- (NSString *)className;
+ (NSString *)className;
//父类名称
- (NSString *)superClassName;
+ (NSString *)superClassName;

//实例属性字典
//???: 崩...
- (NSDictionary *)propertyDictionary;

//属性名称列表
- (NSArray *)propertyKeys;
+ (NSArray *)propertyKeys;

//属性详细信息列表
- (NSArray *)propertiesInfo;
+ (NSArray *)propertiesInfo;

//格式化后的属性列表
+ (NSArray *)propertiesWithCodeFormat;

//方法列表
- (NSArray *)methodList;
+ (NSArray *)methodList;

- (NSArray *)methodListInfo;

//创建并返回一个指向所有已注册类的指针列表
+ (NSArray *)registedClassList;
//实例变量
+ (NSArray *)instanceVariable;

//协议列表
- (NSDictionary *)protocolList;
+ (NSDictionary *)protocolList;

- (BOOL)hasPropertyForKey:(NSString *)key;
- (BOOL)hasIvarForKey:(NSString *)key;

// 通过字典设置一个对象的属性
- (BOOL)reflectDataFromOtherObject:(NSObject *)dataSource;
// 通过字典创建一个对应类型的模型对象
// bug: 字典中嵌套的字典 暂时无法转换成对应模型对象 待完善
+ (instancetype)reflectDataFromOtherObject:(NSObject *)dataSource;

@end
