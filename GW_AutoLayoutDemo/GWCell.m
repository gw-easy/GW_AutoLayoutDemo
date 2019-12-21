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
    UILabel *  _title;
    
    UILabel *  _other;
}
@property (strong, nonatomic)UILabel * content;

@property (strong, nonatomic)NSArray *dataArr;

@property (strong ,nonatomic) UITableView *tableView;
@end
@implementation GWCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _content = [UILabel new];
        
        
        _content.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
        
        
        [self.contentView addSubview:_content];
        _content.GW_TopSpace(10).GW_LeftSpace(10).GW_RightSpace(10).GW_HeightAuto();
        _content.numberOfLines = 0;
        

        [self tableView];
        
        
//        NSLog(@"%f",self.width);
        
//        [_tableView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        [self.contentView addSubview:_tableView];
        _tableView.GW_LeftSpace(100).GW_RightSpace(0).GW_TopSpaceToView(10, _content).GW_HeightAuto();
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.scrollEnabled = NO;
        
        self.gw_CellBottomOffset = 10;
        
        //        self.gw_TableViewWidth = [UIScreen mainScreen].bounds.size.width;
        self.gw_TableViewWidth = self.width_GW;
        [_tableView registerClass:[GWTwoCell class] forCellReuseIdentifier:NSStringFromClass([GWTwoCell class])];
    }
    return _tableView;
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
//    if (object == _tableView) {
//        NSLog(@"height = %f",_tableView.contentSize.height);
//        _tableView.GW_Height(_tableView.contentSize.height);
//    }
//}

//- (void)dealloc{
//    NSLog(@"dealloc");
//    [_tableView removeObserver:self forKeyPath:@"contentSize"];
//}

- (void)setContent:(NSString *)content index:(NSIndexPath *)index data:(NSArray *)data{
    _content.text = content;

    self.dataArr = data;
    _tableView.GW_Height(data.count * 44);
    [_tableView reloadData];
    [_tableView layoutIfNeeded];
    _tableView.GW_Height(_tableView.contentSize.height);
    NSLog(@"_tableView.size = %@",NSStringFromCGSize(_tableView.contentSize) );
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333");
//    NSStringFromClass([GWTwoCell class])
    
    CGFloat gg = [GWTwoCell gw_CellHeightForIndexPath:indexPath tableView:tableView];
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
    
    [cell setContent:@"bbbbbbbbbb-------bbbbbbbbbb--------bbbbbbbbbb-------bbbbbbbbbb--------bbbbbbbbbb-------bbbbbbbbbb--------bbbbbbbbbb-------bbbbbbbbbb--------bbbbbbbbbb-------bbbbbbbbbb--------" width:self.width_GW-100];

    return cell;
}


@end
