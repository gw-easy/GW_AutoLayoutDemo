//
//  GW_VIEW+GW_AutoLayout.h
//  GWDemo
//
//
//  Created by GW on 17/4/8.
//  Copyright © 2017年 GW. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "GW_AutoLayoutUtilities.h"
/// 布局方向
typedef NS_OPTIONS(NSUInteger, GW_LayoutOrientationOptions) {
    /// 垂直布局
    Vertical = 1 << 0,
    /// 横向布局
    Horizontal = 1 << 1,
    /// 垂直布局和横向布局
    All = 1 << 2
};

/// 布局类型
typedef NS_OPTIONS(NSUInteger, GW_LayoutTypeOptions) {
    /// 默认类型
    DefaultType = 1 << 0,
    /// 左右类型
    LeftRightType = 1 << 1,
};
typedef GW_VIEW * (^LessOrEqual)(void);
typedef GW_VIEW * (^GreaterOrEqual)(void);
typedef GW_VIEW * (^ResetConstraintAttribute)(void);
typedef GW_VIEW * (^ClearConstraintAttribute)(void);
typedef GW_VIEW * (^RemoveConstraintAttribute)(NSLayoutAttribute attributes, ...);
typedef GW_VIEW * (^RemoveConstraintFromViewAttribute)(GW_VIEW * view, NSLayoutAttribute attributes, ...);
typedef GW_VIEW * (^RemoveConstraintToViewAttribute)(GW_VIEW * toView, NSLayoutAttribute attributes, ...);

typedef GW_VIEW * (^PriorityLow)(void);
typedef GW_VIEW * (^PriorityHigh)(void);
typedef GW_VIEW * (^PriorityRequired)(void);
typedef GW_VIEW * (^PriorityFitting)(void);
typedef GW_VIEW * (^PriorityValue)(CGFloat value);

typedef GW_VIEW * (^BaseLineSpace)(CGFloat value);
typedef GW_VIEW * (^BaseLineSpaceToView)(CGFloat value , GW_VIEW * toView);
typedef GW_VIEW * (^BaseLineSpaceEqualView)(GW_VIEW * view);
typedef GW_VIEW * (^BaseLineSpaceEqualViewOffset)(GW_VIEW * view, CGFloat offset);


typedef GW_VIEW * (^LeftSpace)(CGFloat value);
typedef GW_VIEW * (^LeftSpaceToView)(CGFloat value , GW_VIEW * toView);
typedef GW_VIEW * (^LeftSpaceEqualView)(GW_VIEW * view);
typedef GW_VIEW * (^LeftSpaceEqualViewOffset)(GW_VIEW * view, CGFloat offset);

typedef GW_VIEW * (^RightSpace)(CGFloat value);
typedef GW_VIEW * (^RightSpaceToView)(CGFloat value , GW_VIEW * toView);
typedef GW_VIEW * (^RightSpaceEqualView)(GW_VIEW * view);
typedef GW_VIEW * (^RightSpaceEqualViewOffset)(GW_VIEW * view, CGFloat offset);

typedef GW_VIEW * (^TopSpace)(CGFloat value);
typedef GW_VIEW * (^TopSpaceToView)(CGFloat value , GW_VIEW * toView);
typedef GW_VIEW * (^TopSpaceEqualView)(GW_VIEW * view);
typedef GW_VIEW * (^TopSpaceEqualViewOffset)(GW_VIEW * view, CGFloat offset);

typedef GW_VIEW * (^BottomSpace)(CGFloat value);
typedef GW_VIEW * (^BottomSpaceToView)(CGFloat value , GW_VIEW * toView);
typedef GW_VIEW * (^BottomSpaceEqualView)(GW_VIEW * view);
typedef GW_VIEW * (^BottomSpaceEqualViewOffset)(GW_VIEW * view, CGFloat offset);

typedef GW_VIEW * (^Width)(CGFloat value);
typedef GW_VIEW * (^WidthAuto)(void);
typedef GW_VIEW * (^WidthEqualView)(GW_VIEW * view);
typedef GW_VIEW * (^WidthEqualViewRatio)(GW_VIEW * view, CGFloat ratio);
typedef GW_VIEW * (^WidthHeightRatio)(CGFloat ratio);

typedef GW_VIEW * (^Height)(CGFloat value);
typedef GW_VIEW * (^HeightAuto)(void);
typedef GW_VIEW * (^HeightEqualView)(GW_VIEW * view);
typedef GW_VIEW * (^HeightEqualViewRatio)(GW_VIEW * view, CGFloat ratio);
typedef GW_VIEW * (^HeightWidthRatio)(CGFloat ratio);

typedef GW_VIEW * (^CenterX)(CGFloat value);
typedef GW_VIEW * (^CenterXToView)(CGFloat value, GW_VIEW * toView);

typedef GW_VIEW * (^CenterY)(CGFloat value);
typedef GW_VIEW * (^CenterYToView)(CGFloat value, GW_VIEW * toView);

