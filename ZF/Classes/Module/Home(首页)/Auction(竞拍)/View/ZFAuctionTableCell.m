//
//  ZFAuctionTableCell.m
//  ZF
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFAuctionTableCell.h"

#import "ZFTool.h"


@interface ZFAuctionTableCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel* timeLabel;
@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* moneyLabel;
@property (nonatomic, strong) UILabel* startLabel;
@property (nonatomic, strong) UIButton *auctionButton;

@end

@implementation ZFAuctionTableCell

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
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.startLabel];
    [self.contentView addSubview:self.auctionButton];
    
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(365);
        make.height.mas_equalTo(260);
        make.top.mas_equalTo(40);
        make.centerX.mas_equalTo(self.contentView);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(215);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(15);
        make.centerX.mas_equalTo(self.contentView);
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(312);
        make.height.mas_equalTo(130);
        make.top.equalTo(self->_bgView.mas_top).offset(35);
        make.centerX.equalTo(self->_bgView);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_left);
        make.top.equalTo(self->_iconView.mas_bottom).offset(10);
        make.right.equalTo(self->_iconView.mas_right).offset(-30);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_nameLabel.mas_left);
        make.top.equalTo(self->_nameLabel.mas_bottom).offset(20);
    }];
    
    [_startLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_moneyLabel.mas_right);
        make.bottom.equalTo(self->_moneyLabel.mas_bottom).offset(-5);
    }];
    
    
    [_auctionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_iconView.mas_right);
        make.width.mas_equalTo(78);
        make.height.mas_equalTo(43);
        make.top.equalTo(self->_iconView.mas_bottom).offset(33);
    }];
    
}

- (void)setAuctionModel:(ZFAuctionModel *)auctionModel
{
    _auctionModel = auctionModel;
    NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,_auctionModel.original_img];
    [_iconView sd_setImageWithURL:[NSURL URLWithString:str]];
    _timeLabel.text = [ZFTool dateTextJP:_auctionModel.start_time];
    _nameLabel.text = _auctionModel.goods_name;
    _moneyLabel.text = [NSString stringWithFormat:@"¥%@",_auctionModel.start_price];
}

- (void)auctionButtonDidClick
{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(ZFAuctionTableCellDidClick:)])
    {
        [self.delegate ZFAuctionTableCellDidClick:self.auctionModel];
    }
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"haibao4"];
    }
    return _iconView;
}

- (UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = RGBColorHex(0x333333);
        _timeLabel.font = [UIFont systemFontOfSize:15];
        _timeLabel.text = @" 1月24号16：00:00准时开拍";
        _timeLabel.layer.borderWidth = 1.0f;
        _timeLabel.layer.borderColor = RGBColorHex(0xBBBBBB).CGColor;
        _timeLabel.backgroundColor = RGBColorHex(0xffffff);
    }
    return _timeLabel;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x101010);
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.text = @"婴儿奶粉2019....";
    }
    return _nameLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0xE8315D);
        _moneyLabel.font = [UIFont systemFontOfSize:28];
        _moneyLabel.text = @"¥189";
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


- (UIButton *)auctionButton {
    if (_auctionButton == nil) {
        _auctionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _auctionButton.backgroundColor = RGBColorHex(0xFF5722);
        [_auctionButton setTitle:@"参与竞拍" forState:UIControlStateNormal];
        _auctionButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_auctionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _auctionButton.layer.cornerRadius = 4;
        _auctionButton.clipsToBounds = YES;
        [_auctionButton addTarget:self action:@selector(auctionButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _auctionButton;
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
