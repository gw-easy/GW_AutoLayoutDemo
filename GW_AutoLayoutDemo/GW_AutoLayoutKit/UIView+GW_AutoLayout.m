//
//  GW_VIEW+GW_AutoLayout.m
//  GWDemo
//
//  Created by GW on 17/4/8.
//  Copyright © 2017年 GW. All rights reserved.
//



#import "UIView+GW_AutoLayout.h"
#import <objc/runtime.h>

#if TARGET_OS_IPHONE || TARGET_OS_TV

#define kDeprecatedVerticalAdapter (0)

typedef NS_OPTIONS(NSUInteger, GWNibType) {
    XIB = 1 << 0,
    SB = 1 << 1
};

#pragma mark - UI自动布局 -

@interface GW_Line : GW_VIEW

@end

@implementation GW_Line
@end

#endif


@implementation GW_VIEW (GW_AutoLayout)

- (void)setCurrentConstraint:(NSLayoutConstraint *)currentConstraint {
    objc_setAssociatedObject(self, @selector(currentConstraint), currentConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)currentConstraint {
    return objc_getAssociatedObject(self, _cmd);
}


- (void)setLeftConstraint:(NSLayoutConstraint *)leftConstraint relation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationLessThanOrEqual:
            [self setLeftLessConstraint:leftConstraint];
            break;
        case NSLayoutRelationGreaterThanOrEqual:
            [self setLeftGreaterConstraint:leftConstraint];
        default:
            [self setLeftConstraint:leftConstraint];
            break;
    }
}

- (NSLayoutConstraint *)leftConstraintRelation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationGreaterThanOrEqual:
            return [self leftGreaterConstraint];
        case NSLayoutRelationLessThanOrEqual:
            return [self leftLessConstraint];
        default:
            return [self leftConstraint];
    }
}

- (void)setLeftConstraint:(NSLayoutConstraint *)leftConstraint {
    objc_setAssociatedObject(self, @selector(leftConstraint), leftConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)leftConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLeftLessConstraint:(NSLayoutConstraint *)leftConstraint {
    objc_setAssociatedObject(self, @selector(leftLessConstraint), leftConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)leftLessConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLeftGreaterConstraint:(NSLayoutConstraint *)leftConstraint {
    objc_setAssociatedObject(self, @selector(leftGreaterConstraint), leftConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)leftGreaterConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setRightConstraint:(NSLayoutConstraint *)rightConstraint relation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationLessThanOrEqual:
            [self setRightLessConstraint:rightConstraint];
            break;
        case NSLayoutRelationGreaterThanOrEqual:
            [self setRightGreaterConstraint:rightConstraint];
        default:
            [self setRightConstraint:rightConstraint];
            break;
    }
}

- (NSLayoutConstraint *)rightConstraintRelation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationGreaterThanOrEqual:
            return [self rightGreaterConstraint];
        case NSLayoutRelationLessThanOrEqual:
            return [self rightLessConstraint];
        default:
            return [self rightConstraint];
    }
}

- (void)setRightConstraint:(NSLayoutConstraint *)rightConstraint {
    objc_setAssociatedObject(self, @selector(rightConstraint), rightConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)rightConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setRightLessConstraint:(NSLayoutConstraint *)rightConstraint {
    objc_setAssociatedObject(self, @selector(rightLessConstraint), rightConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)rightLessConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setRightGreaterConstraint:(NSLayoutConstraint *)rightConstraint {
    objc_setAssociatedObject(self, @selector(rightGreaterConstraint), rightConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)rightGreaterConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setTopConstraint:(NSLayoutConstraint *)topConstraint relation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationLessThanOrEqual:
            [self setTopLessConstraint:topConstraint];
            break;
        case NSLayoutRelationGreaterThanOrEqual:
            [self setTopGreaterConstraint:topConstraint];
        default:
            [self setTopConstraint:topConstraint];
            break;
    }
}

- (NSLayoutConstraint *)topConstraintRelation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationGreaterThanOrEqual:
            return [self topGreaterConstraint];
        case NSLayoutRelationLessThanOrEqual:
            return [self topLessConstraint];
        default:
            return [self topConstraint];
    }
}

- (void)setTopConstraint:(NSLayoutConstraint *)topConstraint {
    objc_setAssociatedObject(self, @selector(topConstraint), topConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)topConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setTopLessConstraint:(NSLayoutConstraint *)topConstraint {
    objc_setAssociatedObject(self, @selector(topLessConstraint), topConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)topLessConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setTopGreaterConstraint:(NSLayoutConstraint *)topConstraint {
    objc_setAssociatedObject(self, @selector(topGreaterConstraint), topConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)topGreaterConstraint {
    return objc_getAssociatedObject(self, _cmd);
}


- (void)setBottomConstraint:(NSLayoutConstraint *)bottomConstraint relation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationLessThanOrEqual:
            [self setBottomLessConstraint:bottomConstraint];
            break;
        case NSLayoutRelationGreaterThanOrEqual:
            [self setBottomGreaterConstraint:bottomConstraint];
        default:
            [self setBottomConstraint:bottomConstraint];
            break;
    }
}

- (NSLayoutConstraint *)bottomConstraintRelation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationGreaterThanOrEqual:
            return [self bottomGreaterConstraint];
        case NSLayoutRelationLessThanOrEqual:
            return [self bottomLessConstraint];
        default:
            return [self bottomConstraint];
    }
}


- (void)setBottomConstraint:(NSLayoutConstraint *)bottomConstraint {
    objc_setAssociatedObject(self, @selector(bottomConstraint), bottomConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)bottomConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setBottomLessConstraint:(NSLayoutConstraint *)bottomConstraint {
    objc_setAssociatedObject(self, @selector(bottomLessConstraint), bottomConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)bottomLessConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setBottomGreaterConstraint:(NSLayoutConstraint *)bottomConstraint {
    objc_setAssociatedObject(self, @selector(bottomGreaterConstraint), bottomConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)bottomGreaterConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setWidthConstraint:(NSLayoutConstraint *)widthConstraint relation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationLessThanOrEqual:
            [self setWidthLessConstraint:widthConstraint];
            break;
        case NSLayoutRelationGreaterThanOrEqual:
            [self setWidthGreaterConstraint:widthConstraint];
        default:
            [self setWidthConstraint:widthConstraint];
            break;
    }
}

- (NSLayoutConstraint *)widthConstraintRelation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationGreaterThanOrEqual:
            return [self widthGreaterConstraint];
        case NSLayoutRelationLessThanOrEqual:
            return [self widthLessConstraint];
        default:
            return [self widthConstraint];
    }
}


- (void)setWidthConstraint:(NSLayoutConstraint *)widthConstraint {
    objc_setAssociatedObject(self, @selector(widthConstraint), widthConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)widthConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setWidthLessConstraint:(NSLayoutConstraint *)widthConstraint {
    objc_setAssociatedObject(self, @selector(widthLessConstraint), widthConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)widthLessConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setWidthGreaterConstraint:(NSLayoutConstraint *)widthConstraint {
    objc_setAssociatedObject(self, @selector(widthGreaterConstraint), widthConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)widthGreaterConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setHeightConstraint:(NSLayoutConstraint *)heightConstraint relation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationLessThanOrEqual:
            [self setHeightLessConstraint:heightConstraint];
            break;
        case NSLayoutRelationGreaterThanOrEqual:
            [self setHeightGreaterConstraint:heightConstraint];
        default:
            [self setHeightConstraint:heightConstraint];
            break;
    }
}

- (NSLayoutConstraint *)heightConstraintRelation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationGreaterThanOrEqual:
            return [self heightGreaterConstraint];
        case NSLayoutRelationLessThanOrEqual:
            return [self heightLessConstraint];
        default:
            return [self heightConstraint];
    }
}

- (void)setHeightConstraint:(NSLayoutConstraint *)heightConstraint {
    objc_setAssociatedObject(self, @selector(heightConstraint), heightConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)heightConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setHeightLessConstraint:(NSLayoutConstraint *)heightConstraint {
    objc_setAssociatedObject(self, @selector(heightLessConstraint), heightConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)heightLessConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setHeightGreaterConstraint:(NSLayoutConstraint *)heightConstraint {
    objc_setAssociatedObject(self, @selector(heightGreaterConstraint), heightConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)heightGreaterConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCenterXConstraint:(NSLayoutConstraint *)centerXConstraint relation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationLessThanOrEqual:
            [self setCenterXLessConstraint:centerXConstraint];
            break;
        case NSLayoutRelationGreaterThanOrEqual:
            [self setCenterXGreaterConstraint:centerXConstraint];
        default:
            [self setCenterXConstraint:centerXConstraint];
            break;
    }
}

- (NSLayoutConstraint *)centerXConstraintRelation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationGreaterThanOrEqual:
            return [self centerXGreaterConstraint];
        case NSLayoutRelationLessThanOrEqual:
            return [self centerXLessConstraint];
        default:
            return [self centerXConstraint];
    }
}


- (void)setCenterXConstraint:(NSLayoutConstraint *)centerXConstraint {
    objc_setAssociatedObject(self, @selector(centerXConstraint), centerXConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)centerXConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCenterXLessConstraint:(NSLayoutConstraint *)centerXConstraint {
    objc_setAssociatedObject(self, @selector(centerXLessConstraint), centerXConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)centerXLessConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCenterXGreaterConstraint:(NSLayoutConstraint *)centerXConstraint {
    objc_setAssociatedObject(self, @selector(centerXGreaterConstraint), centerXConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)centerXGreaterConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCenterYConstraint:(NSLayoutConstraint *)centerYConstraint relation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationLessThanOrEqual:
            [self setCenterYLessConstraint:centerYConstraint];
            break;
        case NSLayoutRelationGreaterThanOrEqual:
            [self setCenterYGreaterConstraint:centerYConstraint];
        default:
            [self setCenterYConstraint:centerYConstraint];
            break;
    }
}

- (NSLayoutConstraint *)centerYConstraintRelation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationGreaterThanOrEqual:
            return [self centerYGreaterConstraint];
        case NSLayoutRelationLessThanOrEqual:
            return [self centerYLessConstraint];
        default:
            return [self centerYConstraint];
    }
}

- (void)setCenterYConstraint:(NSLayoutConstraint *)centerYConstraint {
    objc_setAssociatedObject(self, @selector(centerYConstraint), centerYConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)centerYConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCenterYLessConstraint:(NSLayoutConstraint *)centerYConstraint {
    objc_setAssociatedObject(self, @selector(centerYLessConstraint), centerYConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)centerYLessConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCenterYGreaterConstraint:(NSLayoutConstraint *)centerYConstraint {
    objc_setAssociatedObject(self, @selector(centerYGreaterConstraint), centerYConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)centerYGreaterConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLastBaselineConstraint:(NSLayoutConstraint *)lastBaselineConstraint relation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationLessThanOrEqual:
            [self setLastBaselineLessConstraint:lastBaselineConstraint];
            break;
        case NSLayoutRelationGreaterThanOrEqual:
            [self setLastBaselineGreaterConstraint:lastBaselineConstraint];
        default:
            [self setLastBaselineConstraint:lastBaselineConstraint];
            break;
    }
}

- (NSLayoutConstraint *)lastBaselineConstraintRelation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationGreaterThanOrEqual:
            return [self lastBaselineGreaterConstraint];
        case NSLayoutRelationLessThanOrEqual:
            return [self lastBaselineLessConstraint];
        default:
            return [self lastBaselineConstraint];
    }
}


