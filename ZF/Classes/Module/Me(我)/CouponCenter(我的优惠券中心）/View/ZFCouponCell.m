//
//  ZFCouponCell.m
//  ZF
//
//  Created by weiming zhang on 2019/3/21.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFCouponCell.h"
@interface ZFCouponCell()
@property (nonatomic, strong)UIImageView *bgView;
@property (nonatomic, strong)UILabel *currencylabel;
@property (nonatomic, strong)UILabel *reduceLabel;
@property (nonatomic, strong)UILabel *requireLabel;
@property (nonatomic, strong)UIImageView *CouponImagView;

@end

@implementation ZFCouponCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}


- (void)setup{
    self.backgroundColor = RGBColorHex(0xf5f5f5);
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.currencylabel];
    [self.contentView addSubview:self.reduceLabel];
    [self.contentView addSubview:self.requireLabel];
    [self.contentView addSubview:self.CouponImagView];
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(20);
        make.left.equalTo(self).with.offset(16);
        make.right.equalTo(self).with.offset(-16);
    }];
    [_currencylabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(85);
        make.left.equalTo(self).with.offset(73);
    }];
    [_reduceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_currencylabel.mas_right).with.offset(4);
        make.bottom.equalTo(self->_currencylabel.mas_bottom);
    }];
    [_requireLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_reduceLabel.mas_bottom).with.offset(12);
        make.left.equalTo(self).with.offset(34);
    }];
    [_CouponImagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_requireLabel.mas_right).with.offset(30);
        make.top.equalTo(self->_reduceLabel.mas_top);
    }];
}
- (UIImageView *)bgView{
    if (_bgView == nil) {
        _bgView = [[UIImageView alloc]init];
        _bgView.image = [UIImage imageNamed:@"preferential_a"];
    }
    return _bgView;
}
- (UILabel *)currencylabel{
    if (_currencylabel == nil) {
        _currencylabel = [[UILabel alloc]init];
        [_currencylabel setText:@"￥"];
        [_currencylabel setFont:[UIFont systemFontOfSize:12]];
        [_currencylabel setTextColor:RGBColorHex(0xff5722)];
    }
    return _currencylabel;
}
- (UILabel *)reduceLabel{
    if (_reduceLabel == nil) {
        _reduceLabel = [[UILabel alloc]init];
        [_reduceLabel setText:@"8"];
        [_reduceLabel setFont:[UIFont fontWithName:@"PingFang-SC-Bold" size:32]];
        [_reduceLabel setTextColor:RGBColorHex(0xff5722)];
    }
    return _reduceLabel;
}
- (UILabel *)requireLabel{
    if (_requireLabel == nil) {
        _requireLabel = [[UILabel alloc]init];
        [_requireLabel setTextColor:RGBColorHex(0xff5722)];
        [_requireLabel setFont:[UIFont systemFontOfSize:13]];
        [_requireLabel setText:@"满120元可用"];
    }
    return _requireLabel;
}
@end
