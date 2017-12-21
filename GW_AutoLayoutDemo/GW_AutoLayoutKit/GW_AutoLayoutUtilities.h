//
//  GW_AutoLayoutUtilities.h
//  GW_AutoLayoutKit
//
//  Created by GW on 17/4/12.
//  Copyright © 2017年 GW. All rights reserved.
//

#import <Foundation/Foundation.h>
#if TARGET_OS_IPHONE || TARGET_OS_TV

#define GW_VIEW UIView
#define GW_LayoutPriority UILayoutPriority
#define GW_COLOR UIColor
#import <UIKit/UIKit.h>

#elif TARGET_OS_MAC

#define GW_VIEW NSView
#define GW_LayoutPriority NSLayoutPriority
#define GW_COLOR NSColor
#import <AppKit/AppKit.h>

#endif