- (void)setLastBaselineConstraint:(NSLayoutConstraint *)lastBaselineConstraint {
    objc_setAssociatedObject(self, @selector(lastBaselineConstraint), lastBaselineConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)lastBaselineConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLastBaselineLessConstraint:(NSLayoutConstraint *)lastBaselineConstraint {
    objc_setAssociatedObject(self, @selector(lastBaselineLessConstraint), lastBaselineConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)lastBaselineLessConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLastBaselineGreaterConstraint:(NSLayoutConstraint *)lastBaselineConstraint {
    objc_setAssociatedObject(self, @selector(lastBaselineGreaterConstraint), lastBaselineConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)lastBaselineGreaterConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setFirstBaselineConstraint:(NSLayoutConstraint *)firstBaselineConstraint relation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationLessThanOrEqual:
            [self setFirstBaselineLessConstraint:firstBaselineConstraint];
            break;
        case NSLayoutRelationGreaterThanOrEqual:
            [self setFirstBaselineGreaterConstraint:firstBaselineConstraint];
        default:
            [self setFirstBaselineConstraint:firstBaselineConstraint];
            break;
    }
}

- (NSLayoutConstraint *)firstBaselineConstraintRelation:(NSLayoutRelation)relation {
    switch (relation) {
        case NSLayoutRelationGreaterThanOrEqual:
            return [self firstBaselineGreaterConstraint];
        case NSLayoutRelationLessThanOrEqual:
            return [self firstBaselineLessConstraint];
        default:
            return [self firstBaselineConstraint];
    }
}

- (void)setFirstBaselineConstraint:(NSLayoutConstraint *)firstBaselineConstraint {
    objc_setAssociatedObject(self, @selector(firstBaselineConstraint), firstBaselineConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)firstBaselineConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setFirstBaselineLessConstraint:(NSLayoutConstraint *)firstBaselineConstraint {
    objc_setAssociatedObject(self, @selector(firstBaselineLessConstraint), firstBaselineConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)firstBaselineLessConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setFirstBaselineGreaterConstraint:(NSLayoutConstraint *)firstBaselineConstraint {
    objc_setAssociatedObject(self, @selector(firstBaselineGreaterConstraint), firstBaselineConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)firstBaselineGreaterConstraint {
    return objc_getAssociatedObject(self, _cmd);
}

#pragma mark - removeConstraint api v2.0 -

- (LessOrEqual)GW_LessOrEqual {
    __weak typeof(self) weakSelf = self;
    return ^() {
        [weakSelf GW_HandleConstraintsRelation:NSLayoutRelationLessThanOrEqual];
        return weakSelf;
    };
}

- (GreaterOrEqual)GW_GreaterOrEqual {
    __weak typeof(self) weakSelf = self;
    return ^() {
        [weakSelf GW_HandleConstraintsRelation:NSLayoutRelationGreaterThanOrEqual];
        return weakSelf;
    };
}

- (ResetConstraintAttribute)GW_ResetConstraint {
    __weak typeof(self) weakSelf = self;
    return ^() {
        [weakSelf GW_ResetConstraints];
        return weakSelf;
    };
}

- (RemoveConstraintAttribute)GW_RemoveLayoutAttrs {
    __weak typeof(self) weakSelf = self;
    return ^(NSLayoutAttribute attributes, ...) {
        va_list attrs;
        va_start(attrs, attributes);
        NSLayoutAttribute maxAttr = [weakSelf GW_GetMaxLayoutAttribute];
        while(attributes > NSLayoutAttributeNotAnAttribute && attributes <= maxAttr) {
            if (attributes > 0) {
                [weakSelf GW_SwitchRemoveAttr:attributes view:weakSelf.superview to:nil removeSelf:YES];
            }
            attributes = va_arg(attrs, NSLayoutAttribute);
        }
        va_end(attrs);
        return weakSelf;
    };
}

- (RemoveConstraintFromViewAttribute)GW_RemoveFromLayoutAttrs {
    __weak typeof(self) weakSelf = self;
    return ^(GW_VIEW * view,NSLayoutAttribute attributes, ...) {
        va_list attrs;
        va_start(attrs, attributes);
        NSLayoutAttribute maxAttr = [weakSelf GW_GetMaxLayoutAttribute];
        while(attributes > NSLayoutAttributeNotAnAttribute && attributes <= maxAttr) {
            if (attributes > 0) {
                [weakSelf GW_SwitchRemoveAttr:attributes view:view to:nil removeSelf:NO];
            }
            attributes = va_arg(attrs, NSLayoutAttribute);
        }
        va_end(attrs);
        return weakSelf;
    };
}

- (RemoveConstraintToViewAttribute)GW_RemoveToLayoutAttrs {
    __weak typeof(self) weakSelf = self;
    return ^(GW_VIEW * toView,NSLayoutAttribute attributes, ...) {
        va_list attrs;
        va_start(attrs, attributes);
        NSLayoutAttribute maxAttr = [self GW_GetMaxLayoutAttribute];
        while(attributes > NSLayoutAttributeNotAnAttribute && attributes <= maxAttr) {
            if (attributes > 0) {
                [self GW_SwitchRemoveAttr:attributes view:self.superview to:toView removeSelf:NO];
            }
            attributes = va_arg(attrs, NSLayoutAttribute);
        }
        va_end(attrs);
        return weakSelf;
    };
}

- (ClearConstraintAttribute)GW_ClearLayoutAttr {
    __weak typeof(self) weakSelf = self;
    return ^() {
        [weakSelf GW_ClearLayoutAttrs];
        return weakSelf;
    };
}

#pragma mark - constraintsPriority api v2.0 -

- (PriorityLow)GW_PriorityLow {
    __weak typeof(self) weakSelf = self;
    return ^() {
        [weakSelf GW_priorityLow];
        return weakSelf;
    };
}

- (PriorityHigh)GW_PriorityHigh {
    __weak typeof(self) weakSelf = self;
    return ^() {
        [weakSelf GW_priorityHigh];
        return weakSelf;
    };
}

- (PriorityRequired)GW_PriorityRequired {
    __weak typeof(self) weakSelf = self;
    return ^() {
        [weakSelf GW_priorityRequired];
        return weakSelf;
    };
}

- (PriorityFitting)GW_PriorityFitting {
    __weak typeof(self) weakSelf = self;
    return ^() {
        [weakSelf GW_priorityFitting];
        return weakSelf;
    };
}

- (PriorityValue)GW_Priority {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value) {
        [weakSelf GW_priority:value];
        return weakSelf;
    };
}

#pragma mark - api version 2.0 -
#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
- (BaseLineSpace)GW_FirstBaseLine {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat space) {
        [weakSelf GW_FirstBaseLine:space];
        return weakSelf;
    };
}

- (BaseLineSpaceToView)GW_FirstBaseLineToView {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value , GW_VIEW * toView) {
        [weakSelf GW_FirstBaseLine:value toView:toView];
        return weakSelf;
    };
}

- (BaseLineSpaceEqualView)GW_FirstBaseLineEqualView {
    __weak typeof(self) weakSelf = self;
    return ^(GW_VIEW * view) {
        [weakSelf GW_FirstBaseLineEqualView:view];
        return weakSelf;
    };
}

- (BaseLineSpaceEqualViewOffset)GW_FirstBaseLineEqualViewOffset {
    __weak typeof(self) weakSelf = self;
    return ^(GW_VIEW * view, CGFloat offset) {
        [weakSelf GW_FirstBaseLineEqualView:view offset:offset];
        return weakSelf;
    };
}

#endif

- (BaseLineSpace)GW_LastBaseLine {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat space) {
        [weakSelf GW_LastBaseLine:space];
        return weakSelf;
    };
}

- (BaseLineSpaceToView)GW_LastBaseLineToView {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value , GW_VIEW * toView) {
        [weakSelf GW_LastBaseLine:value toView:toView];
        return weakSelf;
    };
}

- (BaseLineSpaceEqualView)GW_LastBaseLineEqualView {
    __weak typeof(self) weakSelf = self;
    return ^(GW_VIEW * view) {
        [weakSelf GW_LastBaseLineEqualView:view];
        return weakSelf;
    };
}

- (BaseLineSpaceEqualViewOffset)GW_LastBaseLineEqualViewOffset {
    __weak typeof(self) weakSelf = self;
    return ^(GW_VIEW * view, CGFloat offset) {
        [weakSelf GW_LastBaseLineEqualView:view offset:offset];
        return weakSelf;
    };
}


- (LeftSpace)GW_LeftSpace {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat space) {
        [weakSelf GW_LeftSpace:space];
        return weakSelf;
    };
}

- (LeftSpaceToView)GW_LeftSpaceToView {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat space, GW_VIEW * toView) {
        [weakSelf GW_LeftSpace:space toView:toView];
        return weakSelf;
    };
}

- (LeftSpaceEqualView)GW_LeftSpaceEqualView {
    __weak typeof(self) weakSelf = self;
    return ^(GW_VIEW * view) {
        [weakSelf GW_LeftSpaceEqualView:view];
        return weakSelf;
    };
}

- (LeftSpaceEqualViewOffset)GW_LeftSpaceEqualViewOffset {
    __weak typeof(self) weakSelf = self;
    return ^(GW_VIEW * view, CGFloat offset) {
        [weakSelf GW_LeftSpaceEqualView:view offset:offset];
        return weakSelf;
    };
}

- (RightSpace)GW_RightSpace {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat space) {
        [weakSelf GW_RightSpace:space];
        return weakSelf;
    };
}

- (RightSpaceToView)GW_RightSpaceToView {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value , GW_VIEW * toView) {
        [weakSelf GW_RightSpace:value toView:toView];
        return weakSelf;
    };
}

- (RightSpaceEqualView)GW_RightSpaceEqualView {
    __weak typeof(self) weakSelf = self;
    return ^(GW_VIEW * toView) {
        [weakSelf GW_RightSpaceEqualView:toView];
        return weakSelf;
    };
}

- (RightSpaceEqualViewOffset)GW_RightSpaceEqualViewOffset {
    __weak typeof(self) weakSelf = self;
    return ^(GW_VIEW * toView, CGFloat offset) {
        [weakSelf GW_RightSpaceEqualView:toView offset:offset];
        return weakSelf;
    };
}

- (TopSpace)GW_TopSpace {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat space) {
        [weakSelf GW_TopSpace:space];
        return weakSelf;
    };
}

- (TopSpaceToView)GW_TopSpaceToView {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value , GW_VIEW * toView) {
        [weakSelf GW_TopSpace:value toView:toView];
        return weakSelf;
    };
}

- (TopSpaceEqualView)GW_TopSpaceEqualView {
    __weak typeof(self) weakSelf = self;
    return ^(GW_VIEW * view) {
        [weakSelf GW_TopSpaceEqualView:view];
        return weakSelf;
    };
}

- (TopSpaceEqualViewOffset)GW_TopSpaceEqualViewOffset {
    __weak typeof(self) weakSelf = self;
    return ^(GW_VIEW * view, CGFloat offset) {
        [weakSelf GW_TopSpaceEqualView:view offset:offset];
        return weakSelf;
    };
}

- (BottomSpace)GW_BottomSpace {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat space) {
        [weakSelf GW_BottomSpace:space];
        return weakSelf;
    };
}

- (BottomSpaceToView)GW_BottomSpaceToView {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value , GW_VIEW * toView) {
        [weakSelf GW_BottomSpace:value toView:toView];
        return weakSelf;
    };
}

- (BottomSpaceEqualView)GW_BottomSpaceEqualView {
    __weak typeof(self) weakSelf = self;
    return ^(GW_VIEW * toView) {
        [weakSelf GW_BottomSpaceEqualView:toView];
        return weakSelf;
    };
}

- (BottomSpaceEqualViewOffset)GW_BottomSpaceEqualViewOffset {
    __weak typeof(self) weakSelf = self;
    return ^(GW_VIEW * toView, CGFloat offset) {
        [weakSelf GW_BottomSpaceEqualView:toView offset:offset];
        return weakSelf;
    };
}

- (Width)GW_Width {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value) {
        [weakSelf GW_Width:value];
        return weakSelf;
    };
}

- (WidthAuto)GW_WidthAuto {
    __weak typeof(self) weakSelf = self;
    return ^() {
        [weakSelf GW_AutoWidth];
        return weakSelf;
    };
}

- (MaxWidth)GW_MaxWidth{
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value){
        [[weakSelf GW_Width:value] GW_HandleConstraintsRelation:NSLayoutRelationLessThanOrEqual];
        return weakSelf;
    };
}

- (MixWidth)GW_MixWidth{
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value){
        [[weakSelf GW_Width:value] GW_HandleConstraintsRelation:NSLayoutRelationGreaterThanOrEqual];
        return weakSelf;
    };
}

- (WidthEqualView)GW_WidthEqualView {
    __weak typeof(self) weakSelf = self;
    return ^(GW_VIEW * view) {
        [weakSelf GW_WidthEqualView:view];
        return weakSelf;
    };
}

- (WidthEqualViewRatio)GW_WidthEqualViewRatio {
    __weak typeof(self) weakSelf = self;
    return ^(GW_VIEW * view , CGFloat value) {
        [weakSelf GW_WidthEqualView:view ratio:value];
        return weakSelf;
    };
}

- (WidthHeightRatio)GW_WidthHeightRatio {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value) {
        [weakSelf GW_WidthHeightRatio:value];
        return weakSelf;
    };
}

- (Height)GW_Height {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value) {
        [weakSelf GW_Height:value];
        return weakSelf;
    };
}

- (HeightAuto)GW_HeightAuto {
    __weak typeof(self) weakSelf = self;
    return ^() {
        [weakSelf GW_AutoHeight];
        return weakSelf;
    };
}

- (MaxHeight)GW_MaxHeight{
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value){
        [[weakSelf GW_Height:value] GW_HandleConstraintsRelation:NSLayoutRelationLessThanOrEqual];
        return weakSelf;
    };
}

- (MixHeight)GW_MixHeight{
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value){
        [[weakSelf GW_Height:value] GW_HandleConstraintsRelation:NSLayoutRelationGreaterThanOrEqual];
        return weakSelf;
    };
}

- (HeightEqualView)GW_HeightEqualView {
    __weak typeof(self) weakSelf = self;
    return ^(GW_VIEW * view) {
        [weakSelf GW_HeightEqualView:view];
        return weakSelf;
    };
}

- (HeightEqualViewRatio)GW_HeightEqualViewRatio {
    __weak typeof(self) weakSelf = self;
    return ^(GW_VIEW * view , CGFloat value) {
        [weakSelf GW_HeightEqualView:view ratio:value];
        return weakSelf;
    };
}

