//
//  ViewController.m
//  GW_AutoLayoutDemo
//
//  Created by gw on 2017/11/17.
//  Copyright © 2017年 gw. All rights reserved.
//

#import "ViewController.h"
#import "testModel.h"
#import "testModel2.h"
#import "TestViewController.h"
#import "Test2ViewController.h"
#import "GW_AutoLayout.h"
@interface ViewController (){
    UIView * view2;
    UILabel * lable;
    UILabel * lable1,*lable2,*lable3;
    CGFloat width , height;
    
    UILabel * txt;
}
@property (strong, nonatomic) IBOutlet UIView *urlBtn;
@property (weak, nonatomic) IBOutlet UIButton *btn2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self test1];
//    [self test2];
    [self test3];
}

- (void)test3{
    UIView *viewOne = [[UIView alloc] init];
    viewOne.backgroundColor = [UIColor redColor];
    [self.view addSubview:viewOne];
    
    UILabel *lOne = [[UILabel alloc] init];
    lOne.text = @"UIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormal";
    lOne.textColor = [UIColor greenColor];
    [viewOne addSubview:lOne];
    
    UILabel *lTwo = [[UILabel alloc] init];
    lTwo.text = @"UIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormal";
    lTwo.textColor = [UIColor blueColor];
    [viewOne addSubview:lTwo];
    
    viewOne.GW_LeftSpace(10)
    .GW_CenterY(0)
    .GW_RightSpace(10)
    .GW_Height(300).GW_GreaterOrEqual();
    
    lOne.GW_LeftSpace(10)
    .GW_RightSpace(10)
    .GW_TopSpace(10)
    .GW_HeightAuto();
    
    lTwo.GW_LeftSpace(10)
    .GW_RightSpace(10)
    .GW_TopSpaceToView(0, lOne)
    .GW_HeightAuto();

}

- (void)test2{
    view2 = [UIView new];
    view2.backgroundColor = [UIColor greenColor];
    lable = [UILabel new];
    lable.text = @"UIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormal";
    [self.view addSubview:view2];
    [view2 addSubview:lable];
    
    view2.GW_LeftSpace(10)
    .GW_TopSpace(100)
    .GW_RightSpace(10)
    .GW_Height(100);
    
    lable.GW_LeftSpace(10)
    .GW_RightSpace(10)
    .GW_TopSpace(10)
    .GW_HeightAuto();
    
//    lable.GW_BottomSpace(10);
//    如果添加底部约束文字会变成UIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlSt... 导致算不出文字整体的真实高度。

    
}

- (void)test1{
    view2 = [UIView new];
    lable = [UILabel new];
    txt = [UILabel new];
    
    [self.view addSubview:txt];
    txt.backgroundColor = [UIColor grayColor];
    
    
    view2.backgroundColor = [UIColor grayColor];
    lable.text = @"UIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormal";
    
    UIButton * btn = [UIButton new];
    [btn setTitle:@"收起" forState:UIControlStateNormal];
    [btn setTitle:@"展开" forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:btn];
    
    [self.view addSubview:view2];
    [view2 addSubview:lable];
    
    
    
    
    view2.GW_LeftSpace(10)
    .GW_TopSpace(74)
    .GW_RightSpace(10)
    .GW_HeightAuto();
    
    btn.GW_TopSpaceToView(5,view2)
    .GW_LeftSpaceEqualView(view2)
    .GW_RightSpaceEqualView(view2)
    .GW_Height(40);
    
    
    txt.GW_LeftSpace(10)
    .GW_TopSpaceToView(10, btn)
    .GW_Height(40)
    .GW_Width(300)
    .GW_LessOrEqual()
    
    .GW_Width(10)
    .GW_GreaterOrEqual();
    
    /// 宽度小于等于200并且大于等于10 约束演示
    txt.text = @"sdfhisefijiejfisjelfjiejaaajjjjjjjjjjjjjjjaa";
    
    /// 一行代码添加约束
    lable.GW_LeftSpace(10)
    .GW_RightSpace(10)
    .GW_TopSpace(10)
    .GW_HeightAuto()
    .GW_BottomSpace(0)
    ;
}

- (void)clickButton:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        /// 高度约束20并且不删除bottom约束
        lable.GW_Height(20);
    }else {
        /// 自动高度约束并且不删除bottom约束
        lable.GW_HeightAuto();
    }
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
}


- (IBAction)urlBtnAction:(id)sender {
    
    TestViewController *testView = [[TestViewController alloc] init];

    testView.view.backgroundColor = [UIColor grayColor];

    [self.navigationController pushViewController:testView animated:YES];

}

- (IBAction)btn2Action:(id)sender {
    Test2ViewController *testView = [[Test2ViewController alloc] init];
    
    testView.view.backgroundColor = [UIColor grayColor];
    
    [self.navigationController pushViewController:testView animated:YES];
    
}




@end
