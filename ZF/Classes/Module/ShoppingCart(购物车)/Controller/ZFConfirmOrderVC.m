//
//  ZFConfirmOrderVC.m
//  ZF
//
//  Created by weiming zhang on 2019/3/26.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFConfirmOrderVC.h"
#import "ZFAddressManagementVC.h"
#import "ZFBuyModel.h"
#import "ZFXuXianView.h"
#import "ZFExpressView.h"
#import "ZFSelectPayView.h"
#import "TYAlertController.h"
#import "http_order.h"
#import "MJExtension.h"
#import "SVProgressHUD.h"
#import "ZFInvoiceView.h"
#import "ZFConfirmOrderCell.h"
#import "ZFGroupBuyingModel.h"

@interface ZFConfirmOrderVC ()<UITableViewDelegate,UITableViewDataSource>
//收货地址
@property (nonatomic, strong)UIView *addressView;
@property (nonatomic, strong)UILabel *emptyAddressLabel;
@property (nonatomic, strong)UIImageView *jumpImageView;
@property (nonatomic, strong)UIButton *reviseButton;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *phoneNumberLabel;
@property (nonatomic, strong)UILabel *addressLabel;
//商品信息
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UIView *backgroudView;
//订单信息
@property (nonatomic, strong)UILabel *expressLabel;
@property (nonatomic, strong)UILabel *quickLabel;
@property (nonatomic, strong)UILabel *quickLabel1;
@property (nonatomic, strong)UIButton *selectButton;

@property (nonatomic, strong)ZFInvoiceView *invoiceView;

@property (nonatomic, strong)UILabel *useBalanceLabel;
@property (nonatomic, strong)UILabel *balanceLabel;
@property (nonatomic, strong)UIButton *selectButton1;

@property (nonatomic, strong)UILabel *noteLabel;
@property (nonatomic, strong)UITextView *textView;

@property (nonatomic, strong)UILabel *orderDiscountLabel;
@property (nonatomic, strong)UILabel *orderDiscount;
@property (nonatomic, strong)UILabel *priceLabel;
@property (nonatomic, strong)UILabel *price;
@property (nonatomic, strong)UILabel *deliveryLabel;
@property (nonatomic, strong)UILabel *delivery;
@property (nonatomic, strong)UILabel *cashInLabel;
@property (nonatomic, strong)UILabel *cashIn;
@property (nonatomic, strong)UILabel *depositPaidLabel;
@property (nonatomic, strong)UILabel *depositPaid;
@property (nonatomic, strong)UILabel *balanceDiscountLabel;
@property (nonatomic, strong)UILabel *balanceDiscount;

@property (nonatomic, strong)UILabel *totalLabel;
@property (nonatomic, strong)UILabel *totalpriceLabel;
@property (nonatomic, strong)UIButton *submitButton;
@property (nonatomic, strong)ZFBuyModel *buyModel;

@property (nonatomic, copy)NSString *order_sn;
@end

@implementation ZFConfirmOrderVC
static NSString *const ZFConfirmOrderCellID = @"ZFConfirmOrderCellID";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup{
    self.title =@"确定订单";
    self.navigationItem.leftBarButtonItem.image = [UIImage imageNamed:@"Back"];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor blackColor];
