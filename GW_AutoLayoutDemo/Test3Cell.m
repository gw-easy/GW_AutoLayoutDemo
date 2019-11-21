//
//  Test3Cell.m
//  GW_AutoLayoutDemo
//
//  Created by zdwx on 2019/11/21.
//  Copyright © 2019 gw. All rights reserved.
//

#import "Test3Cell.h"

@implementation Test3Cell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        UIView *back1 = [[UIView alloc] init];
        UILabel *la2 = [[UILabel alloc] init];
        [self.contentView addSubview:back1];
        [back1 addSubview:la2];
        la2.text = @"initWithStyleinitWithStyleinitWithStyleinitWithStyleinitWithStyleinitWithStyleinitWithStyleinitWithStyleinitWithStyleinitWithStyleinitWithStyleinitWithStyleinitWithStyleinitWithStyle";
        back1.GW_LeftSpace(0)
        .GW_RightSpace(0)
        .GW_TopSpace(0)
        .GW_HeightAuto();
        
        la2.GW_LeftSpace(0)
        .GW_RightSpace(0)
        .GW_TopSpace(0)
        .GW_HeightAuto();
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
