//
//  GW_StackView.h
//  GWDemo
//
//  Created by GW on 17/4/8.
//  Copyright © 2017年 GW. All rights reserved.
//


#import "GW_AutoLayout.h"

#pragma mark - UI自动布局StackView容器 -


@interface GW_VIEW (GW_StackViewCategory)
/**
 控件横向和垂直布局宽度或者高度权重比例
 */
@property (nonatomic , assign)CGFloat GW_WidthWeight;

@property (nonatomic , assign)CGFloat GW_HeightWeight;
@end

@interface GW_StackView : GW_VIEW



/// 混合布局(同时垂直和横向)每行多少列
@property (nonatomic , assign) NSInteger GW_Column;
/// 容器内边距
#if TARGET_OS_IPHONE || TARGET_OS_TV
@property (nonatomic , assign) UIEdgeInsets GW_Edge;
#elif TARGET_OS_MAC
@property (nonatomic , assign) NSEdgeInsets GW_Edge;
#endif
/// 容器内子控件横向间隙
@property (nonatomic , assign) CGFloat GW_HSpace;
/// 容器内子控件垂直间隙
@property (nonatomic , assign) CGFloat GW_VSpace;

/// 子元素高宽比
@property (nonatomic , assign) CGFloat GW_ElementHeightWidthRatio;

/// 子元素宽高比
@property (nonatomic , assign) CGFloat GW_ElementWidthHeightRatio;

/// 容器里子元素实际数量
@property (nonatomic , assign , readonly) NSInteger GW_SubViewCount;

/// 容器自动布局方向
@property (nonatomic , assign) GW_LayoutOrientationOptions GW_Orientation;

/// 子视图固定宽度
@property (nonatomic , assign) CGFloat GW_SubViewWidth;

/// 子视图固定高度
@property (nonatomic , assign) CGFloat GW_SubViewHeight;

/// 设置分割线尺寸
@property (nonatomic , assign) CGFloat GW_SegmentLineSize;
/// 设置分割线内边距
@property (nonatomic , assign) CGFloat GW_SegmentLinePadding;
/// 设置分割线的颜色
@property (nonatomic , strong) GW_COLOR * GW_SegmentLineColor;
/************重载父类属性**************/
/// 自动高度
@property (nonatomic ,copy , readonly)HeightAuto GW_HeightAuto;

/// 自动宽度
@property (nonatomic ,copy , readonly)WidthAuto GW_WidthAuto;

/// 元素集合
@property (nonatomic, strong, readonly)NSArray<GW_VIEW *> * GW_Subviews;

/************重载父类方法**************/
/**
 自动宽度
 */

- (void)GW_AutoWidth;

/**
 自动高度
 */

- (void)GW_AutoHeight;

/**
 开始进行自动布局
 */
- (void)GW_StartLayout;

/**
 清除所有子视图
 */
- (void)GW_RemoveAllSubviews;

/**
 移除所有空白站位视图(仅仅横向垂直混合布局有效)
 */
- (void)GW_RemoveAllVacntView;
@end

