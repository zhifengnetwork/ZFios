//
//  ZFAssembleCollectionCell.m
//  ZF
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFAssembleCollectionCell.h"
#import "UIImageView+WebCache.h"

@interface ZFAssembleCollectionCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* moneyLabel;


@end

@implementation ZFAssembleCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.contentView.backgroundColor = RGBColorHex(0xf3f5f7);
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.moneyLabel];
    
    
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(15);
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(165);
        make.height.mas_equalTo(220);
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left);
        make.right.equalTo(self->_bgView.mas_right);
        make.top.equalTo(self->_bgView.mas_top);
        make.width.mas_equalTo(165);
        make.height.mas_equalTo(140);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(5);
        make.right.equalTo(self->_bgView.mas_right).offset(-5);
        make.top.equalTo(self->_iconView.mas_bottom).offset(5);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(10);
        make.right.equalTo(self->_bgView.mas_right).offset(-10);
        make.top.equalTo(self->_nameLabel.mas_bottom).offset(5);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self->_bgView);
        make.top.equalTo(self->_titleLabel.mas_bottom).offset(5);
    }];
    
}

-(void)setAssembleModel:(ZFAssembleModel *)assembleModel
{
    _assembleModel = assembleModel;
    
    if (!kStringIsEmpty(_assembleModel.original_img))
    {
        NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,_assembleModel.original_img];
        [_iconView sd_setImageWithURL:[NSURL URLWithString:str]];
    }
    _nameLabel.text = _assembleModel.act_name;
    _titleLabel.text = [NSString stringWithFormat:@"%@",_assembleModel.goods_name];
    _moneyLabel.text = [NSString stringWithFormat:@"¥ %@",_assembleModel.group_price];
}



- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"snank"];
    }
    return _iconView;
}


- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x101010);
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.text = @"强泰家居用品创意(透明)";
        _nameLabel.numberOfLines = 0;
    }
    return _nameLabel;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x999999);
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.text = @"居家生活y实用厨房用品用具小百货东西(东西)";
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0xfe0000);
        _moneyLabel.font = [UIFont systemFontOfSize:16];
        _moneyLabel.text = @"¥ 20";
    }
    return _moneyLabel;
}

-(UIView *)bgView
{
    if(_bgView==nil)
    {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = RGBColorHex(0xffffff);
        _bgView.layer.cornerRadius = 3.0f;
    }
    return _bgView;
}

@end