- (HeightWidthRatio)GW_HeightWidthRatio {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value) {
        [weakSelf GW_HeightWidthRatio:value];
        return weakSelf;
    };
}

- (CenterX)GW_CenterX {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value) {
        [weakSelf GW_CenterX:value];
        return weakSelf;
    };
}

- (CenterXToView)GW_CenterXToView {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value,GW_VIEW * toView) {
        [weakSelf GW_CenterX:value toView:toView];
        return weakSelf;
    };
}

- (CenterY)GW_CenterY {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value) {
        [weakSelf GW_CenterY:value];
        return weakSelf;
    };
}

- (CenterYToView)GW_CenterYToView {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat value,GW_VIEW * toView) {
        [weakSelf GW_CenterY:value toView:toView];
        return weakSelf;
    };
}

- (Center)GW_Center {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat x, CGFloat y) {
        [weakSelf GW_Center:CGPointMake(x, y)];
        return weakSelf;
    };
}

- (CenterToView)GW_CenterToView {
    __weak typeof(self) weakSelf = self;
    return ^(CGPoint center,GW_VIEW * toView) {
        [weakSelf GW_Center:center toView:toView];
        return weakSelf;
    };
}

- (size)GW_Size {
    __weak typeof(self) weakSelf = self;
    return ^(CGFloat width, CGFloat height) {
        [weakSelf GW_Size:CGSizeMake(width, height)];
        return weakSelf;
    };
}

- (SizeEqual)GW_SizeEqualView {
    __weak typeof(self) weakSelf = self;
    return ^(GW_VIEW * view) {
        [weakSelf GW_SizeEqualView:view];
        return weakSelf;
    };
}

- (FrameEqual)GW_FrameEqualView {
    __weak typeof(self) weakSelf = self;
    return ^(GW_VIEW * view) {
        [weakSelf GW_FrameEqualView:view];
        return weakSelf;
    };
}

- (BoundsEqual)GW_BoundsEqualView {
    __weak typeof(self) weakSelf = self;
    return ^(GW_VIEW * view) {
        [weakSelf GW_BoundsEqualView:view];
        return weakSelf;
    };
}

#pragma mark constructionValue
#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
- (CGFloat)firstBaselineConstraintValue{
    return [self firstBaselineConstraint].constant;
}

- (CGFloat)firstBaselineLessConstraintValue{
    return [self firstBaselineLessConstraint].constant;
}

- (CGFloat)firstBaselineGreaterConstraintValue{
    return [self firstBaselineGreaterConstraint].constant;
}
#endif

- (CGFloat)lastBaselineConstraintValue{
    return [self lastBaselineConstraint].constant;
}

- (CGFloat)lastBaselineLessConstraintValue{
    return [self lastBaselineLessConstraint].constant;
}

- (CGFloat)lastBaselineGreaterConstraintValue{
    return [self lastBaselineGreaterConstraint].constant;
}



- (CGFloat)leftConstraintValue{
    return [self leftConstraint].constant;
}

- (CGFloat)leftLessConstraintValue{
    return [self leftLessConstraint].constant;
}

- (CGFloat)leftGreaterConstraintValue{
    return [self leftGreaterConstraint].constant;
}

- (CGFloat)rightConstraintValue{
    return [self rightConstraint].constant;
}

- (CGFloat)rightLessConstraintValue{
    return [self rightLessConstraint].constant;
}

- (CGFloat)rightGreaterConstraintValue{
    return [self rightGreaterConstraint].constant;
}

- (CGFloat)topConstraintValue{
    return [self topConstraint].constant;
}

- (CGFloat)topLessConstraintValue{
    return [self topLessConstraint].constant;
}

- (CGFloat)topGreaterConstraintValue{
    return [self topGreaterConstraint].constant;
}

- (CGFloat)bottomConstraintValue{
    return [self bottomConstraint].constant;
}

- (CGFloat)bottomLessConstraintValue{
    return [self bottomLessConstraint].constant;
}

- (CGFloat)bottomGreaterConstraintValue{
    return [self bottomGreaterConstraint].constant;
}

- (CGFloat)widthConstraintValue{
    return [self widthConstraint].constant;
}

- (CGFloat)widthLessConstraintValue{
    return [self widthLessConstraint].constant;
}

- (CGFloat)widthGreaterConstraintValue{
    return [self widthGreaterConstraint].constant;
}

- (CGFloat)heightConstraintValue{
    return [self heightConstraint].constant;
}

- (CGFloat)heightLessConstraintValue{
    return [self heightLessConstraint].constant;
}

- (CGFloat)heightGreaterConstraintValue{
    return [self heightGreaterConstraint].constant;
}

- (CGFloat)centerXConstraintValue{
    return [self centerXConstraint].constant;
}

- (CGFloat)centerXLessConstraintValue{
    return [self centerXLessConstraint].constant;
}

- (CGFloat)centerXGreaterConstraintValue{
    return [self centerXGreaterConstraint].constant;
}

- (CGFloat)centerYConstraintValue{
    return [self centerYConstraint].constant;
}

- (CGFloat)centerYLessConstraintValue{
    return [self centerYLessConstraint].constant;
}

- (CGFloat)centerYGreaterConstraintValue{
    return [self centerYGreaterConstraint].constant;
}


#pragma mark - removeConstraint api v1.0 -

- (NSLayoutAttribute)GW_GetMaxLayoutAttribute {
    NSLayoutAttribute maxAttr = NSLayoutAttributeNotAnAttribute;
#if TARGET_OS_IPHONE || TARGET_OS_TV
#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000)
    maxAttr = NSLayoutAttributeCenterYWithinMargins;
#else
    maxAttr = NSLayoutAttributeLastBaseline;
#endif
    
#elif TARGET_OS_MAC
#if (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
    maxAttr = NSLayoutAttributeFirstBaseline;
#else
    maxAttr = NSLayoutAttributeLastBaseline;
#endif
    
#endif
    return maxAttr;
}

- (GW_VIEW *)GW_MainViewConstraint:(NSLayoutConstraint *)constraint {
    GW_VIEW * view = nil;
    if (constraint) {
        if (constraint.secondAttribute == NSLayoutAttributeNotAnAttribute ||
            constraint.secondItem == nil) {
            view = constraint.firstItem;
        }else {
            GW_VIEW * firstItem = constraint.firstItem;
            GW_VIEW * secondItem = constraint.secondItem;
            GW_VIEW * sameSuperView = [self sameSuperviewWithView1:firstItem view2:secondItem];
            if (sameSuperView) {
                view = sameSuperView;
            }else {
                view = secondItem;
            }
        }
    }
    return view;
}

- (void)GW_CommonRemoveConstraint:(NSLayoutAttribute)attribute view:(GW_VIEW *)mainView to:(GW_VIEW *)toView {
    NSLayoutConstraint * constraint = nil;
    GW_VIEW * view = nil;
    switch (attribute) {
    #if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
        case NSLayoutAttributeFirstBaseline:{
            constraint = [self firstBaselineConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setFirstBaselineConstraint:nil];
            }
            constraint = [self firstBaselineLessConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setFirstBaselineLessConstraint:nil];
            }
            constraint = [self firstBaselineGreaterConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setFirstBaselineGreaterConstraint:nil];
            }
        }
            break;
    #endif
        case NSLayoutAttributeLastBaseline:{
            constraint = [self lastBaselineConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setLastBaselineConstraint:nil];
            }
            constraint = [self lastBaselineLessConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setLastBaselineLessConstraint:nil];
            }
            constraint = [self lastBaselineGreaterConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setLastBaselineGreaterConstraint:nil];
            }
        }
            break;
        case NSLayoutAttributeCenterY:{
            constraint = [self centerYConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setCenterYConstraint:nil];
            }
            constraint = [self centerYLessConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setCenterYLessConstraint:nil];
            }
            constraint = [self centerYGreaterConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setCenterYGreaterConstraint:nil];
            }
        }
            break;
        case NSLayoutAttributeCenterX:{
            constraint = [self centerXConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setCenterXConstraint:nil];
            }
            constraint = [self centerXLessConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setCenterXLessConstraint:nil];
            }
            constraint = [self centerXGreaterConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setCenterXGreaterConstraint:nil];
            }
        }
            break;
        case NSLayoutAttributeBottom:{
            constraint = [self bottomConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setBottomConstraint:nil];
            }
            constraint = [self bottomLessConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setBottomLessConstraint:nil];
            }
            constraint = [self bottomGreaterConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setBottomGreaterConstraint:nil];
            }
        }
            break;
        case NSLayoutAttributeTop:{
            constraint = [self topConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setTopConstraint:nil];
            }
            constraint = [self topLessConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setTopLessConstraint:nil];
            }
            constraint = [self topGreaterConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setTopGreaterConstraint:nil];
            }
        }
            break;
        case NSLayoutAttributeRight:{
            constraint = [self rightConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setRightConstraint:nil];
            }
            constraint = [self rightLessConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setRightLessConstraint:nil];
            }
            constraint = [self rightGreaterConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setRightGreaterConstraint:nil];
            }
        }
            break;
        case NSLayoutAttributeLeft:{
            constraint = [self leftConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setLeftConstraint:nil];
            }
            constraint = [self leftLessConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setLeftLessConstraint:nil];
            }
            constraint = [self leftGreaterConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setLeftGreaterConstraint:nil];
            }
        }
            break;
        case NSLayoutAttributeWidth:{
            constraint = [self widthConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setWidthConstraint:nil];
            }
            constraint = [self widthLessConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setWidthLessConstraint:nil];
            }
            constraint = [self widthGreaterConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setWidthGreaterConstraint:nil];
            }
        }
            break;
        case NSLayoutAttributeHeight:{
            constraint = [self heightConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setHeightConstraint:nil];
            }
            constraint = [self heightLessConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setHeightLessConstraint:nil];
            }
            constraint = [self heightGreaterConstraint];
            if (constraint) {
                view = [self GW_MainViewConstraint:constraint];
                if (view) [view removeConstraint:constraint];
                [self setHeightGreaterConstraint:nil];
            }
        }
            break;
        default:
            break;
    }
    if (mainView) {
        NSArray<NSLayoutConstraint *> * constraints = mainView.constraints;
        [constraints enumerateObjectsUsingBlock:^(NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            GW_VIEW * linkView = (toView != nil ? toView : mainView);
            if ((obj.firstItem == self &&
                 obj.firstAttribute == attribute &&
                 (obj.secondItem == linkView || obj.secondItem == nil)) ||
                (obj.firstItem == linkView &&
                 obj.secondItem == self &&
                 obj.secondAttribute == attribute)) {
                    [mainView removeConstraint:obj];
                }
        }];
    }
}

- (void)GW_SwitchRemoveAttr:(NSLayoutAttribute)attr view:(GW_VIEW *)view to:(GW_VIEW *)toView removeSelf:(BOOL)removeSelf {
    switch (attr) {
#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
        case NSLayoutAttributeFirstBaseline:
#endif
#if ((TARGET_OS_IPHONE || TARGET_OS_TV) && (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000))
        case NSLayoutAttributeLeftMargin:
        case NSLayoutAttributeRightMargin:
        case NSLayoutAttributeTopMargin:
        case NSLayoutAttributeBottomMargin:
        case NSLayoutAttributeLeadingMargin:
        case NSLayoutAttributeTrailingMargin:
        case NSLayoutAttributeCenterXWithinMargins:
        case NSLayoutAttributeCenterYWithinMargins:
#endif
        case NSLayoutAttributeLastBaseline:
        case NSLayoutAttributeCenterY:
        case NSLayoutAttributeCenterX:
        case NSLayoutAttributeTrailing:
        case NSLayoutAttributeLeading:
        case NSLayoutAttributeBottom:
        case NSLayoutAttributeTop:
        case NSLayoutAttributeRight:
        case NSLayoutAttributeLeft:
            [self GW_CommonRemoveConstraint:attr view:view to:toView];
            break;
        case NSLayoutAttributeWidth:
        case NSLayoutAttributeHeight:
            if (removeSelf) {
                [self GW_CommonRemoveConstraint:attr view:self to:toView];
            }
            [self GW_CommonRemoveConstraint:attr view:view to:toView];
            break;
        default:
            break;
    }
}

