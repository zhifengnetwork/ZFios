//
//  ZFMyWalletButton.m
//  ZF
//
//  Created by weiming zhang on 2019/3/21.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFMyWalletButton.h"
@interface ZFMyWalletButton()
@property (nonatomic, strong)UILabel *label1;
@property (nonatomic, strong)UILabel *label2;
@end
@implementation ZFMyWalletButton
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)awakeFromNib{
    [super awakeFromNib ];
    [self setup];
}
- (void)setup{
    self.layer.cornerRadius = 4;
    self.backgroundColor = RGBColorHex(0xffffff);
}
- (void)buttonWithString:(NSString *)string1 WithString2:(NSString *)string2 WithState:(BOOL)isAdd{
    _label1 = [[UILabel alloc]init];
    [_label1 setText:string1];
    [_label1 setFont:[UIFont systemFontOfSize:14]];
    [_label1 setTextColor:RGBColorHex(0x333333)];
    [self addSubview:_label1];
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"arrow"];
    [self addSubview:imageView];
    _label2 = [[UILabel alloc]init];
    [_label2 setText:string2];
    [_label2 setFont:[UIFont systemFontOfSize:12]];
    if (isAdd) {
        _label2.textColor = RGBColorHex(0x266ce8);
    }else{
        _label2.textColor = RGBColorHex(0xff5600);
    }
    [self addSubview:_label2];
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(20);
        make.centerY.equalTo(self.mas_centerY);
    }];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-20);
        make.centerY.equalTo(self.mas_centerY);
    }];
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(imageView.mas_left).with.offset(-8);
        make.centerY.equalTo(self.mas_centerY);
    }];
}

- (void)changeType:(NSInteger)type{
    if (type == 0) {
        _label2.text = @"未添加";
        _label2.textColor = RGBColorHex(0x266ce8);
    }else{
        _label2.text = @"已添加";
        _label2.textColor = RGBColorHex(0xff5600);
    }
}
@end
