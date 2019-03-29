//
//  ZFShareView.m
//  ZF
//
//  Created by weiming zhang on 2019/3/29.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFShareView.h"
#import "UIView+TYAlertView.h"
#import "ZFShareSuccessView.h"
@interface ZFShareView()
@property (nonatomic, strong)UIImageView *leftImageView;
@property (nonatomic, strong)UILabel *shareLabel;
@property (nonatomic, strong)UIImageView *rightImageView;
@property (nonatomic, strong)UIButton *qqButton;
@property (nonatomic, strong)UIButton *zhifuButton;
@property (nonatomic, strong)UIButton *weixingButton;
@property (nonatomic, strong)UIButton *linkButton;
@property (nonatomic, strong)UIButton *browserButton;
@property (nonatomic, strong)UIButton *cancelButton;
@end

@implementation ZFShareView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    self.backgroundColor = RGBAColorHex(0xffffff, 0.92);
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.frame.size.height);
    }];
    [self addSubview:self.leftImageView];
    [self addSubview:self.shareLabel];
    [self addSubview:self.rightImageView];
    [self addSubview:self.qqButton];
    [self addSubview:self.zhifuButton];
    [self addSubview:self.weixingButton];
    [self addSubview:self.linkButton];
    [self addSubview:self.browserButton];
    [self addSubview:self.cancelButton];
    [_shareLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self).with.offset(14);
    }];
    [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.shareLabel.mas_left).with.offset(-10);
        make.centerY.equalTo(self.shareLabel.mas_centerY);
    }];
    [_rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.shareLabel.mas_right).with.offset(10);
        make.centerY.equalTo(self.shareLabel.mas_centerY);
    }];
    [_qqButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shareLabel.mas_bottom).with.offset(44);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(80);
    }];
    _qqButton.imageEdgeInsets = UIEdgeInsetsMake(-_qqButton.titleLabel.frame.size.height -15, 0.0, 0.0, - _qqButton.titleLabel.frame.size.width);
    _qqButton.titleEdgeInsets = UIEdgeInsetsMake(0, - _qqButton.imageView.frame.size.width, -_qqButton.imageView.frame.size.height -10 , 0);
    [_zhifuButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.qqButton.mas_centerY);
        make.right.equalTo(self.qqButton.mas_left).with.offset(-16);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(80);
    }];
    _zhifuButton.imageEdgeInsets = UIEdgeInsetsMake(-_zhifuButton.titleLabel.frame.size.height -15, 0.0, 0.0, - _zhifuButton.titleLabel.frame.size.width);
    _zhifuButton.titleEdgeInsets = UIEdgeInsetsMake(0, - _zhifuButton.imageView.frame.size.width, -_zhifuButton.imageView.frame.size.height -10 , 0);
    [_weixingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.qqButton.mas_centerY);
        make.right.equalTo(self.zhifuButton.mas_left).with.offset(-16);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(80);
    }];
    _weixingButton.imageEdgeInsets = UIEdgeInsetsMake(-_weixingButton.titleLabel.frame.size.height -15, 0.0, 0.0, - _weixingButton.titleLabel.frame.size.width);
    _weixingButton.titleEdgeInsets = UIEdgeInsetsMake(0, - _weixingButton.imageView.frame.size.width, -_weixingButton.imageView.frame.size.height -10 , 0);
    [_linkButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.qqButton.mas_centerY);
        make.left.equalTo(self.qqButton.mas_right).with.offset(16);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(80);
    }];
    _linkButton.imageEdgeInsets = UIEdgeInsetsMake(-_linkButton.titleLabel.frame.size.height -15, 0.0, 0.0, - _linkButton.titleLabel.frame.size.width);
    _linkButton.titleEdgeInsets = UIEdgeInsetsMake(0, - _linkButton.imageView.frame.size.width, -_linkButton.imageView.frame.size.height -10 , 0);
    [_browserButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.qqButton.mas_centerY);
        make.left.equalTo(self.linkButton.mas_right).with.offset(16);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(80);
    }];
    _browserButton.imageEdgeInsets = UIEdgeInsetsMake(-_browserButton.titleLabel.frame.size.height -15, 0.0, 0.0, - _browserButton.titleLabel.frame.size.width);
    _browserButton.titleEdgeInsets = UIEdgeInsetsMake(0, - _browserButton.imageView.frame.size.width-5, -_browserButton.imageView.frame.size.height -10 , 0);
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(49);
    }];
}
- (UIImageView *)leftImageView{
    if (_leftImageView == nil) {
        _leftImageView = [[UIImageView alloc]init];
        _leftImageView.image = [UIImage imageNamed:@"left_b"];
    }
    return _leftImageView;
}
- (UILabel *)shareLabel{
    if (_shareLabel == nil) {
        _shareLabel = [[UILabel alloc]init];
        _shareLabel.font = [UIFont boldSystemFontOfSize:14];
        _shareLabel.textColor = RGBColorHex(0x0f0f0f);
        _shareLabel.text = @"分享到";
    }
    return _shareLabel;
}
- (UIImageView *)rightImageView{
    if (_rightImageView == nil) {
        _rightImageView = [[UIImageView alloc]init];
        _rightImageView.image = [UIImage imageNamed:@"right_b"];
    }
    return _rightImageView;
}
- (UIButton *)qqButton{
    if (_qqButton == nil) {
        _qqButton = [[UIButton alloc]init];
        [_qqButton setImage:[UIImage imageNamed:@"QQ"] forState:UIControlStateNormal];
        _qqButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_qqButton setTitleColor:RGBColorHex(0x333333) forState:UIControlStateNormal];
        [_qqButton setTitle:@"QQ" forState:UIControlStateNormal];
        [_qqButton addTarget:self action:@selector(jumpQQ) forControlEvents:UIControlEventTouchUpInside];
    }
    return _qqButton;
}
- (UIButton *)zhifuButton{
    if (_zhifuButton == nil) {
        _zhifuButton = [[UIButton alloc]init];
        [_zhifuButton setImage:[UIImage imageNamed:@"Alipay"] forState:UIControlStateNormal];
        _zhifuButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_zhifuButton setTitleColor:RGBColorHex(0x333333) forState:UIControlStateNormal];
        [_zhifuButton setTitle:@"支付宝" forState:UIControlStateNormal];
    }
    return _zhifuButton;
}
- (UIButton *)weixingButton{
    if (_weixingButton == nil) {
        _weixingButton = [[UIButton alloc]init];
        [_weixingButton setImage:[UIImage imageNamed:@"WeChat"] forState:UIControlStateNormal];
        _weixingButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_weixingButton setTitleColor:RGBColorHex(0x333333) forState:UIControlStateNormal];
        [_weixingButton setTitle:@"微信" forState:UIControlStateNormal];
    }
    return _weixingButton;
}
- (UIButton *)linkButton{
    if (_linkButton == nil) {
        _linkButton = [[UIButton alloc]init];
        [_linkButton setImage:[UIImage imageNamed:@"link"] forState:UIControlStateNormal];
        _linkButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_linkButton setTitleColor:RGBColorHex(0x333333) forState:UIControlStateNormal];
        [_linkButton setTitle:@"复制链接" forState:UIControlStateNormal];
    }
    return _linkButton;
}
- (UIButton *)browserButton{
    if (_browserButton == nil) {
        _browserButton = [[UIButton alloc]init];
        [_browserButton setImage:[UIImage imageNamed:@"browser"] forState:UIControlStateNormal];
        _browserButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_browserButton setTitleColor:RGBColorHex(0x333333) forState:UIControlStateNormal];
        [_browserButton setTitle:@"浏览器打开" forState:UIControlStateNormal];
    }
    return _browserButton;
}
- (UIButton *)cancelButton{
    if (_cancelButton == nil) {
        _cancelButton = [[UIButton alloc]init];
        _cancelButton.backgroundColor = RGBAColorHex(0xfafafa, 0.9);
        _cancelButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:RGBColorHex(0x333333) forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
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
- (void)jumpQQ{
    [self cancelClick];
    ZFShareSuccessView *view = [[ZFShareSuccessView alloc]initWithFrame:CGRectMake(10, 150, 280, 296)];
    [view showInWindowWithOriginY:150];
}
- (void)cancelClick{
    [[self currentViewController]dismissViewControllerAnimated:YES completion:nil];
}
@end