- (GW_VIEW *)GW_ResetConstraints {
    GW_VIEW * (^getMainView)(NSLayoutConstraint * constraint) = ^(NSLayoutConstraint * constraint){
        GW_VIEW * view = nil;
        if (constraint && constraint.secondAttribute != NSLayoutAttributeNotAnAttribute && constraint.secondItem != nil) {
            GW_VIEW * firstItem = constraint.firstItem;
            GW_VIEW * secondItem = constraint.secondItem;
            if (firstItem.superview == secondItem.superview) {
                view = firstItem.superview;
            }else {
                view = secondItem;
            }
        }
        return view;
    };
   
    NSLayoutConstraint * constraint = [self firstBaselineConstraint];
    GW_VIEW * mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setFirstBaselineConstraint:nil];
    }

    constraint = [self firstBaselineLessConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setFirstBaselineLessConstraint:nil];
    }
    
    constraint = [self firstBaselineGreaterConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setFirstBaselineGreaterConstraint:nil];
    }
    
    constraint = [self lastBaselineConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setLastBaselineConstraint:nil];
    }
    
    constraint = [self lastBaselineLessConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setLastBaselineLessConstraint:nil];
    }
    
    constraint = [self lastBaselineGreaterConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setLastBaselineGreaterConstraint:nil];
    }
    
    constraint = [self centerYConstraint];
    mainView = getMainView(constraint);

    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setCenterYConstraint:nil];
    }
    
    constraint = [self centerYLessConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setCenterYLessConstraint:nil];
    }
    
    constraint = [self centerYGreaterConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setCenterYGreaterConstraint:nil];
    }
    
    constraint = [self centerXConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setCenterXConstraint:nil];
    }
    
    constraint = [self centerXLessConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setCenterXLessConstraint:nil];
    }
    
    constraint = [self centerXGreaterConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setCenterXGreaterConstraint:nil];
    }
    
    constraint = [self bottomConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setBottomConstraint:nil];
    }
    
    constraint = [self bottomLessConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setBottomLessConstraint:nil];
    }
    
    constraint = [self bottomGreaterConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setBottomGreaterConstraint:nil];
    }
    
    constraint = [self topConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setTopConstraint:nil];
    }
    
    constraint = [self topLessConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setTopLessConstraint:nil];
    }
    
    constraint = [self topGreaterConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setTopGreaterConstraint:nil];
    }

    constraint = [self rightConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setRightConstraint:nil];
    }
    
    constraint = [self rightLessConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setRightLessConstraint:nil];
    }
    
    constraint = [self rightGreaterConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setRightGreaterConstraint:nil];
    }

    constraint = [self leftConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setLeftConstraint:nil];
    }

    constraint = [self leftLessConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setLeftLessConstraint:nil];
    }
    
    constraint = [self leftGreaterConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setLeftGreaterConstraint:nil];
    }
    
    constraint = [self widthConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setWidthConstraint:nil];
    }
    
    constraint = [self widthLessConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setWidthLessConstraint:nil];
    }
    
    constraint = [self widthGreaterConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setWidthGreaterConstraint:nil];
    }
    
    constraint = [self heightConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setHeightConstraint:nil];
    }
    
    constraint = [self heightLessConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setHeightLessConstraint:nil];
    }
    
    constraint = [self heightGreaterConstraint];
    mainView = getMainView(constraint);
    if (mainView) {
        [mainView removeConstraint:constraint];
        [self setHeightGreaterConstraint:nil];
    }
    
    return self;
}

- (GW_VIEW *)GW_ClearLayoutAttrs {
    @autoreleasepool {
        NSArray<NSLayoutConstraint *> * constraints = self.constraints;
        if (constraints) {
            [constraints enumerateObjectsUsingBlock:^(NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if (obj.firstItem == self &&
                    obj.secondAttribute == NSLayoutAttributeNotAnAttribute) {
                    [self removeConstraint:obj];
                }
            }];
        }
        GW_VIEW * superView = self.superview;
        if (superView) {
            constraints = superView.constraints;
            if (constraints) {
                [constraints enumerateObjectsUsingBlock:^(NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if (obj.firstItem == self || obj.secondItem == self) {
                        [superView removeConstraint:obj];
                    }
                }];
            }
        }
        [self GW_ResetConstraints];
    }
    return self;
}

- (GW_VIEW *)GW_RemoveFrom:(GW_VIEW *)view layoutAttrs:(NSLayoutAttribute)attributes, ... {
    va_list attrs;
    va_start(attrs, attributes);
    NSLayoutAttribute maxAttr = [self GW_GetMaxLayoutAttribute];
    while(attributes > NSLayoutAttributeNotAnAttribute && attributes <= maxAttr) {
        if (attributes > 0) {
            [self GW_SwitchRemoveAttr:attributes view:view to:nil removeSelf:NO];
        }
        attributes = va_arg(attrs, NSLayoutAttribute);
    }
    va_end(attrs);
    return self;
}

- (GW_VIEW *)GW_RemoveFrom:(GW_VIEW *)view layoutAttr:(NSLayoutAttribute)attribute {
    NSLayoutAttribute maxAttr = [self GW_GetMaxLayoutAttribute];
    if (attribute > NSLayoutAttributeNotAnAttribute && attribute <= maxAttr) {
        [self GW_SwitchRemoveAttr:attribute view:view to:nil removeSelf:NO];
    }
    return self;
}

- (GW_VIEW *)GW_RemoveLayoutAttr:(NSLayoutAttribute)attributes, ... {
    va_list attrs;
    va_start(attrs, attributes);
    NSLayoutAttribute maxAttr = [self GW_GetMaxLayoutAttribute];
    while(attributes > NSLayoutAttributeNotAnAttribute && attributes <= maxAttr) {
        if (attributes > 0) {
            [self GW_SwitchRemoveAttr:attributes view:self.superview to:nil removeSelf:YES];
        }
        attributes = va_arg(attrs, NSLayoutAttribute);
    }
    va_end(attrs);
    return self;
}

- (GW_VIEW *)GW_RemoveLayoutOneAttr:(NSLayoutAttribute)attribute {
    NSLayoutAttribute maxAttr = [self GW_GetMaxLayoutAttribute];
    if (attribute > NSLayoutAttributeNotAnAttribute && attribute <= maxAttr) {
        [self GW_SwitchRemoveAttr:attribute view:self.superview to:nil removeSelf:YES];
    }
    return self;
}

- (GW_VIEW *)GW_RemoveTo:(GW_VIEW *)view attr:(NSLayoutAttribute)attribute {
    if (attribute > 0 && attribute <= [self GW_GetMaxLayoutAttribute]) {
        [self GW_SwitchRemoveAttr:attribute view:self.superview to:view removeSelf:NO];
    }
    return self;
}

- (GW_VIEW *)GW_RemoveTo:(GW_VIEW *)view layoutAttrs:(NSLayoutAttribute)attributes, ... {
    va_list attrs;
    va_start(attrs, attributes);
    NSLayoutAttribute maxAttr = [self GW_GetMaxLayoutAttribute];
    while(attributes > NSLayoutAttributeNotAnAttribute && attributes <= maxAttr) {
        if (attributes > 0) {
            [self GW_SwitchRemoveAttr:attributes view:self.superview to:view removeSelf:NO];
        }
        attributes = va_arg(attrs, NSLayoutAttribute);
    }
    va_end(attrs);
    return self;
}

#pragma mark - constraintsPriority api v1.0 -

- (GW_VIEW *)GW_HandleConstraintsRelation:(NSLayoutRelation)relation {
    NSLayoutConstraint * constraints = [self currentConstraint];
    if (constraints && constraints.relation != relation) {
        NSLayoutConstraint * tmpConstraints = [NSLayoutConstraint constraintWithItem:constraints.firstItem attribute:constraints.firstAttribute relatedBy:relation toItem:constraints.secondItem attribute:constraints.secondAttribute multiplier:constraints.multiplier constant:constraints.constant];
        GW_VIEW * mainView = [self GW_MainViewConstraint:constraints];
        if (mainView) {
            [mainView removeConstraint:constraints];
            [self setCacheConstraint:nil attribute:constraints.firstAttribute relation:constraints.relation];
            [mainView addConstraint:tmpConstraints];
            [self setCacheConstraint:tmpConstraints attribute:tmpConstraints.firstAttribute relation:tmpConstraints.relation];
            [self setCurrentConstraint:tmpConstraints];
        }
    }
    return self;
}