//    self.navigationController.navigationBar.translucent  = YES; // 导航栏透明
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationController.navigationBar setBackgroundColor:RGBColorHex(0xf4f4f4)];
    self.view.backgroundColor = RGBColorHex(0xf4f4f4);
    //添加view里面的控件
    [self.view addSubview:self.addressView];
    [self.addressView addSubview:self.emptyAddressLabel];
    [self.addressView addSubview:self.jumpImageView];
    [self.addressView addSubview:self.reviseButton];
    [self.addressView addSubview:self.nameLabel];
    [self.addressView addSubview:self.phoneNumberLabel];
    [self.addressView addSubview:self.addressLabel];
    [self.view addSubview:self.tableView];
    
    [self.view addSubview:self.expressLabel];
    [self.view addSubview:self.backgroudView];
    [self.backgroudView addSubview:self.quickLabel];
    [self.backgroudView addSubview:self.quickLabel1];
    [self.backgroudView addSubview:self.selectButton];
    UIView *lineView= [[UIView alloc]init];
    lineView.backgroundColor = RGBColorHex(0xcccccc);
    [self.backgroudView addSubview:lineView];
    [self.backgroudView addSubview:self.invoiceView];
    UIView *lineView2= [[UIView alloc]init];
    lineView2.backgroundColor = RGBColorHex(0xcccccc);
    [self.backgroudView addSubview:lineView2];
    [self.backgroudView addSubview:self.useBalanceLabel];
    [self.backgroudView addSubview:self.balanceLabel];
    [self.backgroudView addSubview:self.selectButton1];
    UIView *lineView3= [[UIView alloc]init];
    lineView3.backgroundColor = RGBColorHex(0xcccccc);
    [self.backgroudView addSubview:lineView3];
    [self.backgroudView addSubview:self.noteLabel];
    [self.backgroudView addSubview:self.textView];
    UIView *lineView4= [[UIView alloc]init];
    lineView4.backgroundColor = RGBColorHex(0xcccccc);
    [self.backgroudView addSubview:lineView4];
    [self.backgroudView addSubview:self.orderDiscountLabel];
    [self.backgroudView addSubview:self.orderDiscount];
    [self.backgroudView addSubview:self.priceLabel];
    [self.backgroudView addSubview:self.price];
    [self.backgroudView addSubview:self.deliveryLabel];
    [self.backgroudView addSubview:self.delivery];
    [self.backgroudView addSubview:self.cashInLabel];
    [self.backgroudView addSubview:self.cashIn];
    [self.backgroudView addSubview:self.depositPaidLabel];
    [self.backgroudView addSubview:self.depositPaid];
    [self.backgroudView addSubview:self.balanceDiscountLabel];
    [self.backgroudView addSubview:self.balanceDiscount];
    
    [self.view addSubview:self.totalLabel];
    [self.view addSubview:self.totalpriceLabel];
    [self.view addSubview:self.submitButton];
    [_addressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(20);
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.height.mas_equalTo(77);
    }];
    [_emptyAddressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.addressView.mas_centerY);
        make.left.equalTo(self.addressView).with.offset(10);
    }];
    [_jumpImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.addressView.mas_centerY);
        make.right.equalTo(self.addressView).with.offset(-10);
    }];
    [_reviseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.addressView).insets(UIEdgeInsetsZero);
    }];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.addressView).with.offset(10);
        make.top.equalTo(self.addressView).with.offset(17);
    }];
    [_phoneNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).with.offset(15);
        make.top.equalTo(self.addressView).with.offset(17);
    }];
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.addressView).with.offset(10);
        make.top.equalTo(self.nameLabel.mas_bottom).with.offset(12);
        make.bottom.equalTo(self.addressView).with.offset(-15);
    }];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.addressView.mas_bottom).with.offset(10);
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.height.mas_equalTo(60);
    }];
    [_expressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableView.mas_bottom).with.offset(7);
        make.left.equalTo(self.view).with.offset(20);
    }];
    
    [_backgroudView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.expressLabel.mas_bottom).with.offset(7);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(435);
    }];
    
    [_quickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.expressLabel.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).with.offset(20);
    }];
    
    [_quickLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.quickLabel.mas_bottom).with.offset(8);
        make.left.equalTo(self.quickLabel.mas_left);
    }];
    
    [_selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.quickLabel.mas_top);
        make.right.equalTo(self.view).with.offset(-20);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.quickLabel1.mas_bottom).with.offset(4);
        make.left.equalTo(self.backgroudView).with.offset(20);
        make.right.equalTo(self.backgroudView).with.offset(-20);
        make.height.mas_equalTo(1);
    }];
    
    [_invoiceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom);
        make.left.equalTo(self.backgroudView).with.offset(20);
        make.right.equalTo(self.backgroudView).with.offset(-20);
        make.height.mas_equalTo(40);
    }];

    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.invoiceView.mas_bottom);
        make.left.equalTo(self.backgroudView).with.offset(20);
        make.right.equalTo(self.backgroudView).with.offset(-20);
        make.height.mas_equalTo(1);
    }];

    [_useBalanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView2.mas_bottom).with.offset(10);
        make.left.equalTo(self.backgroudView).with.offset(20);
    }];
    
    [_balanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.useBalanceLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self.useBalanceLabel.mas_left);
    }];
    
    [_selectButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.useBalanceLabel.mas_top);
        make.right.equalTo(self.backgroudView).with.offset(-20);
    }];
    
    [lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.balanceLabel.mas_bottom);
        make.left.equalTo(self.backgroudView).with.offset(20);
        make.right.equalTo(self.backgroudView).with.offset(-20);
        make.height.mas_equalTo(1);
    }];
    
    [_noteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView3.mas_bottom).with.offset(10);
        make.left.equalTo(self.backgroudView).with.offset(20);
    }];
    
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.noteLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self.backgroudView).with.offset(20);
        make.right.equalTo(self.backgroudView).with.offset(-20);
        make.height.mas_equalTo(40);
    }];
    
    [lineView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textView.mas_bottom).with.offset(10);
        make.left.equalTo(self.backgroudView).with.offset(20);
        make.right.equalTo(self.backgroudView).with.offset(-20);
        make.height.mas_equalTo(1);
    }];
    
    [_orderDiscountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView4.mas_bottom).with.offset(15);
        make.left.equalTo(self.backgroudView).with.offset(20);
    }];
    
    [_orderDiscount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.orderDiscountLabel.mas_centerY);
        make.right.equalTo(self.backgroudView).with.offset(-20);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.orderDiscountLabel.mas_bottom).with.offset(15);
        make.left.equalTo(self.backgroudView).with.offset(20);
    }];
    
    [_price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.priceLabel.mas_centerY);
        make.right.equalTo(self.backgroudView).with.offset(-20);
    }];
    [_deliveryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceLabel.mas_bottom).with.offset(15);
        make.left.equalTo(self.backgroudView).with.offset(20);
    }];
    
    [_delivery mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.deliveryLabel.mas_centerY);
        make.right.equalTo(self.backgroudView).with.offset(-20);
    }];
    
    [_cashInLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.deliveryLabel.mas_bottom).with.offset(15);
        make.left.equalTo(self.backgroudView).with.offset(20);
    }];
    
    [_cashIn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cashInLabel.mas_centerY);
        make.right.equalTo(self.backgroudView).with.offset(-20);
    }];
    
    [_depositPaidLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cashInLabel.mas_bottom).with.offset(15);
        make.left.equalTo(self.backgroudView).with.offset(20);
    }];
    
    [_depositPaid mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.depositPaidLabel.mas_centerY);
        make.right.equalTo(self.backgroudView).with.offset(-20);
    }];
    
    [_balanceDiscountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.depositPaidLabel.mas_bottom).with.offset(15);
        make.left.equalTo(self.backgroudView).with.offset(20);
    }];
    
    [_balanceDiscount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.balanceDiscountLabel.mas_centerY);
        make.right.equalTo(self.backgroudView).with.offset(-20);
    }];
    
    [_submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self.view);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(40);
    }];
    [_totalpriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.submitButton.mas_centerY);
        make.right.equalTo(self.submitButton.mas_left).with.offset(-20);
    }];
    [_totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.totalpriceLabel.mas_left);
        make.centerY.equalTo(self.totalpriceLabel.mas_centerY);
    }];

    self.ordersModel = [[ZFOrdersModel alloc]init];
    self.ordersModel.act = 0;
    
    [http_order post_order:_ordersModel success:^(id responseObject) {
        [self showData:responseObject];
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
    
}

- (void)showData: (id)responseObject{
    if (kObjectIsEmpty(responseObject)) {
        return;
    }
    self.buyModel = [ZFBuyModel mj_objectWithKeyValues:responseObject];
    ZFAddressEditModel *addressModel = self.buyModel.address;
    if (kObjectIsEmpty(addressModel)) {
        _emptyAddressLabel.hidden = NO;
        self.nameLabel.hidden = YES;
        self.phoneNumberLabel.hidden = YES;
        self.addressLabel.hidden = YES;
    }else{
    _nameLabel.text = [NSString stringWithFormat:@"%@",addressModel.consignee];
        _phoneNumberLabel.text = [NSString stringWithFormat:@"%@",addressModel.mobile];
        _addressLabel.text = [NSString stringWithFormat:@"%@%@%@%@",addressModel.province_name,addressModel.city_name,addressModel.district_name,addressModel.twon_name];
    }
    _balanceLabel.text = [NSString stringWithFormat:@"余额：￥%@",_buyModel.user_money];
    ZFOrderModel *priceModel = self.buyModel.price;
    _orderDiscount.text = [NSString stringWithFormat:@"￥%@元",priceModel.order_prom_amount];
    _price.text = [NSString stringWithFormat:@"￥%@元",priceModel.goods_price];
    _delivery.text = [NSString stringWithFormat:@"￥%@元",priceModel.shipping_price];
    _cashIn.text = [NSString stringWithFormat:@"￥%@元",priceModel.sign_price];
    _depositPaid.text = [NSString stringWithFormat:@"￥%ld元",(long)priceModel.deposit];
    _balanceDiscount.text = [NSString stringWithFormat:@"￥%@元",priceModel.user_money];
    _totalpriceLabel.text = [NSString stringWithFormat:@"￥%@元",priceModel.order_amount];
    //设置提交按钮
    if (self.emptyAddressLabel.hidden == NO) {
        self.submitButton.enabled = NO;
        [self.submitButton setBackgroundImage:nil forState:UIControlStateNormal];
        [self.submitButton setBackgroundColor:RGBColorHex(0xe6e6e6)];
    }else{
        self.submitButton.enabled = YES;
        [self.submitButton setBackgroundImage:[UIImage imageNamed:@"submit"] forState:UIControlStateNormal];
    }

    
    [self.tableView reloadData];
}

- (UIView *)addressView{
    if (_addressView == nil) {
        _addressView = [[UIView alloc]init];
        _addressView.layer.cornerRadius = 9;
        _addressView.backgroundColor = RGBColorHex(0xffffff);
    }
    return _addressView;
}
- (UILabel *)emptyAddressLabel{
    if (_emptyAddressLabel == nil) {
        _emptyAddressLabel = [[UILabel alloc]init];
        
        [_emptyAddressLabel setText:@"*请添加收货地址"];
//        [_emptyAddressLabel setFont:[UIFont systemFontOfSize:12]];
        [_emptyAddressLabel setFont:[UIFont boldSystemFontOfSize:12]];
        [_emptyAddressLabel setTextColor:RGBColorHex(0xe51c23)];
        _emptyAddressLabel.hidden = YES;
    }
    return _emptyAddressLabel;
}
- (UIImageView *)jumpImageView{
    if (_jumpImageView == nil) {
        _jumpImageView = [[UIImageView alloc]init];
        [_jumpImageView setImage:[UIImage imageNamed:@"arrow"]];
    }
    return _jumpImageView;
}
- (UIButton *)reviseButton{
    if (_reviseButton == nil) {
        _reviseButton = [[UIButton alloc]init];
        [_reviseButton addTarget:self action:@selector(selectAddress) forControlEvents:UIControlEventTouchUpInside];
    }
    return _reviseButton;
}
- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont boldSystemFontOfSize:15];
        _nameLabel.textColor = RGBColorHex(0x0f0f0f);
        _nameLabel.text = @"张**";
    }
    return _nameLabel;
}
- (UILabel *)phoneNumberLabel{
    if (_phoneNumberLabel == nil) {
        _phoneNumberLabel = [[UILabel alloc]init];
        _phoneNumberLabel.font = [UIFont boldSystemFontOfSize:15];
        _phoneNumberLabel.textColor = RGBColorHex(0x0f0f0f);
        _phoneNumberLabel.text = @"186****0486";
    }
    return _phoneNumberLabel;
}
- (UILabel *)addressLabel{
    if (_addressLabel == nil) {
        _addressLabel = [[UILabel alloc]init];
        _addressLabel.font = [UIFont systemFontOfSize:12];
        _addressLabel.textColor = RGBColorHex(0x424242);
        _addressLabel.text = @"广东省广州市白云区";
    }
    return _addressLabel;
}
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.layer.cornerRadius = 9;
        _tableView.backgroundColor = RGBColorHex(0xffffff);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ZFConfirmOrderCell class] forCellReuseIdentifier:ZFConfirmOrderCellID];
        _tableView.rowHeight = 50;
    }
    return _tableView;
}

