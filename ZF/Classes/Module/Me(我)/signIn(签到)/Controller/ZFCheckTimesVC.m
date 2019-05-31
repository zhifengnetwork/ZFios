//
//  ZFCheckTimesVC.m
//  ETH
//
//  Created by weiming zhang on 2019/4/11.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ZFCheckTimesVC.h"
#import "http_mine.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "RefreshGifHeader.h"
#import "http_user.h"



@interface ZFCheckTimesVC ()

@property (nonatomic, strong)UILabel *idLabel;
@property (nonatomic, strong)UILabel *numberLabel;

@end

@implementation ZFCheckTimesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"签到详情";
    [self setup];
//    [self loadData];
}
- (void)setup
{
    [self.view addSubview:self.idLabel];
    [self.view addSubview:self.numberLabel];
    
    [_idLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(15);
    }];
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_idLabel.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
    }];
    
}


- (UILabel *)idLabel{
    if (_idLabel == nil) {
        _idLabel = [[UILabel alloc]init];
        _idLabel.font = [UIFont systemFontOfSize:15];
        _idLabel.textColor = RGBColorHex(0x151515);
        _idLabel.text = @"ID：56895";
    }
    return _idLabel;
}

- (UILabel *)numberLabel{
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc]init];
        _numberLabel.font = [UIFont systemFontOfSize:15];
        _numberLabel.textColor = RGBColorHex(0x151515);
        _numberLabel.text = @"2天签到次数：2";
    }
    return _numberLabel;
}



//-(void)loadData
//{
//    ZWeakSelf
//    [http_mine pay_management:^(id responseObject)
//     {
//         [weakSelf showData:responseObject];
//     } failure:^(NSError *error) {
//         [SVProgressHUD showErrorWithStatus:error.domain];
//     }];
//}
//
//-(void)showData:(id)responseObject
//{
//    if (responseObject==nil)
//    {
//        return;
//    }
//
//    self.userInfo = [UserInfoModel mj_objectWithKeyValues:responseObject];
//
//    _walletAddressTF.text = self.userInfo.bankid;
//    if (self.userInfo.walletcode)
//    {
//        [_walletQRCode sd_setImageWithURL:[NSURL URLWithString:self.userInfo.walletcode]];
//    }
//}
//


@end