- (GW_VIEW *)GW_HandleConstraintsPriority:(GW_LayoutPriority)priority {
    NSLayoutConstraint * constraints = [self currentConstraint];
    if (constraints && constraints.priority != priority) {
#if TARGET_OS_IPHONE || TARGET_OS_TV
        if (constraints.priority == UILayoutPriorityRequired) {
#elif TARGET_OS_MAC
        if (constraints.priority == NSLayoutPriorityRequired) {
#endif
            GW_VIEW * mainView = [self GW_MainViewConstraint:constraints];
            if (mainView) {
                NSLayoutConstraint * tmpConstraints = [NSLayoutConstraint constraintWithItem:constraints.firstItem attribute:constraints.firstAttribute relatedBy:constraints.relation toItem:constraints.secondItem attribute:constraints.secondAttribute multiplier:constraints.multiplier constant:constraints.constant];
                tmpConstraints.priority = priority;
                [self setCacheConstraint:nil attribute:constraints.firstAttribute relation:constraints.relation];
                [mainView removeConstraint:constraints];
                [mainView addConstraint:tmpConstraints];
                [self setCacheConstraint:tmpConstraints attribute:tmpConstraints.firstAttribute relation:tmpConstraints.relation];
                [self setCurrentConstraint:tmpConstraints];
            }
        }else if (constraints) {
            constraints.priority = priority;
        }
    }
    return self;
}

- (GW_VIEW *)GW_priorityLow {
#if TARGET_OS_IPHONE || TARGET_OS_TV
    return [self GW_HandleConstraintsPriority:UILayoutPriorityDefaultLow];
#elif TARGET_OS_MAC
    return [self GW_HandleConstraintsPriority:NSLayoutPriorityDefaultLow];
#endif
}

- (GW_VIEW *)GW_priorityHigh {
#if TARGET_OS_IPHONE || TARGET_OS_TV
    return [self GW_HandleConstraintsPriority:UILayoutPriorityDefaultHigh];
#elif TARGET_OS_MAC
    return [self GW_HandleConstraintsPriority:NSLayoutPriorityDefaultHigh];
#endif
}

- (GW_VIEW *)GW_priorityRequired {
#if TARGET_OS_IPHONE || TARGET_OS_TV
    return [self GW_HandleConstraintsPriority:UILayoutPriorityRequired];
#elif TARGET_OS_MAC
    return [self GW_HandleConstraintsPriority:NSLayoutPriorityRequired];
#endif
}

- (GW_VIEW *)GW_priorityFitting {
#if TARGET_OS_IPHONE || TARGET_OS_TV
    return [self GW_HandleConstraintsPriority:UILayoutPriorityFittingSizeLevel];
#elif TARGET_OS_MAC
    return [self GW_HandleConstraintsPriority:NSLayoutPriorityFittingSizeCompression];
#endif
}
    
- (GW_VIEW *)GW_priority:(CGFloat)value {
    return [self GW_HandleConstraintsPriority:value];
}

#pragma mark - api version 1.0

#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
- (GW_VIEW *)GW_FirstBaseLine:(CGFloat)space {
    return [self GW_ConstraintWithItem:self.superview
                             attribute:NSLayoutAttributeFirstBaseline
                              constant:0.0 - space];
}

- (GW_VIEW *)GW_FirstBaseLine:(CGFloat)space toView:(GW_VIEW *)toView {
    NSLayoutAttribute toAttribute = NSLayoutAttributeLastBaseline;
    if (![self sameSuperviewWithView1:toView view2:self]) {
        toAttribute = NSLayoutAttributeFirstBaseline;
    }
    return [self GW_ConstraintWithItem:self
                             attribute:NSLayoutAttributeFirstBaseline
                             relatedBy:NSLayoutRelationEqual
                                toItem:toView
                             attribute:toAttribute
                            multiplier:1
                              constant:space];
}

- (GW_VIEW *)GW_FirstBaseLineEqualView:(GW_VIEW *)view {
    return [self GW_FirstBaseLineEqualView:view offset:0];
}

- (GW_VIEW *)GW_FirstBaseLineEqualView:(GW_VIEW *)view offset:(CGFloat)offset {
    return [self GW_ConstraintWithItem:view
                             attribute:NSLayoutAttributeFirstBaseline
                              constant:0.0 - offset];
}
    
#endif
    
- (GW_VIEW *)GW_LastBaseLine:(CGFloat)space {
    return [self GW_ConstraintWithItem:self.superview
                             attribute:NSLayoutAttributeLastBaseline
                              constant:0.0 - space];
}

- (GW_VIEW *)GW_LastBaseLine:(CGFloat)space toView:(GW_VIEW *)toView {
#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
    NSLayoutAttribute toAttribute = NSLayoutAttributeFirstBaseline;
#else
    NSLayoutAttribute toAttribute = NSLayoutAttributeTop;
#endif
    if (![self sameSuperviewWithView1:toView view2:self]) {
        toAttribute = NSLayoutAttributeLastBaseline;
    }
    return [self GW_ConstraintWithItem:self
                             attribute:NSLayoutAttributeLastBaseline
                             relatedBy:NSLayoutRelationEqual
                                toItem:toView
                             attribute:toAttribute
                            multiplier:1
                              constant:0.0 - space];
}

- (GW_VIEW *)GW_LastBaseLineEqualView:(GW_VIEW *)view {
    return [self GW_LastBaseLineEqualView:view offset:0];
}

- (GW_VIEW *)GW_LastBaseLineEqualView:(GW_VIEW *)view offset:(CGFloat)offset {
    return [self GW_ConstraintWithItem:view
                             attribute:NSLayoutAttributeLastBaseline
                              constant:0.0 - offset];
}

    
- (GW_VIEW *)GW_LeftSpace:(CGFloat)leftSpace {
    return [self GW_ConstraintWithItem:self.superview
                       attribute:NSLayoutAttributeLeft
                        constant:leftSpace];
}

- (GW_VIEW *)GW_LeftSpace:(CGFloat)leftSpace toView:(GW_VIEW *)toView {
    NSLayoutAttribute toAttribute = NSLayoutAttributeRight;
    if (![self sameSuperviewWithView1:toView view2:self]) {
        toAttribute = NSLayoutAttributeLeft;
    }
    return [self GW_ConstraintWithItem:self
                       attribute:NSLayoutAttributeLeft
                       relatedBy:NSLayoutRelationEqual
                          toItem:toView
                       attribute:toAttribute
                      multiplier:1
                        constant:leftSpace];
}

- (GW_VIEW *)GW_LeftSpaceEqualView:(GW_VIEW *)view {
    return [self GW_LeftSpaceEqualView:view offset:0];
}

- (GW_VIEW *)GW_LeftSpaceEqualView:(GW_VIEW *)view offset:(CGFloat)offset {
    return [self GW_ConstraintWithItem:self
                       attribute:NSLayoutAttributeLeft
                       relatedBy:NSLayoutRelationEqual
                          toItem:view
                       attribute:NSLayoutAttributeLeft
                      multiplier:1
                        constant:offset];
}

- (GW_VIEW *)GW_RightSpace:(CGFloat)rightSpace {
    return [self GW_ConstraintWithItem:self.superview
                       attribute:NSLayoutAttributeRight
                        constant:0.0 - rightSpace];
}

- (GW_VIEW *)GW_RightSpace:(CGFloat)rightSpace toView:(GW_VIEW *)toView {
    NSLayoutAttribute toAttribute = NSLayoutAttributeLeft;
    if (![self sameSuperviewWithView1:toView view2:self]) {
        toAttribute = NSLayoutAttributeRight;
    }
    return [self GW_ConstraintWithItem:self
                       attribute:NSLayoutAttributeRight
                       relatedBy:NSLayoutRelationEqual
                          toItem:toView
                       attribute:toAttribute
                      multiplier:1
                        constant:0.0 - rightSpace];
}

- (GW_VIEW *)GW_RightSpaceEqualView:(GW_VIEW *)view {
    return [self GW_RightSpaceEqualView:view offset:0];
}

- (GW_VIEW *)GW_RightSpaceEqualView:(GW_VIEW *)view offset:(CGFloat)offset {
    return [self GW_ConstraintWithItem:self
                       attribute:NSLayoutAttributeRight
                       relatedBy:NSLayoutRelationEqual
                          toItem:view
                       attribute:NSLayoutAttributeRight
                      multiplier:1
                        constant:0.0 - offset];
}

- (GW_VIEW *)GW_TopSpace:(CGFloat)topSpace {
    return [self GW_ConstraintWithItem:self.superview
                       attribute:NSLayoutAttributeTop
                        constant:topSpace];
}

- (GW_VIEW *)GW_TopSpace:(CGFloat)topSpace toView:(GW_VIEW *)toView {
    NSLayoutAttribute toAttribute = NSLayoutAttributeBottom;
    if (![self sameSuperviewWithView1:toView view2:self]) {
        toAttribute = NSLayoutAttributeTop;
    }
    return [self GW_ConstraintWithItem:self
                       attribute:NSLayoutAttributeTop
                       relatedBy:NSLayoutRelationEqual
                          toItem:toView
                       attribute:toAttribute
                      multiplier:1
                        constant:topSpace];
}

- (GW_VIEW *)GW_TopSpaceEqualView:(GW_VIEW *)view {
    return [self GW_TopSpaceEqualView:view offset:0];
}

- (GW_VIEW *)GW_TopSpaceEqualView:(GW_VIEW *)view offset:(CGFloat)offset {
    return [self GW_ConstraintWithItem:self
                       attribute:NSLayoutAttributeTop
                       relatedBy:NSLayoutRelationEqual
                          toItem:view
                       attribute:NSLayoutAttributeTop
                      multiplier:1
                        constant:offset];
}

- (GW_VIEW *)GW_BottomSpace:(CGFloat)bottomSpace {
    return [self GW_ConstraintWithItem:self.superview
                       attribute:NSLayoutAttributeBottom
                        constant:0.0 - bottomSpace];
}

- (GW_VIEW *)GW_BottomSpace:(CGFloat)bottomSpace toView:(GW_VIEW *)toView {
    NSLayoutAttribute toAttribute = NSLayoutAttributeTop;
    if (![self sameSuperviewWithView1:toView view2:self]) {
        toAttribute = NSLayoutAttributeBottom;
    }
    return [self GW_ConstraintWithItem:self
                       attribute:NSLayoutAttributeBottom
                       relatedBy:NSLayoutRelationEqual
                          toItem:toView
                       attribute:toAttribute
                      multiplier:1
                        constant:0.0 - bottomSpace];
}

- (GW_VIEW *)GW_BottomSpaceEqualView:(GW_VIEW *)view {
    return [self GW_BottomSpaceEqualView:view offset:0];
}

- (GW_VIEW *)GW_BottomSpaceEqualView:(GW_VIEW *)view offset:(CGFloat)offset {
    return [self GW_ConstraintWithItem:self
                       attribute:NSLayoutAttributeBottom
                       relatedBy:NSLayoutRelationEqual
                          toItem:view
                       attribute:NSLayoutAttributeBottom
                      multiplier:1
                        constant:0.0 - offset];
}

- (GW_VIEW *)GW_Width:(CGFloat)width{
    return [self GW_ConstraintWithItem:self
                       attribute:NSLayoutAttributeWidth
                       relatedBy:NSLayoutRelationEqual
                          toItem:nil
                       attribute:NSLayoutAttributeNotAnAttribute
                      multiplier:0
                        constant:width];
}

- (GW_VIEW *)GW_WidthEqualView:(GW_VIEW *)view {
    return [self GW_ConstraintWithItem:view
                       attribute:NSLayoutAttributeWidth
                        constant:0];
}

- (GW_VIEW *)GW_WidthEqualView:(GW_VIEW *)view ratio:(CGFloat)ratio {
    return [self GW_ConstraintWithItem:view
                       attribute:NSLayoutAttributeWidth
                        constant:0
                      multiplier:ratio];

}

- (GW_VIEW *)GW_AutoWidth {
#if TARGET_OS_IPHONE || TARGET_OS_TV
    if ([self isKindOfClass:[UILabel class]]) {
        UILabel * selfLabel = (UILabel *)self;
        if (selfLabel.numberOfLines == 0) {
            selfLabel.numberOfLines = 1;
        }
    }
#endif
    if ([self widthConstraint] != nil ||
        [self widthLessConstraint] != nil) {
        return self.GW_Width(0).GW_GreaterOrEqual();
    }
    return [self GW_ConstraintWithItem:self
                       attribute:NSLayoutAttributeWidth
                       relatedBy:NSLayoutRelationGreaterThanOrEqual
                          toItem:nil
                       attribute:NSLayoutAttributeNotAnAttribute
                      multiplier:1
                        constant:0];
}

- (GW_VIEW *)GW_WidthHeightRatio:(CGFloat)ratio {
    return [self GW_ConstraintWithItem:self
                       attribute:NSLayoutAttributeWidth
                       relatedBy:NSLayoutRelationEqual
                          toItem:self
                       attribute:NSLayoutAttributeHeight
                      multiplier:ratio
                        constant:0];
}

- (GW_VIEW *)GW_Height:(CGFloat)height{
    return [self GW_ConstraintWithItem:nil
                       attribute:NSLayoutAttributeHeight
                        constant:height];
}

- (GW_VIEW *)GW_HeightEqualView:(GW_VIEW *)view {
    return [self GW_ConstraintWithItem:view
                       attribute:NSLayoutAttributeHeight
                        constant:0];
}

- (GW_VIEW *)GW_HeightEqualView:(GW_VIEW *)view ratio:(CGFloat)ratio {
    return [self GW_ConstraintWithItem:view
                       attribute:NSLayoutAttributeHeight
                        constant:0
                      multiplier:ratio];
}

- (GW_VIEW *)GW_AutoHeight {
#if TARGET_OS_IPHONE || TARGET_OS_TV
    if ([self isKindOfClass:[UILabel class]]) {
        if (((UILabel *)self).numberOfLines != 0) {
            ((UILabel *)self).numberOfLines = 0;
        }
    }
#endif
    if ([self heightConstraint] != nil ||
        [self heightLessConstraint] != nil) {
        return self.GW_Height(0).GW_GreaterOrEqual();
    }
    return [self GW_ConstraintWithItem:self
                       attribute:NSLayoutAttributeHeight
                       relatedBy:NSLayoutRelationGreaterThanOrEqual
                          toItem:nil
                       attribute:NSLayoutAttributeNotAnAttribute
                      multiplier:1
                        constant:0];

}

- (GW_VIEW *)GW_HeightWidthRatio:(CGFloat)ratio {
    return [self GW_ConstraintWithItem:self
                       attribute:NSLayoutAttributeHeight
                       relatedBy:NSLayoutRelationEqual
                          toItem:self
                       attribute:NSLayoutAttributeWidth
                      multiplier:ratio
                        constant:0];
}

- (GW_VIEW *)GW_CenterX:(CGFloat)centerX {
    return [self GW_ConstraintWithItem:self.superview
                       attribute:NSLayoutAttributeCenterX
                        constant:centerX];
}

- (GW_VIEW *)GW_CenterX:(CGFloat)centerX toView:(GW_VIEW *)toView {
    return [self GW_ConstraintWithItem:toView
                       attribute:NSLayoutAttributeCenterX
                        constant:centerX];
}

- (GW_VIEW *)GW_CenterY:(CGFloat)centerY {
    return [self GW_ConstraintWithItem:self.superview
                       attribute:NSLayoutAttributeCenterY
                        constant:centerY];
}

- (GW_VIEW *)GW_CenterY:(CGFloat)centerY toView:(GW_VIEW *)toView {
    return [self GW_ConstraintWithItem:toView
                       attribute:NSLayoutAttributeCenterY
                        constant:centerY];
}




- (GW_VIEW *)GW_Center:(CGPoint)center {
    [self GW_CenterX:center.x];
    return [self GW_CenterY:center.y];
}

- (GW_VIEW *)GW_Center:(CGPoint)center toView:(GW_VIEW *)toView {
    [self GW_CenterX:center.x toView:toView];
    return [self GW_CenterY:center.y toView:toView];
}

- (GW_VIEW *)GW_Frame:(CGFloat)left top:(CGFloat)top width:(CGFloat)width height:(CGFloat)height {
    [self GW_LeftSpace:left];
    [self GW_TopSpace:top];
    [self GW_Width:width];
    return [self GW_Height:height];
}

- (GW_VIEW *)GW_Size:(CGSize)size {
    [self GW_Width:size.width];
    return [self GW_Height:size.height];
}

- (GW_VIEW *)GW_SizeEqualView:(GW_VIEW *)view {
    [self GW_WidthEqualView: view];
    return [self GW_HeightEqualView: view];
}

- (GW_VIEW *)GW_FrameEqualView:(GW_VIEW *)view {
    [self GW_LeftSpaceEqualView: view];
    [self GW_TopSpaceEqualView: view];
    return [self GW_SizeEqualView:view];
}

- (GW_VIEW *)GW_BoundsEqualView:(GW_VIEW *)view {
    [self GW_LeftSpace:0 toView:view];
    [self GW_TopSpace:0 toView:view];
    return [self GW_SizeEqualView:view];
}

- (GW_VIEW *)GW_Frame:(CGFloat)left top:(CGFloat)top width:(CGFloat)width height:(CGFloat)height toView:(GW_VIEW *)toView {
    [self GW_LeftSpace:left toView:toView];
    [self GW_TopSpace:top toView:toView];
    [self GW_Width:width];
    return [self GW_Height:height];
}

- (GW_VIEW *)GW_AutoSize:(CGFloat)left top:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom {
    [self GW_LeftSpace:left];
    [self GW_TopSpace:top];
    [self GW_RightSpace:right];
    return [self GW_BottomSpace:bottom];
}

- (GW_VIEW *)GW_AutoWidth:(CGFloat)left top:(CGFloat)top right:(CGFloat)right height:(CGFloat)height {
    [self GW_LeftSpace:left];
    [self GW_TopSpace:top];
    [self GW_RightSpace:right];
    return [self GW_Height:height];
}

- (GW_VIEW *)GW_AutoHeight:(CGFloat)left top:(CGFloat)top width:(CGFloat)width bottom:(CGFloat)bottom {
    [self GW_LeftSpace:left];
    [self GW_TopSpace:top];
    [self GW_Width:width];
    return [self GW_BottomSpace:bottom];
}

- (GW_VIEW *)GW_AutoSize:(CGFloat)left top:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom toView:(GW_VIEW *)toView {
    [self GW_LeftSpace:left toView:toView];
    [self GW_TopSpace:top toView:toView];
    [self GW_RightSpace:right toView:toView];
    return [self GW_BottomSpace:bottom toView:toView];
}

- (GW_VIEW *)GW_AutoWidth:(CGFloat)left top:(CGFloat)top right:(CGFloat)right height:(CGFloat)height toView:(GW_VIEW *)toView {
    [self GW_LeftSpace:left toView:toView];
    [self GW_TopSpace:top toView:toView];
    [self GW_RightSpace:right toView:toView];
    return [self GW_Height:height];
}

- (GW_VIEW *)GW_AutoHeight:(CGFloat)left top:(CGFloat)top width:(CGFloat)width bottom:(CGFloat)bottom toView:(GW_VIEW *)toView {
    [self GW_LeftSpace:left toView:toView];
    [self GW_TopSpace:top toView:toView];
    [self GW_Width:width];
    return [self GW_BottomSpace:bottom toView:toView];
}

- (GW_VIEW *)GW_ConstraintWithItem:(GW_VIEW *)item
                     attribute:(NSLayoutAttribute)attribute
                      constant:(CGFloat)constant {
    return [self GW_ConstraintWithItem:self
                       attribute:attribute
                          toItem:item
                       attribute:attribute
                        constant:constant];
}

- (GW_VIEW *)GW_ConstraintWithItem:(GW_VIEW *)item
                     attribute:(NSLayoutAttribute)attribute
                      constant:(CGFloat)constant
                    multiplier:(CGFloat)multiplier {
    return [self GW_ConstraintWithItem:self
                       attribute:attribute
                          toItem:item
                       attribute:attribute
                        constant:constant
                      multiplier:multiplier];
}

- (GW_VIEW *)GW_ConstraintWithItem:(GW_VIEW *)item
                     attribute:(NSLayoutAttribute)attribute
                        toItem:(GW_VIEW *)toItem
                     attribute:(NSLayoutAttribute)toAttribute
                      constant:(CGFloat)constant {
    return [self GW_ConstraintWithItem:item
                       attribute:attribute
                       relatedBy:NSLayoutRelationEqual
                          toItem:toItem
                       attribute:toAttribute
                      multiplier:1
                        constant:constant];
}

- (GW_VIEW *)GW_ConstraintWithItem:(GW_VIEW *)item
                     attribute:(NSLayoutAttribute)attribute
                        toItem:(GW_VIEW *)toItem
                     attribute:(NSLayoutAttribute)toAttribute
                      constant:(CGFloat)constant
                    multiplier:(CGFloat)multiplier {
    return [self GW_ConstraintWithItem:item
                       attribute:attribute
                       relatedBy:NSLayoutRelationEqual
                          toItem:toItem
                       attribute:toAttribute
                      multiplier:multiplier
                        constant:constant];
}

- (GW_VIEW *)GW_ConstraintWithItem:(GW_VIEW *)item
                     attribute:(NSLayoutAttribute)attribute
                     relatedBy:(NSLayoutRelation)related
                        toItem:(GW_VIEW *)toItem
                     attribute:(NSLayoutAttribute)toAttribute
                    multiplier:(CGFloat)multiplier
                      constant:(CGFloat)constant {
    
    GW_VIEW * superView = item.superview;
    if (toItem) {
        if (toItem.superview == nil) {
            superView = toItem;
        }else {
            GW_VIEW * sameSuperview = [self sameSuperviewWithView1:toItem view2:item];
            if (sameSuperview) {
                superView = sameSuperview;
            }else {
                superView = toItem;
            }
        }
    }else {
        superView = item;
        toAttribute = NSLayoutAttributeNotAnAttribute;
    }
    if (self.translatesAutoresizingMaskIntoConstraints) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    if (item && item.translatesAutoresizingMaskIntoConstraints) {
        item.translatesAutoresizingMaskIntoConstraints = NO;
    }
    switch (attribute) {
        case NSLayoutAttributeLastBaseline: {
            NSLayoutConstraint * bottom = [self bottomConstraint];
            if (bottom) {
                [superView removeConstraint:bottom];
                [self setBottomConstraint:nil];
            }
            bottom = [self bottomLessConstraint];
            if (bottom) {
                [superView removeConstraint:bottom];
                [self setBottomLessConstraint:nil];
            }
            bottom = [self bottomGreaterConstraint];
            if (bottom) {
                [superView removeConstraint:bottom];
                [self setBottomGreaterConstraint:nil];
            }
            NSLayoutConstraint * lastBaseline = [self lastBaselineConstraintRelation:related];
            if (lastBaseline) {
                if (lastBaseline.firstAttribute == attribute &&
                    lastBaseline.secondAttribute == toAttribute &&
                    lastBaseline.firstItem == item &&
                    lastBaseline.secondItem == toItem &&
                    lastBaseline.relation == related &&
                    lastBaseline.multiplier == multiplier) {
                    lastBaseline.constant = constant;
                    return self;
                }
                [superView removeConstraint:lastBaseline];
                [self setLastBaselineConstraint:nil relation:related];
            }
        }
            break;
#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
        case NSLayoutAttributeFirstBaseline: {
            NSLayoutConstraint * top = [self topConstraint];
            if (top) {
                [superView removeConstraint:top];
                [self setTopConstraint:nil];
            }
            top = [self topLessConstraint];
            if (top) {
                [superView removeConstraint:top];
                [self setTopLessConstraint:nil];
            }
            top = [self topGreaterConstraint];
            if (top) {
                [superView removeConstraint:top];
                [self setTopGreaterConstraint:nil];
            }
            NSLayoutConstraint * firstBaseline = [self firstBaselineConstraintRelation:related];
            if (firstBaseline) {
                if (firstBaseline.firstAttribute == attribute &&
                    firstBaseline.secondAttribute == toAttribute &&
                    firstBaseline.firstItem == item &&
                    firstBaseline.secondItem == toItem &&
                    firstBaseline.relation == related &&
                    firstBaseline.multiplier == multiplier) {
                    firstBaseline.constant = constant;
                    return self;
                }
                [superView removeConstraint:firstBaseline];
                [self setFirstBaselineConstraint:nil relation:related];
            }
        }
            break;
#endif
        case NSLayoutAttributeLeft: {
            NSLayoutConstraint * left = [self leftConstraintRelation:related];
            if (left) {
                if (left.firstAttribute == attribute &&
                    left.secondAttribute == toAttribute &&
                    left.firstItem == item &&
                    left.secondItem == toItem &&
                    left.relation == related &&
                    left.multiplier == multiplier) {
                    left.constant = constant;
                    return self;
                }
                [superView removeConstraint:left];
                [self setLeftConstraint:nil relation:related];
            }
        }
            break;
        case NSLayoutAttributeRight: {
            NSLayoutConstraint * right = [self rightConstraintRelation:related];
            if (right) {
                if (right.firstAttribute == attribute &&
                    right.secondAttribute == toAttribute &&
                    right.firstItem == item &&
                    right.secondItem == toItem &&
                    right.relation == related &&
                    right.multiplier == multiplier) {
                    right.constant = constant;
                    return self;
                }
                [superView removeConstraint:right];
                [self setRightConstraint:nil relation:related];
            }
        }
            break;
        case NSLayoutAttributeTop: {
            NSLayoutConstraint * firstBaseline = [self firstBaselineConstraint];
            if (firstBaseline) {
                [superView removeConstraint:firstBaseline];
                [self setFirstBaselineConstraint:nil];
            }
            firstBaseline = [self firstBaselineLessConstraint];
            if (firstBaseline) {
                [superView removeConstraint:firstBaseline];
                [self setFirstBaselineLessConstraint:nil];
            }
            firstBaseline = [self firstBaselineGreaterConstraint];
            if (firstBaseline) {
                [superView removeConstraint:firstBaseline];
                [self setFirstBaselineGreaterConstraint:nil];
            }
            NSLayoutConstraint * top = [self topConstraintRelation:related];
            if (top) {
                if (top.firstAttribute == attribute &&
                    top.secondAttribute == toAttribute &&
                    top.firstItem == item &&
                    top.secondItem == toItem &&
                    top.relation == related &&
                    top.multiplier == multiplier) {
                    top.constant = constant;
                    return self;
                }
                [superView removeConstraint:top];
                [self setTopConstraint:nil relation:related];
            }
        }
            break;
        case NSLayoutAttributeBottom: {
            NSLayoutConstraint * lastBaseline = [self lastBaselineConstraint];
            if (lastBaseline) {
                [superView removeConstraint:lastBaseline];
                [self setLastBaselineConstraint:nil];
            }
            lastBaseline = [self lastBaselineLessConstraint];
            if (lastBaseline) {
                [superView removeConstraint:lastBaseline];
                [self setLastBaselineLessConstraint:nil];
            }
            lastBaseline = [self lastBaselineGreaterConstraint];
            if (lastBaseline) {
                [superView removeConstraint:lastBaseline];
                [self setLastBaselineGreaterConstraint:nil];
            }

            NSLayoutConstraint * bottom = [self bottomConstraintRelation:related];
            if (bottom) {
                if (bottom.firstAttribute == attribute &&
                    bottom.secondAttribute == toAttribute &&
                    bottom.firstItem == item &&
                    bottom.secondItem == toItem &&
                    bottom.relation == related &&
                    bottom.multiplier == multiplier) {
                    bottom.constant = constant;
                    return self;
                }
                [superView removeConstraint:bottom];
                [self setBottomConstraint:nil relation:related];
            }
        }
            break;
        case NSLayoutAttributeWidth: {
            NSLayoutConstraint * width = [self widthConstraintRelation:related];
            if (width) {
                if (width.firstAttribute == attribute &&
                    width.secondAttribute == toAttribute &&
                    width.firstItem == item &&
                    width.secondItem == toItem &&
                    width.relation == related &&
                    width.multiplier == multiplier) {
                    width.constant = constant;
                    return self;
                }
                if (width.secondAttribute != NSLayoutAttributeNotAnAttribute) {
                    [superView removeConstraint:width];
                }else {
                    [self removeConstraint:width];
                }
                [self setWidthConstraint:nil relation:related];
            }
        }
            break;
        case NSLayoutAttributeHeight: {
            NSLayoutConstraint * height = [self heightConstraintRelation:related];
            if (height) {
                if (height.firstAttribute == attribute &&
                    height.secondAttribute == toAttribute &&
                    height.firstItem == item &&
                    height.secondItem == toItem &&
                    height.relation == related &&
                    height.multiplier == multiplier) {
                    height.constant = constant;
                    return self;
                }
                if (height.secondAttribute != NSLayoutAttributeNotAnAttribute) {
                    [superView removeConstraint:height];
                }else {
                    [self removeConstraint:height];
                }
                [self setHeightConstraint:nil relation:related];
            }
        }
            break;
        case NSLayoutAttributeCenterX: {
            NSLayoutConstraint * centerX = [self centerXConstraintRelation:related];
            if (centerX) {
                if (centerX.firstAttribute == attribute &&
                    centerX.secondAttribute == toAttribute &&
                    centerX.firstItem == item &&
                    centerX.secondItem == toItem &&
                    centerX.relation == related &&
                    centerX.multiplier == multiplier) {
                    centerX.constant = constant;
                    return self;
                }
                [superView removeConstraint:centerX];
                [self setCenterXConstraint:nil relation:related];
            }
        }
            break;
        case NSLayoutAttributeCenterY: {
            NSLayoutConstraint * centerY = [self centerYConstraintRelation:related];
            if (centerY) {
                if (centerY.firstAttribute == attribute &&
                    centerY.secondAttribute == toAttribute &&
                    centerY.firstItem == item &&
                    centerY.secondItem == toItem &&
                    centerY.relation == related &&
                    centerY.multiplier == multiplier) {
                    centerY.constant = constant;
                    return self;
                }
                [superView removeConstraint:centerY];
                [self setCenterYConstraint:nil relation:related];
            }
        }
            break;
        default:
            break;
    }
    
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:item
                                             attribute:attribute
                                             relatedBy:related
                                                toItem:toItem
                                             attribute:toAttribute
                                            multiplier:multiplier
                                              constant:constant];
    [self setCacheConstraint:constraint attribute:attribute relation:related];
    [superView addConstraint:constraint];
    [self setCurrentConstraint:constraint];
    return self;
}

