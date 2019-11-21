//
//  TestViewController.m
//  urlTest
//
//  Created by gw on 2017/11/23.
//  Copyright © 2017年 gw. All rights reserved.
//

#import "TestViewController.h"
#import "ViewController.h"
#import "GW_AutoLayout.h"
#import "GWCell.h"
#import "testModel.h"
@interface TestViewController ()<UITableViewDataSource,UITableViewDelegate> {
    UITableView * _tableView;
    NSMutableArray * dateSourceArray;
    UIView  * view1;
}
@property (weak, nonatomic) IBOutlet UIButton *backBtn;

@end

@implementation TestViewController
- (IBAction)backBtnAction:(id)sender {
    for (UIViewController *vc in self.navigationController.childViewControllers) {
        if ([vc isKindOfClass:[ViewController class]]) {
            ViewController *vv = (ViewController *)vc;
            vv.bbbBool = YES;
            [self.navigationController popToViewController:vv animated:YES];
        }
        
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"列表自动计算cell高度";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(clickRefresh:)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    NSMutableArray *muArr = [NSMutableArray new];
    for (int i = 0; i<5; i++) {
        testModel *testM = [testModel new];
        testM.content = @"aaaaaa-----aaaaaa-----aaaaaa-----aaaaaa-----aaaaaa-----aaaaaa-----aaaaaa-----aaaaaa-----aaaaaa-----aaaaaa-----aaaaaa-----aaaaaa-----aaaaaa-----";
        testM.opencell = YES;
        [muArr addObject:testM];
    }
    dateSourceArray = muArr;

    _tableView = [UITableView new];
    [self.view addSubview:_tableView];

    [_tableView GW_AutoSize:0 top:0 right:0 bottom:0];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    
    
}
- (void)clickRefresh:(UIBarButtonItem *)sender {
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [_tableView reloadData];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [_tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GWCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GWCell class])];
    if (!cell) {
        cell = [[GWCell alloc] initWithStyle:0 reuseIdentifier:NSStringFromClass([GWCell class])];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor whiteColor];
    testModel *m = [dateSourceArray objectAtIndex:indexPath.row];
    if (m.opencell) {
        [cell setContent:m.content index:indexPath.row data:nil];
    }else{
        [cell setContent:m.content index:indexPath.row data:dateSourceArray];
    }

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dateSourceArray.count;
}

/// 自动计算cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return [GWCell gw_CellHeightForIdentifier:NSStringFromClass([GWCell class]) indexPath:indexPath tableView:tableView];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    testModel *m = dateSourceArray[indexPath.row];
    m.opencell = !m.opencell;
    
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:0];

}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{

    if (editingStyle == UITableViewCellEditingStyleDelete) {

        [dateSourceArray removeObjectAtIndex:indexPath.row];
        //删除指定的cell、由于我们的cell事根据数据源动态生成的，所以同时需要删除数据源,添加方法同理
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];

        [tableView reloadData];
        
        
        
        
    }
}

@end