- (UILabel *)expressLabel{
    if (_expressLabel == nil) {
        _expressLabel = [[UILabel alloc]init];
        _expressLabel.font = [UIFont systemFontOfSize:12];
        _expressLabel.textColor = [UIColor grayColor];
        _expressLabel.text = @"选择配送方式";
    }return _expressLabel;
}

- (UIView *)backgroudView{
    if (_backgroudView == nil) {
        _backgroudView = [[UIView alloc]init];
        _backgroudView.backgroundColor = [UIColor whiteColor];
    }return _backgroudView;
}

- (UILabel *)quickLabel{
    if (_quickLabel == nil) {
        _quickLabel = [[UILabel alloc]init];
        _quickLabel.font = [UIFont systemFontOfSize:15];
        _quickLabel.textColor = [UIColor blackColor];
        _quickLabel.text = @"快速配送";
    }return _quickLabel;
}

- (UILabel *)quickLabel1{
    if (_quickLabel1 == nil) {
        _quickLabel1 = [[UILabel alloc]init];
        _quickLabel1.font = [UIFont systemFontOfSize:13];
        _quickLabel1.textColor = RGBColorHex(0x4d4d4d);
        _quickLabel1.text = @"工作日、双休日与节假日均可送货";
    }return _quickLabel1;
}

