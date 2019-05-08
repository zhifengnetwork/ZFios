//
//  ZFShoppingCartView.m
//  ZF
//
//  Created by weiming zhang on 2019/3/11.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFSettlementView.h"
#import "ZFConfirmOrderVC.h"
#import "TYAlertController.h"
#import "UIView+TYAlertView.h"
#import "ZFDeleteView.h"
#import "http_shopping.h"
#import "SVProgressHUD.h"

@interface ZFSettlementView()
@property (weak, nonatomic) IBOutlet UIButton *allSelectButton;
@property (weak, nonatomic) IBOutlet UILabel *allMoneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UIButton *settleButton;

@property (nonatomic, strong)ZFDeleteView *deleteView;

@end
@implementation ZFSettlementView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    self.backgroundColor = RGBColorHex(0xe6e6e6);
    
}
+ (instancetype)CartView{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZFSettlementView" owner:self options:nil]lastObject];
}
- (IBAction)allSelect:(id)sender {
    self.allSelectButton.selected = !self.allSelectButton.selected;
//    标识 1全选 2不全选
    if (self.allSelectButton.selected == YES) {
        [http_shopping selectedOrAll:1 success:^(id responseObject)
         {
             
         } failure:^(NSError *error)
         {
             [SVProgressHUD showErrorWithStatus:error.domain];
         }];
    }else{
        [http_shopping selectedOrAll:2 success:^(id responseObject)
         {
             
         } failure:^(NSError *error)
         {
             [SVProgressHUD showErrorWithStatus:error.domain];
         }];
    }
    
}

- (void)setSettleModel:(ZFListModel *)settleModel{
    _settleModel = settleModel;
    if (_settleModel.selected_flag.all_flag ==0) {
        self.allSelectButton.selected = NO;
    }else{
        self.allSelectButton.selected = YES;
    }
    self.moneyLabel.text = _settleModel.cart_price_info.total_fee;
    
}

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
- (void)buyClick{
    ZFConfirmOrderVC *vc = [[ZFConfirmOrderVC alloc]init];
    [[self currentViewController].navigationController pushViewController:vc animated:YES];
}

- (void)deleteClick{
//    弹出删除界面
    _deleteView = [[ZFDeleteView alloc]init];
    _deleteView.ID = _ID;
    [_deleteView showInWindowWithOriginY:195 backgoundTapDismissEnable:YES];
    [_deleteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.superview).with.offset(195 - LL_StatusBarHeight);

        make.width.mas_equalTo(240);
        make.height.mas_equalTo(145);
    }];

}

//设置按钮
- (void)setEditing {
    [self.settleButton setTitle:@"删除" forState:UIControlStateNormal];
    self.moneyLabel.hidden = YES;
    self.allMoneyLabel.hidden = YES;
    [self.settleButton removeTarget:self action:@selector(buyClick) forControlEvents:UIControlEventTouchUpInside];
    [self.settleButton addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)setSettleMent{
    [self.settleButton setTitle:@"结算" forState:UIControlStateNormal];
    self.moneyLabel.hidden = NO;
    self.allMoneyLabel.hidden = NO;
    [self.settleButton removeTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
    [self.settleButton addTarget:self action:@selector(buyClick) forControlEvents:UIControlEventTouchUpInside];
}


@end
