//
//  ZFSearchTableViewCell.m
//  ZF
//
//  Created by weiming zhang on 2019/4/1.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFSearchTableViewCell.h"
@interface ZFSearchTableViewCell()
@property (nonatomic, strong)UIImageView *iconimageView;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *priceLabel;
@property (nonatomic, strong)UIButton *shopButton;
@property (nonatomic, strong)UILabel *commentsLabel;
@property (nonatomic, strong)UILabel *salesLabel;
@property (nonatomic, strong)UILabel *paymentLabel;
@end
@implementation ZFSearchTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    [self addSubview:self.iconimageView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.priceLabel];
    [self addSubview:self.shopButton];
    [self addSubview:self.commentsLabel];
    [self addSubview:self.salesLabel];
    [self addSubview:self.paymentLabel];
    [_iconimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(10);
        make.left.equalTo(self);
        make.width.height.mas_equalTo(100);
    }];
}
- (UIImageView *)iconimageView{
    if (_iconimageView == nil) {
        _iconimageView = [[UIImageView alloc]init];
        _iconimageView.layer.cornerRadius = 3;
        
    }
    return _iconimageView;
}
@end
