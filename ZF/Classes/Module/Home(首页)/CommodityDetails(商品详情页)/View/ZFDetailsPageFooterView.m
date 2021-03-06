//
//  ZFDetailsPageFooterView.m
//  ZF
//
//  Created by admin on 2019/3/27.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDetailsPageFooterView.h"
#import "UIButton+LXMImagePosition.h"
#import "http_mine.h"
#import "http_good.h"
#import "SVProgressHUD.h"
#import "ZFUserModel.h"
#import "ZFSelectTypeView.h"
#import "TYAlertController.h"

@interface ZFDetailsPageFooterView()<ZFSelectTypeViewDelegate>

@property (nonatomic, strong) UIButton* collectionButton;
@property (nonatomic, strong) UIButton* shoppingCartButton;
@property (nonatomic, strong) UIButton* addCartButton;
@property (nonatomic, strong) MASConstraint *left;
@property (nonatomic, strong) UIButton* immediatePurButton;


@end

@implementation ZFDetailsPageFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    [self addSubview:self.collectionButton];
    [self addSubview:self.shoppingCartButton];
    [self addSubview:self.addCartButton];
    [self addSubview:self.immediatePurButton];
    
    [_collectionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.height.mas_equalTo(50);
        make.top.mas_equalTo(0);
    }];
    
    [_shoppingCartButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_collectionButton.mas_right);
        make.width.height.mas_equalTo(50);
        make.top.mas_equalTo(0);
    }];
    
    [_addCartButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_shoppingCartButton.mas_right);
        make.width.mas_equalTo(140);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(0);
    }];
    
    [_immediatePurButton mas_makeConstraints:^(MASConstraintMaker *make) {
        self.left = make.left.equalTo(self->_addCartButton.mas_right);
        make.right.equalTo(self);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(0);
    }];
    
    //竖线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xE8E8E8);
    [self addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(self->_collectionButton.mas_right);
         make.centerY.equalTo(self->_collectionButton);
         make.width.mas_equalTo(1.0f);
         make.height.mas_equalTo(30.0f);
     }];
    
}

-(void)setDetailsPageModel:(ZFDetailsPageModel *)detailsPageModel
{
    _detailsPageModel = detailsPageModel;
    if (detailsPageModel.sign_free_receive.integerValue == 1) {
        [self.left uninstall];
        [self.immediatePurButton mas_updateConstraints:^(MASConstraintMaker *make) {
            self.left = make.left.equalTo(self.shoppingCartButton.mas_right);
        }];
        [self.immediatePurButton setTitle:@"免费领取" forState:UIControlStateNormal];
        self.addCartButton.hidden = YES;
    }
    
}


- (void)collectionButtonDidClick
{
//    _collectionButton.selected = !_collectionButton.selected;
//    if (_collectionButton.selected == YES) {
//        [http_mine collect_goods:_goodID success:^(id responseObject)
//         {
//             [SVProgressHUD showSuccessWithStatus:@"收藏成功"];
//         } failure:^(NSError *error) {
//             [SVProgressHUD showErrorWithStatus:error.domain];
//         }];
//    }else{
//        [http_mine del_collect_goods:_goodID success:^(id responseObject)
//         {
//             [SVProgressHUD showSuccessWithStatus:@"删除收藏成功"];
//         } failure:^(NSError *error) {
//             [SVProgressHUD showErrorWithStatus:error.domain];
//         }];
//    }
   
}

- (void)shoppingCartButtonDidClick
{
    
    
}

- (void)addCartButtonDidClick
{
    
    ZFSelectTypeView *view = [[ZFSelectTypeView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 370)];
    view.goodID = _goodID;
    view.addCart = YES;
    view.delegate = self;
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:view preferredStyle:TYAlertControllerStyleActionSheet];
    alertController.backgoundTapDismissEnable = YES;
    [[self currentViewController] presentViewController:alertController animated:YES completion:nil];
    
}

- (void)selectItemID:(NSString *)itemID{
    _itemID = itemID;
}

- (void)immediatePurButtonDidClick
{
    
    ZFSelectTypeView *view = [[ZFSelectTypeView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 370)];
    view.goodID = _goodID;
    view.isbuy = YES;
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:view preferredStyle:TYAlertControllerStyleActionSheet];
    alertController.backgoundTapDismissEnable = YES;
    [[self currentViewController] presentViewController:alertController animated:YES completion:nil];
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

- (UIButton *)collectionButton {
    if (_collectionButton == nil) {
        _collectionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_collectionButton setTitle:@"客服" forState:UIControlStateNormal];
        [_collectionButton setImage:[UIImage imageNamed:@"service"] forState:UIControlStateNormal];
        [_collectionButton setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
        _collectionButton.titleLabel.font = [UIFont systemFontOfSize:11];
        [_collectionButton setImagePosition:LXMImagePositionTop spacing:6];
        [_collectionButton addTarget:self action:@selector(collectionButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _collectionButton;
}


- (UIButton *)shoppingCartButton {
    if (_shoppingCartButton == nil) {
        _shoppingCartButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shoppingCartButton setTitle:@"购物车" forState:UIControlStateNormal];
        [_shoppingCartButton setImage:[UIImage imageNamed:@"shopping_default"] forState:UIControlStateNormal];
        [_shoppingCartButton setTitleColor:RGBColorHex(0x666666) forState:UIControlStateNormal];
        _shoppingCartButton.titleLabel.font = [UIFont systemFontOfSize:11];
        [_shoppingCartButton setImagePosition:LXMImagePositionTop spacing:6];
        [_shoppingCartButton addTarget:self action:@selector(shoppingCartButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shoppingCartButton;
}

- (UIButton *)addCartButton {
    if (_addCartButton == nil) {
        _addCartButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addCartButton setTitle:@"加入购物车" forState:UIControlStateNormal];
        [_addCartButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        _addCartButton.backgroundColor = RGBColorHex(0xf3b53f);
        _addCartButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_addCartButton addTarget:self action:@selector(addCartButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addCartButton;
}

- (UIButton *)immediatePurButton {
    if (_immediatePurButton == nil) {
        _immediatePurButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_immediatePurButton setTitle:@"立即购买" forState:UIControlStateNormal];
        [_immediatePurButton setTitleColor:RGBColorHex(0xffffff) forState:UIControlStateNormal];
        _immediatePurButton.backgroundColor = RGBColorHex(0xff5722);
        _immediatePurButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_immediatePurButton addTarget:self action:@selector(immediatePurButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _immediatePurButton;
}

@end
