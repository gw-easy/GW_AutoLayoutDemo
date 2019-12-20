//
//  MianTableViewController.m
//  GW_AutoLayoutDemo
//
//  Created by zdwx on 2019/12/20.
//  Copyright © 2019 gw. All rights reserved.
//

#import "MainTableViewController.h"

@interface MainTableViewController ()
@property (strong ,nonatomic) NSMutableArray *dataArr;
@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataArr];
    [self.tableView reloadData];
    
}

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
        NSArray *firstArr = @[
            [self createVCDateClassName:@"AutoHeightCellViewController" desStr:@"列表自动计算cell高度"],
            [self createVCDateClassName:@"Test3Controller" desStr:@"列表自动计算cell高度"],
            
            
            
             ];
        [_dataArr addObject:firstArr];
    }
    return _dataArr;
}

- (NSDictionary *)createVCDateClassName:(NSString *)className desStr:(NSString *)desStr{
    return @{@"class":className,@"des":desStr};
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataArr[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    // Configure the cell...
    NSDictionary *dict = _dataArr[indexPath.section][indexPath.row];
    cell.textLabel.text = dict[@"class"];
    cell.detailTextLabel.text = dict[@"des"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict = _dataArr[indexPath.section][indexPath.row];
    Class vcClass = NSClassFromString(dict[@"class"]);
    UIViewController *vc = [vcClass new];
    vc.title = dict[@"class"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
