//
//  ZFOfflinePickupVC.m
//  ZF
//
//  Created by admin on 2019/3/16.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFOfflinePickupVC.h"

#import "SVProgressHUD.h"
#import "ZFTool.h"

@interface ZFOfflinePickupVC ()

@property (nonatomic, strong) UIView* bgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *codeView;

@property (nonatomic, strong) UIImage *qrImage;

@end

@implementation ZFOfflinePickupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ZFTool isHiddenNavigationBarSeparatorLine:YES vc:self];
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setup
{
    self.view.backgroundColor = RGBColorHex(0xf3f5f7);
    
    [self.view addSubview:self.bgView];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.codeView];
    
    self.title = @"线下取货";
    
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(47);
        make.width.height.mas_equalTo(360);
        make.centerX.equalTo(self.view);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_bgView.mas_top).offset(50);
        make.centerX.equalTo(self->_bgView);
    }];
    
    [_codeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_titleLabel.mas_bottom).offset(50);
        make.centerX.equalTo(self->_bgView);
        make.width.height.mas_equalTo(200);
    }];
    
}


- (UIView *)bgView {
    if (_bgView == nil) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = RGBColorHex(0xf3f5f7);
        _bgView.layer.borderWidth = 1.0f;
        _bgView.layer.borderColor = RGBColorHex(0xBBBBBB).CGColor;
    }
    return _bgView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x333333);
        _titleLabel.font = [UIFont systemFontOfSize:13];
        [_titleLabel sizeToFit];
        _titleLabel.text = @"券码：1243535465787";
    }
    return _titleLabel;
}


- (UIImageView *)codeView {
    if (_codeView == nil) {
        _codeView = [[UIImageView alloc] init];
        _codeView.image = [UIImage imageNamed:@"erweima"];
    }
    return _codeView;
}


@end
