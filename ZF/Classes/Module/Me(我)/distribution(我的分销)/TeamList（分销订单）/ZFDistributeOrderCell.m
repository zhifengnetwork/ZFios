//
//  ZFDistributeOrderCell.m
//  ZF
//
//  Created by weiming zhang on 2019/5/21.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDistributeOrderCell.h"
#import "ZFTool.h"

@interface ZFDistributeOrderCell()
@property (nonatomic, strong)UILabel *orderIDLabel;
@property (nonatomic, strong)UILabel *priceLabel;
@property (nonatomic, strong)UILabel *promptLabel;
@end
@implementation ZFDistributeOrderCell

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
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.promptLabel];
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = RGBColorHex(0xcccccc);
    [self.contentView addSubview:lineView];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    
    [_orderIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.priceLabel.mas_centerY);
        make.left.equalTo(self.contentView).with.offset(25);
    }];
    
    [_promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.priceLabel.mas_centerY);
        make.right.equalTo(self.contentView).with.offset(-14);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(1);
    }];
}

- (UILabel *)orderIDLabel{
    if (_orderIDLabel == nil) {
        _orderIDLabel = [[UILabel alloc]init];
        _orderIDLabel.font = [UIFont systemFontOfSize:13];
        _orderIDLabel.textColor = RGBColorHex(0x2f2f2f);
        _orderIDLabel.text = @"订单3223";
    }return _orderIDLabel;
}

- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont systemFontOfSize:13];
        _priceLabel.textColor = RGBColorHex(0x2f2f2f);
        _priceLabel.text = @"234.23";
    }return _priceLabel;
}

- (UILabel *)promptLabel{
    if (_promptLabel == nil) {
        _promptLabel = [[UILabel alloc]init];
        _promptLabel.font = [UIFont systemFontOfSize:13];
        _promptLabel.textColor = RGBColorHex(0x2f2f2f);
        _promptLabel.text = @"订单而完全完成";
    }return _promptLabel;
}

- (void)setRecordModel:(ZFDetailDistModel *)recordModel{
    _recordModel = recordModel;
    _orderIDLabel.text = _recordModel.nickname;
    _priceLabel.text = [NSString stringWithFormat:@"订单%ld",_recordModel.order_id];
    _promptLabel.text = [ZFTool dateText:[NSString stringWithFormat:@"%ld",_recordModel.pay_time]];
}
@end
