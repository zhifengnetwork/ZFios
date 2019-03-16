//
//  ZFTotalAssetsTableCell.m
//  ZF
//
//  Created by admin on 2019/3/16.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFTotalAssetsTableCell.h"

@interface ZFTotalAssetsTableCell()

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
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.totalMoneyLabel];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(55);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_totalMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-55);
        make.centerY.equalTo(self.contentView);
    }];
    
    //竖线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xcccccc);
    [self.contentView addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.centerX.centerY.equalTo(self.contentView);
         make.width.mas_equalTo(0.5f);
         make.height.mas_equalTo(60.0f);
     }];
    
    
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

@end