typedef GW_VIEW * (^Center)(CGFloat x, CGFloat y);
typedef GW_VIEW * (^CenterToView)(CGPoint center, GW_VIEW * toView);

typedef GW_VIEW * (^size)(CGFloat width, CGFloat height);
typedef GW_VIEW * (^SizeEqual)(GW_VIEW * view);

typedef GW_VIEW * (^FrameEqual)(GW_VIEW * view);
typedef GW_VIEW * (^BoundsEqual)(GW_VIEW * view);
#pragma mark - UI自动布局 -

@interface GW_VIEW (GW_AutoLayout)

#pragma mark - api version ~ 2.0 -

/// 当前约束小于等于
@property (nonatomic ,copy , readonly)LessOrEqual GW_LessOrEqual;
/// 当前约束大于等于
@property (nonatomic ,copy , readonly)GreaterOrEqual GW_GreaterOrEqual;
/// 重置缓存约束
@property (nonatomic ,copy , readonly)ResetConstraintAttribute GW_ResetConstraint;
/// 清除所有约束
@property (nonatomic ,copy , readonly)ClearConstraintAttribute GW_ClearLayoutAttr;
/// 移除约束(NSLayoutAttribute attributes, ...)
@property (nonatomic ,copy , readonly)RemoveConstraintAttribute GW_RemoveLayoutAttrs;
/// 移除约束从指定视图上(GW_VIEW * view, NSLayoutAttribute attributes, ...)
@property (nonatomic ,copy , readonly)RemoveConstraintFromViewAttribute GW_RemoveFromLayoutAttrs;
/// 移除约束从关联视图上(GW_VIEW * toView, NSLayoutAttribute attributes, ...)
@property (nonatomic ,copy , readonly)RemoveConstraintToViewAttribute GW_RemoveToLayoutAttrs;

/// 设置当前约束的低优先级
@property (nonatomic ,copy , readonly)PriorityLow GW_PriorityLow;
/// 设置当前约束的高优先级
@property (nonatomic ,copy , readonly)PriorityHigh GW_PriorityHigh;
/// 设置当前约束的默认优先级
@property (nonatomic ,copy , readonly)PriorityRequired GW_PriorityRequired;
/// 设置当前约束的合适优先级
@property (nonatomic ,copy , readonly)PriorityFitting GW_PriorityFitting;
/// 设置当前约束的优先级 (CGFloat value): 优先级大小(0-1000)
@property (nonatomic ,copy , readonly)PriorityValue GW_Priority;


#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
/// 与父视图底边间距Y(CGFloat value)
@property (nonatomic ,copy , readonly)BaseLineSpace GW_FirstBaseLine;
/// 与相对视图toView底边间距Y(CGFloat value,GW_VIEW * toView)
@property (nonatomic ,copy , readonly)BaseLineSpaceToView GW_FirstBaseLineToView;
/// 与视图view底边间距Y相等(GW_VIEW * view)
@property (nonatomic ,copy , readonly)BaseLineSpaceEqualView GW_FirstBaseLineEqualView;
/// 与视图view底边间距Y相等并偏移offset(GW_VIEW * view, CGFloat offset)
@property (nonatomic ,copy , readonly)BaseLineSpaceEqualViewOffset GW_FirstBaseLineEqualViewOffset;
#endif

/// 与父视图底边间距Y(CGFloat value)
@property (nonatomic ,copy , readonly)BaseLineSpace GW_LastBaseLine;
/// 与相对视图toView底边间距Y(CGFloat value,GW_VIEW * toView)
@property (nonatomic ,copy , readonly)BaseLineSpaceToView GW_LastBaseLineToView;
/// 与视图view底边间距Y相等(GW_VIEW * view)
@property (nonatomic ,copy , readonly)BaseLineSpaceEqualView GW_LastBaseLineEqualView;
/// 与视图view底边间距Y相等并偏移offset(GW_VIEW * view, CGFloat offset)
@property (nonatomic ,copy , readonly)BaseLineSpaceEqualViewOffset GW_LastBaseLineEqualViewOffset;



/// 与父视图左边间距(CGFloat value)
@property (nonatomic ,copy , readonly)LeftSpace GW_LeftSpace;
/// 与相对视图toView左边间距(CGFloat value,GW_VIEW * toView)
@property (nonatomic ,copy , readonly)LeftSpaceToView GW_LeftSpaceToView;
/// 与视图view左边间距相等(GW_VIEW * view)
@property (nonatomic ,copy , readonly)LeftSpaceEqualView GW_LeftSpaceEqualView;
/// 与视图view左边间距相等并偏移offset(GW_VIEW * view, CGFloat offset)
@property (nonatomic ,copy , readonly)LeftSpaceEqualViewOffset GW_LeftSpaceEqualViewOffset;

