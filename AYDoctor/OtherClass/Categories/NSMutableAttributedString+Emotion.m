//
//  NSMutableAttributedString+Emotion.m
//  NTOFFICE_TS
//
//  Created by NATON on 16/7/4.
//  Copyright © 2016年 natonAir. All rights reserved.
//

#import "NSMutableAttributedString+Emotion.h"

@implementation NTTextAttachment



@end

@implementation NSMutableAttributedString (Emotion)

//----------------------------------------------------------------------静态方法----------------------------------------------------------------------
///*
// * 返回绘制文本需要的区域
// */
//+ (CGRect)boundsForString:(NSString *)string size:(CGSize)size attributes:(NSDictionary *)attrs
//{
//    NSMutableAttributedString *attributedString = [NSMutableAttributedString emotionAttributedStringFrom:string attributes:attrs];
//    CGRect contentRect = [attributedString boundingRectWithSize:size options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
//    return contentRect;
//}

/*
 * 返回Emotion替换过的 NSAttributedString
 */
+ (NSMutableAttributedString *)emotionAttributedStringFrom:(NSString *)string attributes:(NSDictionary *)attrs
{
    NSMutableAttributedString *attributedEmotionString = [[NSMutableAttributedString alloc] initWithString:string attributes:attrs];
    
    NSArray *attachmentArray = [NSMutableAttributedString attachmentsForAttributedString:attributedEmotionString];
    for (NTTextAttachment *attachment in attachmentArray)
    {
        NSAttributedString *emotionAttachmentString = [NSAttributedString attributedStringWithAttachment:attachment];
        [attributedEmotionString replaceCharactersInRange:attachment.range withAttributedString:emotionAttachmentString];
    }
    return attributedEmotionString;
}

/*
 * 查找所有表情文本并替换
 */
+ (NSArray *)attachmentsForAttributedString:(NSMutableAttributedString *)attributedString
{
    NSString *markL       = @"[";
    NSString *markR       = @"]";
    NSString *string      = attributedString.string;
    NSMutableArray *array = [NSMutableArray array];
    NSMutableArray *stack = [[NSMutableArray alloc] init];
    
    //获取头像列表，从emojiName.plist中
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"emojiName" ofType:@"plist"];
    NSDictionary *dic = [[NSDictionary alloc]initWithContentsOfFile:plistPath];
    
    NSArray *faceArray = [[NSArray alloc]init];
    faceArray = [dic allKeys];
    
    NSMutableArray *imageArray = [[NSMutableArray alloc] init];
    for (int i = 0;i<[faceArray count];i++){
        NSString *emojiSendName = [faceArray objectAtIndex:i];
        NSString *emojiName = [dic objectForKey:emojiSendName];
        NSString *emojImageName = [NSString stringWithFormat:@"%@@2x.png",emojiName];
        [imageArray addObject:emojImageName];
    }

    
    for (int i = 0; i < string.length; i++)
    {
        NSString *s = [string substringWithRange:NSMakeRange(i, 1)];
        
        if (([s isEqualToString:markL]) || ((stack.count > 0) && [stack[0] isEqualToString:markL]))
        {
            if (([s isEqualToString:markL]) && ((stack.count > 0) && [stack[0] isEqualToString:markL]))
            {
                [stack removeAllObjects];
            }
            
            [stack addObject:s];
            
            if ([s isEqualToString:markR] || (i == string.length - 1))
            {
                NSMutableString *emojiStr = [[NSMutableString alloc] init];
                for (NSString *c in stack)
                {
                    [emojiStr appendString:c];
                }
                
                if ([faceArray containsObject:emojiStr])
                {
                    NSInteger index = [faceArray indexOfObject:emojiStr];
                    NSRange range = NSMakeRange(i + 1 - emojiStr.length, emojiStr.length);
                    
                    [attributedString replaceCharactersInRange:range withString:@" "];
                    NTTextAttachment *attachment = [[NTTextAttachment alloc] initWithData:nil ofType:nil];
                    attachment.bounds = CGRectMake(0, -5, 18, 18);
                    attachment.range = NSMakeRange(i + 1 - emojiStr.length, 1);
                    attachment.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[imageArray objectAtIndex:index]]];
                    
                    i -= ([stack count] - 1);
                    [array addObject:attachment];
                }
                [stack removeAllObjects];
            }
        }
    }
    return array;
}

@end
