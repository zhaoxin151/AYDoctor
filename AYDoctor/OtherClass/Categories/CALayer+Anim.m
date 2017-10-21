
#import "CALayer+Anim.h"
#import <AVFoundation/AVFoundation.h>

@implementation CALayer (Anim)


/*
 *  摇动-x
 */
-(void)shakeWithRange:(int)range andDuration:(double)duration andRepeatCount:(int)repeatCount{
    
    CAKeyframeAnimation *kfa = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    
    CGFloat s = range;
    
    kfa.values = @[@(-s),@(0),@(s),@(0),@(-s),@(0),@(s),@(0)];
    
    //时长
    kfa.duration = duration;
    
    //重复
    kfa.repeatCount = repeatCount;
    
    //移除
    kfa.removedOnCompletion = YES;
    
    [self addAnimation:kfa forKey:@"shake"];
}


-(void)playSystemShake {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

@end
