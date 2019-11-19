//
//  UITableViewCell+gw_AutoHeightForCell.m
//  GWDemo
//
//  Created by gw on 2017/6/30.
//  Copyright © 2017年 gw. All rights reserved.
//

#import "UITableViewCell+GW_AutoHeightForCell.h"

#if TARGET_OS_IPHONE || TARGET_OS_TV
#import <objc/runtime.h>
//#import "UIView+gw_AutoLayout.h"

@implementation UITableView (GW_CacheCellHeight)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method reloadData = class_getInstanceMethod(self, @selector(reloadData));
        Method gw_ReloadData = class_getInstanceMethod(self, @selector(gw_ReloadData));
        Method reloadDataRow = class_getInstanceMethod(self, @selector(reloadRowsAtIndexPaths:withRowAnimation:));
        Method gw_ReloadDataRow = class_getInstanceMethod(self, @selector(gw_reloadRowsAtIndexPaths:withRowAnimation:));
        Method sectionReloadData = class_getInstanceMethod(self, @selector(reloadSections:withRowAnimation:));
        Method gw_SectionReloadData = class_getInstanceMethod(self, @selector(gw_ReloadSections:withRowAnimation:));
        Method deleteCell = class_getInstanceMethod(self, @selector(deleteRowsAtIndexPaths:withRowAnimation:));
        Method gw_deleteCell = class_getInstanceMethod(self, @selector(gw_DeleteRowsAtIndexPaths:withRowAnimation:));
        Method deleteSection = class_getInstanceMethod(self, @selector(deleteSections:withRowAnimation:));
        Method gw_deleteSection = class_getInstanceMethod(self, @selector(gw_DeleteSections:withRowAnimation:));
        Method moveSection = class_getInstanceMethod(self, @selector(moveSection:toSection:));
        Method gw_moveSection = class_getInstanceMethod(self, @selector(gw_MoveSection:toSection:));
        Method moveRowAtIndexPath = class_getInstanceMethod(self, @selector(moveRowAtIndexPath:toIndexPath:));
        Method gw_moveRowAtIndexPath = class_getInstanceMethod(self, @selector(gw_MoveRowAtIndexPath:toIndexPath:));
        Method insertSections = class_getInstanceMethod(self, @selector(insertSections:withRowAnimation:));
        Method gw_insertSections = class_getInstanceMethod(self, @selector(gw_InsertSections:withRowAnimation:));
        Method insertRowsAtIndexPaths = class_getInstanceMethod(self, @selector(insertRowsAtIndexPaths:withRowAnimation:));
        Method gw_insertRowsAtIndexPaths = class_getInstanceMethod(self, @selector(gw_InsertRowsAtIndexPaths:withRowAnimation:));
        
        method_exchangeImplementations(sectionReloadData, gw_SectionReloadData);
        method_exchangeImplementations(reloadDataRow, gw_ReloadDataRow);
        method_exchangeImplementations(reloadData, gw_ReloadData);
        method_exchangeImplementations(deleteCell, gw_deleteCell);
        method_exchangeImplementations(deleteSection, gw_deleteSection);
        method_exchangeImplementations(moveSection, gw_moveSection);
        method_exchangeImplementations(moveRowAtIndexPath, gw_moveRowAtIndexPath);
        method_exchangeImplementations(insertSections, gw_insertSections);
        method_exchangeImplementations(insertRowsAtIndexPaths, gw_insertRowsAtIndexPaths);
    });
}

