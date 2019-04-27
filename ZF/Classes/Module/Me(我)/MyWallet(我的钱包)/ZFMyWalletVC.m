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
@interface ZFMyWalletVC ()

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
    ZFMyWalletView *headerView = [[ZFMyWalletView alloc]init];
    [self.view addSubview:headerView];
    ZFMyWalletButton *billBtn = [[ZFMyWalletButton alloc]init];
    [self.view addSubview:billBtn];
    ZFMyWalletButton *myCardBtn = [[ZFMyWalletButton alloc]init];
    [self.view addSubview:myCardBtn];
    ZFMyWalletButton *myAlipayBtn = [[ZFMyWalletButton alloc]init];
    [self.view addSubview:myAlipayBtn];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
    }];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.height.mas_equalTo(132);
    }];
    
    [billBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headerView.mas_bottom).with.offset(15);
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.height.mas_equalTo(45);
    }];
    [billBtn buttonWithString:@"账单明细" WithString2:nil WithState:nil];
    [myCardBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(billBtn.mas_bottom).with.offset(15);
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.height.mas_equalTo(45);
    }];
    [myCardBtn buttonWithString:@"我的银行卡" WithString2:@"未添加" WithState:NO];
    [myAlipayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(myCardBtn.mas_bottom).with.offset(15);
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.height.mas_equalTo(45);
    }];
    [myAlipayBtn buttonWithString:@"我的支付宝" WithString2:@"已添加" WithState:YES];
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
    
//    UserInfoModel* userInfo = [UserInfoModel mj_objectWithKeyValues:responseObject];
//    [userInfo saveUserInfo];
    
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
