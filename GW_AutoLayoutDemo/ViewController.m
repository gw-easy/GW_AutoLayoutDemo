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
    [self test1];
//    [self test2];
//    [self test3];
}

- (void)test3{
    UIView *viewOne = [[UIView alloc] init];
    viewOne.backgroundColor = [UIColor redColor];
    [self.view addSubview:viewOne];
    
    UILabel *lOne = [[UILabel alloc] init];
    lOne.text = @"UIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormalUIControlStateNormal";
    lOne.textColor = [UIColor greenColor];
    [viewOne addSubview:lOne];
    
    viewOne.GW_LeftSpace(10)
    .GW_CenterY(0)
    .GW_RightSpace(10)
    .GW_Height(300).GW_GreaterOrEqual();
    
    lOne.GW_LeftSpace(10)
    .GW_RightSpace(10)
    .GW_TopSpace(10)
    .GW_HeightAuto()
    .GW_BottomSpaceToView(10, viewOne)
    ;
}

- (void)test2{
    
    UIView *viewBoot = [[UIView alloc] init];
    viewBoot.backgroundColor = [UIColor blackColor];
    viewBoot.alpha = 0.6;
    [self.view addSubview:viewBoot];
    
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
    
    UIButton *btnOne = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnOne setTitle:@"aaa" forState:UIControlStateNormal];
    btnOne.titleLabel.font = [UIFont systemFontOfSize:20];
    [viewOne addSubview:btnOne];
    
    UIButton *btnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnTwo setTitle:@"bbb" forState:UIControlStateNormal];
    btnTwo.titleLabel.font = [UIFont systemFontOfSize:20];
    [viewOne addSubview:btnTwo];
    
    
    
    viewOne.GW_LeftSpace(10)
    .GW_CenterY(0)
    .GW_RightSpace(10)
    .GW_Height(300).GW_GreaterOrEqual()
    .GW_Height(320).GW_LessOrEqual();
    
    lOne.GW_LeftSpace(10)
    .GW_RightSpace(10)
    .GW_TopSpace(10)
    .GW_HeightAuto();
    
    lTwo.GW_LeftSpaceEqualView(lOne)
    .GW_TopSpaceToView(10, lOne)
    .GW_RightSpaceEqualView(lOne)
    .GW_HeightAuto();
    
    btnOne.GW_LeftSpaceEqualView(lOne)
    .GW_TopSpaceToView(10, lTwo)
    .GW_Size(100, 100)
    .GW_BottomSpace(0);
    
    btnTwo.GW_SizeEqualView(btnOne)
    .GW_RightSpaceEqualView(lOne)
    .GW_BottomSpaceEqualView(btnOne);
}

- (void)test1{
    self.navigationItem.title = @"普通高度宽度自动布局";
    self.view.backgroundColor = [UIColor whiteColor];
    
    view2 = [UIView new];
    lable = [UILabel new];
    txt = [UILabel new];
    
    [self.view addSubview:txt];
    txt.backgroundColor = [UIColor grayColor];
    
    
    view2.backgroundColor = [UIColor redColor];
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
