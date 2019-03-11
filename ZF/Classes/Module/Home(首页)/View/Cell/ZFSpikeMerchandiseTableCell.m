//
//  ZFSpikeMerchandiseTableCell.m
//  ZF
//
//  Created by apple on 2019/2/28.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFSpikeMerchandiseTableCell.h"

@interface ZFSpikeMerchandiseTableCell()

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* moneyLabel;

@end

@implementation ZFSpikeMerchandiseTableCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.contentView.backgroundColor = RGBColorHex(0xffffff);
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.moneyLabel];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(10);
        make.width.height.mas_equalTo(78);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_iconView.mas_bottom).offset(4);
        make.centerX.equalTo(self->_iconView);
    }];
    
    
}


- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"KK"];
    }
    return _iconView;
}


- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0xff0000);
        _moneyLabel.font = [UIFont systemFontOfSize:17];
        _moneyLabel.text = @"¥1399.00";
    }
    return _moneyLabel;
}


@end
