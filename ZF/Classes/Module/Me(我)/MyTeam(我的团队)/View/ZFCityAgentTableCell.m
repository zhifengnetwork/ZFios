//
//  ZFCityAgentTableCell.m
//  ZF
//
//  Created by admin on 2019/3/19.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFCityAgentTableCell.h"

@interface ZFCityAgentTableCell()

@property (nonatomic, strong) UILabel *cityLabel;
@property (nonatomic, strong) UILabel *moneyLabel;
@property (nonatomic, strong) UIImageView *iconView;

@end

@implementation ZFCityAgentTableCell

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
    self.contentView.backgroundColor = RGBColorHex(0xf7e7e8);
    [self.contentView addSubview:self.cityLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.iconView];
    
    
    [_cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(22);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(self.contentView);
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.mas_equalTo(-22);
    }];
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xcccccc);
    [self.contentView addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.mas_equalTo(0);
         make.right.mas_equalTo(-0);
         make.bottom.equalTo(self.contentView);
         make.height.mas_equalTo(0.5f);
     }];
    
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    _cityLabel.text = _title;
}


- (UILabel *)cityLabel {
    if (_cityLabel == nil) {
        _cityLabel = [[UILabel alloc] init];
        _cityLabel.textColor = RGBColorHex(0xff0054);
        _cityLabel.font = [UIFont systemFontOfSize:20];
        _cityLabel.text = @"市代理";
    }
    return _cityLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0x333333);
        _moneyLabel.font = [UIFont systemFontOfSize:14];
        _moneyLabel.text = @"¥743,222";
    }
    return _moneyLabel;
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"xia"];
    }
    return _iconView;
}

@end
