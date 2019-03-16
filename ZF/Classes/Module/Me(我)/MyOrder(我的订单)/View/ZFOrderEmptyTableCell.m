//
//  ZFOrderEmptyTableCell.m
//  ZF
//
//  Created by admin on 2019/3/15.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFOrderEmptyTableCell.h"
#import "UIButton+LXMImagePosition.h"

@interface ZFOrderEmptyTableCell ()

@property (nonatomic, strong) UIButton* noOrderButton;

@end

@implementation ZFOrderEmptyTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setup];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setup
{
    self.contentView.backgroundColor = RGBColorHex(0xf3f5f7);
    [self.contentView addSubview:self.noOrderButton];
    
    [_noOrderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(150);
        make.centerX.equalTo(self.contentView);
    }];
   
}

-(void)noOrderButtonDidClick
{
   
}



- (UIButton *)noOrderButton {
    if (_noOrderButton == nil) {
        _noOrderButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_noOrderButton setTitle:@"您暂时没有订单" forState:UIControlStateNormal];
        [_noOrderButton setImage:[UIImage imageNamed:@"OrderManagement"] forState:UIControlStateNormal];
        [_noOrderButton setTitleColor:RGBColorHex(0x646464) forState:UIControlStateNormal];
        _noOrderButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_noOrderButton setImagePosition:LXMImagePositionTop spacing:13];
        [_noOrderButton addTarget:self action:@selector(noOrderButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _noOrderButton;
}


@end
