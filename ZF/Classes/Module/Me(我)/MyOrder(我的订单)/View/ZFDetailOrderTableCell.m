//
//  ZFDetailOrderTableCell.m
//  ZF
//
//  Created by weiming zhang on 2019/5/15.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDetailOrderTableCell.h"

@interface ZFDetailOrderTableCell()
@property (nonatomic, strong)UIImageView *goodImageView;//商品图片
@property (nonatomic, strong)UILabel *goodNameLabel;
@property (nonatomic, strong)UILabel *spec_keyLabel;//规格
@property (nonatomic, strong)UILabel *priceLabel;//商品价格

@end
@implementation ZFDetailOrderTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }return self;
}

- (void)setup{
    [self.contentView addSubview:self.goodImageView];
    [self.contentView addSubview:self.goodNameLabel];
    [self.contentView addSubview:self.spec_keyLabel];
    [self.contentView addSubview:self.priceLabel];
    
    [_goodImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(5);
        make.left.equalTo(self).with.offset(10);
        make.width.height.mas_equalTo(80);
    }];
    
    [_goodNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.goodImageView.mas_right).with.offset(12);
        make.top.equalTo(self.goodImageView.mas_top);
        make.right.equalTo(self).with.offset(-10);
    }];
    
    [_spec_keyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodNameLabel.mas_bottom).with.offset(12);
        make.left.equalTo(self.goodNameLabel.mas_left);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.spec_keyLabel.mas_bottom).with.offset(12);
        make.left.equalTo(self.goodNameLabel.mas_left);
    }];
}

- (UIImageView *)goodImageView{
    if (_goodImageView == nil) {
        _goodImageView = [[UIImageView alloc]init];
    }return _goodImageView;
}

- (UILabel *)goodNameLabel{
    if (_goodNameLabel == nil) {
        _goodNameLabel = [[UILabel alloc]init];
        _goodNameLabel.font = [UIFont systemFontOfSize:12];
        _goodNameLabel.textColor = RGBColorHex(0x151515);
        _goodNameLabel.text = @"发发神经发酵饲料发了手机发了两份拉进来司法局房间爱垃圾费啦";
        _goodNameLabel.numberOfLines = 0;
    }return _goodNameLabel;
}

- (UILabel *)spec_keyLabel{
    if (_spec_keyLabel == nil) {
        _spec_keyLabel = [[UILabel alloc]init];
        _spec_keyLabel.font = [UIFont systemFontOfSize:12];
        _spec_keyLabel.textColor = RGBColorHex(0x151515);
        _spec_keyLabel.text = @"颜色：蓝色   尺寸：M码";
    }return _spec_keyLabel;
}

- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont systemFontOfSize:12];
        _priceLabel.textColor = RGBColorHex(0x151515);
        _priceLabel.text = @"￥368 x 2";
    }return _priceLabel;
}

- (void)setGoodModel:(ZFOrdersModel *)goodModel{
    _goodModel = goodModel;
    if (!kStringIsEmpty(_goodModel.original_img))
    {
        NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,_goodModel.original_img];
        [_goodImageView sd_setImageWithURL:[NSURL URLWithString:str]];
    }
    _goodNameLabel.text = [NSString stringWithFormat:@"%@",_goodModel.goods_name];
    _spec_keyLabel.text = [NSString stringWithFormat:@"%@",_goodModel.spec_key_name];
    _priceLabel.text = [NSString stringWithFormat:@"￥%@ x %ld",_goodModel.final_price,_goodModel.goods_num];
}
@end
