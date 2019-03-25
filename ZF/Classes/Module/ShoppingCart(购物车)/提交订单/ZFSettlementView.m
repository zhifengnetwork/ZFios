//
//  ZFShoppingCartView.m
//  ZF
//
//  Created by weiming zhang on 2019/3/11.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFSettlementView.h"
#import "ZFBounceView.h"
#import "TYAlertController.h"
#import "TYShowAlertView.h"
#import "ZFDeleteView.h"
@interface ZFSettlementView()
@property (weak, nonatomic) IBOutlet UIButton *allSelectButton;
@property (weak, nonatomic) IBOutlet UILabel *allMoneyLabel;
@property (weak, nonatomic) IBOutlet UIButton *settleButton;

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
    self.backgroundColor = RGBColor(230, 230, 230);
    
}
+ (instancetype)CartView{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZFSettlementView" owner:self options:nil]lastObject];
}
- (IBAction)allSelect:(id)sender {
    
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
    ZFBounceView *bounceView = [[ZFBounceView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 344)];
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:bounceView preferredStyle:TYAlertControllerStyleActionSheet];
    alertController.backgoundTapDismissEnable = YES;
    [[self currentViewController] presentViewController:alertController animated:YES completion:nil];
}

- (void)deleteClick{
//    弹出删除界面
    ZFDeleteView *view = [[ZFDeleteView alloc]init];
    [TYShowAlertView showAlertViewWithView:view backgoundTapDismissEnable:YES];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.superview).with.offset(195 - LL_StatusBarHeight);
        make.centerX.equalTo(self.superview.mas_centerX);
        make.width.mas_equalTo(240);
        make.height.mas_equalTo(135);
    }];

    

}

//设置按钮
- (void)setEditing {
    [self.settleButton setTitle:@"删除" forState:UIControlStateNormal];
    self.allMoneyLabel.hidden = YES;
    [self.settleButton removeTarget:self action:@selector(buyClick) forControlEvents:UIControlEventTouchUpInside];
    [self.settleButton addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)setPrice{
    [self.settleButton setTitle:@"结算" forState:UIControlStateNormal];
    self.allMoneyLabel.hidden = NO;
    [self.settleButton removeTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
    [self.settleButton addTarget:self action:@selector(buyClick) forControlEvents:UIControlEventTouchUpInside];
}


@end
