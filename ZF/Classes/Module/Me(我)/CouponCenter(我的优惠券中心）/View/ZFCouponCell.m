//
//  ZFCouponCell.m
//  ZF
//
//  Created by weiming zhang on 2019/3/21.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFCouponCell.h"
#import "ZFQRCodeView.h"
#import "TYShowAlertView.h"
@interface ZFCouponCell()
@property (nonatomic, strong)UIImageView *bgView;
@property (nonatomic, strong)UILabel *currencylabel;
@property (nonatomic, strong)UILabel *reduceLabel;
@property (nonatomic, strong)UILabel *requireLabel;
@property (nonatomic, strong)UIView *couponView;
@property (nonatomic, strong)UIImageView *couponimageView;
@property (nonatomic, strong)UILabel *kindLabel;
@property (nonatomic, strong)UILabel *detailKindLabel;
@property (nonatomic, strong)UILabel *lastTimeLabel;
@property (nonatomic, strong)UIButton *useButton;


@end

@implementation ZFCouponCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}


- (void)setup{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = RGBColorHex(0xf5f5f5);
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.currencylabel];
    [self.contentView addSubview:self.reduceLabel];
    [self.contentView addSubview:self.requireLabel];
    [self.contentView addSubview:self.couponView];
    [self.couponView addSubview:self.couponimageView];
    [self.couponView addSubview:self.kindLabel];
    [self.contentView addSubview:self.detailKindLabel];
    [self.contentView addSubview:self.lastTimeLabel];
    [self.contentView addSubview:self.useButton];
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
        make.left.equalTo(self).with.offset(50);
    }];
    [_couponView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_requireLabel.mas_right).with.offset(30);
        make.top.equalTo(self->_reduceLabel.mas_top);
    }];
    [_couponimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self->_couponView).insets(UIEdgeInsetsMake(0, 0,0 ,0));
    }];
    [_kindLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self->_couponView.mas_centerX).with.offset(3);
        make.centerY.equalTo(self->_couponView.mas_centerY);
    }];
    [_detailKindLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_couponView.mas_right).with.offset(12);
        make.centerY.equalTo(self->_couponView.mas_centerY);
    }];
    [_lastTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_couponView.mas_bottom).with.offset(21);
        make.left.equalTo(self->_couponView.mas_left);
    }];
    [_useButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).with.offset(-10);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(90);
        make.height.mas_equalTo(27);
    }];
    
}
#pragma mark --加载控件
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
- (UIView *)couponView{
    if (_couponView == nil) {
        _couponView = [[UIView alloc]init];
        
    }
    return _couponView;
}
- (UIImageView *)couponimageView{
    if (_couponimageView ==nil) {
        _couponimageView = [[UIImageView alloc]init];
        [_couponimageView setImage:[UIImage imageNamed:@"label_a"]];
    }
    return _couponimageView;
}
- (UILabel *)kindLabel{
    if (_kindLabel ==nil) {
        _kindLabel = [[UILabel alloc]init];
        [_kindLabel setText:@"智丰券"];
        [_kindLabel setFont:[UIFont systemFontOfSize:10]];
        [_kindLabel setTextColor:RGBColorHex(0xffffff)];
    }
    return _kindLabel;
}
- (UILabel *)detailKindLabel{
    if (_detailKindLabel ==nil) {
        _detailKindLabel = [[UILabel alloc]init];
        [_detailKindLabel setTextColor:RGBColorHex(0x333333)];
        [_detailKindLabel setFont:[UIFont systemFontOfSize:12]];
        [_detailKindLabel setText:@"全品类"];
    }
    return _detailKindLabel;
}
- (UILabel *)lastTimeLabel{
    if (_lastTimeLabel == nil) {
        _lastTimeLabel = [[UILabel alloc]init];
        [_lastTimeLabel setText:@"使用时间:2019.01.25-2019.02.25"];
        [_lastTimeLabel setFont:[UIFont systemFontOfSize:11]];
        [_lastTimeLabel setTextColor:RGBColorHex(0x333333)];
    }
    return _lastTimeLabel;
}
- (UIButton *)useButton{
    if (_useButton ==nil) {
        _useButton = [[UIButton alloc]init];
        _useButton.layer.cornerRadius = 3;
        _useButton.backgroundColor = RGBColorHex(0xf75c61);
        [_useButton setTitle:@"立即使用" forState:UIControlStateNormal];
        [_useButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        [_useButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [_useButton addTarget:self action:@selector(useClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _useButton;
}
#pragma mark --根据type改变控件颜色
- (void)setCellType:(NSInteger )type{
    switch (type) {
        case 0:
            break;
        case 1:{
            self.bgView.image = [UIImage imageNamed:@"preferential_b"];
            self.currencylabel.textColor = RGBColorHex(0xd87b7e);
            self.reduceLabel.textColor = RGBColorHex(0xd87b7e);
            self.requireLabel.textColor = RGBColorHex(0xd87b7e);
            self.couponimageView.image = [UIImage imageNamed:@"label_b"];
            self.useButton.backgroundColor = RGBColorHex(0xd87b7e);
            [self.useButton setTitle:@"已使用" forState:UIControlStateNormal];
            self.useButton.userInteractionEnabled=NO;
            break;
        }
        case 2:
            self.bgView.image = [UIImage imageNamed:@"preferential_c"];
            self.currencylabel.textColor = RGBColorHex(0xada5a5);
            self.reduceLabel.textColor = RGBColorHex(0xada5a5);
            self.requireLabel.textColor = RGBColorHex(0xada5a5);
            self.couponimageView.image = [UIImage imageNamed:@"label_c"];
            self.useButton.backgroundColor = RGBColorHex(0xada5a5);
            [self.useButton setTitle:@"已过期" forState:UIControlStateNormal];
            self.useButton.userInteractionEnabled=NO;
            break;
    }
}
- (UITableViewController *)viewController
{
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponser = [next nextResponder];
        if ([nextResponser isKindOfClass:[UITableViewController class]]) {
            return (UITableViewController *)nextResponser;
        }
    }
    return nil;
}
//使用优惠券
- (void)useClick{
    ZFQRCodeView *view = [[ZFQRCodeView alloc]init];
    
    [TYShowAlertView showAlertViewWithView:view backgoundTapDismissEnable:YES];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.superview).with.offset(189);
        make.left.equalTo(view.superview).with.offset(53);
        make.width.mas_equalTo(270);
        make.height.mas_equalTo(289);
    }];
}
@end