- (UIButton *)selectButton{
    if (_selectButton == nil) {
        _selectButton = [[UIButton alloc]init];
        [_selectButton setImage:[UIImage imageNamed:@"option_b"] forState:UIControlStateNormal];
        [_selectButton setImage:[UIImage imageNamed:@"option_s"] forState:UIControlStateSelected];
        [_selectButton addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
    }return _selectButton;
}

- (ZFInvoiceView *)invoiceView{
    if (_invoiceView == nil) {
        _invoiceView = [[ZFInvoiceView alloc]init];
        
    }return _invoiceView;
}

- (UILabel *)useBalanceLabel{
    if (_useBalanceLabel == nil) {
        _useBalanceLabel = [[UILabel alloc]init];
        _useBalanceLabel.font = [UIFont systemFontOfSize:15];
        _useBalanceLabel.textColor = [UIColor blackColor];
        _useBalanceLabel.text = @"使用余额";
    }return _useBalanceLabel;
}

- (UILabel *)balanceLabel{
    if (_balanceLabel == nil) {
        _balanceLabel = [[UILabel alloc]init];
        _balanceLabel.font = [UIFont systemFontOfSize:13];
        _balanceLabel.textColor = RGBColorHex(0x4d4d4d);
        _balanceLabel.text = @"余额：￥124.32";
    }return _balanceLabel;
}

- (UIButton *)selectButton1{
    if (_selectButton1 == nil) {
        _selectButton1 = [[UIButton alloc]init];
        [_selectButton1 setImage:[UIImage imageNamed:@"button_default"] forState:UIControlStateNormal];
        [_selectButton1 setImage:[UIImage imageNamed:@"button_click"] forState:UIControlStateSelected];
        [_selectButton1 addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
    }return _selectButton1;
}

- (UILabel *)noteLabel{
    if (_noteLabel == nil) {
        _noteLabel = [[UILabel alloc]init];
        _noteLabel.font = [UIFont systemFontOfSize:15];
        _noteLabel.textColor = [UIColor blackColor];
        _noteLabel.text = @"用户备注(50字)";
    }return _noteLabel;
}

- (UITextView *)textView{
    if (_textView == nil) {
        _textView = [[UITextView alloc]init];
        _textView.layer.borderWidth = 1;
        _textView.layer.borderColor =RGBColorHex(0xcccccc).CGColor;
    }return _textView;
}

- (UILabel *)orderDiscountLabel{
    if (_orderDiscountLabel == nil) {
        _orderDiscountLabel = [[UILabel alloc]init];
        _orderDiscountLabel.font = [UIFont systemFontOfSize:13];
        _orderDiscountLabel.textColor = RGBColorHex(0x4d4d4d);
        _orderDiscountLabel.text = @"订单优惠";
    }return _orderDiscountLabel;
}

- (UILabel *)orderDiscount{
    if (_orderDiscount == nil) {
        _orderDiscount = [[UILabel alloc]init];
        _orderDiscount.font = [UIFont systemFontOfSize:13];
        _orderDiscount.textColor = [UIColor redColor];
        _orderDiscount.text = @"￥0.00元";
    }return _orderDiscount;
}

- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont systemFontOfSize:13];
        _priceLabel.textColor = RGBColorHex(0x4d4d4d);
        _priceLabel.text = @"商品金额";
    }return _priceLabel;
}

