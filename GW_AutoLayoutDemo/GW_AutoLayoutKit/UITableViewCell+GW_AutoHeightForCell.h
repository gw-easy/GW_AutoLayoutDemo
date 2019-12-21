//
//  UITableViewCell+gw_AutoHeightForCell.h
//  GWDemo
//
//  Created by gw on 2017/6/30.
//  Copyright © 2017年 gw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GW_AutoLayout.h"
#import "GW_AutoLayoutUtilities.h"



////////////////////////////列表视图//////////////////////////////
#if TARGET_OS_IPHONE || TARGET_OS_TV
@interface UITableViewCell (GW_AutoHeightForCell)
/// cell最底部视图
@property (nonatomic , strong) UIView * gw_CellBottomView;
/// cell最底部视图集合
@property (nonatomic , strong) NSArray * gw_CellBottomViews;
/// cell最底部视图与cell底部的间隙
@property (nonatomic , assign) CGFloat  gw_CellBottomOffset;
/// 指定tableview宽度（有助于提高自动计算效率-宽度必须准确，否则不能正确计算高度）
@property (nonatomic , assign) CGFloat gw_TableViewWidth;


#pragma mark - 由于注册制计算高度不准确,所以本方案只支持手动复用机制

#pragma mark - 特别注意UITableViewCell的子视图，如果布局中使用了GW_HeightAuto()，请不要设置GW_BottomSpace底部约束，容易导致高度计算不准，可以使用gw_CellBottomOffset设置距离底部的距离。

#pragma mark - 手动复用机制 - (nullable __kindof UITableViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier;




/**
 自动计算cell高度: 重用cell -2

 @param indexPath cell indexPath
 @param tableView tableView
 @return cell高度
 */
+ (CGFloat)gw_CellHeightForIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView;


@end

@interface UITableView (GW_CacheCellHeight)

@property (strong, nonatomic)NSMutableDictionary *gw_CacheHeightDictionary;

@property (strong ,nonatomic) NSNumber *gw_CacheHeight;
@end
#endif

