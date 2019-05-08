//
//  ZFAuctionEndTableCell.m
//  ZF
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFAuctionEndTableCell.h"
#import "UIImageView+WebCache.h"
#import "ZFTool.h"

@interface ZFAuctionEndTableCell()

@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* tradeNameLabel;
@property (nonatomic, strong) UILabel* moneyLabel;
@property (nonatomic, strong) UILabel* startLabel;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView* headView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* highestLabel;

@end

@implementation ZFAuctionEndTableCell

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
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.tradeNameLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.startLabel];
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.headView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.highestLabel];
    
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(195);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(10);
        make.centerX.mas_equalTo(self.contentView);
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(312);
        make.height.mas_equalTo(130);
        make.top.equalTo(self->_titleLabel.mas_bottom).offset(20);
        make.centerX.mas_equalTo(self.contentView);
    }];
    
    [_tradeNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_left);
        make.right.equalTo(self->_iconView.mas_right);
        make.top.equalTo(self->_iconView.mas_bottom).offset(10);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_tradeNameLabel.mas_left).offset(-10);
        make.top.equalTo(self->_tradeNameLabel.mas_bottom).offset(50);
    }];
    
    [_startLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_moneyLabel.mas_right);
        make.bottom.equalTo(self->_moneyLabel.mas_bottom);
    }];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(60);
        make.right.equalTo(self->_iconView.mas_right);
        make.top.equalTo(self->_tradeNameLabel.mas_bottom).offset(12);
        make.bottom.equalTo(self->_startLabel.mas_bottom);
    }];
    
    [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(5);
        make.width.height.mas_equalTo(40);
        make.centerY.mas_equalTo(self->_bgView);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_headView.mas_right).offset(8);
        make.centerY.mas_equalTo(self->_headView);
    }];
    
    [_highestLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_nameLabel.mas_right).offset(10);
        make.centerY.mas_equalTo(self->_headView);
    }];
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xBBBBBB);
    [self.contentView addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.mas_equalTo(0);
         make.right.mas_equalTo(-0);
         make.top.equalTo(self->_moneyLabel.mas_bottom).offset(25);
         make.height.mas_equalTo(0.5f);
     }];
    
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    _titleLabel.text = _title;
}

- (void)setDetailsModel:(ZFdetailsModel *)detailsModel
{
    _detailsModel = detailsModel;
    NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,_detailsModel.original_img];
    [_iconView sd_setImageWithURL:[NSURL URLWithString:str]];
    _tradeNameLabel.text = _detailsModel.goods_name;
    _moneyLabel.text = [NSString stringWithFormat:@"¥%@",_detailsModel.start_price];
    _titleLabel.text = [ZFTool startDate:_detailsModel.end_time];

}

-(void)setBondUserModel:(ZFBondUserModel *)bondUserModel
{
    _bondUserModel = bondUserModel;
    //显示头像
    [_headView sd_setImageWithURL:[NSURL URLWithString:_bondUserModel.head_pic]];
    _highestLabel.text = [NSString stringWithFormat:@"当前最高¥%@",_bondUserModel.offer_price];
}

- (void)setStartAuctionModel:(ZFStartAuctionModel *)startAuctionModel
{
    _startAuctionModel = startAuctionModel;
    
    //显示头像
//    [_headView sd_setImageWithURL:[NSURL URLWithString:_startAuctionModel.head_pic]];
//    _highestLabel.text = [NSString stringWithFormat:@"当前最高¥ %@",_startAuctionModel.offer_price];
    
}


- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0xE8315D);
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.text = @"            竞拍已经结束";
        _titleLabel.layer.borderWidth = 1.0f;
        _titleLabel.layer.borderColor = RGBColorHex(0xE8315D).CGColor;
        
    }
    return _titleLabel;
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"haibao4"];
    }
    return _iconView;
}

- (UILabel *)tradeNameLabel {
    if (_tradeNameLabel == nil) {
        _tradeNameLabel = [[UILabel alloc] init];
        _tradeNameLabel.textColor = RGBColorHex(0x101010);
        _tradeNameLabel.font = [UIFont systemFontOfSize:15];
        _tradeNameLabel.text = @"Soper Rugby Highlanders Jersay 高地人橄榄球衣";
        _tradeNameLabel.numberOfLines = 0;
    }
    return _tradeNameLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0xE8315D);
        _moneyLabel.font = [UIFont systemFontOfSize:28];
        _moneyLabel.text = @"¥ 79";
    }
    return _moneyLabel;
}

- (UILabel *)startLabel {
    if (_startLabel == nil) {
        _startLabel = [[UILabel alloc] init];
        _startLabel.textColor = RGBColorHex(0x101010);
        _startLabel.font = [UIFont systemFontOfSize:14];
        _startLabel.text = @"起拍";
    }
    return _startLabel;
}

- (UIImageView *)headView {
    if (_headView == nil) {
        _headView = [[UIImageView alloc] init];
        _headView.image = [UIImage imageNamed:@"weixi"];
        _headView.layer.cornerRadius = 20;
        _headView.clipsToBounds = YES;
    }
    return _headView;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x333333);
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.text = @"张三";
    }
    return _nameLabel;
}

- (UILabel *)highestLabel {
    if (_highestLabel == nil) {
        _highestLabel = [[UILabel alloc] init];
        _highestLabel.textColor = RGBColorHex(0x333333);
        _highestLabel.font = [UIFont systemFontOfSize:12];
        _highestLabel.text = @"当前最高¥ 90";
    }
    return _highestLabel;
}

-(UIView *)bgView
{
    if(_bgView==nil)
    {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = RGBColorHex(0xffffff);
        _bgView.layer.borderWidth = 1.0f;
        _bgView.layer.borderColor = RGBColorHex(0xBBBBBB).CGColor;
    }
    return _bgView;
}

@end
