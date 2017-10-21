//
//  NSMutableAttributedString+Emotion.h
//  NTOFFICE_TS
//
//  Created by NATON on 16/7/4.
//  Copyright © 2016年 natonAir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NTTextAttachment : NSTextAttachment

@property (nonatomic , assign) NSRange range;

@end

@interface NSMutableAttributedString (Emotion)

///*
// * 返回绘制文本需要的区域
// */
//+ (CGRect)boundsForString:(NSString *)string size:(CGSize)size attributes:(NSDictionary *)attrs;

/*
 * 返回Emotion替换过的 NSAttributedString
 */
+ (NSMutableAttributedString *)emotionAttributedStringFrom:(NSString *)string attributes:(NSDictionary *)attrs;


@end