/// 与父视图右边间距(CGFloat value)
@property (nonatomic ,copy , readonly)RightSpace GW_RightSpace;
/// 与相对视图toView右边间距(CGFloat value,GW_VIEW * toView)
@property (nonatomic ,copy , readonly)RightSpaceToView GW_RightSpaceToView;
/// 与相对视图toView右边间距相等(GW_VIEW toView)
@property (nonatomic ,copy , readonly)RightSpaceEqualView GW_RightSpaceEqualView;
/// 与相对视图toView右边间距相等并偏移offset(GW_VIEW toView, CGFloat offset)
@property (nonatomic ,copy , readonly)RightSpaceEqualViewOffset GW_RightSpaceEqualViewOffset;

/// 与父视图顶边间距(CGFloat value)
@property (nonatomic ,copy , readonly)TopSpace GW_TopSpace;
/// 与相对视图toView顶边间距(CGFloat value,GW_VIEW * toView)
@property (nonatomic ,copy , readonly)TopSpaceToView GW_TopSpaceToView;
/// 与视图view顶边间距相等(GW_VIEW * view)
@property (nonatomic ,copy , readonly)TopSpaceEqualView GW_TopSpaceEqualView;
/// 与视图view顶边间距相等并偏移offset(GW_VIEW * view, CGFloat offset)
@property (nonatomic ,copy , readonly)TopSpaceEqualViewOffset GW_TopSpaceEqualViewOffset;

/// 与父视图底边间距(CGFloat value)
@property (nonatomic ,copy , readonly)BottomSpace GW_BottomSpace;
/// 与相对视图toView底边间距(CGFloat value,GW_VIEW * toView) self:bottom -> toView:top
@property (nonatomic ,copy , readonly)BottomSpaceToView GW_BottomSpaceToView;
/// 与相对视图toView底边间距相等(GW_VIEW * toView)
@property (nonatomic ,copy , readonly)BottomSpaceEqualView GW_BottomSpaceEqualView;
/// 与相对视图toView底边间距相等并偏移offset(GW_VIEW * toView, CGFloat offset)
@property (nonatomic ,copy , readonly)BottomSpaceEqualViewOffset GW_BottomSpaceEqualViewOffset;

/// 宽度(CGFloat value)
@property (nonatomic ,copy , readonly)Width GW_Width;
/// 宽度自动()
@property (nonatomic ,copy , readonly)WidthAuto GW_WidthAuto;
/// 宽度等于视图view(GW_VIEW * view)
@property (nonatomic ,copy , readonly)WidthEqualView GW_WidthEqualView;
/// 宽度等于视图view 参照比例Ratio(GW_VIEW * view ,CGFloat ratio)
@property (nonatomic ,copy , readonly)WidthEqualViewRatio GW_WidthEqualViewRatio;
/// 视图自身宽度与高度的比(CGFloat Ratio)
@property (nonatomic ,copy , readonly)WidthHeightRatio GW_WidthHeightRatio;

/// 高度(CGFloat value)
@property (nonatomic ,copy , readonly)Height GW_Height;
/// 高度自动()
@property (nonatomic ,copy , readonly)HeightAuto GW_HeightAuto;
/// 高度等于视图view(GW_VIEW * view)
@property (nonatomic ,copy , readonly)HeightEqualView GW_HeightEqualView;
/// 高度等于视图view 参照比例Ratio(GW_VIEW * view ,CGFloat ratio)
@property (nonatomic ,copy , readonly)HeightEqualViewRatio GW_HeightEqualViewRatio;
/// 视图自身高度与宽度的比(CGFloat Ratio)
@property (nonatomic ,copy , readonly)HeightWidthRatio GW_HeightWidthRatio;

/// 中心X与父视图偏移(CGFloat value)
@property (nonatomic ,copy , readonly)CenterX GW_CenterX;
/// 中心X与视图view偏移(CGFloat value , GW_VIEW * toView)
@property (nonatomic ,copy , readonly)CenterXToView GW_CenterXToView;

/// 中心Y与父视图偏移(CGFloat value)
@property (nonatomic ,copy , readonly)CenterY GW_CenterY;
/// 中心Y与视图view偏移(CGFloat value , GW_VIEW * toView)
@property (nonatomic ,copy , readonly)CenterYToView GW_CenterYToView;

/// 中心与父视图偏移(CGFloat value)
@property (nonatomic ,copy , readonly)Center GW_Center;
/// 中心与视图view偏移(CGFloat value , GW_VIEW * toView)
@property (nonatomic ,copy , readonly)CenterToView GW_CenterToView;

/// size设置(CGFloat width, CGFloat height)
@property (nonatomic ,copy , readonly)size GW_Size;
/// size设置(GW_VIEW * view)
@property (nonatomic ,copy , readonly)SizeEqual GW_SizeEqualView;

/// frame设置(GW_VIEW * view)
@property (nonatomic ,copy , readonly)FrameEqual GW_FrameEqualView;