- (UILabel *)price{
    if (_price == nil) {
        _price = [[UILabel alloc]init];
        _price.font = [UIFont systemFontOfSize:13];
        _price.textColor = [UIColor redColor];
        _price.text = @"￥0.00元";
    }return _price;
}

- (UILabel *)deliveryLabel{
    if (_deliveryLabel == nil) {
        _deliveryLabel = [[UILabel alloc]init];
        _deliveryLabel.font = [UIFont systemFontOfSize:13];
        _deliveryLabel.textColor = RGBColorHex(0x4d4d4d);
        _deliveryLabel.text = @"配送费用";
    }return _deliveryLabel;
}

- (UILabel *)delivery{
    if (_delivery == nil) {
        _delivery = [[UILabel alloc]init];
        _delivery.font = [UIFont systemFontOfSize:13];
        _delivery.textColor = [UIColor redColor];
        _delivery.text = @"￥0.00元";
    }return _delivery;
}

- (UILabel *)cashInLabel{
    if (_cashInLabel == nil) {
        _cashInLabel = [[UILabel alloc]init];
        _cashInLabel.font = [UIFont systemFontOfSize:13];
        _cashInLabel.textColor = RGBColorHex(0x4d4d4d);
        _cashInLabel.text = @"签到折扣";
    }return _cashInLabel;
}

