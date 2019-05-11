//
//  ZFDetailOrderVC.m
//  ZF
//
//  Created by weiming zhang on 2019/5/10.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDetailOrderVC.h"
#import "http_user.h"
#import "MJExtension.h"
#import "SVProgressHUD.h"
#import "ZFAddressEditModel.h"
#import "ZFOrdersModel.h"

@interface ZFDetailOrderVC ()
@property (nonatomic, strong)UILabel *orderStatus;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *phoneLabel;
@property (nonatomic, strong)UILabel *addressLabel;

@property (nonatomic, strong)UIImageView *iconImageView;//店铺头像
@property (nonatomic, strong)UILabel *storeLabel;//店铺名称
@property (nonatomic, strong)UIImageView *goodImageView;//商品图片
@property (nonatomic, strong)UILabel *goodNameLabel;
@property (nonatomic, strong)UILabel *spec_keyLabel;//规格
@property (nonatomic, strong)UILabel *priceLabel;//商品价格

@property (nonatomic, strong)UILabel *totalPriceLabel;
@property (nonatomic, strong)UILabel *totalPrice;//商品总价
@property (nonatomic, strong)UILabel *freightLabel;
@property (nonatomic, strong)UILabel *freight;//运费
@property (nonatomic, strong)UILabel *discountLabel;
@property (nonatomic, strong)UILabel *discount;
@property (nonatomic, strong)UILabel *orderPriceLabel;
@property (nonatomic, strong)UILabel *orderPrice;
@property (nonatomic, strong)UILabel *paymentLabel;
@property (nonatomic, strong)UILabel *payment;//实付款

@property (nonatomic, strong)UILabel *informationLabel;
@property (nonatomic, strong)UILabel *orderIDLabel;
@property (nonatomic, strong)UILabel *payTimeLabel;
@property (nonatomic, strong)UILabel *payTypeLabel;
@end

@implementation ZFDetailOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单详情";
    
    UIImage *imgRight = [UIImage imageNamed:@"All"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[imgRight imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(moreButtonDidClick)];
    [self setup];
}

- (void)moreButtonDidClick
{
    
}

- (void)setup{
    UIView *view1 = [[UIView alloc]init];
    view1.backgroundColor = RGBColorHex(0xfde6e6);
    [self.view addSubview:view1];
    [view1 addSubview:self.orderStatus];
    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.phoneLabel];
    [self.view addSubview:self.addressLabel];
    UIView *lineView1 = [[UIView alloc]init];
    lineView1.backgroundColor = RGBColorHex(0xcdcdcd);
    [self.view addSubview:lineView1];
    [self.view addSubview:self.iconImageView];
    [self.view addSubview:self.storeLabel];
    UIView *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = RGBColorHex(0xcdcdcd);
    [self.view addSubview:lineView2];
    [self.view addSubview:self.goodImageView];
    [self.view addSubview:self.goodNameLabel];
    [self.view addSubview:self.spec_keyLabel];
    [self.view addSubview:self.priceLabel];
    [self.view addSubview:self.totalPriceLabel];
    [self.view addSubview:self.totalPrice];
    [self.view addSubview:self.freightLabel];
    [self.view addSubview:self.freight];
    [self.view addSubview:self.discountLabel];
    [self.view addSubview:self.discount];
    [self.view addSubview:self.orderPriceLabel];
    [self.view addSubview:self.orderPrice];
    UIView *lineView3 = [[UIView alloc]init];
    lineView3.backgroundColor = RGBColorHex(0xcdcdcd);
    [self.view addSubview:lineView3];
    [self.view addSubview:self.paymentLabel];
    [self.view addSubview:self.payment];
    UIView *lineView4 = [[UIView alloc]init];
    lineView4.backgroundColor = RGBColorHex(0xcdcdcd);
    [self.view addSubview:lineView4];
    [self.view addSubview:self.informationLabel];
    [self.view addSubview:self.orderIDLabel];
    [self.view addSubview:self.payTimeLabel];
    [self.view addSubview:self.payTypeLabel];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(50);
    }];
    [_orderStatus mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view1.mas_centerX);
        make.centerY.equalTo(view1.mas_centerY);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(10);
        make.top.equalTo(view1.mas_bottom).with.offset(11);
    }];
    
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).with.offset(20);
        make.top.equalTo(self.nameLabel.mas_top);
    }];
    
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(10);
        make.top.equalTo(self.nameLabel.mas_bottom).with.offset(10);
    }];
    
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.addressLabel.mas_bottom).with.offset(16);
        make.height.mas_equalTo(5);
    }];
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView1.mas_bottom).with.offset(2);
        make.left.equalTo(self.view).with.offset(10);
        make.width.height.mas_equalTo(25);
    }];
    
    [_storeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).with.offset(6);
        make.top.equalTo(lineView1.mas_bottom).with.offset(8);
    }];
    
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.storeLabel.mas_bottom).with.offset(8);
        make.left.equalTo(self.view).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.height.mas_equalTo(1);
    }];
    
    [_goodImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView2.mas_bottom).with.offset(14);
        make.left.equalTo(self.view).with.offset(10);
        make.width.height.mas_equalTo(80);
    }];
    
    [_goodNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.goodImageView.mas_right).with.offset(12);
        make.top.equalTo(self.goodImageView.mas_top);
        make.right.equalTo(self.view).with.offset(-10);
    }];
    
    [_spec_keyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodNameLabel.mas_bottom).with.offset(12);
        make.left.equalTo(self.goodNameLabel.mas_left);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.spec_keyLabel.mas_bottom).with.offset(12);
        make.left.equalTo(self.goodNameLabel.mas_left);
    }];
    
    [_totalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodImageView.mas_bottom).with.offset(30);
        make.left.equalTo(self.view).with.offset(10);
    }];
    
    [_totalPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.totalPriceLabel.mas_top);
        make.right.equalTo(self.view).with.offset(-10);
    }];
    
    [_freightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.totalPriceLabel.mas_bottom).with.offset(6);
        make.left.equalTo(self.totalPriceLabel.mas_left);
    }];
    
    [_freight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.totalPrice.mas_bottom).with.offset(6);
        make.right.equalTo(self.totalPrice.mas_right);
    }];
    
    [_discountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.freightLabel.mas_bottom).with.offset(6);
        make.left.equalTo(self.totalPriceLabel.mas_left);
    }];
    
    [_discount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.freight.mas_bottom).with.offset(6);
        make.right.equalTo(self.totalPrice.mas_right);
    }];
    
    [_orderPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.discountLabel.mas_bottom).with.offset(6);
        make.left.equalTo(self.totalPriceLabel.mas_left);
    }];
    
    [_orderPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.discount.mas_bottom).with.offset(6);
        make.right.equalTo(self.totalPrice.mas_right);
    }];
    
    [lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.orderPriceLabel.mas_bottom).with.offset(9);
        make.left.equalTo(self.view).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.height.mas_equalTo(1);
    }];
    
    [_paymentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView3.mas_bottom).with.offset(8);
        make.left.equalTo(self.view).with.offset(10);
    }];
    
    [_payment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.paymentLabel.mas_top);
        make.right.equalTo(self.view).with.offset(-10);
    }];
    
    [lineView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.paymentLabel.mas_bottom).with.offset(12);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(5);
    }];
    
    [_informationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView4.mas_bottom).with.offset(16);
        make.left.equalTo(self.view).with.offset(10);
    }];
    
    [_orderIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.informationLabel.mas_bottom).with.offset(17);
        make.left.equalTo(self.informationLabel.mas_left);
    }];
    
    [_payTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.orderIDLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self.informationLabel.mas_left);
    }];
    
    [_payTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.payTimeLabel.mas_bottom).with.offset(6);
        make.left.equalTo(self.informationLabel.mas_left);
    }];
}

