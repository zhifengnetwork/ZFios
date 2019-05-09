//
//  ZFTotalAssetsTableCell.m
//  ZF
//
//  Created by admin on 2019/3/16.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFTotalAssetsTableCell.h"

@interface ZFTotalAssetsTableCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel* moneyLabel;
@property (nonatomic, strong) UILabel* totalMoneyLabel;

@end

@implementation ZFTotalAssetsTableCell

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
    self.contentView.backgroundColor = TableViewBGColor;
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.totalMoneyLabel];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(5);
        make.bottom.mas_equalTo(0);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(55);
        make.centerY.equalTo(self.contentView).offset(2);
    }];
    
    [_totalMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_moneyLabel.mas_right).offset(60);
//        make.right.mas_equalTo(-55);
        make.centerY.equalTo(self.contentView).offset(2);
    }];
    
    //竖线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xf5f5f5);
    [self.contentView addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.mas_equalTo(10.0f);
         make.centerX.equalTo(self.contentView);
         make.width.mas_equalTo(0.5f);
         make.height.mas_equalTo(55.0f);
     }];
    
    
}

-(void)setWithdraModel:(ZFWithdrawModel *)withdraModel
{
    _withdraModel = withdraModel;
    
    _moneyLabel.text = [NSString stringWithFormat:@"累积收益¥%@元",_withdraModel.distribut_money];
    _totalMoneyLabel.text = [NSString stringWithFormat:@"资产总计¥%.2f(元)",_withdraModel.total_property];
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0x333333);
        _moneyLabel.font = [UIFont systemFontOfSize:12];
        _moneyLabel.text = @"积累收益¥670元";
    }
    return _moneyLabel;
}

- (UILabel *)totalMoneyLabel {
    if (_totalMoneyLabel == nil) {
        _totalMoneyLabel = [[UILabel alloc] init];
        _totalMoneyLabel.textColor = RGBColorHex(0x333333);
        _totalMoneyLabel.font = [UIFont systemFontOfSize:12];
        _totalMoneyLabel.text = @"资产总计¥670(元)";
    }
    return _totalMoneyLabel;
}

-(UIView *)bgView
{
    if(_bgView==nil)
    {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.clipsToBounds = YES;
        _bgView.layer.cornerRadius = 13.0f;
    }
    return _bgView;
}

@end