- (UILabel *)cashIn{
    if (_cashIn == nil) {
        _cashIn = [[UILabel alloc]init];
        _cashIn.font = [UIFont systemFontOfSize:13];
        _cashIn.textColor = [UIColor redColor];
        _cashIn.text = @"￥0.00元";
    }return _cashIn;
}

- (UILabel *)depositPaidLabel{
    if (_depositPaidLabel == nil) {
        _depositPaidLabel = [[UILabel alloc]init];
        _depositPaidLabel.font = [UIFont systemFontOfSize:13];
        _depositPaidLabel.textColor = RGBColorHex(0x4d4d4d);
        _depositPaidLabel.text = @"已交订金";
    }return _depositPaidLabel;
}

- (UILabel *)depositPaid{
    if (_depositPaid == nil) {
        _depositPaid = [[UILabel alloc]init];
        _depositPaid.font = [UIFont systemFontOfSize:13];
        _depositPaid.textColor = [UIColor redColor];
        _depositPaid.text = @"￥0.00元";
    }return _depositPaid;
}

- (UILabel *)balanceDiscountLabel{
    if (_balanceDiscountLabel == nil) {
        _balanceDiscountLabel = [[UILabel alloc]init];
        _balanceDiscountLabel.font = [UIFont systemFontOfSize:13];
        _balanceDiscountLabel.textColor = RGBColorHex(0x4d4d4d);
        _balanceDiscountLabel.text = @"余额折扣";
    }return _balanceDiscountLabel;
}

