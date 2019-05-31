//
//  ZFSpikeMerchandiseTableViewCell.m
//  ZF
//
//  Created by apple on 2019/3/2.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFSpikeMerchandiseTableViewCell.h"


@interface ZFSpikeMerchandiseTableViewCell()

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* moneyLabel;
@property (nonatomic, strong) UILabel* money2Label;

@end

@implementation ZFSpikeMerchandiseTableViewCell

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
    self.backgroundColor = RGBColorHex(0xF9F5F0);
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.money2Label];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(8);
        make.top.mas_equalTo(15);
        make.width.height.mas_equalTo(100);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_left).offset(10);
        make.right.mas_equalTo(-5);
        make.top.equalTo(self->_iconView.mas_bottom).offset(10);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.equalTo(self->_nameLabel.mas_bottom).offset(5);
    }];
    
    [_money2Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_moneyLabel.mas_right).offset(5);
        make.centerY.equalTo(self->_moneyLabel);
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

-(void)setPlantingModel:(ZFPlantingModel *)plantingModel
{
    _plantingModel = plantingModel;
    
    if (!kStringIsEmpty(plantingModel.original_img))
    {
        NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,plantingModel.original_img];
        [_iconView sd_setImageWithURL:[NSURL URLWithString:str]];
    }
    _nameLabel.text = _plantingModel.goods_name;
    _moneyLabel.text = [NSString stringWithFormat:@"¥%@",_plantingModel.price];
    _money2Label.text = [NSString stringWithFormat:@"¥%@",_plantingModel.shop_price];
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
        _nameLabel.textColor = RGBColorHex(0x333333);
        _nameLabel.font = [UIFont systemFontOfSize:13];
        _nameLabel.text = @"DR Darry Ring 求婚钻戒";
        _nameLabel.numberOfLines = 0;
    }
    return _nameLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0xe8305c);
        _moneyLabel.font = [UIFont systemFontOfSize:12];
        _moneyLabel.text = @"¥ 8500";
    }
    return _moneyLabel;
}

- (UILabel *)money2Label {
    if (_money2Label == nil) {
        _money2Label = [[UILabel alloc] init];
        _money2Label.textColor = RGBColorHex(0x999999);
        _money2Label.font = [UIFont systemFontOfSize:10];
        _money2Label.text = @"¥ 10500";
    }
    return _money2Label;
}


@end
