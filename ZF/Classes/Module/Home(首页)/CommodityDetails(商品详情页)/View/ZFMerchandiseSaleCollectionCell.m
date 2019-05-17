//
//  ZFMerchandiseSaleCollectionCell.m
//  ZF
//
//  Created by admin on 2019/3/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMerchandiseSaleCollectionCell.h"
#import "UIImageView+WebCache.h"

@interface ZFMerchandiseSaleCollectionCell()

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* moneyLabel;

@end

@implementation ZFMerchandiseSaleCollectionCell

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
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.moneyLabel];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(100);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_iconView.mas_bottom).offset(10);
        make.centerX.equalTo(self->_iconView);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_nameLabel.mas_bottom).offset(20);
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

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x101010);
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.text = @"小米8";
    }
    return _nameLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0xe31839);
        _moneyLabel.font = [UIFont systemFontOfSize:12];
        _moneyLabel.text = @"¥2199";
    }
    return _moneyLabel;
}


- (void)setGoodModel:(ZFGroupBuyingModel *)goodModel{
    _goodModel = goodModel;
    if (!kStringIsEmpty(_goodModel.original_img)) {
        NSString *str = [NSString stringWithFormat:@"%@%@",ImageUrl,_goodModel.original_img];
        [_iconView sd_setImageWithURL:[NSURL URLWithString:str]];
    }
    _nameLabel.text = [NSString stringWithFormat:@"%@",[_goodModel.goods_name substringToIndex:8]];
    _moneyLabel.text = [NSString stringWithFormat:@"¥%@",_goodModel.shop_price];
}
@end
