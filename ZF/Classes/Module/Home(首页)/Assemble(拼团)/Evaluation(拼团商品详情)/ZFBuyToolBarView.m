//
//  ZFToolBarView.m
//  ZF
//
//  Created by weiming zhang on 2019/4/29.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFBuyToolBarView.h"
#import "ZFSelectTypeView.h"
#import "http_mine.h"
#import "SVProgressHUD.h"
#import "TYAlertController.h"

@interface ZFBuyToolBarView()
@property (nonatomic, strong)UIButton *collectButton;
@property (nonatomic, strong)UIButton *customerServiceButton;
@property (nonatomic, strong)UIButton *onlyBuyButton;
@property (nonatomic, strong)UIButton *spellListButton;

@end
@implementation ZFBuyToolBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    [self addSubview:self.collectButton];
    [self addSubview:self.customerServiceButton];
    [self addSubview:self.onlyBuyButton];
    [self addSubview:self.spellListButton];
    
    [_collectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.mas_equalTo(LL_ScreenWidth/7);
    }];
    [_collectButton setTitleEdgeInsets:UIEdgeInsetsMake(_collectButton.imageView.frame.size.height+20,-_collectButton.imageView.frame.size.width, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [_collectButton setImageEdgeInsets:UIEdgeInsetsMake(-_collectButton.titleLabel.bounds.size.height-5, 0, 0, -_collectButton.titleLabel.bounds.size.width)];//图片距离右边框距离减少图片的宽度，其它不边
    
    [_customerServiceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.collectButton.mas_right);
        make.width.mas_equalTo(LL_ScreenWidth/7);
    }];
    [_customerServiceButton setTitleEdgeInsets:UIEdgeInsetsMake(_customerServiceButton.imageView.frame.size.height+20 ,-_customerServiceButton.imageView.frame.size.width, 0.0,0.0)];
    [_customerServiceButton setImageEdgeInsets:UIEdgeInsetsMake(-_collectButton.titleLabel.bounds.size.height-5, 0.0,0.0, -_customerServiceButton.titleLabel.bounds.size.width)];
    
    [_onlyBuyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.customerServiceButton.mas_right);
        make.width.mas_equalTo(2*LL_ScreenWidth/7);
    }];
    
    [_spellListButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.onlyBuyButton.mas_right);
        make.width.mas_equalTo(3*LL_ScreenWidth/7);
    }];
    
}

- (UIButton *)collectButton{
    if (_collectButton == nil) {
        _collectButton = [[UIButton alloc]init];
        _collectButton.backgroundColor = RGBColor(245, 245, 245);
        _collectButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [_collectButton setImage:[UIImage imageNamed:@"collection1"] forState:UIControlStateNormal];
        [_collectButton setImage:[UIImage imageNamed:@"collection2"] forState:UIControlStateSelected];
        [_collectButton setTitleColor:RGBColor(51, 51, 51) forState:UIControlStateNormal];
        [_collectButton setTitle:@"收藏" forState:UIControlStateNormal];
        [_collectButton addTarget:self action:@selector(collectClick) forControlEvents:UIControlEventTouchUpInside];
    }return _collectButton;
}

- (UIButton *)customerServiceButton{
    if (_customerServiceButton == nil) {
        _customerServiceButton = [[UIButton alloc]init];
        _customerServiceButton.backgroundColor = RGBColor(245, 245, 245);
        _customerServiceButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [_customerServiceButton setImage:[UIImage imageNamed:@"kefu"] forState:UIControlStateNormal];
        [_customerServiceButton setTitleColor:RGBColor(51, 51, 51) forState:UIControlStateNormal];
        [_customerServiceButton setTitle:@"客服" forState:UIControlStateNormal];
    }return _customerServiceButton;
}

- (UIButton *)onlyBuyButton{
    if (_onlyBuyButton == nil) {
        _onlyBuyButton = [[UIButton alloc]init];
        _onlyBuyButton.backgroundColor = RGBColorHex(0xfe8c45);
        _onlyBuyButton.titleLabel.font = [UIFont systemFontOfSize:16];
        _onlyBuyButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [_onlyBuyButton setTitle:@" ￥279\n单独购买" forState:UIControlStateNormal];
        [_onlyBuyButton setTitleColor:RGBColor(255, 255, 255) forState:UIControlStateNormal];
        [_onlyBuyButton addTarget:self action:@selector(onlyBuyClick) forControlEvents:UIControlEventTouchUpInside];
    }return _onlyBuyButton;
}

- (UIButton *)spellListButton{
    if (_spellListButton == nil) {
        _spellListButton = [[UIButton alloc]init];
        _spellListButton.titleLabel.font = [UIFont systemFontOfSize:16];
        _spellListButton.backgroundColor = RGBColor(232, 47, 92);
        _spellListButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [_spellListButton setTitle:@" ￥139\n发起拼单" forState:UIControlStateNormal];
        [_spellListButton setTitleColor:RGBColor(255, 255, 255) forState:UIControlStateNormal];
         [_spellListButton addTarget:self action:@selector(spellClick) forControlEvents:UIControlEventTouchUpInside];
    }return _spellListButton;
}

- (void)setAssembleModel:(ZFAssembleListModel *)assembleModel{
    _assembleModel = assembleModel;
    if (_assembleModel.collect ==0) {
        self.collectButton.selected = NO;
    }else{
        self.collectButton.selected = YES;
    }
   [_spellListButton setTitle:[NSString stringWithFormat:@" ￥%@\n发起拼单",self.assembleModel.info.group_price] forState:UIControlStateNormal];
    [_onlyBuyButton setTitle:[NSString stringWithFormat:@" ￥%@\n单独购买",self.assembleModel.info.shop_price] forState:UIControlStateNormal];
    
}

#pragma mark -- 跳转

- (void)collectClick{
    self.collectButton.selected = !self.collectButton.selected;
    if (_collectButton.selected == YES) {
                [http_mine collect_goods:self.assembleModel.info.goods_id success:^(id responseObject)
                 {
                     [SVProgressHUD showSuccessWithStatus:@"收藏成功"];
                 } failure:^(NSError *error) {
                     [SVProgressHUD showErrorWithStatus:error.domain];
                 }];
        }else{
                [http_mine del_collect_goods:self.assembleModel.info.goods_id success:^(id responseObject)
                 {
                     [SVProgressHUD showSuccessWithStatus:@"删除收藏成功"];
                 } failure:^(NSError *error) {
                     [SVProgressHUD showErrorWithStatus:error.domain];
                 }];
        
        }
    
}

//弹出选择款式窗口
- (void)spellClick{
    ZFSelectTypeView *view = [[ZFSelectTypeView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 400)];
    view.isPin = YES;
    view.team_id = self.assembleModel.info.team_id;
    view.goodID = self.assembleModel.info.goods_id;
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:view preferredStyle:TYAlertControllerStyleActionSheet];
    alertController.backgoundTapDismissEnable = YES;
    [[self currentViewController] presentViewController:alertController animated:YES completion:nil];
    
}

- (void)onlyBuyClick{
    ZFSelectTypeView *view = [[ZFSelectTypeView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 400)];
    view.onlyBuy = YES;
    view.team_id = self.assembleModel.info.team_id;
    view.goodID = self.assembleModel.info.goods_id;
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
@end
