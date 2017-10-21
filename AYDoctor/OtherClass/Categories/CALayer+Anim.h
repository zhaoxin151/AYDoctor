
#import <QuartzCore/QuartzCore.h>

@interface CALayer (Anim)

/*
 *  摇动
 */
-(void)shakeWithRange:(int)range andDuration:(double)duration andRepeatCount:(int)repeatCount;

/*
 *  调用系统的震动效果
 */
-(void)playSystemShake;

@end
