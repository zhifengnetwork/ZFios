//
//  ZFQRCode.m
//  ZF
//
//  Created by weiming zhang on 2019/3/22.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFQRCodeView.h"
@interface ZFQRCodeView()
@property (nonatomic, strong)UILabel *QRLabel;
@property (nonatomic, strong)UIImageView *QRImageView;
@end
@implementation ZFQRCodeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}
- (void)setup{
    self.backgroundColor = RGBColorHex(0xffffff);
    
    [self addSubview:self.QRLabel];
    [_QRLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(40);
        make.centerX.equalTo(self.mas_centerX);
    }];
    [self addSubview:self.QRImageView];
    [_QRImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(40);
        make.centerX.equalTo(self.mas_centerX);
        make.width.height.mas_equalTo(155);
    }];
}
- (UILabel *)QRLabel{
    if (_QRLabel == nil) {
        _QRLabel = [[UILabel alloc]init];
        [_QRLabel setTextColor:RGBColorHex(0x333333)];
        [_QRLabel setFont:[UIFont systemFontOfSize:15]];
        [_QRLabel setText:@"券码:1568393848392"];
    }
    return _QRLabel;
}
- (UIImageView *)QRImageView{
    if (_QRImageView == nil) {
    
    }
    return _QRImageView;
}

- (void)setCoupon_code:(NSString *)coupon_code{
    _coupon_code = coupon_code;
    _QRLabel.text = [NSString stringWithFormat:@"%@",_coupon_code];
}
@end