- (GW_VIEW *)sameSuperviewWithView1:(GW_VIEW *)view1 view2:(GW_VIEW *)view2 {
    GW_VIEW * sameSuperview = nil;
    GW_VIEW * tempToItem = view1;
    GW_VIEW * tempItem = view2;
    
    //判断是否是父试图关系
    if (tempToItem && tempItem) {
        if (tempToItem.superview && tempToItem.superview == tempItem) {
            return sameSuperview;
        }
        if (tempItem.superview && tempItem.superview == tempToItem) {
            return sameSuperview;
        }
    }
    
    
    BOOL (^checkSameSuperview)(GW_VIEW *, GW_VIEW *) = ^(GW_VIEW * tmpSuperview, GW_VIEW * singleView) {
        GW_VIEW * tmpSingleView = singleView;
        if (tmpSingleView) {
            GW_VIEW * tempSingleSuperview = tmpSingleView.superview;
            while (tempSingleSuperview) {
                if (tmpSuperview == tempSingleSuperview) {
                    return YES;
                }else {
                    tempSingleSuperview = tempSingleSuperview.superview;
                }
            }
        }
        return NO;
    };
    
    if (tempToItem && tempItem) {
        GW_VIEW * toItemSuperview = tempToItem.superview;
        GW_VIEW * itemSuperview = tempItem.superview;
        while (toItemSuperview && itemSuperview) {
//            判断两个视图的父试图是否相等
            if (toItemSuperview == itemSuperview) {
                sameSuperview = toItemSuperview;
                break;
            }else {
                tempToItem = toItemSuperview;
                tempItem = itemSuperview;
                if (!tempToItem.superview && tempItem.superview) {
                    if (checkSameSuperview(tempToItem, tempItem)) {
                        sameSuperview = tempToItem;
                        break;
                    }
                }else if (tempToItem.superview && !tempItem.superview) {
                    if (checkSameSuperview(tempItem, tempToItem)) {
                        sameSuperview = tempItem;
                        break;
                    }
                }else {
                    toItemSuperview = toItemSuperview.superview;
                    itemSuperview = itemSuperview.superview;
                }
            }
        }
    }
    return sameSuperview;
}

