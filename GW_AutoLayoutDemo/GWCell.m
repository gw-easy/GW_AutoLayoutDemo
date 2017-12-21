//
//  GWCell.m
//  GW_AutoLayoutDemo
//
//  Created by gw on 2017/12/13.
//  Copyright © 2017年 gw. All rights reserved.
//

#import "GWCell.h"
#import "GW_AutoLayout.h"
#import "GWTwoCell.h"
@interface GWCell()<UITableViewDataSource,UITableViewDelegate> {
    UILabel *  _image;
    UILabel *  _title;
    
    UILabel *  _other;
    UITableView * _tableView;
}
@property (strong, nonatomic)UILabel * content;

@property (strong, nonatomic)NSMutableArray *dataArr;

@end
@implementation GWCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _content = [UILabel new];
        
        _tableView = [[UITableView alloc] init];
        _content.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
        
        
        [self.contentView addSubview:_content];
        _content.GW_TopSpace(10).GW_LeftSpace(10).GW_RightSpace(10).GW_HeightAuto();
        _content.numberOfLines = 0;
        

            
        [self.contentView addSubview:_tableView];
        _tableView.GW_LeftSpace(100).GW_RightSpace(10).GW_TopSpaceToView(10, _content).GW_HeightAuto();
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.scrollEnabled = NO;
        self.gw_CellTableView = _tableView;
        
        
        self.gw_CellBottomOffset = 10;
        
//        self.gw_TableViewWidth = [UIScreen mainScreen].bounds.size.width;
        self.gw_TableViewWidth = self.width;
        
//        NSLog(@"%f",self.width);
        
        
    }
    return self;
}

- (void)setContent:(NSString *)content index:(NSInteger)index data:(NSMutableArray *)data{
    _content.text = content;
    _image.text = @(index).stringValue;

    self.dataArr = data;
    [_tableView reloadData];
    [_tableView GW_Height:_tableView.contentSize.height];


}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat gg = [GWTwoCell gw_CellHeightForIndexPath:indexPath tableView:tableView];
//    NSLog(@"gg--%d---%f",indexPath.row,gg);
    return gg;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GWTwoCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GWTwoCell class])];
    if (cell == nil) {
        cell = [[GWTwoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([GWTwoCell class])];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell setContent:@"bbbbbbbbbb-------bbbbbbbbbb--------bbbbbbbbbb-------bbbbbbbbbb--------bbbbbbbbbb-------bbbbbbbbbb--------bbbbbbbbbb-------bbbbbbbbbb--------bbbbbbbbbb-------bbbbbbbbbb--------" index:indexPath.row width:self.gw_CellTableView.width];

    return cell;
}


@end
