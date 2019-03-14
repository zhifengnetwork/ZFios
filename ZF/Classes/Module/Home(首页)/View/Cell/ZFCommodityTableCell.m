//
//  ZFCommodityTableCell.m
//  ZF
//
//  Created by apple on 2019/2/27.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFCommodityTableCell.h"

@interface ZFCommodityTableCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* moneyLabel;
@property (nonatomic, strong) UILabel* evaluateLabel;

@end

@implementation ZFCommodityTableCell

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
    self.contentView.backgroundColor = RGBColorHex(0xf3f5f7);
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.evaluateLabel];
    
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(168);
        make.height.mas_equalTo(222);
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(5);
        make.right.equalTo(self->_bgView.mas_right).offset(-5);
        make.top.equalTo(self->_bgView.mas_top).offset(5);
        make.width.height.mas_equalTo(160);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(5);
        make.right.equalTo(self->_bgView.mas_right).offset(-5);
        make.top.equalTo(self->_iconView.mas_bottom).offset(5);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(5);
        make.top.equalTo(self->_nameLabel.mas_bottom).offset(2);
    }];
    
    [_evaluateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_bgView.mas_right).offset(-15);
        make.top.equalTo(self->_nameLabel.mas_bottom).offset(3);
    }];
   
}

-(void)setIsShowButton:(BOOL)isShowButton
{
    _isShowButton = isShowButton;
    
    _evaluateLabel.hidden = !_isShowButton;
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
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.text = @"羽绒服短款 韩版鸭绒休闲宽松韩国外套潮";
        _nameLabel.numberOfLines = 0;
    }
    return _nameLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0xfe0000);
        _moneyLabel.font = [UIFont systemFontOfSize:15];
        _moneyLabel.text = @"¥ 1399.00";
    }
    return _moneyLabel;
}

- (UILabel *)evaluateLabel {
    if (_evaluateLabel == nil) {
        _evaluateLabel = [[UILabel alloc] init];
        _evaluateLabel.textColor = RGBColorHex(0x4b4b4b);
        _evaluateLabel.font = [UIFont systemFontOfSize:12];
        _evaluateLabel.text = @"评价:100";
    }
    return _evaluateLabel;
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