- (UILabel *)orderStatus{
    if (_orderStatus == nil) {
        _orderStatus = [[UILabel alloc]init];
        _orderStatus.font = [UIFont boldSystemFontOfSize:15];
        _orderStatus.textColor = RGBColorHex(0xfa0404);
        _orderStatus.text = @"交易成功";
    }return _orderStatus;
}

- (UILabel *)nameLabel{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.textColor = RGBColorHex(0x393939);
        _nameLabel.text = @"张胜男";
    }return _nameLabel;
}

- (UILabel *)phoneLabel{
    if (_phoneLabel == nil) {
        _phoneLabel = [[UILabel alloc]init];
        _phoneLabel.font = [UIFont systemFontOfSize:12];
        _phoneLabel.textColor = RGBColorHex(0x393939);
        _phoneLabel.text = @"13444343564";
    }return _phoneLabel;
}

- (UILabel *)addressLabel{
    if (_addressLabel == nil) {
        _addressLabel = [[UILabel alloc]init];
        _addressLabel.font = [UIFont systemFontOfSize:12];
        _addressLabel.textColor = RGBColorHex(0x393939);
        _addressLabel.text = @"广东省广州市白云区下新村永和街3巷22号";
    }return _addressLabel;
}

- (UIImageView *)iconImageView{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.layer.cornerRadius = 12.5;
    }return _iconImageView;
}

