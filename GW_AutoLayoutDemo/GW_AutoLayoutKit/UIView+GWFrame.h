//
//  UIView+GWFrame.h
//  Pocket
//
//  Created by gw on 2020/9/1.
//  Copyright © 2020 tiens. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (GWFrame)<CAAnimationDelegate>
/**
* 左 frame.origin.x
*
* Sets frame.origin.x = left_GW
*/
@property (nonatomic) CGFloat left_GW;

/**
 * 上 frame.origin.y
 *
 * Sets frame.origin.y = top_GW
 */
@property (nonatomic) CGFloat top_GW;

/**
 * 右 frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
@property (nonatomic) CGFloat right_GW;

/**
 * 下 frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
@property (nonatomic) CGFloat bottom_GW;

/**
 * 宽 frame.size.width
 *
 * Sets frame.size.width = width
 */
@property (nonatomic) CGFloat width_GW;

/**
 * 高 frame.size.height
 *
 * Sets frame.size.height = height
 */
@property (nonatomic) CGFloat height_GW;

/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
@property (nonatomic) CGFloat centerX_GW;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
@property (nonatomic) CGFloat centerY_GW;
/**
 * Shortcut for frame.origin
 */
@property (nonatomic) CGPoint origin_GW;

/**
 * Shortcut for frame.size
 */
@property (nonatomic) CGSize size_GW;

/// 获取视图最大x
@property (nonatomic, assign)CGFloat maxX_GW;
/// 获取视图最大y
@property (nonatomic, assign)CGFloat maxY_GW;
/// 获取视图中间x
@property (nonatomic, assign)CGFloat midX_GW;
/// 获取视图中间y
@property (nonatomic, assign)CGFloat midY_GW;

/// 获取当前视图的控制器
- (UIViewController *)viewController_GW;
@end


NS_ASSUME_NONNULL_END
