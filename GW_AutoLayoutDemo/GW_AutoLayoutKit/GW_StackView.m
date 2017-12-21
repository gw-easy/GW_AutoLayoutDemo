//
//  GW_StackView.m
//  GWDemo
//
//  Created by GW on 17/4/8.
//  Copyright © 2017年 GW. All rights reserved.
//



#import "GW_StackView.h"
#import <objc/runtime.h>


@implementation GW_VIEW (GW_StackViewCategory)

- (void)setGW_WidthWeight:(CGFloat)GW_WidthWeight {
    objc_setAssociatedObject(self,
                             @selector(GW_WidthWeight),
                             @(GW_WidthWeight),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)GW_WidthWeight {
    CGFloat weight = [objc_getAssociatedObject(self, _cmd) floatValue];
    if (weight == 0) {
        weight = 1;
    }
    return weight;
}

- (void)setGW_HeightWeight:(CGFloat)GW_HeightWeight {
    objc_setAssociatedObject(self,
                             @selector(GW_HeightWeight),
                             @(GW_HeightWeight),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)GW_HeightWeight {
    CGFloat weight = [objc_getAssociatedObject(self, _cmd) floatValue];
    if (weight == 0) {
        weight = 1;
    }
    return weight;
}

@end

/// 填充空白视图类
@interface GW_VacntView : GW_VIEW

@end

@implementation GW_VacntView

@end

/// 分割线视图
@interface GW_StackViewLineView : GW_VIEW

@end

@implementation GW_StackViewLineView

@end

@interface GW_StackView () {
    BOOL      _autoHeight;
    BOOL      _autoWidth;
    NSInteger _lastRowVacantCount;
}

@end

@implementation GW_StackView

- (instancetype)init {
    self = [super init];
    if (self) {
        #if TARGET_OS_IPHONE || TARGET_OS_TV
        self.backgroundColor = [GW_COLOR whiteColor];
        #elif TARGET_OS_MAC
        self.makeBackingLayer.backgroundColor = [GW_COLOR whiteColor].CGColor;
        #endif
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        #if TARGET_OS_IPHONE || TARGET_OS_TV
        self.backgroundColor = [GW_COLOR whiteColor];
        #elif TARGET_OS_MAC
        self.makeBackingLayer.backgroundColor = [GW_COLOR whiteColor].CGColor;
        #endif
    }
    return self;
}

- (void)setGW_WidthWeight:(CGFloat)GW_WidthWeight {
    objc_setAssociatedObject(self,
                             @selector(GW_WidthWeight),
                             @(GW_WidthWeight),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setGW_ElementHeightWidthRatio:(CGFloat)GW_ElementHeightWidthRatio {
    _GW_ElementHeightWidthRatio = GW_ElementHeightWidthRatio;
    _GW_ElementWidthHeightRatio = 0;
}

- (void)setGW_ElementWidthHeightRatio:(CGFloat)GW_ElementWidthHeightRatio {
    _GW_ElementWidthHeightRatio = GW_ElementWidthHeightRatio;
    _GW_ElementHeightWidthRatio = 0;
}

- (NSInteger)GW_SubViewCount {
    return self.GW_Subviews.count;
}

- (NSInteger)GW_Column {
    return MAX(_GW_Column, 1);
}

- (void)GW_AutoHeight {
    [super GW_AutoHeight];
    _autoHeight = YES;
}

- (HeightAuto)GW_HeightAuto {
    _autoHeight = YES;
    __weak typeof(self) weakSelf = self;
    return ^() {
        [super GW_AutoHeight];
        return weakSelf;
    };
}

- (void)GW_AutoWidth {
    [super GW_AutoWidth];
    _autoWidth = YES;
}

- (WidthAuto)GW_WidthAuto {
    _autoWidth = YES;
    __weak typeof(self) weakSelf = self;
    return ^() {
        [super GW_AutoWidth];
        return weakSelf;
    };
}

- (NSArray<GW_VIEW *> *)GW_Subviews {
    NSMutableArray * subViews = [NSMutableArray array];
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (![obj isKindOfClass:GW_VacntView.self] &&
            ![obj isKindOfClass:GW_StackViewLineView.self]) {
            [subViews addObject:obj];
        }
    }];
    return subViews;
}

- (void)GW_StartLayout {
    [self runStackLayoutEngine];
}

- (GW_StackViewLineView *)makeLine {
    GW_StackViewLineView * lineView = [GW_StackViewLineView new];
    #if TARGET_OS_IPHONE || TARGET_OS_TV
    if (self.GW_SegmentLineColor) {
        lineView.backgroundColor = self.GW_SegmentLineColor;
    }else {
        lineView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    }
    #elif TARGET_OS_MAC
    if (self.GW_SegmentLineColor) {
        lineView.makeBackingLayer.backgroundColor = self.GW_SegmentLineColor.CGColor;
    }else {
        lineView.makeBackingLayer.backgroundColor = [GW_COLOR colorWithWhite:0.9 alpha:1.0].CGColor;
    }
    #endif
    return lineView;
}

- (void)GW_RemoveAllSubviews {
    [self.subviews enumerateObjectsUsingBlock:^(__kindof GW_VIEW * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
        [obj GW_ResetConstraints];
    }];
}

- (void)GW_RemoveAllVacntView {
    _lastRowVacantCount = 0;
    [self.subviews enumerateObjectsUsingBlock:^(__kindof GW_VIEW * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj GW_ResetConstraints];
        if ([obj isKindOfClass:[GW_VacntView class]]) {
            [obj removeFromSuperview];
        }
    }];
}

- (void)removeAllSegmentLine {
    [self.subviews enumerateObjectsUsingBlock:^(__kindof GW_VIEW * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj GW_ResetConstraints];
        if ([obj isKindOfClass:[GW_StackViewLineView class]]) {
            [obj removeFromSuperview];
        }
    }];
}

