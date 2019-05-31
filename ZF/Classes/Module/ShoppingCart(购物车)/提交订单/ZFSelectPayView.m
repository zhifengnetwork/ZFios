//
//  ZFSelectPayView.m
//  ZF
//
//  Created by weiming zhang on 2019/3/19.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFSelectPayView.h"
#import "ZFSelectPayCell.h"
#import "ZFAddCardVC.h"
#import "MJExtension.h"
#import "SVProgressHUD.h"
#import "WXPayModel.h"
#import "http_user.h"
#import "AFHTTPSessionManager.h"
#import "WXApiManager.h"

@interface ZFSelectPayView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UILabel *explainLabel;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UIButton *payBtn;
@property (nonatomic, assign) NSIndexPath *selIndex;

@property (nonatomic, strong)WXPayModel *payModel;
@end
@implementation ZFSelectPayView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}
- (void)setup{
    self.layer.cornerRadius = 10;
    self.backgroundColor = RGBColorHex(0xffffff);
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(LL_ScreenWidth);
        make.height.mas_equalTo(self.frame.size.height);
    }];
    UILabel *title = [[UILabel alloc]init];
    [title setText:@"请选择支付方式"];
    [title setFont:[UIFont boldSystemFontOfSize:17]];
    [title setTextColor:RGBColorHex(0x0f0f0f)];
    [self addSubview:title];
    
    UIButton *back = [[UIButton alloc]init];
    [back setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:back];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = RGBColorHex(0xf5f5f5);
    [self addSubview:lineView];
    
    _explainLabel = [[UILabel alloc]init];
    [_explainLabel setFont:[UIFont systemFontOfSize:13]];
    _explainLabel.textColor = RGBColorHex(0x666666);
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:@"请在0小时30分钟内完成支付 金额 ￥1476.00元"];
    NSRange range = [[str string]rangeOfString:@"￥1476.00"];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:238/225 green:65/225 blue:65/225 alpha:1] range:range];

    _explainLabel.attributedText = str;
    [self addSubview:self.explainLabel];
    
    _tableView = [[UITableView alloc]init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:self.tableView];
    
    _payBtn = [[UIButton alloc]init];
    [self addSubview:self.payBtn];
    [_payBtn setBackgroundImage:[UIImage imageNamed:@"submit"] forState:UIControlStateNormal];
    [_payBtn setTitle:@"提交订单" forState:UIControlStateNormal];
    [_payBtn addTarget:self action:@selector(payClick) forControlEvents:UIControlEventTouchUpInside];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).with.offset(15);
        make.centerX.equalTo(self.mas_centerX);
    }];
    [back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).with.offset(-16);
        make.centerY.equalTo(title.mas_centerY);
    }];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).with.offset(15);
        make.left.equalTo(self).with.offset(16);
        make.right.equalTo(self).with.offset(-16);
        make.height.mas_equalTo(1);
    }];
    [_explainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView.mas_bottom).with.offset(16);
        make.left.mas_equalTo(self).with.offset(16);
    }];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.explainLabel.mas_bottom).with.offset(16);
        make.left.right.equalTo(self);
        make.bottom.mas_equalTo(self.mas_bottom).with.offset(-49);
    }];
    [_payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.tableView.mas_bottom);
        make.left.bottom.right.equalTo(self);
    }];
}

- (void)setOrder_sn:(NSString *)order_sn{
    _order_sn = order_sn;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    UserInfoModel* userInfo = [UserInfoModel readUserInfo];
    [manager.requestSerializer setValue:userInfo.token forHTTPHeaderField:@"token"];
    
    [manager POST:@"https://mobile.zhifengwangluo.c3w.cc/api/payment/GetWxAppPaySign" parameters:@{@"order_sn" : _order_sn} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        DLog(@"获取成功：%@", responseObject);
        self.payModel = [WXPayModel payModelWithDic:responseObject[@"data"]];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        DLog(@"获取失败：%@", error);
    }];
}

#pragma mark --方法
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
//返回
- (void)backClick{
    [[self currentViewController]dismissViewControllerAnimated:YES completion:nil];
}
//付款
- (void)payClick{
     ZFSelectPayCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    if (cell.selected == YES) {
        WXApiManager *manager = [[WXApiManager alloc]init];
        [manager wechatPayWithPayModel:self.payModel];
    }
    //跳转到添加银行卡
//    if ([self.tableView indexPathForSelectedRow].row== 0&&[self.tableView indexPathForSelectedRow]!=nil) {
//        ZFAddCardVC *vc = [[ZFAddCardVC alloc]init];
//        [[self currentViewController]presentViewController:vc animated:YES completion:nil];
//    }
}

- (void)setPayNumber:(NSString *)payNumber{
    _payNumber = payNumber;

    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"请在0小时30分钟内完成支付 金额 %@元",self.payNumber]];
    NSRange range = [[str string]rangeOfString:self.payNumber];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:238/225 green:65/225 blue:65/225 alpha:1] range:range];
    
    _explainLabel.attributedText = str;
    
    
}

#pragma mark --tableview数据源协议
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //定义一个变量记录每次点击的cell的indexpath
    ZFSelectPayCell *celled = [tableView cellForRowAtIndexPath:_selIndex];
    [celled setSelected:NO];
    celled.accessoryType = UITableViewCellAccessoryNone;
    _selIndex = indexPath;
    ZFSelectPayCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:YES];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZFSelectPayCell *cell = [[ZFSelectPayCell alloc]init];
    if (indexPath.row == 0) {
        [cell.textLabel setText:@"微信支付"];
        }
    else if (indexPath.row == 1) {
        [cell.textLabel setText:@"支付宝"];
//    }else if (indexPath.row == 2){
//          [cell.textLabel setText:@"网易支付"];
//    }else if (indexPath.row == 3) {
//        [cell.textLabel setText:@"银行卡快捷支付"];
//    }else {
//        [cell.textLabel setText:@"余额"];
    }
    
    return cell;
}

@end