- (void)setCacheConstraint:(NSLayoutConstraint *)constraint attribute:(NSLayoutAttribute) attribute relation:(NSLayoutRelation)relation {
    switch (attribute) {
#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 80000) || (__TV_OS_VERSION_MIN_REQUIRED >= 9000) || (__MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
        case NSLayoutAttributeFirstBaseline:
            [self setFirstBaselineConstraint:constraint relation:relation];
            break;
#endif
        case NSLayoutAttributeLastBaseline:
            [self setLastBaselineConstraint:constraint relation:relation];
            break;
        case NSLayoutAttributeCenterY:
            [self setCenterYConstraint:constraint relation:relation];
            break;
        case NSLayoutAttributeCenterX:
            [self setCenterXConstraint:constraint relation:relation];
            break;
        case NSLayoutAttributeBottom:
            [self setBottomConstraint:constraint relation:relation];
            break;
        case NSLayoutAttributeTop:
            [self setTopConstraint:constraint relation:relation];
            break;
        case NSLayoutAttributeRight:
            [self setRightConstraint:constraint relation:relation];
            break;
        case NSLayoutAttributeLeft:
            [self setLeftConstraint:constraint relation:relation];
            break;
        case NSLayoutAttributeWidth:
            [self setWidthConstraint:constraint relation:relation];
            break;
        case NSLayoutAttributeHeight:
            [self setHeightConstraint:constraint relation:relation];
            break;
        default:
            break;
    }
}

#if TARGET_OS_IPHONE || TARGET_OS_TV

#pragma mark - Xib智能布局模块

- (void)GW_AutoXibLayout {
#if kDeprecatedVerticalAdapter
    [self GW_AutoXibLayoutType:DefaultType];
#else
    [self GW_AutoXibHorizontalLayout];
#endif
}

- (void)GW_AutoXibLayoutType:(GW_LayoutTypeOptions)type {
#if kDeprecatedVerticalAdapter
    [self GW_RunLayoutEngineWithOrientation:All layoutType:type nibType:XIB];
#else
    [self GW_RunLayoutEngineWithOrientation:Horizontal layoutType:type nibType:XIB];
#endif
    
}

- (void)GW_AutoXibHorizontalLayout {
    [self GW_AutoXibHorizontalLayoutType:DefaultType];
}

- (void)GW_AutoXibHorizontalLayoutType:(GW_LayoutTypeOptions)type {
    [self GW_RunLayoutEngineWithOrientation:Horizontal layoutType:type nibType:XIB];
}

- (void)GW_AutoSBLayout {
#if kDeprecatedVerticalAdapter
    [self GW_AutoSBLayoutType:DefaultType];
#else
    [self GW_AutoSBHorizontalLayout];
#endif
}

- (void)GW_AutoSBLayoutType:(GW_LayoutTypeOptions)type {
    CGRect initRect = self.bounds;
    self.bounds = CGRectMake(0, 0, 375, 667);
#if kDeprecatedVerticalAdapter
    [self GW_RunLayoutEngineWithOrientation:All layoutType:type nibType:SB];
#else
    [self GW_RunLayoutEngineWithOrientation:Horizontal layoutType:type nibType:SB];
#endif
    
    self.bounds = initRect;
}

- (void)GW_AutoSBHorizontalLayout {
    [self GW_AutoSBHorizontalLayoutType:DefaultType];
}

- (void)GW_AutoSBHorizontalLayoutType:(GW_LayoutTypeOptions)type {
    CGRect initRect = self.bounds;
    self.bounds = CGRectMake(0, 0, 375, 667);
    [self GW_RunLayoutEngineWithOrientation:Horizontal layoutType:type nibType:SB];
    self.bounds = initRect;
}

- (void)GW_RunLayoutEngineWithOrientation:(GW_LayoutOrientationOptions)orientation
                                layoutType:(GW_LayoutTypeOptions)layoutType
                                   nibType:(GWNibType)nibType {
    NSMutableArray  * subViewArray = [NSMutableArray array];
    if (nibType == SB) {
        for (NSObject * view in self.subviews) {
            if (![NSStringFromClass(view.class) isEqualToString:@"_UILayoutGuide"]) {
                [subViewArray addObject:view];
            }
        }
    }else {
        [subViewArray addObjectsFromArray:self.subviews];
    }
    NSMutableArray  * rowViewArray = [NSMutableArray array];
    for (NSInteger i = 0; i < subViewArray.count; i++) {
        GW_VIEW * subView = subViewArray[i];
        if(rowViewArray.count == 0) {
            NSMutableArray * subRowViewArray = [NSMutableArray array];
            [subRowViewArray addObject:subView];
            [rowViewArray addObject:subRowViewArray];
        }else{
            BOOL isAddSubView = NO;
            for (NSInteger j = 0; j < rowViewArray.count; j++) {
                NSMutableArray  * subRowViewArray = rowViewArray[j];
                BOOL  isAtRow = YES;
                for (NSInteger w = 0; w < subRowViewArray.count; w++) {
                    GW_VIEW * rowSubView = subRowViewArray[w];
                    if(CGRectGetMinY(subView.frame) > rowSubView.center.y ||
                       CGRectGetMaxY(subView.frame) < rowSubView.center.y){
                        isAtRow = NO;
                        break;
                    }
                }
                if(isAtRow) {
                    isAddSubView = YES;
                    [subRowViewArray addObject:subView];
                    break;
                }
            }
            if(!isAddSubView) {
                NSMutableArray * subRowViewArr = [NSMutableArray array];
                [subRowViewArr addObject:subView];
                [rowViewArray addObject:subRowViewArr];
            }
        }
    }
    
    NSInteger rowCount = rowViewArray.count;
    for(NSInteger row = 0; row < rowCount; row++){
        NSMutableArray  * subRowViewArray = rowViewArray[row];
        NSInteger columnCount = subRowViewArray.count;
        for (NSInteger column = 0; column < columnCount; column++) {
            for (NSInteger j = column + 1; j < columnCount; j++) {
                GW_VIEW  * view1 = subRowViewArray[column];
                GW_VIEW  * view2 = subRowViewArray[j];
                if(view1.center.x > view2.center.x){
                    [subRowViewArray exchangeObjectAtIndex:column withObjectAtIndex:j];
                }
            }
        }
    }

    GW_VIEW * frontRowView = nil;
    GW_VIEW * nextRowView = nil;
    
    for (NSInteger row = 0; row < rowCount; row++) {
        NSArray * subRowViewArray = rowViewArray[row];
        NSInteger columnCount = subRowViewArray.count;
        for (NSInteger column = 0; column < columnCount; column++) {
            GW_VIEW * view = subRowViewArray[column];
            CGFloat superWidthHalf = CGRectGetWidth(view.superview.frame) / 2;
            GW_VIEW * nextColumnView = nil;
            GW_VIEW * frontColumnView = nil;
            frontRowView = nil;
            nextRowView = nil;
            BOOL canFitWidthOrHeight = [self canFitWidthOrHeightWithView:view];
            if (row < rowCount - 1) {
                nextRowView = [self getNextRowView:rowViewArray[row + 1] currentView:view];
            }
            if (column < columnCount - 1) {
                nextColumnView = subRowViewArray[column + 1];
            }
            if (row == 0) {
                [view GW_TopSpace:CGRectGetMinY(view.frame)];
            }else {
                frontRowView = [self getFrontRowView:rowViewArray[row - 1] currentView:view];
                [view GW_TopSpace:CGRectGetMinY(view.frame) - CGRectGetMaxY(frontRowView.frame)
                      toView:frontRowView];
            }
            if (column == 0) {
                if (!canFitWidthOrHeight && layoutType == LeftRightType) {
                    if (view.center.x == superWidthHalf) {
                        [view GW_CenterX:0];
                    } else if (view.center.x > superWidthHalf) {
                        if (nextColumnView) {
                            [view GW_RightSpace:CGRectGetMinX(nextColumnView.frame) - CGRectGetMaxX(view.frame) toView:nextColumnView];
                        }else {
                            [view GW_RightSpace:CGRectGetWidth(view.superview.frame) - CGRectGetMaxX(view.frame)];
                        }
                    }
                }else {
                    [view GW_LeftSpace:CGRectGetMinX(view.frame)];
                }
            }else {
                frontColumnView = subRowViewArray[column - 1];
                if (!canFitWidthOrHeight && layoutType == LeftRightType) {
                    if (view.center.x == superWidthHalf) {
                        [view GW_CenterX:0];
                    }else if (view.center.x > superWidthHalf) {
                        if (nextColumnView) {
                            [view GW_RightSpace:CGRectGetMinX(nextColumnView.frame) - CGRectGetMaxX(view.frame) toView:nextColumnView];
                        }else {
                            [view GW_RightSpace:CGRectGetWidth(view.superview.frame) - CGRectGetMaxX(view.frame)];
                        }
                    }
                }else {
                    [view GW_LeftSpace:CGRectGetMinX(view.frame) - CGRectGetMaxX(frontColumnView.frame)
                           toView:frontColumnView];
                }
            }
            if (orientation == All ||
                orientation == Vertical) {
                if (canFitWidthOrHeight) {
                    if (nextRowView) {
                        [view GW_HeightEqualView:nextRowView
                                            ratio:CGRectGetHeight(view.frame) / CGRectGetHeight(nextRowView.frame)];
                    }else {
                        [view GW_BottomSpace:CGRectGetHeight(view.superview.frame) - CGRectGetMaxY(view.frame)];
                    }
                }else {
                    [view GW_Height:CGRectGetHeight(view.frame)];
                }
                goto GW_FIT_WIDTH;
            }else {
            GW_FIT_WIDTH:
                if (canFitWidthOrHeight) {
                    [view GW_RightSpace:CGRectGetWidth(view.superview.frame) - CGRectGetMaxX(view.frame)];
                }else {
                    [view GW_Width:CGRectGetWidth(view.frame)];
                }
                [view GW_Height:CGRectGetHeight(view.frame)];
            }
            if ([view isKindOfClass:[UITableViewCell class]] ||
                (view.subviews.count > 0 && ([NSStringFromClass(view.class) isEqualToString:@"GW_VIEW"] ||
                                             [NSStringFromClass(view.class) isEqualToString:@"UIScrollView"])) ||
                [NSStringFromClass(view.class) isEqualToString:@"UITableViewCellContentView"]) {
                [view GW_RunLayoutEngineWithOrientation:orientation layoutType:layoutType nibType:nibType];
            }
        }
    }
}

- (BOOL)canFitWidthOrHeightWithView:(GW_VIEW *) view {
    if ([view isKindOfClass:[UIImageView class]] ||
        (([view isKindOfClass:[UIButton class]] &&
          (((UIButton *)view).layer.cornerRadius == CGRectGetWidth(view.frame) / 2 ||
           ((UIButton *)view).layer.cornerRadius == CGRectGetHeight(view.frame) / 2 ||
           CGRectGetWidth(view.frame) == CGRectGetHeight(view.frame) ||
           [((UIButton *)view) backgroundImageForState:UIControlStateNormal])))) {
              return NO;
          }
    return YES;
}


- (GW_VIEW *)getFrontRowView:(NSArray *)rowViewArray
                currentView:(GW_VIEW *)currentView {
    if (currentView) {
        NSInteger columnCount = rowViewArray.count;
        NSInteger currentViewY = CGRectGetMinY(currentView.frame);
        for (NSInteger row = 0; row < columnCount; row++) {
            GW_VIEW * view = rowViewArray[row];
            if (CGRectContainsPoint(currentView.frame, CGPointMake(CGRectGetMinX(view.frame), currentViewY)) ||
                CGRectContainsPoint(currentView.frame, CGPointMake(view.center.x, currentViewY)) ||
                CGRectContainsPoint(currentView.frame, CGPointMake(CGRectGetMaxX(view.frame), currentViewY))) {
                return view;
            }
        }
    }else {
        return nil;
    }
    return rowViewArray[0];
}

- (GW_VIEW *)getNextRowView:(NSArray *)rowViewArray
               currentView:(GW_VIEW *)currentView {
    return [self getFrontRowView:rowViewArray currentView:currentView];
}


#pragma mark - 自动加边线模块 -