/// bounds设置(GW_VIEW * view)
@property (nonatomic ,copy , readonly)BoundsEqual GW_BoundsEqualView;
#pragma mark - api version ~ 1.0 -

//[view leftConstraint].content----进行复制修改参数

//- (NSLayoutConstraint *)currentConstraint;

//布局数据
- (NSLayoutConstraint *)lastBaselineConstraint;
- (NSLayoutConstraint *)lastBaselineLessConstraint;
- (NSLayoutConstraint *)lastBaselineGreaterConstraint;

- (NSLayoutConstraint *)firstBaselineConstraint;
- (NSLayoutConstraint *)firstBaselineLessConstraint;
- (NSLayoutConstraint *)firstBaselineGreaterConstraint;

- (NSLayoutConstraint *)leftConstraint;
- (NSLayoutConstraint *)leftLessConstraint;
- (NSLayoutConstraint *)leftGreaterConstraint;

- (NSLayoutConstraint *)rightConstraint;
- (NSLayoutConstraint *)rightLessConstraint;
- (NSLayoutConstraint *)rightGreaterConstraint;

- (NSLayoutConstraint *)topConstraint;
- (NSLayoutConstraint *)topLessConstraint;
- (NSLayoutConstraint *)topGreaterConstraint;

- (NSLayoutConstraint *)bottomConstraint;
- (NSLayoutConstraint *)bottomLessConstraint;
- (NSLayoutConstraint *)bottomGreaterConstraint;

- (NSLayoutConstraint *)widthConstraint;
- (NSLayoutConstraint *)widthLessConstraint;
- (NSLayoutConstraint *)widthGreaterConstraint ;

- (NSLayoutConstraint *)heightConstraint;
- (NSLayoutConstraint *)heightLessConstraint;
- (NSLayoutConstraint *)heightGreaterConstraint;

- (NSLayoutConstraint *)centerXConstraint;
- (NSLayoutConstraint *)centerXLessConstraint;
- (NSLayoutConstraint *)centerXGreaterConstraint;

- (NSLayoutConstraint *)centerYConstraint;
- (NSLayoutConstraint *)centerYLessConstraint;
- (NSLayoutConstraint *)centerYGreaterConstraint;


#pragma mark constructionValue
//@property (assign, nonatomic, readonly) CGFloat currentConstraintValue;
//各个布局的值
@property (assign, nonatomic, readonly) CGFloat lastBaselineConstraintValue;
@property (assign, nonatomic, readonly) CGFloat lastBaselineLessConstraintValue;
@property (assign, nonatomic, readonly) CGFloat lastBaselineGreaterConstraintValue;

@property (assign, nonatomic, readonly) CGFloat firstBaselineConstraintValue;
@property (assign, nonatomic, readonly) CGFloat firstBaselineLessConstraintValue;
@property (assign, nonatomic, readonly) CGFloat firstBaselineGreaterConstraintValue;


@property (assign, nonatomic, readonly) CGFloat leftConstraintValue;
@property (assign, nonatomic, readonly) CGFloat leftLessConstraintValue;
@property (assign, nonatomic, readonly) CGFloat leftGreaterConstraintValue;

@property (assign, nonatomic, readonly) CGFloat rightConstraintValue;
@property (assign, nonatomic, readonly) CGFloat rightLessConstraintValue;
@property (assign, nonatomic, readonly) CGFloat rightGreaterConstraintValue;

@property (assign, nonatomic, readonly) CGFloat topConstraintValue;
@property (assign, nonatomic, readonly) CGFloat topLessConstraintValue;
@property (assign, nonatomic, readonly) CGFloat topGreaterConstraintValue;

@property (assign, nonatomic, readonly) CGFloat bottomConstraintValue;
@property (assign, nonatomic, readonly) CGFloat bottomLessConstraintValue;
@property (assign, nonatomic, readonly) CGFloat bottomGreaterConstraintValue;

@property (assign, nonatomic, readonly) CGFloat widthConstraintValue;
@property (assign, nonatomic, readonly) CGFloat widthLessConstraintValue;
@property (assign, nonatomic, readonly) CGFloat widthGreaterConstraintValue;

@property (assign, nonatomic, readonly) CGFloat heightConstraintValue;
@property (assign, nonatomic, readonly) CGFloat heightLessConstraintValue;
@property (assign, nonatomic, readonly) CGFloat heightGreaterConstraintValue;

@property (assign, nonatomic, readonly) CGFloat centerXConstraintValue;
@property (assign, nonatomic, readonly) CGFloat centerXLessConstraintValue;
@property (assign, nonatomic, readonly) CGFloat centerXGreaterConstraintValue;

@property (assign, nonatomic, readonly) CGFloat centerYConstraintValue;
@property (assign, nonatomic, readonly) CGFloat centerYLessConstraintValue;
@property (assign, nonatomic, readonly) CGFloat centerYGreaterConstraintValue;