- (UILabel *)storeLabel{
    if (_storeLabel == nil) {
        _storeLabel = [[UILabel alloc]init];
        _storeLabel.font = [UIFont systemFontOfSize:12];
        _storeLabel.textColor = RGBColorHex(0x6f6f6f);
        _storeLabel.text = @"欧欧及";
    }return _storeLabel;
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

- (UILabel *)totalPriceLabel{
    if (_totalPriceLabel == nil) {
        _totalPriceLabel = [[UILabel alloc]init];
        _totalPriceLabel.font = [UIFont systemFontOfSize:12];
        _totalPriceLabel.textColor = RGBColorHex(0x393939);
        _totalPriceLabel.text = @"商品总价：";
    }return _totalPriceLabel;
}

- (UILabel *)totalPrice{
    if (_totalPrice == nil) {
        _totalPrice = [[UILabel alloc]init];
        _totalPrice.font = [UIFont systemFontOfSize:12];
        _totalPrice.textColor = RGBColorHex(0x393939);
        _totalPrice.text = @"￥736.00";
    }return _totalPrice;
}

- (UILabel *)freightLabel{
    if (_freightLabel == nil) {
        _freightLabel = [[UILabel alloc]init];
        _freightLabel.font = [UIFont systemFontOfSize:12];
        _freightLabel.textColor = RGBColorHex(0x393939);
        _freightLabel.text = @"运    费：";
    }return _freightLabel;
}

- (UILabel *)freight{
    if (_freight == nil) {
        _freight = [[UILabel alloc]init];
        _freight.font = [UIFont systemFontOfSize:12];
        _freight.textColor = RGBColorHex(0x393939);
        _freight.text = @"￥736.00";
    }return _freight;
}

- (UILabel *)discountLabel{
    if (_discountLabel == nil) {
        _discountLabel = [[UILabel alloc]init];
        _discountLabel.font = [UIFont systemFontOfSize:12];
        _discountLabel.textColor = RGBColorHex(0x393939);
        _discountLabel.text = @"店铺优惠：";
    }return _discountLabel;
}

- (UILabel *)discount{
    if (_discount == nil) {
        _discount = [[UILabel alloc]init];
        _discount.font = [UIFont systemFontOfSize:12];
        _discount.textColor = RGBColorHex(0x393939);
        _discount.text = @"￥736.00";
    }return _discount;
}

- (UILabel *)orderPriceLabel{
    if (_orderPriceLabel == nil) {
        _orderPriceLabel = [[UILabel alloc]init];
        _orderPriceLabel.font = [UIFont systemFontOfSize:12];
        _orderPriceLabel.textColor = RGBColorHex(0x393939);
        _orderPriceLabel.text = @"订单总价：";
    }return _orderPriceLabel;
}

- (UILabel *)orderPrice{
    if (_orderPrice == nil) {
        _orderPrice = [[UILabel alloc]init];
        _orderPrice.font = [UIFont systemFontOfSize:12];
        _orderPrice.textColor = RGBColorHex(0x393939);
        _orderPrice.text = @"￥736.00";
    }return _orderPrice;
}

- (UILabel *)paymentLabel{
    if (_paymentLabel == nil) {
        _paymentLabel = [[UILabel alloc]init];
        _paymentLabel.font = [UIFont systemFontOfSize:12];
        _paymentLabel.textColor = RGBColorHex(0xfa0404);
        _paymentLabel.text = @"实付款";
    }return _paymentLabel;
}

- (UILabel *)payment{
    if (_payment == nil) {
        _payment = [[UILabel alloc]init];
        _payment.font = [UIFont systemFontOfSize:12];
        _payment.textColor = RGBColorHex(0xfa0404);
        _payment.text = @"￥736.00";
    }return _payment;
}

- (UILabel *)informationLabel{
    if (_informationLabel == nil) {
        _informationLabel = [[UILabel alloc]init];
        _informationLabel.font = [UIFont systemFontOfSize:12];
        _informationLabel.textColor = RGBColorHex(0x151515);
        _informationLabel.text = @"订单信息:";
    }return _informationLabel;
}

- (UILabel *)orderIDLabel{
    if (_orderIDLabel == nil) {
        _orderIDLabel = [[UILabel alloc]init];
        _orderIDLabel.font = [UIFont systemFontOfSize:12];
        _orderIDLabel.textColor = RGBColorHex(0x707070);
        _orderIDLabel.text = @"订单号：45455222";
    }return _orderIDLabel;
}

- (UILabel *)payTimeLabel{
    if (_payTimeLabel == nil) {
        _payTimeLabel = [[UILabel alloc]init];
        _payTimeLabel.font = [UIFont systemFontOfSize:12];
        _payTimeLabel.textColor = RGBColorHex(0x707070);
        _payTimeLabel.text = @"付款时间：2019-03-22";
    }return _payTimeLabel;
}

- (UILabel *)payTypeLabel{
    if (_payTypeLabel == nil) {
        _payTypeLabel = [[UILabel alloc]init];
        _payTypeLabel.font = [UIFont systemFontOfSize:12];
        _payTypeLabel.textColor = RGBColorHex(0x707070);
        _payTypeLabel.text = @"支付方式：";
    }return _payTypeLabel;
}

- (void)setOrder_id:(NSInteger)order_id{
    _order_id = order_id;
    
    [http_user order_detail:_order_id success:^(id responseObject) {
        [self showData:responseObject];
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
}

- (void)showData:(id)responseObject{
    if (kObjectIsEmpty(responseObject)) {
        return;
    }
    ZFAddressEditModel *editModel = [ZFAddressEditModel mj_objectWithKeyValues:responseObject];
    ZFOrdersModel *goodModel = editModel.goods[0];
    
}
@end
