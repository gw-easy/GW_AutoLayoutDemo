//
//  TestViewController.m
//  GW_AutoLayoutDemo
//
//  Created by gw on 2020/3/24.
//  Copyright © 2020 gw. All rights reserved.
//

#import "TestViewController.h"
#import "GW_AutoLayout.h"
@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *testL = [UILabel new];
    [self.view addSubview:testL];
    testL.GW_LeftSpace(10)
    .GW_TopSpace(100)
    .GW_MaxWidth(100)
    .GW_MixWidth(50);
    
    testL.backgroundColor = [UIColor redColor];
    testL.text = @"1";
    
    UILabel *testL2 = [UILabel new];
    [self.view addSubview:testL2];
    testL2.numberOfLines = 0;
    testL2.GW_LeftSpace(50)
    .GW_TopSpaceToView(40, testL)
    .GW_RightSpace(50)
    .GW_MaxHeight(100)
    .GW_MixHeight(50);
    
    testL2.backgroundColor = [UIColor greenColor];
    
    testL2.text = @"sjdfie";
    
}


@end
