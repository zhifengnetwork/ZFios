//
//  ZFInvoiceView.m
//  ZF
//
//  Created by weiming zhang on 2019/5/15.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFInvoiceView.h"
#import "ZFDetailInvoiceVC.h"
@interface ZFInvoiceView()<ZFDetailInvoiceVCDelegate>
@property (nonatomic, strong)UILabel *invoiceLabel;
@property (nonatomic, strong)UIButton *invoiceButton;
@property (nonatomic, strong)UIImageView *jumpImageView;
@end
@implementation ZFInvoiceView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    [self addSubview:self.invoiceLabel];
    [self addSubview:self.invoiceButton];
    [self addSubview:self.jumpImageView];
    
    [_invoiceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [_jumpImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [_invoiceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.jumpImageView.mas_left);
        make.centerY.equalTo(self.mas_centerY);
        make.width.mas_equalTo(200);
    }];
    
    
    
}

- (UILabel *)invoiceLabel{
    if (_invoiceLabel == nil) {
        _invoiceLabel = [[UILabel alloc]init];
        _invoiceLabel.font = [UIFont systemFontOfSize:15];
        _invoiceLabel.textColor = [UIColor blackColor];
        _invoiceLabel.text = @"发票信息";
    }return _invoiceLabel;
}
- (UIImageView *)jumpImageView{
    if (_jumpImageView == nil) {
        _jumpImageView = [[UIImageView alloc]init];
        _jumpImageView.image = [UIImage imageNamed:@"arrow"];
    }return _jumpImageView;
}

- (UIButton *)invoiceButton{
    if (_invoiceButton == nil) {
        _invoiceButton = [[UIButton alloc]init];
        _invoiceButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_invoiceButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_invoiceButton setTitle:@"不开发票" forState:UIControlStateNormal];
        [_invoiceButton addTarget:self action:@selector(invoiceClick) forControlEvents:UIControlEventTouchUpInside];
    }return _invoiceButton;
}

- (void)invoiceClick{
    ZFDetailInvoiceVC *vc = [[ZFDetailInvoiceVC alloc]init];
    vc.delegate = self;
    [[self currentViewController].navigationController pushViewController:vc animated:YES];
}

- (void)invoice:(NSArray *)invoiceArray isInvoice:(BOOL)isInvoice{
    _invoiceArray = invoiceArray;
    self.isInvoice = isInvoice;
    [_invoiceButton setTitle:invoiceArray[0] forState:UIControlStateNormal];
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
