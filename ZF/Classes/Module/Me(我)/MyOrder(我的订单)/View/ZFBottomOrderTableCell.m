//
//  ZFBottomOrderTableCell.m
//  ZF
//
//  Created by admin on 2019/3/21.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFBottomOrderTableCell.h"
#import "http_user.h"
#import "SVProgressHUD.h"
#import "ZFWriteEvaluationVC.h"
#import "ZFExpressDetailVC.h"

@interface ZFBottomOrderTableCell()

@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* numberLabel;
@property (nonatomic, strong) UILabel* moneyLabel;
@property (nonatomic, strong) UIButton *deliverButton;
@property (nonatomic, strong) UIButton *orderButton;

@end

@implementation ZFBottomOrderTableCell

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
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.numberLabel];
    [self.contentView addSubview:self.moneyLabel];
    [self.contentView addSubview:self.deliverButton];
    [self.contentView addSubview:self.orderButton];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.bottom.mas_equalTo(-40);
    }];
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_nameLabel.mas_right).offset(155);
        make.centerY.equalTo(self->_nameLabel);
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.bottom.equalTo(self->_numberLabel.mas_bottom);
    }];
    
    [_deliverButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_numberLabel.mas_bottom).offset(8);
        make.right.equalTo(self->_orderButton.mas_left).offset(-13);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(20);
    }];
    
    [_orderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.top.equalTo(self->_moneyLabel.mas_bottom).offset(8);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(20);
    }];
    
}

- (void)deliverButtonDidClick:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"查看物流"]) {
        ZFExpressDetailVC *vc = [[ZFExpressDetailVC alloc]init];
        vc.orderID = _orderModel.order_id;
        [[self currentViewController].navigationController pushViewController:vc animated:YES];
    }
    [self.delegate updateCell];
}


- (void)orderButtonDidClick:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"取消订单"]) {
        [http_user CancelOrder:_orderModel.order_id success:^(id responseObject) {
            [SVProgressHUD showSuccessWithStatus:@"取消成功"];
        } failure:^(NSError *error) {
            [SVProgressHUD showErrorWithStatus:error.domain];
        }];
    }else if ([btn.titleLabel.text isEqualToString:@"确认收货"]){
        [http_user order_confirm:_orderModel.order_id success:^(id responseObject) {
            [SVProgressHUD showSuccessWithStatus:@"确认收货成功"];
        } failure:^(NSError *error) {
            [SVProgressHUD showErrorWithStatus:error.domain];
        }];
    }else if ([btn.titleLabel.text isEqualToString:@"去评价"]){
        ZFWriteEvaluationVC *vc = [[ZFWriteEvaluationVC alloc]init];
        vc.orderID = _orderModel.order_id;
        [[self currentViewController].navigationController pushViewController:vc animated:YES];
    }
    [self.delegate updateCell];
}



- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x6f6f6f);
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.text = @"欧欧记";
    }
    return _nameLabel;
}

- (UILabel *)numberLabel {
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.textColor = RGBColorHex(0x6f6f6f);
        _numberLabel.font = [UIFont systemFontOfSize:12];
        _numberLabel.text = @"共2件 应付总额";
    }
    return _numberLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.textColor = RGBColorHex(0xE51C23);
        _moneyLabel.font = [UIFont systemFontOfSize:14];
        _moneyLabel.text = @"¥ 399.00";
    }
    return _moneyLabel;
}

- (UIButton *)deliverButton {
    if (_deliverButton == nil) {
        _deliverButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deliverButton setTitle:@"提醒发货" forState:UIControlStateNormal];
        [_deliverButton setTitleColor:RGBColorHex(0xe51c23) forState:UIControlStateNormal];
        _deliverButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _deliverButton.backgroundColor = RGBColorHex(0xFFCDCF);
        [_deliverButton addTarget:self action:@selector(deliverButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deliverButton;
}

- (UIButton *)orderButton {
    if (_orderButton == nil) {
        _orderButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_orderButton setTitle:@"取消订单" forState:UIControlStateNormal];
        [_orderButton setTitleColor:RGBColorHex(0xFF5600) forState:UIControlStateNormal];
        _orderButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _orderButton.backgroundColor = RGBColorHex(0xFDDECF);
        [_orderButton addTarget:self action:@selector(orderButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _orderButton;
}

- (void)setType:(NSInteger)type{
    _type = type;
    
    _nameLabel.text = [NSString stringWithFormat:@"%@",_orderModel.store_name];
    ZFOrdersModel *model = [_orderModel.goods objectAtIndex:0];
    _numberLabel.text = [NSString stringWithFormat:@"共%ld件 应付总额",model.goods_num];
    _moneyLabel.text = [NSString stringWithFormat:@"¥ %@",_orderModel.total_amount];
    
    if (_type == 0) {//全部订单
        if (_orderModel.pay_status ==0) {
            [_deliverButton setTitle:@"确认支付" forState:UIControlStateNormal];
            [_orderButton setTitle:@"取消订单" forState:UIControlStateNormal];
        }else if (_orderModel.shipping_status == 0) {
            
            [_deliverButton setTitle:@"提醒发货" forState:UIControlStateNormal];
            [_orderButton setTitle:@"取消订单" forState:UIControlStateNormal];
        }
        if (_orderModel.shipping_status == 1) {
            [_deliverButton setTitle:@"查看物流" forState:UIControlStateNormal];
            [_orderButton setTitle:@"确认收货" forState:UIControlStateNormal];
        }
        if (_orderModel.order_status == 2) {
            _deliverButton.hidden = YES;
            [_orderButton setTitle:@"去评价" forState:UIControlStateNormal];
        }
        if (_orderModel.order_status == 3||_orderModel.order_status == 5){
            _deliverButton.hidden = YES;
            _orderButton.hidden = YES;
        }
    }else if (_type == 1){//待发货
        [_deliverButton setTitle:@"提醒发货" forState:UIControlStateNormal];
        [_orderButton setTitle:@"取消订单" forState:UIControlStateNormal];
    }else if (_type == 2){//待支付
        [_deliverButton setTitle:@"确认支付" forState:UIControlStateNormal];
        [_orderButton setTitle:@"取消订单" forState:UIControlStateNormal];
    }else if (_type == 3){//待收货
        [_deliverButton setTitle:@"查看物流" forState:UIControlStateNormal];
        [_orderButton setTitle:@"确认收货" forState:UIControlStateNormal];
    }else if (_type == 4){//待评价
        _deliverButton.hidden = YES;
        [_orderButton setTitle:@"去评价" forState:UIControlStateNormal];
        
    }
    
}

//获取当前控制器
- (UIViewController *)currentViewController{
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1) {
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController *)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController *)vc).visibleViewController;
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    return vc;
}

@end
