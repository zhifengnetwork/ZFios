
//
//  ZFConfirmOrderCell.m
//  ZF
//
//  Created by weiming zhang on 2019/5/15.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFConfirmOrderCell.h"


@interface ZFConfirmOrderCell()
@property (nonatomic, strong)UIImageView *pictureImageView;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *priceLabel;

@end
@implementation ZFConfirmOrderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }return self;
}

- (void)setup{
    [self.contentView addSubview:self.pictureImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.priceLabel];
    
    [_pictureImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self).with.offset(20);
        make.width.height.mas_equalTo(30);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(10);
        make.left.equalTo(self.pictureImageView.mas_right).with.offset(10);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.pictureImageView.mas_bottom);
        make.right.equalTo(self).with.offset(-20);
    }];
}

- (UIImageView *)pictureImageView{
    if (_pictureImageView == nil) {
        _pictureImageView = [[UIImageView alloc]init];
    }
    return _pictureImageView;
}
- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:11];
        _nameLabel.textColor = RGBColorHex(0x4d4d4d);
        _nameLabel.text = @"Apple iphone XS 128G 金色 移动联通电信4G手机  旗舰店专营";
        _nameLabel.lineBreakMode = 0;
        _nameLabel.numberOfLines = 0;
    }
    return _nameLabel;
}
- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont boldSystemFontOfSize:13];
        _priceLabel.textColor = RGBColorHex(0x1a1a1a);
        _priceLabel.text = @"￥4900.00 x2";
    }
    return _priceLabel;
}

- (void)setGoodModel:(ZFGroupBuyingModel *)goodModel{
    _goodModel = goodModel;
    if (!kStringIsEmpty(_goodModel.original_img))
    {
        NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,_goodModel.original_img];
        [_pictureImageView sd_setImageWithURL:[NSURL URLWithString:str]];
    }
    _nameLabel.text = [NSString stringWithFormat:@"%@",_goodModel.goods_name];
    _priceLabel.text = [NSString stringWithFormat:@"￥%@ x%@",_goodModel.shop_price,_goodModel.goods_num];

}
@end
