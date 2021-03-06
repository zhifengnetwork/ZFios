//
//  ZFSearchCollectionViewCell.m
//  ZF
//
//  Created by weiming zhang on 2019/4/2.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFSearchCollectionViewCell.h"


@interface ZFSearchCollectionViewCell()
@property (nonatomic, strong)UIImageView *iconimageView;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *priceLabel;
@property (nonatomic, strong)UIButton *shopButton;
@property (nonatomic, strong)UILabel *commentsLabel;
@property (nonatomic, strong)UILabel *salesLabel;
@property (nonatomic, strong)UILabel *paymentLabel;
@end
@implementation ZFSearchCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    self.contentView.backgroundColor =RGBColorHex(0xfafafa);
    self.contentView.layer.cornerRadius =4;
    [self.contentView addSubview:self.iconimageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.shopButton];
    [self.contentView addSubview:self.commentsLabel];
    [self.contentView addSubview:self.salesLabel];
    [self.contentView addSubview:self.paymentLabel];

    [_iconimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).with.offset(7);
        make.right.equalTo(self.contentView).with.offset(-7);
        make.height.mas_equalTo(150);
    }];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconimageView.mas_bottom).with.offset(10);
        make.left.equalTo(self.contentView).with.offset(7);
        make.right.equalTo(self.contentView).with.offset(-7);
    }];
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self.contentView).with.offset(7);
    }];
    [_shopButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self.contentView).with.offset(7);
    }];
    [_shopButton setTitleEdgeInsets:UIEdgeInsetsMake(0,  -_shopButton.imageView.frame.size.width, 0, 0)];
    [_shopButton setImageEdgeInsets:UIEdgeInsetsMake(0 , _shopButton.titleLabel.bounds.size.width-10 , 0,
                                                     -_shopButton.titleLabel.bounds.size.width+10 )];
    [_commentsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shopButton.mas_bottom).with.offset(10);
        make.left.equalTo(self.contentView).with.offset(7);
    }];
    [_salesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.commentsLabel.mas_right).with.offset(8);
        make.bottom.equalTo(self.commentsLabel.mas_bottom);
    }];
    [_paymentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.salesLabel.mas_right).with.offset(8);
        make.bottom.equalTo(self.commentsLabel.mas_bottom);
    }];
}

- (void)setSearchModel:(ZFSearchModel *)searchModel
{
    _searchModel = searchModel;
    
    _nameLabel.text = _searchModel.goods_name;
    _priceLabel.text = [NSString stringWithFormat:@"¥ %@",_searchModel.shop_price];
    [_shopButton setTitle:_searchModel.seller_name forState:UIControlStateNormal];
    _commentsLabel.text = [NSString stringWithFormat:@"%@%%好评",_searchModel.comment_count];
    _salesLabel.text = [NSString stringWithFormat:@"销量：%@",_searchModel.sales_sum];
    _paymentLabel.text = [NSString stringWithFormat:@"已付款：%@+",_searchModel.sale_total];
    
    //显示图片
    if (_searchModel.goods_images.count>0) {
        ZFGoodsImageModel *imageModel = [_searchModel.goods_images objectAtIndex:0];
        NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,imageModel.image_url];
        [_iconimageView sd_setImageWithURL:[NSURL URLWithString:str]];
    }
    
}

- (UIImageView *)iconimageView{
    if (_iconimageView == nil) {
        _iconimageView = [[UIImageView alloc]init];
        _iconimageView.layer.cornerRadius = 4;
        
    }
    return _iconimageView;
}
- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.textColor = RGBColorHex(0x1a1a1a);
        _nameLabel.text = @"女士花瓣肩连衣裙2019春季纱网拼接高腰连衣裙";
        _nameLabel.numberOfLines = 0;
    }
    return _nameLabel;
}
- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.textColor = RGBColorHex(0xd21018);
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:@"￥399.00"];
        NSRange range1 = [[str string] rangeOfString:@"￥"];
        [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:11] range:range1];
        NSRange range2 = [[str string] rangeOfString:@"399.00"];
        [str addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:17] range:range2];
        _priceLabel.attributedText = str;
    }
    return _priceLabel;
}
- (UIButton *)shopButton{
    if (_shopButton == nil) {
        _shopButton = [[UIButton alloc]init];
        [_shopButton setTitle:@"MODA专营店" forState:UIControlStateNormal];
        [_shopButton setTitleColor:RGBColorHex(0x1a1a1a) forState:UIControlStateNormal];
        _shopButton.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        [_shopButton setImage:[UIImage imageNamed:@"arrow_b"] forState:UIControlStateNormal];
        
    }
    return _shopButton;
}
- (UILabel *)commentsLabel{
    if (_commentsLabel == nil) {
        _commentsLabel = [[UILabel alloc]init];
        _commentsLabel.font = [UIFont boldSystemFontOfSize:9];
        _commentsLabel.textColor = RGBColorHex(0x4d4d4d);
        _commentsLabel.text = @"90.8%好评";
    }
    return _commentsLabel;
}
- (UILabel *)salesLabel{
    if (_salesLabel == nil) {
        _salesLabel = [[UILabel alloc]init];
        _salesLabel.font = [UIFont boldSystemFontOfSize:9];
        _salesLabel.textColor = RGBColorHex(0x4d4d4d);
        _salesLabel.text = @"销量：10万";
    }
    return _salesLabel;
}
- (UILabel *)paymentLabel{
    if (_paymentLabel == nil) {
        _paymentLabel = [[UILabel alloc]init];
        _paymentLabel.font = [UIFont boldSystemFontOfSize:9];
        _paymentLabel.textColor = RGBColorHex(0x4d4d4d);
        _paymentLabel.text = @"已付款：4200+";
    }
    return _paymentLabel;
}
@end