/**
 重置缓存的约束,该方法在当前视图对象移除从父视图上可能需要调用清除与父视图之前旧约束缓存对象
 
 @return 返回当前视图
 */
- (GW_VIEW *)GW_ResetConstraints;

/**
 清除所有布局属性
 
 @return 返回当前视图
 */
- (GW_VIEW *)GW_ClearLayoutAttrs;

/**
 移除一个或者一组约束
 
 @param attributes 约束类型（可变参数）
 @return 返回当前视图
 */
- (GW_VIEW *)GW_RemoveLayoutAttr:(NSLayoutAttribute)attributes, ...;


/**
 移除一个单个属性

 @param attribute 约束类型
 @return 返回当前视图
 */
- (GW_VIEW *)GW_RemoveLayoutOneAttr:(NSLayoutAttribute)attribute;

/**
 移除一个或者一组约束从指定的视图上

 @param view 指定视图
 @param attributes 约束类型（可变参数）
 @return 返回当前视图
 */
- (GW_VIEW *)GW_RemoveFrom:(GW_VIEW *)view layoutAttrs:(NSLayoutAttribute)attributes, ...;


/**
 移除一个约束从指定的视图上

 @param view 指定视图
 @param attribute 约束类型
 @return 返回当前视图
 */
- (GW_VIEW *)GW_RemoveFrom:(GW_VIEW *)view layoutAttr:(NSLayoutAttribute)attribute;


/**
 移除一个约束从关联的视图

 @param view 关联的视图
 @param attribute 移除的约束
 @return 当前视图
 */
- (GW_VIEW *)GW_RemoveTo:(GW_VIEW *)view attr:(NSLayoutAttribute)attribute;

/**
 移除多个约束从关联的视图
 
 @param view 关联的视图
 @param attributes 移除的约束
 @return 当前视图
 */

- (GW_VIEW *)GW_RemoveTo:(GW_VIEW *)view layoutAttrs:(NSLayoutAttribute)attributes, ... ;

/**
 设置当前约束的低优先级

 @return 返回当前视图
 */
- (GW_VIEW *)GW_priorityLow;

/**
 设置当前约束的高优先级

 @return 返回当前视图
 */
- (GW_VIEW *)GW_priorityHigh;

/**
 设置当前约束的默认优先级

 @return 返回当前视图
 */
- (GW_VIEW *)GW_priorityRequired;

/**
 设置当前约束的合适优先级

 @return 返回当前视图
 */
- (GW_VIEW *)GW_priorityFitting;

/**
 设置当前约束的优先级

 @param value 优先级大小(0-1000)
 @return 返回当前视图
 */
- (GW_VIEW *)GW_priority:(CGFloat)value;

#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
/**
 设置顶部基线偏移(默认相对父视图)
 
 @param space 间隙
 @return 返回当前视图
 */
- (GW_VIEW *)GW_FirstBaseLine:(CGFloat)space;

/**
 设置顶部基线与对象视图底部基线偏移
 
 @param space 间隙
 @param toView 相对视图
 @return 返回当前视图
 */
- (GW_VIEW *)GW_FirstBaseLine:(CGFloat)space toView:(GW_VIEW *)toView;

/**
 设置顶部基线与相对视图顶部基线相等
 
 @param view 相对视图
 @return 返回当前视图
 */
- (GW_VIEW *)GW_FirstBaseLineEqualView:(GW_VIEW *)view;

/**
 设置顶部基线与相对视图顶部基线相等并偏移offset
 
 @param view 相对视图
 @param offset 偏移量
 @return 返回当前视图
 */
- (GW_VIEW *)GW_FirstBaseLineEqualView:(GW_VIEW *)view offset:(CGFloat)offset;

#endif

/**
 设置底部基线偏移(默认相对父视图)
 
 @param space 间隙
 @return 返回当前视图
 */
- (GW_VIEW *)GW_LastBaseLine:(CGFloat)space;

/**
 设置底部基线与对象视图顶部基线偏移
 
 @param space 间隙
 @param toView 相对视图
 @return 返回当前视图
 */
- (GW_VIEW *)GW_LastBaseLine:(CGFloat)space toView:(GW_VIEW *)toView;

/**
 设置底部基线与相对视图底部基线相等
 
 @param view 相对视图
 @return 返回当前视图
 */
- (GW_VIEW *)GW_LastBaseLineEqualView:(GW_VIEW *)view;

/**
 设置底部基线与相对视图底部基线相等并偏移offset
 
 @param view 相对视图
 @param offset 偏移量
 @return 返回当前视图
 */
- (GW_VIEW *)GW_LastBaseLineEqualView:(GW_VIEW *)view offset:(CGFloat)offset;




/**
 设置左边距(默认相对父视图)

 @param leftSpace 左边距
 @return 返回当前视图
 */
