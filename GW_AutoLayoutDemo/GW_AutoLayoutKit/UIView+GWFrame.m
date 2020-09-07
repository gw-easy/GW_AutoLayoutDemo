//
//  UIView+GWFrame.m
//  Pocket
//
//  Created by gw on 2020/9/1.
//  Copyright © 2020 tiens. All rights reserved.
//

#import "UIView+GWFrame.h"

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

