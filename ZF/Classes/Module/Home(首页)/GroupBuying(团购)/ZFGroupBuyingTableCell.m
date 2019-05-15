//
//  ZFGroupBuyingTableCell.m
//  ZF
//
//  Created by admin on 2019/5/14.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFGroupBuyingTableCell.h"
#import "UIImageView+WebCache.h"
#import "ZFTool.h"

@interface ZFGroupBuyingTableCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* discountLabel;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* numberLabel;
@property (nonatomic, strong) UILabel* timeLabel;
@property (nonatomic, strong) UILabel* moneyLabel;
@property (nonatomic, strong) UILabel* evaluateLabel;

@end

@implementation ZFGroupBuyingTableCell

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
    [self.contentView addSubview:self.discountLabel];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.numberLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.evaluateLabel];
    
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(10);
        make.width.mas_equalTo(168);
        make.height.mas_equalTo(236);
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(5);
        make.right.equalTo(self->_bgView.mas_right).offset(-5);
        make.top.equalTo(self->_bgView.mas_top).offset(5);
        make.width.height.mas_equalTo(165);
    }];
    
    [_discountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(15);
        make.top.equalTo(self->_iconView.mas_top);
        make.right.equalTo(self->_iconView.mas_right);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(5);
        make.right.equalTo(self->_bgView.mas_right).offset(-5);
        make.top.equalTo(self->_iconView.mas_bottom).offset(5);
    }];
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(5);
        make.top.equalTo(self->_nameLabel.mas_bottom).offset(6);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_numberLabel.mas_right).offset(15);
        make.top.equalTo(self->_nameLabel.mas_bottom).offset(6);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_left).offset(5);
        make.top.equalTo(self->_numberLabel.mas_bottom).offset(8);
    }];
    
    [_evaluateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_bgView.mas_right).offset(-15);
        make.top.equalTo(self->_timeLabel.mas_bottom).offset(12);
    }];
    
}

-(void)setGroupBuyingModel:(ZFGroupBuyingModel *)groupBuyingModel
{
    _groupBuyingModel = groupBuyingModel;
    
    if (!kStringIsEmpty(_groupBuyingModel.original_img))
    {
        NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,_groupBuyingModel.original_img];
        [_iconView sd_setImageWithURL:[NSURL URLWithString:str]];
    }
    _nameLabel.text = _groupBuyingModel.goods_name;
    _numberLabel.text = [NSString stringWithFormat:@"%@参与",_groupBuyingModel.goods_num];
    _timeLabel.text = [ZFTool GroupBuying:_groupBuyingModel.end_time];
    _moneyLabel.text = [NSString stringWithFormat:@"¥%@",_groupBuyingModel.price];
    _evaluateLabel.text = [NSString stringWithFormat:@"评价: %@",_groupBuyingModel.comment_count];
    _discountLabel.text = [NSString stringWithFormat:@" %@折",_groupBuyingModel.rebate];
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
        _nameLabel.font = [UIFont systemFontOfSize:10];
        _nameLabel.text = @"羽绒服短款 韩版鸭绒休闲宽松韩国外套潮";
    }
    return _nameLabel;
}

- (UILabel *)numberLabel {
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.textColor = RGBColorHex(0x5b5b5b);
        _numberLabel.font = [UIFont systemFontOfSize:9];
        _numberLabel.text = @"234参与";
    }
    return _numberLabel;
}

- (UILabel *)discountLabel {
    if (_discountLabel == nil) {
        _discountLabel = [[UILabel alloc] init];
        _discountLabel.textColor = RGBColorHex(0xffffff);
        _discountLabel.backgroundColor = RGBColorHex(0xff0000);
        _discountLabel.font = [UIFont systemFontOfSize:9];
        _discountLabel.text = @"2折";
    }
    return _discountLabel;
}

- (UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = RGBColorHex(0x5b5b5b);
        _timeLabel.font = [UIFont systemFontOfSize:9];
        _timeLabel.text = @"剩余15天03小时25分8秒";
    }
    return _timeLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0xf60808);
        _moneyLabel.font = [UIFont systemFontOfSize:15];
        _moneyLabel.text = @"¥ 368.00";
    }
    return _moneyLabel;
}

- (UILabel *)evaluateLabel {
    if (_evaluateLabel == nil) {
        _evaluateLabel = [[UILabel alloc] init];
        _evaluateLabel.textColor = RGBColorHex(0x5b5b5b);
        _evaluateLabel.font = [UIFont systemFontOfSize:9];
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
