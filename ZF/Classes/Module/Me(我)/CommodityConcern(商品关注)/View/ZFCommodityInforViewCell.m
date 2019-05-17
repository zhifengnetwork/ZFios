//
//  ZFCommodityInforViewCell.m
//  ZF
//
//  Created by admin on 2019/3/14.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFCommodityInforViewCell.h"
#import "UIImageView+WebCache.h"
#import "http_mine.h"
#import "SVProgressHUD.h"

@interface ZFCommodityInforViewCell()

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UIButton* deleteButton;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* moneyLabel;
@property (nonatomic, strong) UILabel* money2Label;
@property (nonatomic, strong) UIButton *seeButton;

@end

@implementation ZFCommodityInforViewCell

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
    self.contentView.backgroundColor = RGBColorHex(0xffffff);
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.deleteButton];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.money2Label];
    [self.contentView addSubview:self.seeButton];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(10);
        make.width.height.mas_equalTo(90);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(13);
        make.top.mas_equalTo(30);
        make.right.mas_equalTo(-25);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(13);
        make.top.equalTo(self->_titleLabel.mas_bottom).offset(20);
    }];
    
    [_money2Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_moneyLabel.mas_right).offset(8);
        make.bottom.equalTo(self->_moneyLabel.mas_bottom);
    }];
    
    [_seeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.width.mas_equalTo(55);
        make.height.mas_equalTo(20);
        make.bottom.equalTo(self->_iconView.mas_bottom);
    }];
    
    [_deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.top.equalTo(self.iconView.mas_top);
    }];
    
    //横线
    UIView *hLine2View = [[UIView alloc] init];
    hLine2View.backgroundColor = RGBColorHex(0x999999);
    [self.contentView addSubview:hLine2View];
    
    [hLine2View mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.centerY.centerX.equalTo(self->_money2Label);
         make.width.mas_equalTo(35);
         make.height.mas_equalTo(0.5);
     }];
    
}
- (void)setDelete:(BOOL)isHidden{
    _deleteButton.hidden = isHidden;
}

- (void)deleteClick{
    //删除cell
    [http_mine del_collect_goods:_commodityModel.goods_id success:^(id responseObject) {
        [SVProgressHUD showSuccessWithStatus:@"删除成功"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"del_collect_goods" object:self userInfo:nil];
        
    } failure:^(NSError *error) {

        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
}

- (void)seeButtonDidClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFCommodityInforViewCellDidClick:)])
    {
        [self.delegate ZFCommodityInforViewCellDidClick:self.commodityModel];
    }
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    
    [_seeButton setTitle:_title forState:UIControlStateNormal];
}


- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"image"];
        _iconView.clipsToBounds = YES;
        _iconView.layer.cornerRadius = 3.0f;
    }
    return _iconView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x151515);
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.numberOfLines = 0;
        _titleLabel.text = @"女式花瓣连衣裙女式花瓣连衣裙女式花瓣连衣裙女式花瓣连衣裙";
    }
    return _titleLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0xfa0505);
        _moneyLabel.font = [UIFont systemFontOfSize:15];
        _moneyLabel.text = @"¥ 399.00";
    }
    return _moneyLabel;
}

- (UILabel *)money2Label {
    if (_money2Label == nil) {
        _money2Label = [[UILabel alloc] init];
        _money2Label.textColor = RGBColorHex(0x767676);
        _money2Label.font = [UIFont systemFontOfSize:12];
        _money2Label.text = @"¥ 189";
    }
    return _money2Label;
}

- (UIButton *)seeButton {
    if (_seeButton == nil) {
        _seeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_seeButton setTitle:@"查看同款" forState:UIControlStateNormal];
        [_seeButton setTitleColor:RGBColorHex(0x1e79ea) forState:UIControlStateNormal];
        _seeButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _seeButton.layer.borderWidth = 1.0f;
        _seeButton.layer.borderColor = RGBColorHex(0x1e79ea).CGColor;
        _seeButton.layer.cornerRadius = 9;
        _seeButton.clipsToBounds = YES;
        [_seeButton addTarget:self action:@selector(seeButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _seeButton;
}

- (UIButton *)deleteButton{
    if (_deleteButton == nil) {
        _deleteButton = [[UIButton alloc]init];
        [_deleteButton setImage:[UIImage imageNamed:@"Delete"] forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
    }return _deleteButton;
}

- (void)setCommodityModel:(ZFGoodModel *)commodityModel{
    _commodityModel = commodityModel;
    
    _titleLabel.text = _commodityModel.goods_name;
    _moneyLabel.text = [NSString stringWithFormat:@"¥ %@",_commodityModel.shop_price];
    if (!kStringIsEmpty(_commodityModel.original_img))
    {
        NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,_commodityModel.original_img];
        [_iconView sd_setImageWithURL:[NSURL URLWithString:str]];
    }
    _money2Label.text = [NSString stringWithFormat:@"¥ %@",_commodityModel.market_price];


}

@end