- (void)setGw_CacheHeightDictionary:(NSMutableDictionary *)gw_CacheHeightDictionary {
    objc_setAssociatedObject(self,
                             @selector(gw_CacheHeightDictionary),
                             gw_CacheHeightDictionary,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary *)gw_CacheHeightDictionary {
    return objc_getAssociatedObject(self, _cmd);
}

- (NSMutableDictionary *)handleCacheHeightDictionary:(NSMutableDictionary *)dict indexPath:(NSIndexPath *)indexPath{
    
    NSMutableDictionary *newRowMap = [[NSMutableDictionary alloc] init];
//    NSLog(@"%@",dict);
    if (dict != nil) {
        NSInteger moveRow = dict.count;
        if (moveRow > indexPath.row) {
            for (NSInteger index = indexPath.row; index < moveRow; index++) {
                id heightObject = dict[@(index).stringValue];
                if (heightObject) {
                    [newRowMap setValue:@([heightObject floatValue]) forKey:@(index + 1).stringValue];
                    [dict removeObjectForKey:@(index).stringValue];
                }
            }
        }
        
        [dict addEntriesFromDictionary:newRowMap];
    }
    return dict;
}

- (NSMutableDictionary *)handleCacheSectionDictionary:(NSMutableDictionary *)dict indexCount:(NSInteger)indexCount{
    
    NSMutableDictionary *newRowMap = [[NSMutableDictionary alloc] init];
    if (dict != nil) {
        NSInteger moveRow = dict.count;
        if (moveRow > indexCount) {
            for (NSInteger index = indexCount; index < moveRow; index++) {
                NSMutableDictionary *curDir = dict[@(index).stringValue];
                if (curDir) {
                    [newRowMap setValue:curDir forKey:@(index + 1).stringValue];
                    [dict removeObjectForKey:@(index).stringValue];
                }
            }
        }
        
        [dict addEntriesFromDictionary:newRowMap];
    }
    return dict;
}

- (NSMutableDictionary *)handleCacheHeightRow:(NSMutableDictionary *)dict {
    if (dict) {
        NSArray<NSString *> * allKey = [dict.allKeys sortedArrayUsingComparator:^NSComparisonResult(NSString * obj1, NSString * obj2) {
            return obj1.floatValue < obj2.floatValue;
        }];
        
        NSMutableDictionary *newDict = [NSMutableDictionary new];
        for (NSInteger i = allKey.count; i>0; i--) {
            
            int row = (int)(i-allKey.count);
            [newDict setValue:dict[allKey[i-1]] forKey:@(abs(row)).stringValue];
        }
        
        return newDict;
    }
    return dict;
}


- (void)gw_reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation {
    if (indexPaths && self.gw_CacheHeightDictionary) {
        [indexPaths enumerateObjectsUsingBlock:^(NSIndexPath * _Nonnull indexPath, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString * cacheHeightKey = @(indexPath.section).stringValue;
            NSMutableDictionary * sectionCacheHeightDictionary = self.gw_CacheHeightDictionary[cacheHeightKey];
            if (sectionCacheHeightDictionary != nil) {
                [sectionCacheHeightDictionary removeObjectForKey:@(indexPath.row).stringValue];
            }
        }];
    }
    [self gw_reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)gw_ReloadData {
    if (self.gw_CacheHeightDictionary != nil) {
        [self.gw_CacheHeightDictionary removeAllObjects];
    }
    [self gw_ReloadData];
}

- (void)gw_DeleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation{
    if (indexPaths && self.gw_CacheHeightDictionary) {
        [indexPaths enumerateObjectsUsingBlock:^(NSIndexPath * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSMutableDictionary *dict = self.gw_CacheHeightDictionary[@(obj.section).stringValue];
            if (dict) {
                [dict removeObjectForKey:@(obj.row).stringValue];
                dict = [self handleCacheHeightRow:dict];
                self.gw_CacheHeightDictionary[@(obj.section).stringValue] = dict;
                
            }
        }];
        
    }
    
    [self gw_DeleteRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)gw_DeleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation{
    if (sections && self.gw_CacheHeightDictionary) {
        [sections enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
            NSMutableDictionary *dict = self.gw_CacheHeightDictionary[@(idx).stringValue];
            if (dict) {
                [self.gw_CacheHeightDictionary removeObjectForKey:@(idx).stringValue];
                dict = [self handleCacheHeightRow:dict];
                self.gw_CacheHeightDictionary[@(idx).stringValue] = dict;
            }
        }];
    }
    
    [self gw_DeleteSections:sections withRowAnimation:animation];
}

- (void)gw_ReloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation{
    if (indexPaths && self.gw_CacheHeightDictionary) {
        [indexPaths enumerateObjectsUsingBlock:^(NSIndexPath * _Nonnull indexPath, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString * cacheHeightKey = @(indexPath.section).stringValue;
            NSMutableDictionary * sectionCacheHeightDictionary = self.gw_CacheHeightDictionary[cacheHeightKey];
            if (sectionCacheHeightDictionary != nil) {
                [sectionCacheHeightDictionary removeObjectForKey:@(indexPath.row).stringValue];
            }
        }];
    }
    [self gw_ReloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)gw_ReloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation{
    if (sections && self.gw_CacheHeightDictionary) {
        [sections enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
            [self.gw_CacheHeightDictionary removeObjectForKey:@(idx).stringValue];
        }];
    }
    [self gw_ReloadSections:sections withRowAnimation:animation];
}

- (void)gw_MoveSection:(NSInteger)section toSection:(NSInteger)newSection {
    if (self.gw_CacheHeightDictionary) {
        NSMutableDictionary * sectionMap = [NSMutableDictionary dictionaryWithDictionary:self.gw_CacheHeightDictionary[@(section).stringValue]];
        self.gw_CacheHeightDictionary[@(section).stringValue] = self.gw_CacheHeightDictionary[@(newSection).stringValue];
        self.gw_CacheHeightDictionary[@(newSection).stringValue] = sectionMap;
    }
    [self gw_MoveSection:section toSection:newSection];
}

- (void)gw_MoveRowAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath {
    if (indexPath && newIndexPath && self.gw_CacheHeightDictionary) {
        NSMutableDictionary * indexPathMap = self.gw_CacheHeightDictionary[@(indexPath.section).stringValue];
        CGFloat indexPathHeight = [indexPathMap[@(indexPath.row).stringValue] floatValue];
        
        NSMutableDictionary * newIndexPathMap = self.gw_CacheHeightDictionary[@(newIndexPath.section).stringValue];
        CGFloat newIndexPathHeight = [newIndexPathMap[@(newIndexPath.row).stringValue] floatValue];
        
        indexPathMap[@(indexPath.row).stringValue] = @(newIndexPathHeight);
        newIndexPathMap[@(newIndexPath.row).stringValue] = @(indexPathHeight);
    }
    [self gw_MoveRowAtIndexPath:indexPath toIndexPath:newIndexPath];
}

- (void)gw_InsertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation {
    if (sections && self.gw_CacheHeightDictionary) {
        [sections enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
            self.gw_CacheHeightDictionary = [self handleCacheSectionDictionary:self.gw_CacheHeightDictionary indexCount:idx];
        }];
        
    }
    [self gw_InsertSections:sections withRowAnimation:animation];
}

- (void)gw_InsertRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation {
    if (self.gw_CacheHeightDictionary && indexPaths) {
        [indexPaths enumerateObjectsUsingBlock:^(NSIndexPath * _Nonnull indexPath, NSUInteger idx, BOOL * _Nonnull stop) {
            NSMutableDictionary * sectionMap = self.gw_CacheHeightDictionary[@(indexPath.section).stringValue];
            self.gw_CacheHeightDictionary[@(indexPath.section).stringValue] = [self handleCacheHeightDictionary:sectionMap indexPath:indexPath];

        }];
    }
    [self gw_InsertRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

@end



@implementation UITableViewCell (GW_AutoHeightForCell)

- (void)setGw_CellBottomOffset:(CGFloat)gw_CellBottomOffset {
    objc_setAssociatedObject(self,
                             @selector(gw_CellBottomOffset),
                             @(gw_CellBottomOffset),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)gw_CellBottomOffset {
    id bottomOffset = objc_getAssociatedObject(self, _cmd);
    return bottomOffset != nil ? [bottomOffset floatValue] : 0;
}

- (void)setGw_CellBottomViews:(NSArray *)gw_CellBottomViews {
    objc_setAssociatedObject(self,
                             @selector(gw_CellBottomViews),
                             gw_CellBottomViews,
                             OBJC_ASSOCIATION_COPY);
}

- (NSArray *)gw_CellBottomViews {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setGw_CellBottomView:(UIView *)gw_CellBottomView {
    objc_setAssociatedObject(self,
                             @selector(gw_CellBottomView),
                             gw_CellBottomView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)gw_CellBottomView {
    return objc_getAssociatedObject(self, _cmd);
}

- (UITableView *)gw_CellTableView {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setGw_CellTableView:(UITableView *)gw_CellTableView {
    objc_setAssociatedObject(self,
                             @selector(gw_CellTableView),
                             gw_CellTableView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)gw_TableViewWidth {
    id value = objc_getAssociatedObject(self, _cmd);
    return value != nil ? [value floatValue] : 0;
}

- (void)setGw_TableViewWidth:(CGFloat)gw_TableViewWidth {
    objc_setAssociatedObject(self, @selector(gw_TableViewWidth), @(gw_TableViewWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (CGFloat)gw_CellHeightForIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView{
    return [self gw_CellHeightForIdentifier:nil indexPath:indexPath tableView:tableView];
}

+ (CGFloat)gw_CellHeightForIdentifier:(NSString *)identifier indexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView {
    return [self gw_CellHeightForIdentifier:identifier indexPath:indexPath tableView:tableView layoutBlock:nil];
}

+ (CGFloat)gw_CellHeightForIdentifier:(NSString *)identifier indexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView  layoutBlock:(void (^)(UITableViewCell * cell))block {
    if (tableView.gw_CacheHeightDictionary == nil) {
        tableView.gw_CacheHeightDictionary = [NSMutableDictionary dictionary];
    }
    NSString * cacheHeightKey = @(indexPath.section).stringValue;
    NSMutableDictionary * sectionCacheHeightDictionary = tableView.gw_CacheHeightDictionary[cacheHeightKey];
    if (sectionCacheHeightDictionary != nil) {
        NSNumber * cellHeight = sectionCacheHeightDictionary[@(indexPath.row).stringValue];
        if (cellHeight) {
            return cellHeight.floatValue;
        }
    }else {
        sectionCacheHeightDictionary = [NSMutableDictionary dictionary];
        [tableView.gw_CacheHeightDictionary setObject:sectionCacheHeightDictionary forKey:cacheHeightKey];
    }
    
    UITableViewCell * cell = nil;
    if (identifier && identifier.length > 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (block) {
            block(cell);
        }
        if (!cell) {
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        }
    }else {
        cell = [tableView.dataSource tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    
    if (!cell) {
        return 1;
    }
    
    CGFloat tableViewWidth = cell.gw_TableViewWidth;
    if (tableViewWidth == 0) {
        [tableView layoutIfNeeded];
        tableViewWidth = CGRectGetWidth(tableView.frame);
    }
    if (tableViewWidth == 0) return 0;
    cell.width = tableViewWidth;
    cell.contentView.width = tableViewWidth;

    [cell layoutIfNeeded];
    
    UIView * bottomView = nil;
    if (cell.gw_CellBottomView != nil) {
        bottomView = cell.gw_CellBottomView;
    }else if(cell.gw_CellBottomViews != nil && cell.gw_CellBottomViews.count > 0) {
        bottomView = cell.gw_CellBottomViews[0];
        for (int i = 1; i < cell.gw_CellBottomViews.count; i++) {
            UIView * view = cell.gw_CellBottomViews[i];
            if (CGRectGetMaxY(bottomView.frame) < CGRectGetMaxY(view.frame)) {
                bottomView = view;
            }
        }
    }else {
        NSArray * cellSubViews = cell.contentView.subviews;
        if (cellSubViews.count > 0) {
            bottomView = cellSubViews[0];
            for (int i = 1; i < cellSubViews.count; i++) {
                UIView * view = cellSubViews[i];
                if (CGRectGetMaxY(bottomView.frame) < CGRectGetMaxY(view.frame)) {
                    bottomView = view;
                }
            }
        }else {
            bottomView = cell.contentView;
        }
    }
    
    CGFloat cacheHeight = CGRectGetMaxY(bottomView.frame) + cell.gw_CellBottomOffset;
    [sectionCacheHeightDictionary setValue:@(cacheHeight) forKey:@(indexPath.row).stringValue];
    return cacheHeight>0?cacheHeight:0;
}

+ (void)checkBottomView:(UITableViewCell *)cell{
    if (cell.gw_CellBottomView) {
        return;
    }
    UIView * bottomView = nil;
    NSArray * cellSubViews = cell.contentView.subviews;
    if (cellSubViews.count > 0) {
        bottomView = cellSubViews[0];
        for (int i = 1; i < cellSubViews.count; i++) {
            UIView * view = cellSubViews[i];
            if (CGRectGetMaxY(bottomView.frame) < CGRectGetMaxY(view.frame)) {
                bottomView = view;
            }
        }
        NSLayoutConstraint * heightGreaterCons = [bottomView heightGreaterConstraint];
        if (heightGreaterCons) {
            cell.gw_CellBottomView = [[UIView alloc] init];
            [cell.contentView addSubview:cell.gw_CellBottomView];
            cell.gw_CellBottomView.GW_Width(10)
            .GW_Height(0)
            .GW_TopSpaceToView(0, bottomView)
            .GW_BottomSpace(0);
        }
    }
}

@end
#endif
