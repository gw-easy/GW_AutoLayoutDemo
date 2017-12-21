//
//  GWTwoCell.m
//  GW_AutoLayoutDemo
//
//  Created by gw on 2017/12/15.
//  Copyright © 2017年 gw. All rights reserved.
//

#import "GWTwoCell.h"
#import "GW_AutoLayout.h"
@interface GWTwoCell()
@property (strong, nonatomic)UILabel * content;

@end
@implementation GWTwoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _content = [UILabel new];

        _content.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
 
        [self.contentView addSubview:_content];

        _content.GW_TopSpace(10).GW_LeftSpace(10).GW_RightSpace(10).GW_HeightAuto();
        _content.numberOfLines = 0;
        self.gw_CellBottomOffset = 10;
     
        
    }
    return self;
}

- (void)setContent:(NSString *)content index:(NSInteger)index width:(CGFloat)width{
    _content.text = content;
    self.gw_TableViewWidth = width;

    
}





@end
