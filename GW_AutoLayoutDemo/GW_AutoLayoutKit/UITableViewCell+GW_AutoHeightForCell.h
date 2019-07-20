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

#pragma mark - 特别注意UITableViewCell的子视图，如果布局中使用了GW_HeightAuto()，请不要设置GW_BottomSpace底部约束，容易导致高度计算不准，可以使用gw_CellBottomOffset设置距离底部的距离。

////////////////////////////列表视图//////////////////////////////
#if TARGET_OS_IPHONE || TARGET_OS_TV
@interface UITableViewCell (GW_AutoHeightForCell)
/// cell最底部视图
@property (nonatomic , strong) UIView * gw_CellBottomView;
/// cell最底部视图集合
@property (nonatomic , strong) NSArray * gw_CellBottomViews;
/// cell最底部视图与cell底部的间隙
@property (nonatomic , assign) CGFloat  gw_CellBottomOffset;
/// cell中包含的UITableView
@property (nonatomic , strong) UITableView * gw_CellTableView;
/// 指定tableview宽度（有助于提高自动计算效率-宽度必须准确，否则不能正确计算高度）
@property (nonatomic , assign) CGFloat gw_TableViewWidth;

/// 自动计算cell高度
+ (CGFloat)gw_CellHeightForIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView;


/**
 自动计算cell高度: 重用cell api

 @param indexPath cell index
 @param tableView 列表
 @param identifier 重用标示
 @param block cell 布局回调
 @return cell高度
 
 @note 改api定要实现block回调才能正确计算cell高度
 */
+ (CGFloat)gw_CellHeightForIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView identifier:(NSString *)identifier layoutBlock:(void (^)(UITableViewCell * cell))block;
@end

@interface UITableView (GW_CacheCellHeight)

@property (strong, nonatomic)NSMutableDictionary *gw_CacheHeightDictionary;
@end
#endif

