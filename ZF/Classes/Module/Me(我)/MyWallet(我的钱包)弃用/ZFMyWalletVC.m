//
//  ZFMyWalletVC.m
//  ZF
//
//  Created by weiming zhang on 2019/3/21.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFMyWalletVC.h"
#import "ZFMyWalletView.h"
#import "ZFMyWalletButton.h"
#import "http_mine.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "ZFOrdersModel.h"
@interface ZFMyWalletVC ()
@property (nonatomic, strong)ZFOrdersModel *orderModel;
@property (nonatomic, strong)ZFMyWalletView *headerView;
@property (nonatomic, strong)ZFMyWalletButton *myCardBtn;
@property (nonatomic, strong)ZFMyWalletButton *myAlipayBtn;

@end

@implementation ZFMyWalletVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的钱包";
    self.navigationItem.leftBarButtonItem.image = [UIImage imageNamed:@"Back"];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor blackColor];
    self.view.backgroundColor = RGBColorHex(0xf5f5f5);
    [self setup];
    
}
- (void)setup{
    UIImageView *bgView = [[UIImageView alloc]init];
    [bgView setImage:[UIImage imageNamed:@"colour"]];
    [self.view addSubview:bgView];
    _headerView = [[ZFMyWalletView alloc]init];
    [self.view addSubview:_headerView];
    ZFMyWalletButton *billBtn = [[ZFMyWalletButton alloc]init];
    [self.view addSubview:billBtn];
    _myCardBtn = [[ZFMyWalletButton alloc]init];
    [self.view addSubview:_myCardBtn];
    _myAlipayBtn = [[ZFMyWalletButton alloc]init];
    [self.view addSubview:_myAlipayBtn];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
    }];
    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.height.mas_equalTo(142);
    }];
    
    [billBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_headerView.mas_bottom).with.offset(15);
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.height.mas_equalTo(45);
    }];
    [billBtn buttonWithString:@"账单明细" WithString2:nil WithState:nil];
    [_myCardBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(billBtn.mas_bottom).with.offset(15);
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.height.mas_equalTo(45);
    }];
    [_myCardBtn buttonWithString:@"我的银行卡" WithString2:@"未添加" WithState:NO];
    [_myAlipayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_myCardBtn.mas_bottom).with.offset(15);
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.height.mas_equalTo(45);
    }];
    [_myAlipayBtn buttonWithString:@"我的支付宝" WithString2:@"已添加" WithState:YES];
    ZWeakSelf
    [http_mine my_wallet:^(id responseObject)
     {
         [weakSelf showData:responseObject];
         
     } failure:^(NSError *error)
     {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
    
    
}

-(void)showData:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    self.orderModel = [ZFOrdersModel mj_objectWithKeyValues:responseObject];
    _headerView.orderModel = self.orderModel;
    //判断有无支付宝
    if ([self.orderModel.alipay isEqualToString:@""]) {
        [_myAlipayBtn changeType:0];
    }else{
        [_myAlipayBtn changeType:1];
    }
    //判断有无银行卡
    if ([self.orderModel.bank_card isEqualToString:@""]) {
        [_myCardBtn changeType:0];
    }else{
        [_myCardBtn changeType:1];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
