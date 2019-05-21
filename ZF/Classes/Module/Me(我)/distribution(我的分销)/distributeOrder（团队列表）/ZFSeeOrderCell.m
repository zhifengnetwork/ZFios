//
//  ZFSeeOrderCell.m
//  ZF
//
//  Created by weiming zhang on 2019/5/21.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFSeeOrderCell.h"
#import "ZFTool.h"

@interface ZFSeeOrderCell()
@property (nonatomic, strong)UILabel *orderIDLabel;
@property (nonatomic, strong)UILabel *orderPrcieLabel;
@property (nonatomic, strong)UILabel *priceLabel;
@property (nonatomic, strong)UILabel *receiveLabel;
@property (nonatomic, strong)UILabel *timeLabel;
@end
@implementation ZFSeeOrderCell

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
    [self.contentView addSubview:self.orderIDLabel];
    [self.contentView addSubview:self.orderPrcieLabel];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.receiveLabel];
    [self.contentView addSubview:self.timeLabel];
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
        make.top.equalTo(self.orderIDLabel.mas_bottom).with.offset(5);
        make.left.equalTo(self).with.offset(90);
    }];
    
    [_receiveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.orderPrcieLabel.mas_bottom).with.offset(5);
        make.left.equalTo(self.orderIDLabel.mas_left);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.receiveLabel.mas_bottom).with.offset(5);
        make.left.equalTo(self.orderIDLabel.mas_left);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeLabel.mas_bottom).with.offset(12);
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
        _orderIDLabel.text = @"订单编号：232432342324234";
    }return _orderIDLabel;
}

- (UILabel *)orderPrcieLabel{
    if (_orderPrcieLabel == nil) {
        _orderPrcieLabel = [[UILabel alloc]init];
        _orderPrcieLabel.font = [UIFont systemFontOfSize:15];
        _orderPrcieLabel.textColor = RGBColorHex(0x151515);
        _orderPrcieLabel.text = @"订单金额：";
    }return _orderPrcieLabel;
}

- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont systemFontOfSize:15];
        _priceLabel.textColor = [UIColor redColor];
        _priceLabel.text = @"68.80";
    }return _priceLabel;
}

- (UILabel *)receiveLabel{
    if (_receiveLabel == nil) {
        _receiveLabel = [[UILabel alloc]init];
        _receiveLabel.font = [UIFont systemFontOfSize:15];
        _receiveLabel.textColor = RGBColorHex(0x151515);
        _receiveLabel.text = @"收货人:       揉法";
    }return _receiveLabel;
}

- (UILabel *)timeLabel{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:15];
        _timeLabel.textColor = RGBColorHex(0x151515);
        _timeLabel.text = @"下单时间：20138-32-23 238:234:42";
    }return _timeLabel;
}

- (void)setDetailModel:(ZFDetailDistModel *)detailModel{
    _detailModel = detailModel;
    _orderIDLabel.text = [NSString stringWithFormat:@"订单编号：%@",_detailModel.order_sn];
    _priceLabel.text = _detailModel.total_amount;
    _receiveLabel.text = [NSString stringWithFormat:@"收货人:       %@",_detailModel.consignee];
    _timeLabel.text = [NSString stringWithFormat:@"下单时间：%@",[ZFTool dateText:[NSString stringWithFormat:@"%ld",(long)_detailModel.add_time]]];
}
@end