- (GW_VIEW *)GW_LeftSpace:(CGFloat)leftSpace;

/**
 设置左边距

 @param leftSpace 左边距
 @param toView 相对视图
 @return 返回当前视图
 */
- (GW_VIEW *)GW_LeftSpace:(CGFloat)leftSpace toView:(GW_VIEW *)toView;

/**
 设置左边距与视图view左边距相等

 @param view 相对视图
 @return 返回当前视图
 */
- (GW_VIEW *)GW_LeftSpaceEqualView:(GW_VIEW *)view;

/**
 设置左边距与视图view左边距相等并偏移offset

 @param view 相对视图
 @param offset 偏移量
 @return 返回当前视图
 */
- (GW_VIEW *)GW_LeftSpaceEqualView:(GW_VIEW *)view offset:(CGFloat)offset;

/**
 设置右边距(默认相对父视图)

 @param rightSpace 右边距
 @return 返回当前视图
 */
- (GW_VIEW *)GW_RightSpace:(CGFloat)rightSpace;

/**
 设置右边距

 @param rightSpace 右边距
 @param toView 相对视图
 @return 返回当前视图
 */
- (GW_VIEW *)GW_RightSpace:(CGFloat)rightSpace toView:(GW_VIEW *)toView;

/**
 设置右边距与视图view左对齐边距相等

 @param view 相对视图
 @return 返回当前视图
 */
- (GW_VIEW *)GW_RightSpaceEqualView:(GW_VIEW *)view;

/**
 设置右边距与视图view左对齐边距相等并偏移offset

 @param view 相对视图
 @param offset 偏移量
 @return 返回当前视图
 */
- (GW_VIEW *)GW_RightSpaceEqualView:(GW_VIEW *)view offset:(CGFloat)offset;

/**
 设置顶边距(默认相对父视图)

 @param topSpace 顶边距
 @return 返回当前视图
 */
- (GW_VIEW *)GW_TopSpace:(CGFloat)topSpace;

/**
 设置顶边距

 @param topSpace 顶边距
 @param toView 相对视图
 @return 返回当前视图
 */
- (GW_VIEW *)GW_TopSpace:(CGFloat)topSpace toView:(GW_VIEW *)toView;

/**
 设置顶边距与视图view顶边距相等

 @param view 相对视图
 @return 返回当前视图
 */
- (GW_VIEW *)GW_TopSpaceEqualView:(GW_VIEW *)view;

/**
 设置顶边距与视图view顶边距相等并偏移offset

 @param view 相对视图
 @param offset 偏移量
 @return 返回当前视图
 */
- (GW_VIEW *)GW_TopSpaceEqualView:(GW_VIEW *)view offset:(CGFloat)offset;

/**
 设置底边距(默认相对父视图)

 @param bottomSpace 底边距
 @return 返回当前视图
 */
- (GW_VIEW *)GW_BottomSpace:(CGFloat)bottomSpace;

/**
 设置self:bottom -> toView:top的距离

 @param bottomSpace 底边距
 @param toView 相对视图 top
 @return 返回当前视图
 */
- (GW_VIEW *)GW_BottomSpace:(CGFloat)bottomSpace toView:(GW_VIEW *)toView;

/**
 设置底边距与视图view底边距相等

 @param view 相对视图
 @return 返回当前视图
 */
- (GW_VIEW *)GW_BottomSpaceEqualView:(GW_VIEW *)view;

/**
 设置底边距与视图view底边距相等并偏移offset

 @param view 相对视图
 @param offset 偏移量
 @return 返回当前视图
 */
- (GW_VIEW *)GW_BottomSpaceEqualView:(GW_VIEW *)view offset:(CGFloat)offset;

/**
 设置宽度

 @param width 宽度
 @return 返回当前视图
 */
- (GW_VIEW *)GW_Width:(CGFloat)width;

/**
 设置宽度与某个视图相等

 @param view 相对视图
 @return 返回当前视图
 */
- (GW_VIEW *)GW_WidthEqualView:(GW_VIEW *)view;

/**
 设置宽度与视图view相等

 @param view 相对视图
 @param ratio 缩放比例
 @return 返回当前视图
 */
- (GW_VIEW *)GW_WidthEqualView:(GW_VIEW *)view ratio:(CGFloat)ratio;

/**
 设置自动宽度

 @return 返回当前视图
 */
- (GW_VIEW *)GW_AutoWidth;

/**
 设置视图自身宽度与高度的比

 @param ratio 比例
 @return 返回当前视图
 */
- (GW_VIEW *)GW_WidthHeightRatio:(CGFloat)ratio;

/**
 设置高度

 @param height 高度
 @return 返回当前视图
 */
- (GW_VIEW *)GW_Height:(CGFloat)height;

/**
 设置高度与视图view相等

 @param view 相对视图
 @return 返回当前视图
 */
- (GW_VIEW *)GW_HeightEqualView:(GW_VIEW *)view;