static const int kLeft_Line_Tag = 100000;
static const int kRight_Line_Tag = kLeft_Line_Tag + 1;
static const int kTop_Line_Tag = kRight_Line_Tag + 1;
static const int kBottom_Line_Tag = kTop_Line_Tag + 1;

- (GW_Line *)createLineWithTag:(int)lineTag {
    GW_Line * line = nil;
    for (GW_VIEW * view in self.subviews) {
        if ([view isKindOfClass:[GW_Line class]] &&
            view.tag == lineTag) {
            line = (GW_Line *)view;
            break;
        }
    }
    if (line == nil) {
        line = [GW_Line new];
        line.tag = lineTag;
        [self addSubview:line];
    }
    return line;
}

- (GW_VIEW *)GW_AddBottomLine:(CGFloat)value lineColor:(UIColor *)color {
    return [self GW_AddBottomLine:value lineColor:color pading:0];
}

- (GW_VIEW *)GW_AddBottomLine:(CGFloat)value lineColor:(UIColor *)color pading:(CGFloat)pading {
    GW_Line * line = [self createLineWithTag:kBottom_Line_Tag];
    line.backgroundColor = color;
    [line GW_RightSpace:pading];
    [line GW_LeftSpace:pading];
    [line GW_Height:value];
    [line GW_BottomSpace:0];
    return line;
}

- (GW_VIEW *)GW_AddTopLine:(CGFloat)value lineColor:(UIColor *)color {
    return [self GW_AddTopLine:value lineColor:color pading:0];
}

- (GW_VIEW *)GW_AddTopLine:(CGFloat)value lineColor:(UIColor *)color pading:(CGFloat)pading {
    GW_Line * line = [self createLineWithTag:kTop_Line_Tag];
    line.backgroundColor = color;
    [line GW_RightSpace:pading];
    [line GW_LeftSpace:pading];
    [line GW_Height:value];
    [line GW_TopSpace:0];
    return line;
}

- (GW_VIEW *)GW_AddLeftLine:(CGFloat)value lineColor:(UIColor *)color padding:(CGFloat)padding
{
    GW_Line * line = [self createLineWithTag:kLeft_Line_Tag];
    line.backgroundColor = color;
    [line GW_Width:value];
    [line GW_LeftSpace:0];
    [line GW_TopSpace:padding];
    [line GW_BottomSpace:padding];
    return line;
}

- (GW_VIEW *)GW_AddLeftLine:(CGFloat)value lineColor:(UIColor *)color {
    GW_Line * line = [self createLineWithTag:kLeft_Line_Tag];
    line.backgroundColor = color;
    [line GW_Width:value];
    [line GW_LeftSpace:0];
    [line GW_TopSpace:0];
    [line GW_BottomSpace:0];
    return line;
}

- (GW_VIEW *)GW_AddRightLine:(CGFloat)value lineColor:(UIColor *)color {
    GW_Line * line = [self createLineWithTag:kRight_Line_Tag];
    line.backgroundColor = color;
    [line GW_Width:value];
    [line GW_RightSpace:0];
    [line GW_TopSpace:0];
    [line GW_BottomSpace:0];
    return line;
}

- (GW_VIEW *)GW_AddRightLine:(CGFloat)value lineColor:(UIColor *)color padding:(CGFloat)padding
{
    GW_Line * line = [self createLineWithTag:kRight_Line_Tag];
    line.backgroundColor = color;
    [line GW_Width:value];
    [line GW_RightSpace:0];
    [line GW_TopSpace:padding];
    [line GW_BottomSpace:padding];
    return line;
}
#endif
@end


#pragma mark - frame
@implementation UIView (GWFrame)

- (CGFloat)left_GW {
    return self.frame.origin.x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setLeft_GW:(CGFloat)x_GW {
    CGRect frame = self.frame;
    frame.origin.x = x_GW;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)top_GW {
    return self.frame.origin.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTop_GW:(CGFloat)y_GW {
    CGRect frame = self.frame;
    frame.origin.y = y_GW;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)right_GW {
    return self.frame.origin.x + self.frame.size.width;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setRight_GW:(CGFloat)right_GW {
    CGRect frame = self.frame;
    frame.origin.x = right_GW - frame.size.width;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)bottom_GW {
    return self.frame.origin.y + self.frame.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setBottom_GW:(CGFloat)bottom_GW {
    CGRect frame = self.frame;
    frame.origin.y = bottom_GW - frame.size.height;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)centerX_GW {
    return self.center.x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setCenterX_GW:(CGFloat)centerX_GW {
    self.center = CGPointMake(centerX_GW, self.center.y);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)centerY_GW {
    return self.center.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setCenterY_GW:(CGFloat)centerY_GW {
    self.center = CGPointMake(self.center.x, centerY_GW);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)width_GW {
    return self.frame.size.width;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setWidth_GW:(CGFloat)width_GW {
    CGRect frame = self.frame;
    frame.size.width = width_GW;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)height_GW {
    return self.frame.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setHeight_GW:(CGFloat)height_GW {
    CGRect frame = self.frame;
    frame.size.height = height_GW;
    self.frame = frame;
}

- (void)setMaxX_GW:(CGFloat)maxX_GW {
    self.width_GW = maxX_GW - self.left_GW;
}

- (CGFloat)maxX_GW {
    return CGRectGetMaxX(self.frame);
}

- (void)setMaxY_GW:(CGFloat)maxY_GW {
    self.height_GW = maxY_GW - self.top_GW;
}

- (CGFloat)maxY_GW {
    return CGRectGetMaxY(self.frame);
}

- (void)setMidX_GW:(CGFloat)midX_GW {
    self.width_GW = midX_GW * 2;
}

- (CGFloat)midX_GW {
    return CGRectGetMinX(self.frame) + CGRectGetWidth(self.frame) / 2;
}

- (void)setMidY_GW:(CGFloat)midY_GW {
    self.height_GW = midY_GW * 2;
}

- (CGFloat)midY_GW {
    return CGRectGetMinY(self.frame) + CGRectGetHeight(self.frame) / 2;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGPoint)origin_GW {
    return self.frame.origin;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setOrigin_GW:(CGPoint)origin_GW {
    CGRect frame = self.frame;
    frame.origin = origin_GW;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)size_GW {
    return self.frame.size;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setSize_GW:(CGSize)size_GW {
    CGRect frame = self.frame;
    frame.size = size_GW;
    self.frame = frame;
}


- (UIViewController *)viewController_GW{
    for (UIView* next = self; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

@end



@implementation UIView(GWView)
+ (void)load{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gw_applicationDidFinishLaunching) name:UIApplicationDidFinishLaunchingNotification object:nil];
}

+ (void)gw_applicationDidFinishLaunching{
    CGFloat navHeight = [UINavigationController new].navigationBar.bounds.size.height>0?:44;
    CGFloat statusHeight = [UIApplication sharedApplication].statusBarFrame.size.height>0?:(IS_HAS_SafeArea_GW ? 44 : 20);
    CGFloat tabHeight = [UITabBarController new].tabBar.bounds.size.height>0?:49;
    [[NSUserDefaults standardUserDefaults] setDouble:navHeight forKey:GW_NAV_BAR_HEIGHT];
    [[NSUserDefaults standardUserDefaults] setDouble:statusHeight forKey:GW_STATUS_HEIGHT];
    [[NSUserDefaults standardUserDefaults] setDouble:navHeight+statusHeight forKey:GW_NAV_HEIGHT];
    [[NSUserDefaults standardUserDefaults] setDouble:tabHeight forKey:GW_TAB_BAR_HEIGHT];
    [[NSUserDefaults standardUserDefaults] setDouble:IS_HAS_SafeArea_GW?tabHeight + HomeIndicatorHeight_GW:tabHeight forKey:GW_TAB_HEIGHT];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidFinishLaunchingNotification object:nil];

}

#pragma mark - view - Present
static char PresentedViewAddress;   //被Present的View
static char PresentingViewAddress;  //正在Present其他视图的view
#define AnimateDuartion .25f
- (void)presentView:(UIView*)view animated:(BOOL)animated complete:(void(^)(void)) complete{
    if (!self.window) {
        return;
    }
    [self.window addSubview:view];
    objc_setAssociatedObject(self, &PresentedViewAddress, view, OBJC_ASSOCIATION_RETAIN);
    objc_setAssociatedObject(view, &PresentingViewAddress, self, OBJC_ASSOCIATION_RETAIN);
    if (animated) {
        [self doAlertAnimate:view complete:complete];
    }else{
        view.center = self.window.center;
    }
}

- (UIView *)presentedView{
    UIView * view =  objc_getAssociatedObject(self, &PresentedViewAddress);
    return view;
}

- (void)dismissPresentedView:(BOOL)animated complete:(void(^)(void)) complete{
    UIView * view =  objc_getAssociatedObject(self, &PresentedViewAddress);
    if (animated) {
        [self doHideAnimate:view complete:complete];
    }else{
        [view removeFromSuperview];
        [self cleanAssocaiteObject];
    }
}

- (void)hideSelf:(BOOL)animated complete:(void(^)(void)) complete{
    UIView * baseView =  objc_getAssociatedObject(self, &PresentingViewAddress);
    if (!baseView) {
        return;
    }
    [baseView dismissPresentedView:animated complete:complete];
    [self cleanAssocaiteObject];
}


- (void)onPressBkg:(id)sender{
    [self dismissPresentedView:YES complete:nil];
}

#pragma mark - Animation
- (void)doAlertAnimate:(UIView*)view complete:(void(^)(void)) complete{
    CGRect bounds = view.bounds;
    // 放大
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    scaleAnimation.duration  = AnimateDuartion;
    scaleAnimation.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 1, 1)];
    scaleAnimation.toValue   = [NSValue valueWithCGRect:bounds];
    
    // 移动
    CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnimation.duration   = AnimateDuartion;
    moveAnimation.fromValue  = [NSValue valueWithCGPoint:[self.superview convertPoint:self.center toView:nil]];
    moveAnimation.toValue    = [NSValue valueWithCGPoint:self.window.center];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.beginTime                = CACurrentMediaTime();
    group.duration                = AnimateDuartion;
    group.animations            = [NSArray arrayWithObjects:scaleAnimation,moveAnimation,nil];
    group.timingFunction        = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    group.delegate                = self;
    group.fillMode                = kCAFillModeForwards;
    group.removedOnCompletion    = NO;
    group.autoreverses            = NO;
    
    [self hideAllSubView:view];
    
    [view.layer addAnimation:group forKey:@"groupAnimationAlert"];
    
    __weak UIView * wself = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(AnimateDuartion * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        view.layer.bounds    = bounds;
        view.layer.position  = wself.superview.center;
        [wself showAllSubView:view];
        if (complete) {
            complete();
        }
    });
    
}

- (void)doHideAnimate:(UIView*)alertView complete:(void(^)(void)) complete{
    if (!alertView) {
        return;
    }
    // 缩小
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    scaleAnimation.duration = AnimateDuartion;
    scaleAnimation.toValue  = [NSValue valueWithCGRect:CGRectMake(0, 0, 1, 1)];
    
    CGPoint position   = self.center;
    // 移动
    CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnimation.duration = AnimateDuartion;
    moveAnimation.toValue  = [NSValue valueWithCGPoint:[self.superview convertPoint:self.center toView:nil]];
    
    CAAnimationGroup *group   = [CAAnimationGroup animation];
    group.beginTime           = CACurrentMediaTime();
    group.duration            = AnimateDuartion;
    group.animations          = [NSArray arrayWithObjects:scaleAnimation,moveAnimation,nil];
    group.timingFunction      = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    group.delegate            = self;
    group.fillMode            = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    group.autoreverses        = NO;
    
    
    alertView.layer.bounds    = self.bounds;
    alertView.layer.position  = position;
    alertView.layer.needsDisplayOnBoundsChange = YES;
    
    [self hideAllSubView:alertView];
    alertView.backgroundColor = [UIColor clearColor];
    
    [alertView.layer addAnimation:group forKey:@"groupAnimationHide"];
    
    __weak UIView * wself = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(AnimateDuartion * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [alertView removeFromSuperview];
        [wself cleanAssocaiteObject];
        [wself showAllSubView:alertView];
        if (complete) {
            complete();
        }
    });
}


static char *HideViewsAddress = "hideViewsAddress";
- (void)hideAllSubView:(UIView*)view{
    for (UIView * subView in view.subviews) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        if (subView.hidden) {
            [array addObject:subView];
        }
        objc_setAssociatedObject(self, &HideViewsAddress, array, OBJC_ASSOCIATION_RETAIN);
        subView.hidden = YES;
    }
}

- (void)showAllSubView:(UIView*)view{
    NSMutableArray *array = objc_getAssociatedObject(self,&HideViewsAddress);
    for (UIView * subView in view.subviews) {
        subView.hidden = [array containsObject:subView];
    }
}

- (void)cleanAssocaiteObject{
    objc_setAssociatedObject(self,&PresentedViewAddress,nil,OBJC_ASSOCIATION_RETAIN);
    objc_setAssociatedObject(self,&PresentingViewAddress,nil,OBJC_ASSOCIATION_RETAIN);
    objc_setAssociatedObject(self,&HideViewsAddress,nil, OBJC_ASSOCIATION_RETAIN);
}

@end
