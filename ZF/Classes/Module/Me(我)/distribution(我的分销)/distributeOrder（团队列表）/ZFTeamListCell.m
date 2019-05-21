//
//  ZFTeamListCell.m
//  ZF
//
//  Created by weiming zhang on 2019/5/21.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFTeamListCell.h"
#import "ZFSeeOrderVC.h"

@interface ZFTeamListCell()
@property (nonatomic, strong)UILabel *orderIDLabel;
@property (nonatomic, strong)UILabel *priceLabel;
@property (nonatomic, strong)UILabel *promptLabel;
@property (nonatomic, strong)UIButton *jumpButton;

@end
@implementation ZFTeamListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }return self;
}

- (void)setup{
    [self.contentView addSubview:self.orderIDLabel];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.promptLabel];
    [self.contentView addSubview:self.jumpButton];
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = RGBColorHex(0xcccccc);
    [self.contentView addSubview:lineView];
    
    
    [_orderIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView).with.offset(LL_ScreenWidth/8);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(LL_ScreenWidth/4+20);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    
    [_jumpButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.priceLabel.mas_centerY);
        make.right.equalTo(self.contentView).with.offset(-LL_ScreenWidth/8);
        make.width.height.mas_equalTo(30);
    }];
    
    [_promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.jumpButton.mas_left).with.offset(-20);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(1);
    }];
}

- (UILabel *)orderIDLabel{
    if (_orderIDLabel == nil) {
        _orderIDLabel = [[UILabel alloc]init];
        _orderIDLabel.font = [UIFont systemFontOfSize:13];
        _orderIDLabel.textColor = RGBColorHex(0x2f2f2f);
        _orderIDLabel.text = @"订单3223";
    }return _orderIDLabel;
}

- (UILabel *)priceLabel{
    if (_priceLabel == nil) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont systemFontOfSize:13];
        _priceLabel.textColor = RGBColorHex(0x2f2f2f);
        _priceLabel.text = @"234.23";
    }return _priceLabel;
}

- (UILabel *)promptLabel{
    if (_promptLabel == nil) {
        _promptLabel = [[UILabel alloc]init];
        _promptLabel.font = [UIFont systemFontOfSize:13];
        _promptLabel.textColor = RGBColorHex(0x2f2f2f);
        _promptLabel.text = @"订单而完全完成";
    }return _promptLabel;
}

- (UIButton *)jumpButton{
    if (_jumpButton == nil) {
        _jumpButton = [[UIButton alloc]init];
        _jumpButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [_jumpButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_jumpButton setTitle:@"查看" forState:UIControlStateNormal];
        [_jumpButton addTarget:self action:@selector(jumpClick) forControlEvents:UIControlEventTouchUpInside];
    }return _jumpButton;
}

- (void)setOrderModel:(ZFDetailDistModel *)orderModel{
    _orderModel = orderModel;
    _orderIDLabel.text = [NSString stringWithFormat:@"%ld",_orderModel.user_id];
    _priceLabel.text = _orderModel.nickname;
    if (kStringIsEmpty(_orderModel.mobile)) {
        _promptLabel.text = @"未绑定手机";
    }else{
        _promptLabel.text = _orderModel.mobile;
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

- (void)jumpClick{
    ZFSeeOrderVC *vc = [[ZFSeeOrderVC alloc]init];
    vc.user_id = self.orderModel.user_id;
    vc.name = self.orderModel.nickname;
    [[self currentViewController].navigationController pushViewController:vc animated:YES];
}
@end
