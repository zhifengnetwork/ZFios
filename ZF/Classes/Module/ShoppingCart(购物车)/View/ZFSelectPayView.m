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
    [self addSubview:tableView];
    
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
        make.left.right.bottom.equalTo(self);
    }];
}
#pragma mark --方法
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
- (void)backClick{
    [[self currentViewController]dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark --tableview数据源协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID =@"zfselectcell";
    
    ZFSelectPayCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[ZFSelectPayCell alloc]init];
    }
    UIView *lineView = [[UIView alloc]init];
    lineView.frame = CGRectMake(16, 32, 14, 10);
    lineView.backgroundColor = [UIColor blackColor];
//    RGBColorHex(0xf5f5f5);
    
    [cell.contentView addSubview:lineView];
    
    return cell;
}

@end
