//
//  ZFMyOrderHeadTableCell.m
//  ZF
//
//  Created by admin on 2019/3/21.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMyOrderHeadTableCell.h"
#import "ZFTool.h"
#import "http_mine.h"
#import "SVProgressHUD.h"
#import "RefreshGifHeader.h"

@interface ZFMyOrderHeadTableCell()

@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton* deleteButton;

@end

@implementation ZFMyOrderHeadTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setup];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setup
{
    self.contentView.backgroundColor = RGBColorHex(0xffffff);
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.deleteButton];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_deleteButton.mas_left).offset(-10);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.bottom.equalTo(self->_titleLabel.mas_bottom).offset(3);
    }];
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xE3E3E3);
    [self.contentView addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(self->_timeLabel.mas_left);
         make.right.equalTo(self->_deleteButton.mas_right);
         make.bottom.equalTo(self.contentView);
         make.height.mas_equalTo(0.5f);
     }];
}

- (void)deleteClick{
    //删除cell
    [http_mine del_collect_goods:_orderModel.order_id success:^(id responseObject) {
        [SVProgressHUD showSuccessWithStatus:@"删除成功"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"del_collect_goods2" object:self userInfo:nil];
    } failure:^(NSError *error) {
        
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
}

- (UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = RGBColorHex(0x151515);
        _timeLabel.font = [UIFont systemFontOfSize:11];
        _timeLabel.text = @"2019/2/3  12:25:30";
    }
    return _timeLabel;
}


- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0xf20c0c);
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.text = @"等待卖家发货";
    }
    return _titleLabel;
}

- (UIButton *)deleteButton{
    if (_deleteButton == nil) {
        _deleteButton = [[UIButton alloc]init];
        [_deleteButton setImage:[UIImage imageNamed:@"Delete"] forState:UIControlStateNormal];
        [_deleteButton addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
    }return _deleteButton;
}

- (void)setOrderModel:(ZFOrderModel *)orderModel{
    _orderModel = orderModel;
    _timeLabel.text = [ZFTool Orderdate:_orderModel.add_time];
    if (_orderModel.pay_status ==0) {
        _titleLabel.text = @"待付款";
    }else if (_orderModel.shipping_status == 0) {
        _titleLabel.text = @"等待卖家发货";
    }
    if (_orderModel.shipping_status == 1) {
        _titleLabel.text = @"卖家已发货";
    }
    if (_orderModel.order_status == 2) {
        _titleLabel.text = @"买家已收货";
    }
    if (_orderModel.order_status == 4) {
        _titleLabel.text = @"交易成功";
    }
    if (_orderModel.order_status == 3||_orderModel.order_status == 5){
        _titleLabel.text = @"交易取消";
    }
}





@end
