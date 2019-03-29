//
//  ZFShareSuccessView.m
//  ZF
//
//  Created by weiming zhang on 2019/3/29.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFShareSuccessView.h"
@interface ZFShareSuccessView()
@property (nonatomic, strong)UIImageView *ribbonImageView;
@property (nonatomic, strong)UIImageView *picImageView;
@property (nonatomic, strong)UILabel *congratulateLabel;
@property (nonatomic, strong)UILabel *increaseIntegral;
@property (nonatomic, strong)UILabel *totalIntegral;
@property (nonatomic, strong)UIButton *ensureButton;
@end
@implementation ZFShareSuccessView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 10;
    [self addSubview:self.ribbonImageView];
    [self addSubview:self.picImageView];
    [self addSubview:self.congratulateLabel];
    [self addSubview:self.increaseIntegral];
    [self addSubview:self.totalIntegral];
    [self addSubview:self.ensureButton];
    [_ribbonImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self).with.offset(-10);
    }];
    [_picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(58);
        make.centerX.equalTo(self.mas_centerX);
    }];
    [_congratulateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.picImageView.mas_bottom).with.offset(20);
        make.centerX.equalTo(self.mas_centerX);
    }];
    [_increaseIntegral mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.congratulateLabel.mas_bottom).with.offset(10);
        make.centerX.equalTo(self.mas_centerX);
    }];
    [_totalIntegral mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.increaseIntegral.mas_bottom).with.offset(10);
        make.centerX.equalTo(self.mas_centerX);
    }];
    [_ensureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.totalIntegral.mas_bottom).with.offset(20);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(130);
        make.height.mas_equalTo(30);
    }];
}
- (UIImageView *)ribbonImageView{
    if (_ribbonImageView == nil) {
        _ribbonImageView = [[UIImageView alloc]init];
        _ribbonImageView.image = [UIImage imageNamed:@"ribbon"];
    }
    return _ribbonImageView;
}
- (UIImageView *)picImageView{
    if (_picImageView == nil) {
        _picImageView = [[UIImageView alloc]init];
        _picImageView.image = [UIImage imageNamed:@"pic"];
    }
    return _picImageView;
}
- (UILabel *)congratulateLabel{
    if (_congratulateLabel == nil) {
        _congratulateLabel = [[UILabel alloc]init];
        _congratulateLabel.font = [UIFont boldSystemFontOfSize:14];
        _congratulateLabel.textColor = RGBColorHex(0x000000);
        _congratulateLabel.text = @"恭 喜 你 获 得 积 分 !";
    }
    return _congratulateLabel;
}
- (UILabel *)increaseIntegral{
    if (_increaseIntegral == nil) {
        _increaseIntegral = [[UILabel alloc]init];
        _increaseIntegral.font = [UIFont systemFontOfSize:10];
        _increaseIntegral.textColor = RGBColorHex(0x4d4d4d);
        _increaseIntegral.text = @"+ 1 0 积 分";
    }
    return _increaseIntegral;
}
- (UILabel *)totalIntegral{
    if (_totalIntegral == nil) {
        _totalIntegral = [[UILabel alloc]init];
        _totalIntegral.font = [UIFont systemFontOfSize:10];
        _totalIntegral.textColor = RGBColorHex(0x4d4d4d);
        _totalIntegral.text = @"积 分 ：2 1 5 8";
    }
    return _totalIntegral;
}
- (UIButton *)ensureButton{
    if (_ensureButton == nil) {
        _ensureButton = [[UIButton alloc]init];
        _ensureButton.layer.cornerRadius = 15;
        _ensureButton.backgroundColor = RGBColorHex(0xff592c);
        _ensureButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [_ensureButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        [_ensureButton setTitle:@"确定" forState:UIControlStateNormal];
    }
    return _ensureButton;
}
@end
