//
//  ZFOrderDetailCell.m
//  ZF
//
//  Created by weiming zhang on 2019/5/21.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFOrderDetailCell.h"
@interface ZFOrderDetailCell()
@property (nonatomic, strong)UILabel *orderIDLabel;
@property (nonatomic, strong)UILabel *orderPrcieLabel;
@property (nonatomic, strong)UILabel *priceLabel;
@end
@implementation ZFOrderDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }return self;
}

- (void)setup{
    [self.contentView addSubview:self.orderIDLabel];
    [self.contentView addSubview:self.orderPrcieLabel];
    [self.contentView addSubview:self.priceLabel];
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = RGBColorHex(0xcccccc);
    [self.contentView addSubview:lineView];
    
    [_orderIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self).with.offset(13);
    }];
    
    [_orderPrcieLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.orderIDLabel.mas_bottom).with.offset(5);
        make.left.equalTo(self.orderIDLabel.mas_left);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.orderPrcieLabel.mas_bottom).with.offset(5);
        make.left.equalTo(self.orderIDLabel.mas_left);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceLabel.mas_bottom).with.offset(12);
        make.left.equalTo(self.orderIDLabel.mas_left);
        make.right.equalTo(self).with.offset(-13);
        make.height.mas_equalTo(1);
    }];
}

- (UILabel *)orderIDLabel{
    if (_orderIDLabel == nil) {
        _orderIDLabel = [[UILabel alloc]init];
        _orderIDLabel.font = [UIFont systemFontOfSize:15];
        _orderIDLabel.textColor = RGBColorHex(0x151515);
        _orderIDLabel.text = @"商品名称：232432342324234";
    }return _orderIDLabel;
}

- (UILabel *)orderPrcieLabel{
    if (_orderPrcieLabel == nil) {
        _orderPrcieLabel = [[UILabel alloc]init];
        _orderPrcieLabel.font = [UIFont systemFontOfSize:15];
        _orderPrcieLabel.textColor = RGBColorHex(0x151515);
        _orderPrcieLabel.text = @"商品数量：";
    }return _orderPrcieLabel;
}

- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont systemFontOfSize:15];
        _priceLabel.textColor = RGBColorHex(0x151515);
        _priceLabel.text = @"商品价格：";
    }return _priceLabel;
}

- (void)setDetailModel:(ZFOrdersModel *)detailModel{
    _detailModel = detailModel;
    _orderIDLabel.text = [NSString stringWithFormat:@"商品名称：%@",_detailModel.goods_name];
    _orderPrcieLabel.text = [NSString stringWithFormat:@"商品数量：%ld",_detailModel.goods_num];
    _priceLabel.text = [NSString stringWithFormat:@"商品价格：%@",_detailModel.final_price];
}
@end
