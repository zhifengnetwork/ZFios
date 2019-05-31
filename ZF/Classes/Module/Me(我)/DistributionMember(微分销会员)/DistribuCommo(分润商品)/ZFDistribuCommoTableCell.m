//
//  ZFDistribuCommoTableCell.m
//  ZF
//
//  Created by admin on 2019/5/9.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDistribuCommoTableCell.h"


@interface ZFDistribuCommoTableCell()

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* moneyLabel;
@property (nonatomic, strong) UILabel* titleLabel;

@end

@implementation ZFDistribuCommoTableCell

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
    self.contentView.backgroundColor = RGBColorHex(0xffffff);
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.titleLabel];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(80);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(10);
        make.top.mas_equalTo(15);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(20);
        make.top.equalTo(self->_nameLabel.mas_bottom).offset(20);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_moneyLabel.mas_right).offset(13);
        make.centerY.equalTo(self->_moneyLabel);
    }];
}

-(void)setDistribuCommModel:(ZFDistribuCommModel *)distribuCommModel
{
    _distribuCommModel = distribuCommModel;
    
    if (!kStringIsEmpty(distribuCommModel.original_img))
    {
        NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,distribuCommModel.original_img];
        [_iconView sd_setImageWithURL:[NSURL URLWithString:str]];
    }
    _nameLabel.text = _distribuCommModel.goods_name;
    _moneyLabel.text = [NSString stringWithFormat:@"商品价格¥%@",_distribuCommModel.shop_price];
    _titleLabel.text = [NSString stringWithFormat:@"分润: %@",_distribuCommModel.commission_num];
}


- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"image"];
        _iconView.clipsToBounds = YES;
        _iconView.layer.cornerRadius = 3.0f;
    }
    return _iconView;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x151515);
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.text = @"DC金箔水光精华9.9元";
    }
    return _nameLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0x151515);
        _moneyLabel.font = [UIFont systemFontOfSize:15];
        _moneyLabel.text = @"商品价格¥399.00";
    }
    return _moneyLabel;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x151515);
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.text = @"分润：76.36";
    }
    return _titleLabel;
}

@end