- (UILabel *)balanceDiscount{
    if (_balanceDiscount == nil) {
        _balanceDiscount = [[UILabel alloc]init];
        _balanceDiscount.font = [UIFont systemFontOfSize:13];
        _balanceDiscount.textColor = [UIColor redColor];
        _balanceDiscount.text = @"￥0.00元";
    }return _balanceDiscount;
}

- (UILabel *)totalpriceLabel{
    if (_totalpriceLabel == nil) {
        _totalpriceLabel = [[UILabel alloc]init];
        _totalpriceLabel.font = [UIFont systemFontOfSize:15];
        _totalpriceLabel.textColor = RGBColorHex(0xf05050);
        _totalpriceLabel.text = @"￥4900.00";
    }
    return _totalpriceLabel;
}
- (UILabel *)totalLabel{
    if (_totalLabel == nil) {
        _totalLabel = [[UILabel alloc]init];
        _totalLabel.font = [UIFont systemFontOfSize:15];
        _totalLabel.textColor = RGBColorHex(0x0f0f0f);
        _totalLabel.text = @"应付金额:";
    }
    return _totalLabel;
}
- (UIButton *)submitButton{
    if (_submitButton == nil) {
        _submitButton = [[UIButton alloc]init];
        _submitButton.backgroundColor = [UIColor redColor];
        [_submitButton setTitle:@"提交订单" forState:UIControlStateNormal];
        [_submitButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        _submitButton.titleLabel.font = [UIFont systemFontOfSize:17];
        [_submitButton addTarget:self action:@selector(submitClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _submitButton;
}
#pragma mark --协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.buyModel.goodsinfo.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZFConfirmOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:ZFConfirmOrderCellID forIndexPath:indexPath];
    cell.goodModel = [self.buyModel.goodsinfo objectAtIndex:indexPath.row];
    return cell;
}
#pragma mark --方法
- (void)selectClick:(UIButton *)btn{
    btn.selected = !btn.selected;
}

//选择地址
- (void)selectAddress{
    ZFAddressManagementVC* vc = [[ZFAddressManagementVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
//提交订单，调到选择支付方式页面
- (void)submitClick{
    //设置提交订单参数
    ZFAddressEditModel *addressModel = self.buyModel.address;
//    ZFGroupBuyingModel *goodModel = self.buyModel.goodsinfo[0];
    [_ordersModel setAddress_id:addressModel.address_id];
    if (self.invoiceView.invoiceArray.count ==0) {
        _ordersModel.invoice_title = @"不开发票";
    }else{
        _ordersModel.invoice_title = self.invoiceView.invoiceArray[0];
        if (self.invoiceView.invoiceArray.count>2) {
            _ordersModel.invoice_desc = self.invoiceView.invoiceArray[1];
            _ordersModel.taxpayer = self.invoiceView.invoiceArray[2];
        }
    }
    
    if (self.selectButton1.selected == YES) {
        _ordersModel.user_money = @"1";
    }
    _ordersModel.user_note = self.textView.text;
    //是否立即购买
//    _ordersModel.action = 1
//    _ordersModel.goods_id =
//    _ordersModel.goods_num=
//    _ordersModel.item_id =
    _ordersModel.act = 1;
    _ordersModel.consignee = addressModel.consignee;
    _ordersModel.mobile = addressModel.mobile;
    
    [http_order post_order:_ordersModel success:^(id responseObject) {
        if (kObjectIsEmpty(responseObject)) {
            return;
        }
        self.order_sn = [responseObject objectForKey:@"order_sn"];
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
    if (self.submitButton.enabled ) {
        ZFSelectPayView *payView = [[ZFSelectPayView alloc]initWithFrame:CGRectMake(0, LL_ScreenHeight - 367, LL_ScreenWidth, 367)];
        payView.order_sn = _order_sn;
        TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:payView preferredStyle:TYAlertControllerStyleActionSheet];
        alertController.backgoundTapDismissEnable = YES;
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
}

@end
