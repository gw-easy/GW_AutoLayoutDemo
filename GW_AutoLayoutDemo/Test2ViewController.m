//
//  Test2ViewController.m
//  GW_AutoLayoutDemo
//
//  Created by zdwx on 2018/11/5.
//  Copyright © 2018 gw. All rights reserved.
//

#import "Test2ViewController.h"
#import "GW_AutoLayout.h"
@interface Test2ViewController ()

@end

@implementation Test2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIView *view1 = [UIView new];
    [self.view addSubview:view1];
    view1.backgroundColor = [UIColor redColor];
    
    
    UIView *view2 = [UIView new];
    [view1 addSubview:view2];
    view2.backgroundColor = [UIColor yellowColor];
    UIView *view3 = [UIView new];
    [view1 addSubview:view3];
    view3.backgroundColor = [UIColor greenColor];

    view1.GW_LeftSpace(0).GW_RightSpace(0).GW_TopSpace(100).GW_HeightAuto();
    
//    view1.GW_LeftSpace(0).GW_TopSpace(100).GW_HeightAuto().
    
    view2
    .GW_TopSpaceEqualView(view1)
    .GW_Height(100)
    .GW_LeftSpace(0).GW_BottomSpace(0).GW_RightSpaceToView(0, view3);
    
//    [view2 GW_AutoSBHorizontalLayout];
//    .GW_RightSpaceEqualView(view3);

    view3.GW_SizeEqualView(view2)
    .GW_TopSpaceEqualView(view2)
    .GW_LeftSpaceToView(0, view2).GW_BottomSpaceEqualView(view2)
    ;
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
