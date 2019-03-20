//
//  ZFSelectPayView.m
//  ZF
//
//  Created by weiming zhang on 2019/3/19.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFSelectPayView.h"
#import "ZFSelectPayCell.h"
@interface ZFSelectPayView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,assign) NSIndexPath *selIndex;
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
    [title setFont:[UIFont fontWithName:@"PingFang-SC-Bold" size:17]];
    [title setTextColor:RGBColorHex(0x0f0f0f)];
    [self addSubview:title];
    
    UIButton *back = [[UIButton alloc]init];
    [back setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:back];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = RGBColorHex(0xf5f5f5);
    [self addSubview:lineView];
    
    UILabel *explain = [[UILabel alloc]init];
    [explain setFont:[UIFont systemFontOfSize:13]];
    explain.textColor = RGBColorHex(0x666666);
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:@"请在0小时30分钟内完成支付 金额 ￥1476.00元"];
    NSRange range = [[str string]rangeOfString:@"￥1476.00"];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:238/225 green:65/225 blue:65/225 alpha:1] range:range];

    explain.attributedText = str;
    [self addSubview:explain];
    
    UITableView *tableView = [[UITableView alloc]init];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:tableView];
    
    UIButton *payBtn = [[UIButton alloc]init];
    [self addSubview:payBtn];
    [payBtn setBackgroundImage:[UIImage imageNamed:@"submit"] forState:UIControlStateNormal];
    [payBtn setTitle:@"提交订单" forState:UIControlStateNormal];
    [payBtn addTarget:self action:@selector(payClick) forControlEvents:UIControlEventTouchUpInside];
    
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
    [explain mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView.mas_bottom).with.offset(16);
        make.left.mas_equalTo(self).with.offset(16);
    }];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(explain.mas_bottom).with.offset(16);
        make.left.right.equalTo(self);
        make.bottom.mas_equalTo(self.mas_bottom).with.offset(-49);
    }];
    [payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(tableView.mas_bottom);
        make.left.bottom.right.equalTo(self);
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
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* ID = @"ZFSelectPayCell";
    ZFSelectPayCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[ZFSelectPayCell alloc]init];
    }
    
    if (_selIndex == indexPath) {
        [cell setSelected:YES];
    }else{
        [cell setSelected:NO];
    }
    
    if (indexPath.row == 0) {
        [cell.textLabel setText:@"银行卡快捷支付"];
    }else if (indexPath.row == 1) {
        [cell.textLabel setText:@"网易支付"];
    }else if (indexPath.row == 2){
        [cell.textLabel setText:@"支付宝"];
    }else if (indexPath.row == 3) {
        [cell.textLabel setText:@"微信支付"];
    }else {
        [cell.textLabel setText:@"余额"];
    }
    
    return cell;
}

@end
