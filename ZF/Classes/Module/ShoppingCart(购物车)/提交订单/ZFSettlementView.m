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
@interface ZFSettlementView()
@property (weak, nonatomic) IBOutlet UIButton *allSelectButton;
@property (weak, nonatomic) IBOutlet UILabel *allMoneyLabel;

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

- (IBAction)buy:(id)sender {
    ZFBounceView *bounceView = [[ZFBounceView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 344)];
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:bounceView preferredStyle:TYAlertControllerStyleActionSheet];
    alertController.backgoundTapDismissEnable = YES;
    [[self currentViewController] presentViewController:alertController animated:YES completion:nil];

}
@end
