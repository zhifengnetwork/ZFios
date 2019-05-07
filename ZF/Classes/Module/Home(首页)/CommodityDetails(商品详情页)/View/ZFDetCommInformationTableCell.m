//
//  ZFDetCommInformationTableCell.m
//  ZF
//
//  Created by admin on 2019/3/25.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDetCommInformationTableCell.h"

@interface ZFDetCommInformationTableCell()

@property (nonatomic, strong) UILabel* secondLabel;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* symbolLabel;
@property (nonatomic, strong) UILabel* moneyLabel;
@property (nonatomic, strong) UILabel* priceLabel;
@property (nonatomic, strong) UILabel* money2Label;
@property (nonatomic, strong) UILabel* salesLabel;
@property (nonatomic, strong) UILabel* stockLabel;

@end

@implementation ZFDetCommInformationTableCell

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
    [self.contentView addSubview:self.secondLabel];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.symbolLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.money2Label];
    [self.contentView addSubview:self.salesLabel];
    [self.contentView addSubview:self.stockLabel];
    
    [_secondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(15);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(18);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_secondLabel.mas_right).offset(8);
        make.top.mas_equalTo(15);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.equalTo(self->_nameLabel.mas_bottom).offset(20);
        make.right.mas_equalTo(-20);
    }];
    
    [_symbolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.bottom.equalTo(self->_moneyLabel.mas_bottom).offset(-3);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.top.equalTo(self->_titleLabel.mas_bottom).offset(20);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_moneyLabel.mas_right).offset(25);
        make.bottom.equalTo(self->_moneyLabel.mas_bottom);
    }];
    
    [_money2Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_priceLabel.mas_right).offset(5);
        make.bottom.equalTo(self->_priceLabel.mas_bottom);
    }];
    
    [_salesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.equalTo(self->_moneyLabel.mas_bottom).offset(15);
        make.bottom.mas_equalTo(-15);
    }];
    
    [_stockLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self->_salesLabel);
        make.left.equalTo(self->_salesLabel.mas_right).offset(20);
        make.bottom.mas_equalTo(-15);
    }];
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xE8E8E8);
    [self.contentView addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.mas_equalTo(0);
         make.right.mas_equalTo(-0);
         make.bottom.equalTo(self.contentView);
         make.height.mas_equalTo(0.5f);
     }];
    
    //横线
    UIView *hLine2View = [[UIView alloc] init];
    hLine2View.backgroundColor = RGBColorHex(0x999999);
    [self.contentView addSubview:hLine2View];
    
    [hLine2View mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.centerY.centerX.equalTo(self->_money2Label);
         make.width.mas_equalTo(30);
         make.height.mas_equalTo(0.5);
     }];
    
}

- (UILabel *)secondLabel {
    if (_secondLabel == nil) {
        _secondLabel = [[UILabel alloc] init];
        _secondLabel.textColor = RGBColorHex(0xe60b30);
        _secondLabel.font = [UIFont systemFontOfSize:12];
        _secondLabel.layer.borderWidth = 1.0f;
        _secondLabel.layer.borderColor = RGBColorHex(0xe60b30).CGColor;
        _secondLabel.text = @"  自营";
    }
    return _secondLabel;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x0f0f0f);
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.text = @"Apple/p iphone XR";
    }
    return _nameLabel;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x404040);
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.text = @"苹果 iphone XR 移动联通电信4G双卡双待苹果 iphone XR 苹果 iphone XR ";
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UILabel *)symbolLabel {
    if (_symbolLabel == nil) {
        _symbolLabel = [[UILabel alloc] init];
        _symbolLabel.textColor = RGBColorHex(0xe60b30);
        _symbolLabel.font = [UIFont systemFontOfSize:10];
        _symbolLabel.text = @"¥";
    }
    return _symbolLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0xe60b30);
        _moneyLabel.font = [UIFont systemFontOfSize:21];
        _moneyLabel.text = @"7999";
    }
    return _moneyLabel;
}

- (UILabel *)priceLabel {
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.textColor = RGBColorHex(0x999999);
        _priceLabel.font = [UIFont systemFontOfSize:10];
        _priceLabel.text = @"市场价格";
    }
    return _priceLabel;
}

- (UILabel *)money2Label {
    if (_money2Label == nil) {
        _money2Label = [[UILabel alloc] init];
        _money2Label.textColor = RGBColorHex(0x999999);
        _money2Label.font = [UIFont systemFontOfSize:10];
        _money2Label.text = @"¥7999";
    }
    return _money2Label;
}

- (UILabel *)salesLabel {
    if (_salesLabel == nil) {
        _salesLabel = [[UILabel alloc] init];
        _salesLabel.textColor = RGBColorHex(0xb3b3b3);
        _salesLabel.font = [UIFont systemFontOfSize:10];
        _salesLabel.text = @"销量：1W+";
    }
    return _salesLabel;
}

- (UILabel *)stockLabel {
    if (_stockLabel == nil) {
        _stockLabel = [[UILabel alloc] init];
        _stockLabel.textColor = RGBColorHex(0xb3b3b3);
        _stockLabel.font = [UIFont systemFontOfSize:10];
        _stockLabel.text = @"当前库存：1+件";
    }
    return _stockLabel;
}

- (void)setInformationModel:(ZFGoodModel *)informationModel{
    _informationModel = informationModel;
    _nameLabel.text = [NSString stringWithFormat:@"%@",_informationModel.goods_name];
    
}
@end
