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
@property (nonatomic, strong)UILabel *kindlabel;
@property (nonatomic, strong)UILabel *moneyLabel;

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
    [self.contentView addSubview:self.kindlabel];
    [self.contentView addSubview:self.moneyLabel];
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(20);
        make.left.equalTo(self).with.offset(16);
        make.right.equalTo(self).with.offset(-16);
    }];
    [_kindlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(85);
        make.left.equalTo(self).with.offset(73);
    }];
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_kindlabel.mas_right).with.offset(4);
        make.bottom.equalTo(self->_kindlabel.mas_bottom);
    }];
    
}
- (UIImageView *)bgView{
    if (_bgView == nil) {
        _bgView = [[UIImageView alloc]init];
        _bgView.image = [UIImage imageNamed:@"preferential_a"];
    }
    return _bgView;
}
- (UILabel *)kindlabel{
    if (_kindlabel == nil) {
        _kindlabel = [[UILabel alloc]init];
        [_kindlabel setText:@"￥"];
        [_kindlabel setFont:[UIFont systemFontOfSize:12]];
        [_kindlabel setTextColor:RGBColorHex(0xff5722)];
    }
    return _kindlabel;
}
- (UILabel *)moneyLabel{
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc]init];
        [_moneyLabel setText:@"8"];
        [_moneyLabel setFont:[UIFont fontWithName:@"PingFang-SC-Bold" size:32]];
        [_moneyLabel setTextColor:RGBColorHex(0xff5722)];
    }
    return _moneyLabel;
}
@end
