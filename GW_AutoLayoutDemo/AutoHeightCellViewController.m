//
//  TestViewController.m
//  urlTest
//
//  Created by gw on 2017/11/23.
//  Copyright © 2017年 gw. All rights reserved.
//

#import "AutoHeightCellViewController.h"
#import "GW_AutoLayout.h"
#import "GWCell.h"
#import "testModel.h"
@interface AutoHeightCellViewController ()<UITableViewDataSource,UITableViewDelegate> {
    UITableView * _tableView;
    NSMutableArray * dateSourceArray;
    UIView  * view1;
}
@property (weak, nonatomic) IBOutlet UIButton *backBtn;

@end

@implementation AutoHeightCellViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(clickRefresh:)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    dateSourceArray = [NSMutableArray new];
    for (int i = 0; i<2; i++) {
        testModel *testM = [testModel new];
        testM.content = @"aaaaaa-----aaaaaa-----aaaaaa-----aaaaaa-----aaaaaa-----aaaaaa-----aaaaaa-----aaaaaa-----aaaaaa-----aaaaaa-----aaaaaa-----aaaaaa-----aaaaaa-----";
        testM.opencell = YES;
        NSMutableArray *seArr=  [NSMutableArray new];
        for (int x = 0; x < 4; x++) {
            testModel *testM2 = [testModel new];
            testM2.content = @"bbbbbb-----bbbbbb-----bbbbbb-----bbbbbb-----bbbbbb-----bbbbbb-----bbbbbb-----bbbbbb-----bbbbbb-----bbbbbb-----bbbbbb-----bbbbbb-----bbbbbb-----bbbbbb-----";
            [seArr addObject:testM2];
        }
        testM.dataArr = seArr;
        [dateSourceArray addObject:testM];
    }

    _tableView = [UITableView new];
    [self.view addSubview:_tableView];

    [_tableView GW_AutoSize:0 top:0 right:0 bottom:0];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[GWCell class] forCellReuseIdentifier:NSStringFromClass([GWCell class])];
    
    
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
        [cell setContent:m.content index:indexPath data:nil];
    }else{
        [cell setContent:m.content index:indexPath data:m.dataArr];
    }

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dateSourceArray.count;
}

/// 自动计算cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"111111111111111111111111111111111111111111111111111111111111111111111111111111111111");
//
    CGFloat height =  [GWCell gw_CellHeightForIndexPath:indexPath tableView:tableView];
    NSLog(@"GWCell : indexPath = %@ height = %f",indexPath,height);
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    testModel *m = dateSourceArray[indexPath.row];
    m.opencell = !m.opencell;
     
//    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:0];
    
    [_tableView reloadData];
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