- (void)runStackLayoutEngine {
    [self removeAllSegmentLine];
    NSArray * subViews = self.subviews;
    NSInteger count = subViews.count;
    if (count == 0) {
        return;
    }
    GW_VIEW * toView = nil;
    GW_LayoutOrientationOptions orientation = self.GW_Orientation;
GW_GOTO:
    switch (orientation) {
        case Horizontal: {
            for (int i = 0; i < count; i++) {
                GW_VIEW * view = subViews[i];
                GW_VIEW * nextView = i < count - 1 ? subViews[i + 1] : nil;
                if (i == 0) {
                    [view GW_LeftSpace:self.GW_Edge.left];
                }else {
                    if (self.GW_SegmentLineSize > 0.0) {
                        GW_StackViewLineView * lineView = [self makeLine];
                        [self addSubview:lineView];
                        [lineView GW_TopSpace:self.GW_SegmentLinePadding];
                        [lineView GW_BottomSpace:self.GW_SegmentLinePadding];
                        [lineView GW_LeftSpace:self.GW_HSpace / 2.0 toView:toView];
                        [lineView GW_Width:self.GW_SegmentLineSize];
                        [view GW_LeftSpace:self.GW_HSpace / 2.0 toView:lineView];
                    }else {
                        [view GW_LeftSpace:self.GW_HSpace toView:toView];
                    }
                }
                [view GW_TopSpace:self.GW_Edge.top];
                if (nextView) {
                    if (self.GW_SubViewWidth > 0) {
                        [view GW_Width:self.GW_SubViewWidth];
                    }else {
                        if (_GW_ElementWidthHeightRatio > 0) {
                            [view GW_WidthHeightRatio:_GW_ElementWidthHeightRatio];
                        }else {
                            if (_autoWidth) {
                                [view GW_AutoWidth];
                            }else {
                                [view GW_WidthEqualView:nextView
                                                   ratio:view.GW_WidthWeight / nextView.GW_WidthWeight];
                            }
                        }
                    }
                    if (self.GW_SubViewHeight > 0) {
                        [view GW_Height:self.GW_SubViewHeight];
                    }else {
                        if (_GW_ElementHeightWidthRatio > 0) {
                            [view GW_HeightWidthRatio:_GW_ElementHeightWidthRatio];
                        }else {
                            if (_autoHeight) {
                                [view GW_AutoHeight];
                            }else {
                                [view GW_BottomSpace:self.GW_Edge.bottom];
                            }
                        }
                    }
                }else {
                    if (self.GW_SubViewWidth > 0) {
                        [view GW_Width:self.GW_SubViewWidth];
                        if (_autoWidth) {
                            [view GW_RightSpace:self.GW_Edge.right];
                        }
                    }else {
                        if (_GW_ElementWidthHeightRatio > 0) {
                            [view GW_WidthHeightRatio:_GW_ElementWidthHeightRatio];
                            if (_autoWidth) {
                                [view GW_RightSpace:self.GW_Edge.right];
                            }
                        }else {
                            if (_autoWidth) {
                                [view GW_AutoWidth];
                            }
                            [view GW_RightSpace:self.GW_Edge.right];
                        }
                    }
                    if (self.GW_SubViewHeight > 0) {
                        [view GW_Height:self.GW_SubViewHeight];
                        if (_autoHeight) {
                            [view GW_BottomSpace:self.GW_Edge.bottom];
                        }
                    }else {
                        if (_GW_ElementHeightWidthRatio > 0) {
                            [view GW_HeightWidthRatio:_GW_ElementHeightWidthRatio];
                            if (_autoHeight) {
                                [view GW_BottomSpace:self.GW_Edge.bottom];
                            }
                        }else {
                            if (_autoHeight) {
                                [view GW_AutoHeight];
                            }
                            [view GW_BottomSpace:self.GW_Edge.bottom];
                        }
                    }
                }
                toView = view;
                if ([toView isKindOfClass:[GW_StackView class]]) {
                    [((GW_StackView *)toView) GW_StartLayout];
                }
            }
            break;
        }
        case Vertical: {
            for (int i = 0; i < count; i++) {
                GW_VIEW * view = subViews[i];
                GW_VIEW * nextView = i < count - 1 ? subViews[i + 1] : nil;
                if (i == 0) {
                    [view GW_TopSpace:self.GW_Edge.top];
                }else {
                    if (self.GW_SegmentLineSize > 0.0) {
                        GW_StackViewLineView * lineView = [self makeLine];
                        [self addSubview:lineView];
                        [lineView GW_LeftSpace:self.GW_SegmentLinePadding];
                        [lineView GW_RightSpace:self.GW_SegmentLinePadding];
                        [lineView GW_Height:self.GW_SegmentLineSize];
                        [lineView GW_TopSpace:self.GW_VSpace / 2.0 toView:toView];
                        [view GW_TopSpace:self.GW_VSpace / 2.0 toView:lineView];
                    }else {
                        [view GW_TopSpace:self.GW_VSpace toView:toView];
                    }
                }
                [view GW_LeftSpace:self.GW_Edge.left];
                if (nextView) {
                    if (self.GW_SubViewWidth > 0) {
                        [view GW_Width:self.GW_SubViewWidth];
                    }else {
                        if (_GW_ElementWidthHeightRatio > 0) {
                            [view GW_WidthHeightRatio:_GW_ElementWidthHeightRatio];
                        }else {
                            if (_autoWidth) {
                                [view GW_AutoWidth];
                            }else {
                                [view GW_RightSpace:self.GW_Edge.right];
                            }
                        }
                    }
                    if (self.GW_SubViewHeight > 0) {
                        [view GW_Height:self.GW_SubViewHeight];
                    }else {
                        if (_GW_ElementHeightWidthRatio > 0) {
                            [view GW_HeightWidthRatio:_GW_ElementHeightWidthRatio];
                        }else {
                            if (_autoHeight) {
                                [view GW_AutoHeight];
                            }else {
                                [view GW_HeightEqualView:nextView
                                                    ratio:view.GW_HeightWeight / nextView.GW_HeightWeight];
                            }
                        }
                    }
                }else {
                    if (self.GW_SubViewWidth > 0) {
                        [view GW_Width:self.GW_SubViewWidth];
                        if (_autoWidth) {
                            [view GW_RightSpace:self.GW_Edge.right];
                        }
                    }else {
                        if (_GW_ElementWidthHeightRatio > 0) {
                            [view GW_WidthHeightRatio:_GW_ElementWidthHeightRatio];
                            if (_autoWidth) {
                                [view GW_RightSpace:self.GW_Edge.right];
                            }
                        }else {
                            if (_autoWidth) {
                                [view GW_AutoWidth];
                            }
                            [view GW_RightSpace:self.GW_Edge.right];
                        }
                    }
                    if (self.GW_SubViewHeight > 0) {
                        [view GW_Height:self.GW_SubViewHeight];
                        if (_autoHeight) {
                            [view GW_BottomSpace:self.GW_Edge.bottom];
                        }
                    }else {
                        if (_GW_ElementHeightWidthRatio > 0) {
                            [view GW_HeightWidthRatio:_GW_ElementHeightWidthRatio];
                            if (_autoHeight) {
                                [view GW_BottomSpace:self.GW_Edge.bottom];
                            }
                        }else {
                            if (_autoHeight) {
                                [view GW_AutoHeight];
                            }
                            [view GW_BottomSpace:self.GW_Edge.bottom];
                        }
                    }
                }
                toView = view;
                if ([toView isKindOfClass:[GW_StackView class]]) {
                    [((GW_StackView *)toView) GW_StartLayout];
                }
            }
            break;
        }
        case All: {
            for (GW_VIEW * view in self.subviews) {
                [view GW_ResetConstraints];
                if ([view isKindOfClass:[GW_VacntView class]]) {
                    [view removeFromSuperview];
                }
            }
            subViews = self.subviews;
            count = subViews.count;
            if (self.GW_Column < 2) {
                orientation = Vertical;
                goto GW_GOTO;
            }else {
                NSInteger rowCount = count / self.GW_Column + (count % self.GW_Column == 0 ? 0 : 1);
                NSInteger index = 0;
                _lastRowVacantCount = rowCount * self.GW_Column - count;
                for (NSInteger i = 0; i < _lastRowVacantCount; i++) {
                    GW_VacntView * view = [GW_VacntView new];
#if TARGET_OS_IPHONE || TARGET_OS_TV
                    view.backgroundColor = [GW_COLOR clearColor];
#elif TARGET_OS_MAC
                    view.makeBackingLayer.backgroundColor = [GW_COLOR clearColor].CGColor;
#endif
                    [self addSubview:view];
                }
                if (_lastRowVacantCount > 0) {
                    subViews = nil;
                    subViews = self.subviews;
                    count = subViews.count;
                }
                GW_VIEW * frontRowView = nil;
                GW_VIEW * frontColumnView = nil;
                
                GW_StackViewLineView * columnLineView = nil;
                for (NSInteger row = 0; row < rowCount; row++) {
                    GW_VIEW * nextRowView = nil;
                    GW_VIEW * rowView = subViews[row * self.GW_Column];
                    NSInteger nextRow = (row + 1) * self.GW_Column;
                    if (nextRow < count) {
                        nextRowView = subViews[nextRow];
                    }
                    GW_StackViewLineView * rowLineView = nil;
                    if (self.GW_SegmentLineSize > 0.0 && row > 0) {
                        rowLineView = [self makeLine];
                        [self addSubview:rowLineView];
                        [rowLineView GW_LeftSpace:self.GW_SegmentLinePadding];
                        [rowLineView GW_RightSpace:self.GW_SegmentLinePadding];
                        [rowLineView GW_Height:self.GW_SegmentLineSize];
                        [rowLineView GW_TopSpace:self.GW_VSpace / 2.0 toView:frontRowView];
                    }
                    for (NSInteger column = 0; column < self.GW_Column; column++) {
                        index = row * self.GW_Column + column;
                        GW_VIEW * view = subViews[index];
                        GW_VIEW * nextColumnView = nil;
                        if (column > 0 && self.GW_SegmentLineSize > 0.0) {
                            columnLineView = [self makeLine];
                            [self addSubview:columnLineView];
                            [columnLineView GW_LeftSpace:self.GW_HSpace / 2.0 toView:frontColumnView];
                            [columnLineView GW_TopSpace:self.GW_SegmentLinePadding];
                            [columnLineView GW_BottomSpace:self.GW_SegmentLinePadding];
                            [columnLineView GW_Width:self.GW_SegmentLineSize];
                        }
                        if (column < self.GW_Column - 1 && index < count) {
                            nextColumnView = subViews[index + 1];
                        }
                        if (row == 0) {
                            [view GW_TopSpace:self.GW_Edge.top];
                        }else {
                            if (rowLineView) {
                                [view GW_TopSpace:self.GW_VSpace / 2.0 toView:rowLineView];
                            }else {
                                [view GW_TopSpace:self.GW_VSpace toView:frontRowView];
                            }
                        }
                        if (column == 0) {
                            [view GW_LeftSpace:self.GW_Edge.left];
                        }else {
                            if (columnLineView) {
                                [view GW_LeftSpace:self.GW_HSpace / 2.0 toView:columnLineView];
                            }else {
                                [view GW_LeftSpace:self.GW_HSpace toView:frontColumnView];
                            }
                            
                        }
                        if (nextRowView) {
                            if (self.GW_SubViewHeight > 0) {
                                [view GW_Height:self.GW_SubViewHeight];
                            }else {
                                if (_GW_ElementHeightWidthRatio > 0) {
                                    [view GW_HeightWidthRatio:_GW_ElementHeightWidthRatio];
                                }else {
                                    if (_autoHeight) {
                                        [view GW_AutoHeight];
                                    }else {
                                        [view GW_HeightEqualView:nextRowView
                                                            ratio:view.GW_HeightWeight / nextRowView.GW_HeightWeight];
                                    }
                                }
                            }
                        }else {
                            if (self.GW_SubViewHeight > 0) {
                                [view GW_Height:self.GW_SubViewHeight];
                            }else {
                                if (_GW_ElementHeightWidthRatio > 0) {
                                    [view GW_HeightWidthRatio:_GW_ElementHeightWidthRatio];
                                }else {
                                    if (_autoHeight) {
                                        [view GW_AutoHeight];
                                    }else {
                                        [view GW_BottomSpace:self.GW_Edge.bottom];
                                    }
                                }
                            }
                        }
                        if (nextColumnView) {
                            if (self.GW_SubViewWidth > 0) {
                                [view GW_Width:self.GW_SubViewWidth];
                            }else {
                                if (_GW_ElementWidthHeightRatio > 0) {
                                    [view GW_WidthHeightRatio:_GW_ElementWidthHeightRatio];
                                }else {
                                    if (_autoWidth) {
                                        [view GW_AutoWidth];
                                    }else {
                                        [view GW_WidthEqualView:nextColumnView
                                                       ratio:view.GW_WidthWeight / nextColumnView.GW_WidthWeight];
                                    }
                                }
                            }
                        }else {
                            if (self.GW_SubViewWidth > 0) {
                                [view GW_Width:self.GW_SubViewWidth];
                            }else {
                                if (_GW_ElementWidthHeightRatio > 0) {
                                    [view GW_WidthHeightRatio:_GW_ElementWidthHeightRatio];
                                }else {
                                    if (_autoWidth) {
                                        [view GW_AutoWidth];
                                    }else {
                                        [view GW_RightSpace:self.GW_Edge.right];
                                    }
                                }
                            }
                        }
                        frontColumnView = view;
                        if ([frontColumnView isKindOfClass:[GW_StackView class]]) {
                            [((GW_StackView *)frontColumnView) GW_StartLayout];
                        }
                    }
                    frontRowView = rowView;
                }
                
                if (_autoWidth) {
                    NSInteger subCount = self.subviews.count;
#if TARGET_OS_IPHONE || TARGET_OS_TV
                    [self layoutIfNeeded];
#elif TARGET_OS_MAC
                    [self.makeBackingLayer layoutIfNeeded];
#endif
                    CGFloat rowLastColumnViewMaxX = 0;
                    GW_VIEW * rowLastColumnViewMaxXView;
                    for (NSInteger r = 0; r < subCount; r++) {
                        NSInteger index = r;
                        GW_VIEW * maxWidthView = self.subviews[index];
#if TARGET_OS_IPHONE || TARGET_OS_TV
                        [maxWidthView layoutIfNeeded];
#elif TARGET_OS_MAC
                        [maxWidthView.makeBackingLayer layoutIfNeeded];
#endif
                        if (maxWidthView.maxX > rowLastColumnViewMaxX) {
                            rowLastColumnViewMaxX = maxWidthView.maxX;
                            rowLastColumnViewMaxXView = maxWidthView;
                        }
                    }
                    [rowLastColumnViewMaxXView GW_RightSpace:_GW_Edge.right];
                }
                
                if (_autoHeight) {
                    NSInteger subCount = self.subviews.count;
#if TARGET_OS_IPHONE || TARGET_OS_TV
                    [self layoutIfNeeded];
#elif TARGET_OS_MAC
                    [self.makeBackingLayer layoutIfNeeded];
#endif
                    CGFloat columnLastRowViewMaxY = 0;
                    GW_VIEW * columnLastRowViewMaxYView;
                    for (NSInteger r = 0; r < subCount; r++) {
                        NSInteger index = r;
                        GW_VIEW * maxHeightView = self.subviews[index];
#if TARGET_OS_IPHONE || TARGET_OS_TV
                        [maxHeightView layoutIfNeeded];
#elif TARGET_OS_MAC
                        [maxHeightView.makeBackingLayer layoutIfNeeded];
#endif
                        if (maxHeightView.maxY > columnLastRowViewMaxY) {
                            columnLastRowViewMaxY = maxHeightView.maxY;
                            columnLastRowViewMaxYView = maxHeightView;
                        }
                    }
                    [columnLastRowViewMaxYView GW_BottomSpace:_GW_Edge.bottom];
                }
            }
            break;
        }
        default:
            break;
    }
}


@end
