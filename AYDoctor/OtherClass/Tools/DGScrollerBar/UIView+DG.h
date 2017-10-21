//
//  UIView+DG.h
//  NTOFFICE_TS
//
//  Created by naton on 16/6/5.
//  Copyright © 2016年 natonAir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DG)
/**
 *  1.间隔X值
 */
@property (nonatomic, assign) CGFloat x;

/**
 *  2.间隔Y值
 */
@property (nonatomic, assign) CGFloat y;

/**
 *  3.宽度
 */
@property (nonatomic, assign) CGFloat width;

/**
 *  4.高度
 */
@property (nonatomic, assign) CGFloat height;

/**
 *  5.中心点X值
 */
@property (nonatomic, assign) CGFloat centerX;

/**
 *  6.中心点Y值
 */
@property (nonatomic, assign) CGFloat centerY;

/**
 *  7.尺寸大小
 */
@property (nonatomic, assign) CGSize size;

/**
 *  8.起始点
 */
@property (nonatomic, assign) CGPoint origin;

/**
 *  9.上
 */
@property (nonatomic) CGFloat top;

/**
 *  10.下
 */
@property (nonatomic) CGFloat bottom;

/**
 *  11.左
 */
@property (nonatomic) CGFloat left;

/**
 *  12.右
 */
@property (nonatomic) CGFloat right;

@end