/**
 设置高度与视图view相等

 @param view 相对视图
 @param ratio 比例
 @return 返回当前视图
 */
- (GW_VIEW *)GW_HeightEqualView:(GW_VIEW *)view ratio:(CGFloat)ratio;

/**
 设置自动高度

 @return 返回当前视图
 */
- (GW_VIEW *)GW_AutoHeight;

/**
 设置视图自身高度与宽度的比

 @param ratio 比例
 @return 返回当前视图
 */
- (GW_VIEW *)GW_HeightWidthRatio:(CGFloat)ratio;

/**
 设置中心x与父视图中心的偏移 centerX = 0 与父视图中心x重合

 @param centerX 中心x坐标偏移
 @return 返回当前视图
 */
- (GW_VIEW *)GW_CenterX:(CGFloat)centerX;

/**
 设置中心x与相对视图中心的偏移 centerX = 0 与相对视图中心x重合

 @param centerX 中心x坐标偏移
 @param toView 相对视图
 @return 返回当前视图
 */
- (GW_VIEW *)GW_CenterX:(CGFloat)centerX toView:(GW_VIEW *)toView;

/**
 设置中心y与父视图中心的偏移 centerY = 0 与父视图中心y重合

 @param centerY 中心y坐标偏移
 @return 返回当前视图
 */
- (GW_VIEW *)GW_CenterY:(CGFloat)centerY;

/**
 设置中心y与相对视图中心的偏移 centerY = 0 与相对视图中心y重合

 @param centerY 中心y坐标偏移
 @param toView 相对视图
 @return 返回当前视图
 */
- (GW_VIEW *)GW_CenterY:(CGFloat)centerY toView:(GW_VIEW *)toView;


/**
 设置中心偏移(默认相对父视图)center = CGPointZero 与父视图中心重合

 @param center 中心偏移xy
 @return 返回当前视图
 */
- (GW_VIEW *)GW_Center:(CGPoint)center;

/**
 设置中心偏移(默认相对父视图)center = CGPointZero 与父视图中心重合

 @param center 中心偏移xy
 @param toView 相对视图
 @return 返回当前视图
 */
- (GW_VIEW *)GW_Center:(CGPoint)center toView:(GW_VIEW *)toView;

/**
 设置frame(默认相对父视图)

 @param left 左边距
 @param top 顶边距
 @param width 宽度
 @param height 高度
 @return 返回当前视图
 */
- (GW_VIEW *)GW_Frame:(CGFloat)left top:(CGFloat)top width:(CGFloat)width height:(CGFloat)height;

/**
 设置frame (默认相对父视图)
 
 @param left 左边距
 @param top 顶边距
 @param right 右边距
 @param bottom 底边距
 @return 返回当前视图
 */

- (GW_VIEW *)GW_AutoSize:(CGFloat)left top:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom;

/**
 设置frame
 
 @param left 左边距
 @param top 顶边距
 @param width 宽度
 @param height 高度
 @param toView 相对视图
 @return 返回当前视图
 */

- (GW_VIEW *)GW_Frame:(CGFloat)left top:(CGFloat)top width:(CGFloat)width height:(CGFloat)height toView:(GW_VIEW *)toView;

/**
 设置frame (默认相对父视图)
 
 @param left 左边距
 @param top 顶边距
 @param right 右边距
 @param height 高度
 @return 返回当前视图
 */

- (GW_VIEW *)GW_AutoWidth:(CGFloat)left top:(CGFloat)top right:(CGFloat)right height:(CGFloat)height;

/**
 设置frame (默认相对父视图)
 
 @param left 左边距
 @param top 顶边距
 @param width 宽度
 @param bottom 底边距
 @return 返回当前视图
 */

- (GW_VIEW *)GW_AutoHeight:(CGFloat)left top:(CGFloat)top width:(CGFloat)width bottom:(CGFloat)bottom;

/**
 设置frame
 
 @param left 左边距
 @param top 顶边距
 @param right 右边距
 @param bottom 底边距
 @param toView 相对视图
 @return 返回当前视图
 */

- (GW_VIEW *)GW_AutoSize:(CGFloat)left top:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom toView:(GW_VIEW *)toView;

/**
 设置frame
 
 @param left 左边距
 @param top 顶边距
 @param right 右边距
 @param height 高度
 @param toView 相对视图
 @return 返回当前视图
 */

- (GW_VIEW *)GW_AutoWidth:(CGFloat)left top:(CGFloat)top right:(CGFloat)right height:(CGFloat)height toView:(GW_VIEW *)toView;

/**
 设置frame (默认相对父视图)
 
 @param left 左边距
 @param top 顶边距
 @param width 宽度
 @param bottom 底边距
 @return 返回当前视图
 */

- (GW_VIEW *)GW_AutoHeight:(CGFloat)left top:(CGFloat)top width:(CGFloat)width bottom:(CGFloat)bottom toView:(GW_VIEW *)toView;

