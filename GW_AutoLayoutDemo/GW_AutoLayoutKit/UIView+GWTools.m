//
//  UIView+GWTools.m
//  Pocket
//
//  Created by gw on 2020/9/1.
//  Copyright © 2020 tiens. All rights reserved.
//

#import "UIView+GWTools.h"

@implementation UIView (GWTools)

@end

typedef enum : NSUInteger {
    GWLayerTypeMask   = 1,
    GWLayerTypeBorder,
} GWLayerType;

#pragma mark - layer - 圆角
@implementation UIView (GWLayer)

- (void)GWLayerOnlyRect:(CGRect)frame
                    layerName:(NSString * _Nullable)name{
    UIBezierPath * path= [UIBezierPath bezierPathWithRect:self.bounds];
    CAShapeLayer *mask=nil;
    if ([self.layer.mask.name isEqualToString:name]) {
        mask = self.layer.mask;
    } else {
        mask=[CAShapeLayer layer];
        mask.name = name;
    }
    mask.path=path.CGPath;
    mask.frame=frame;
    self.layer.mask = mask;
}

- (void)GWLayerOnluRoundedCorners:(UIRectCorner)rectCorner
                 cornerRadius:(CGFloat)radius
                        frame:(CGRect)frame
                    layerName:(NSString * _Nullable)name{
    [self GWLayerRoundedCorners:rectCorner cornerRadius:radius frame:frame borderWidth:0 borderColor:nil fillColor:nil layerName:name];
}

- (void)GWLayerRoundedCorners:(UIRectCorner)rectCorner
                 cornerRadius:(CGFloat)radius
                        frame:(CGRect)frame
                  borderWidth:(CGFloat)borderWidth
                  borderColor:( UIColor * _Nullable )borderColor
                    fillColor:(UIColor * _Nullable)fillColor
                    layerName:(NSString * _Nullable)name
{
    
    //设置遮罩
        CAShapeLayer *mask=nil;
        if ([self.layer.mask.name isEqualToString:name]) {
            mask = self.layer.mask;
        } else {
            mask=[CAShapeLayer layer];
            mask.name = name;
        }
        UIBezierPath * path= [UIBezierPath bezierPathWithRoundedRect:frame byRoundingCorners:rectCorner cornerRadii:CGSizeMake(radius,radius)];
        mask.path=path.CGPath;
        mask.frame=frame;
        self.layer.mask = mask;
    
    //设置边框及填充色
//        __block CAShapeLayer *borderLayer = nil;
//        if (name.length) {
//            NSArray<CALayer *> *subLayers = self.layer.sublayers;
//            [subLayers enumerateObjectsUsingBlock:^(CALayer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//                if([obj.name isEqualToString:name]){
//                    borderLayer = (CAShapeLayer *)obj;
//                    *stop = YES;
//                }
//            }];
//        }
//
//        if (!borderLayer) {
//            borderLayer=[CAShapeLayer layer];
//            borderLayer.name = name;
//            [self.layer addSublayer:borderLayer];
//        }
//
//        borderLayer.path=path.CGPath;
//        if (fillColor) {
//            borderLayer.fillColor = fillColor.CGColor;
//        }
//        if (borderColor) {
//            borderLayer.strokeColor = borderColor.CGColor;
//        }
//
//        if (borderWidth > 0) {
//            borderLayer.lineWidth = borderWidth;
//        }
//        self.backgroundColor = UIColor.clearColor;
//        borderLayer.frame = frame;
}

- (void)GWLayerRoundedCorners:(UIRectCorner)rectCorner
               cornerRadius:(CGFloat)radius
                borderWidth:(CGFloat)borderWidth
                borderColor:( UIColor * _Nullable )borderColor
                  fillColor:(UIColor * _Nullable)fillColor
                  layerName:(NSString * _Nullable)name{
    [self GWLayerRoundedCorners:rectCorner cornerRadius:radius frame:self.bounds borderWidth:borderWidth borderColor:borderColor fillColor:fillColor layerName:name];
}

- (void)GWLayerRemove:(NSString *)name{
    __block CAShapeLayer *borderLayer = nil;
    if (name.length) {
        NSArray<CALayer *> *subLayers = self.layer.sublayers;
        [subLayers enumerateObjectsUsingBlock:^(CALayer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if([obj.name isEqualToString:name]){
                borderLayer = (CAShapeLayer *)obj;
                [borderLayer removeFromSuperlayer];
                *stop = YES;
            }
        }];
    }
}

@end

@implementation UIView(Present)
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
static char PresentingViewAddress;  //self
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
