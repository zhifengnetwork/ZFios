//
//  ZFGoShoppingTableCell.m
//  ZF
//
//  Created by admin on 2019/3/15.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFGoShoppingTableCell.h"

@interface ZFGoShoppingTableCell()

@property (nonatomic, strong) UIButton *goShopButton;

@end

@implementation ZFGoShoppingTableCell

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
    
    [self.contentView addSubview:self.goShopButton];
    
    [_goShopButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(152);
        make.width.mas_equalTo(355);
        make.height.mas_equalTo(40);
        make.centerX.equalTo(self.contentView);
    }];
}

- (void)goShopButtonDidClick
{
    
}

- (UIButton *)goShopButton {
    if (_goShopButton == nil) {
        _goShopButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _goShopButton.backgroundColor = RGBColorHex(0xd91c1c);
        [_goShopButton setTitle:@"去选购相关商品" forState:UIControlStateNormal];
        _goShopButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_goShopButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _goShopButton.layer.cornerRadius = 3;
        _goShopButton.clipsToBounds = YES;
        [_goShopButton addTarget:self action:@selector(goShopButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _goShopButton;
}



@end