/**
 设置视图显示宽高
 
 @param size 视图宽高
 @return 返回当前视图
 */

- (GW_VIEW *)GW_Size:(CGSize)size;

/**
 设置视图size等于view
 
 @param view 相对视图
 @return 返回当前视图
 */
- (GW_VIEW *)GW_SizeEqualView:(GW_VIEW *)view;

/**
 设置视图frame等于view
 @param view 相对视图
 @return 返回当前视图
 */
- (GW_VIEW *)GW_FrameEqualView:(GW_VIEW *)view;

/**
 设置视图Bounds等于view - point是（0，0）
 @param view 相对视图
 @return 返回当前视图
 */
- (GW_VIEW *)GW_BoundsEqualView:(GW_VIEW *)view;

#if TARGET_OS_IPHONE || TARGET_OS_TV

#pragma mark - Xib智能布局模块 -

/**
 对整个Xib(使用3.5寸xib)上UI控件垂直和横向智能添加约束进行布局(从此告别xib上拖拽添加约束方式)
 */

- (void)GW_AutoXibLayout;

/**
 对整个Xib(使用3.5寸xib)上UI控件横向智能添加约束进行布局(从此告别xib上拖拽添加约束方式)
 */

- (void)GW_AutoXibLayoutType:(GW_LayoutTypeOptions)type;

/**
 对整个storyboard(使用4.7寸xib)上UI控件垂直和横向智能添加约束进行布局(从此告别xib上拖拽添加约束方式)
 */

- (void)GW_AutoSBLayout;

/**
 对整个storyboard(使用4.7寸xib)上UI控件横向智能添加约束进行布局(从此告别xib上拖拽添加约束方式)
 */

- (void)GW_AutoSBLayoutType:(GW_LayoutTypeOptions)type;

/**
 对整个Xib(使用3.5寸xib)上UI控件横向智能添加约束进行布局(从此告别xib上拖拽添加约束方式)
 */

- (void)GW_AutoXibHorizontalLayout;

/**
 对整个Xib(使用3.5寸xib)上UI控件横向智能添加约束进行布局(从此告别xib上拖拽添加约束方式)
 */

- (void)GW_AutoXibHorizontalLayoutType:(GW_LayoutTypeOptions)type;

/**
 对整个storyboard(使用4.7寸xib)上UI控件横向智能添加约束进行布局(从此告别xib上拖拽添加约束方式)
 */

- (void)GW_AutoSBHorizontalLayout;

/**
 对整个storyboard(使用4.7寸xib)上UI控件横向智能添加约束进行布局(从此告别xib上拖拽添加约束方式)
 */

- (void)GW_AutoSBHorizontalLayoutType:(GW_LayoutTypeOptions)type;

#pragma mark - 自动加边线模块 -

/**
 对视图底部加线
 
 @param value 线宽
 @param color 线的颜色
 @return 返回线视图
 */

- (GW_VIEW *)GW_AddBottomLine:(CGFloat)value lineColor:(UIColor *)color;

/**
 对视图底部加线
 
 @param value 线宽
 @param color 线的颜色
 @param pading 内边距
 @return 返回线视图
 */

- (GW_VIEW *)GW_AddBottomLine:(CGFloat)value lineColor:(UIColor *)color pading:(CGFloat)pading;

/**
 对视图顶部加线
 
 @param value 线宽
 @param color 线的颜色
 @return 返回线视图
 */

- (GW_VIEW *)GW_AddTopLine:(CGFloat)value lineColor:(UIColor *)color;

/**
 对视图顶部加线
 
 @param value 线宽
 @param color 线的颜色
 @param pading 内边距
 @return 返回线视图
 */

- (GW_VIEW *)GW_AddTopLine:(CGFloat)value lineColor:(UIColor *)color pading:(CGFloat)pading;

/**
 对视图左边加线
 
 @param value 线宽
 @param color 线的颜色
 @return 返回线视图
 */


- (GW_VIEW *)GW_AddLeftLine:(CGFloat)value lineColor:(UIColor *)color;

/**
 对视图左边加线

 @param value   线宽
 @param color   线的颜色
 @param padding 边距
 @return 返回线视图
 */
- (GW_VIEW *)GW_AddLeftLine:(CGFloat)value lineColor:(UIColor *)color padding:(CGFloat)padding;

/**
 对视图右边加线
 
 @param value 线宽
 @param color 线的颜色
 @return 返回线视图
 */

- (GW_VIEW *)GW_AddRightLine:(CGFloat)value lineColor:(UIColor *)color;

/**
 对视图右边加线
 
 @param value 线宽
 @param color 线的颜色
 @param padding 边距
 @return 返回线视图
 */

- (GW_VIEW *)GW_AddRightLine:(CGFloat)value lineColor:(UIColor *)color padding:(CGFloat)padding;
#endif



@end
