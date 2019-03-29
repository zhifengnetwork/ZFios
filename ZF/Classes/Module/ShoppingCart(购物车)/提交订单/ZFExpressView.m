//
//  ZFExpressView.m
//  ZF
//
//  Created by weiming zhang on 2019/3/28.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFExpressView.h"
@interface ZFExpressView()
@property (nonatomic, strong)UILabel *expressLabel;
@property (nonatomic, strong)UIButton *addExpressButton;
@property (nonatomic, strong)UIView *lineview;
@property (nonatomic, strong)UILabel *couponLabel;
@property (nonatomic, strong)UIButton *addCouponButton;
@property (nonatomic, strong)UIView *lineView2;
@property (nonatomic, strong)UILabel *redPacketLabel;
@property (nonatomic, strong)UIButton *addRedPacketButton;
@end
@implementation ZFExpressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    [self addSubview:self.expressLabel];
    [self addSubview:self.addExpressButton];
    [self addSubview:self.lineview];
    [self addSubview:self.couponLabel];
    [self addSubview:self.addCouponButton];
    [self addSubview:self.lineView2];
    [self addSubview:self.redPacketLabel];
    [self addSubview:self.addRedPacketButton];
    
    
    [_expressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).with.offset(10);
        make.top.equalTo(self).with.offset(15);
    }];
    [_addExpressButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(15);
        make.right.equalTo(self).with.offset(-10);
    }];
    [_addExpressButton setTitleEdgeInsets:UIEdgeInsetsMake(0,  -_addExpressButton.imageView.frame.size.width - 12, 0, _addExpressButton.imageView.frame.size.width + 12)];
    [_addExpressButton setImageEdgeInsets:UIEdgeInsetsMake(0 , _addExpressButton.titleLabel.bounds.size.width, 0,
        -_addExpressButton.titleLabel.bounds.size.width)];
    
    [_lineview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.expressLabel.mas_bottom).with.offset(15);
        make.left.mas_equalTo(self).with.offset(10);
        make.right.mas_equalTo(self).with.offset(-10);
        make.height.mas_equalTo(1);
    }];
    [_couponLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.top.equalTo(self.lineview.mas_bottom).with.offset(15);
    }];
    [_addCouponButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineview.mas_bottom).with.offset(15);
        make.right.equalTo(self).with.offset(-10);
    }];
    [_addCouponButton setTitleEdgeInsets:UIEdgeInsetsMake(0,  -_addCouponButton.imageView.frame.size.width - 12, 0, _addCouponButton.imageView.frame.size.width + 12)];
    [_addCouponButton setImageEdgeInsets:UIEdgeInsetsMake(0 , _addCouponButton.titleLabel.bounds.size.width, 0,
        -_addCouponButton.titleLabel.bounds.size.width)];
    [_lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.couponLabel.mas_bottom).with.offset(15);
        make.left.mas_equalTo(self).with.offset(10);
        make.right.mas_equalTo(self).with.offset(-10);
        make.height.mas_equalTo(1);
    }];
    [_redPacketLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.top.equalTo(self.lineView2.mas_bottom).with.offset(15);
    }];
    [_addRedPacketButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView2.mas_bottom).with.offset(15);
        make.right.equalTo(self).with.offset(-10);
    }];
    [_addRedPacketButton setTitleEdgeInsets:UIEdgeInsetsMake(0,  -_addRedPacketButton.imageView.frame.size.width - 12, 0, _addRedPacketButton.imageView.frame.size.width + 12)];
    [_addRedPacketButton setImageEdgeInsets:UIEdgeInsetsMake(0 , _addRedPacketButton.titleLabel.bounds.size.width, 0,
        -_addRedPacketButton.titleLabel.bounds.size.width)];
}
- (UILabel *)expressLabel{
    if (_expressLabel == nil) {
        _expressLabel = [[UILabel alloc]init];
        _expressLabel.font = [UIFont systemFontOfSize:14];
        _expressLabel.text = @"配送";
        _expressLabel.textColor = RGBColorHex(0x0f0f0f);
    }
    return _expressLabel;
}
- (UIButton *)addExpressButton{
    if (_addExpressButton == nil) {
        _addExpressButton = [[UIButton alloc]init];
        [_addExpressButton setImage:[UIImage imageNamed:@"down_b"] forState:UIControlStateNormal];
        [_addExpressButton setTitle:@"第三方快递" forState:UIControlStateNormal];
        [_addExpressButton setTitleColor:RGBColorHex(0x0f0f0f) forState:UIControlStateNormal];
        _addExpressButton.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _addExpressButton;
}
- (UIView *)lineview{
    if (_lineview == nil) {
        _lineview = [[UIView alloc]init];
        _lineview.backgroundColor = RGBColorHex(0xf5f5f5);
    }
    return _lineview;
}
- (UILabel *)couponLabel{
    if (_couponLabel == nil) {
        _couponLabel= [[UILabel alloc]init];
        _couponLabel.font = [UIFont systemFontOfSize:14];
        _couponLabel.text = @"优惠券";
        _couponLabel.textColor = RGBColorHex(0x0f0f0f);
        
    }
    return _couponLabel;
}
- (UIButton *)addCouponButton{
    if (_addCouponButton == nil) {
        _addCouponButton = [[UIButton alloc]init];
        [_addCouponButton setImage:[UIImage imageNamed:@"down_b"] forState:UIControlStateNormal];
        [_addCouponButton setTitle:@"暂无可用" forState:UIControlStateNormal];
        [_addCouponButton setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
        _addCouponButton.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _addCouponButton;
}
- (UIView *)lineView2{
    if (_lineView2 == nil) {
        _lineView2 = [[UIView alloc]init];
        _lineView2.backgroundColor = RGBColorHex(0xf5f5f5);
    }
    return _lineView2;
}
- (UILabel *)redPacketLabel{
    if (_redPacketLabel == nil) {
        _redPacketLabel = [[UILabel alloc]init];
        _redPacketLabel.font = [UIFont systemFontOfSize:14];
        _redPacketLabel.text = @"红包";
        _redPacketLabel.textColor = RGBColorHex(0x0f0f0f);
    }
    return _redPacketLabel;
}
- (UIButton *)addRedPacketButton{
    if (_addRedPacketButton == nil) {
        _addRedPacketButton = [[UIButton alloc]init];
        [_addRedPacketButton setImage:[UIImage imageNamed:@"down_b"] forState:UIControlStateNormal];
        [_addRedPacketButton setTitle:@"暂无可用" forState:UIControlStateNormal];
        [_addRedPacketButton setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
        _addRedPacketButton.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _addRedPacketButton;
}
@end
