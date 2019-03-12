//
//  ZFAddressTagTableCell.m
//  ZF
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFAddressTagTableCell.h"

@interface ZFAddressTagTableCell()

@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UIButton *homeButton;
@property (nonatomic, strong) UIButton *companyButton;
@property (nonatomic, strong) UIButton *schoolButton;
@property (nonatomic, strong) UIButton *customButton;

@end

@implementation ZFAddressTagTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setup];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setup
{
    self.contentView.backgroundColor = TableViewBGColor;
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.homeButton];
    [self.contentView addSubview:self.companyButton];
    [self.contentView addSubview:self.schoolButton];
    [self.contentView addSubview:self.customButton];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_homeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->_titleLabel.mas_right).offset(11);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_companyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->_homeButton.mas_right).offset(15);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_schoolButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->_companyButton.mas_right).offset(15);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_customButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->_schoolButton.mas_right).offset(15);
        make.centerY.equalTo(self.contentView);
    }];
    
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xf5f5f5);
    [self.contentView addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(self->_titleLabel.mas_left);
         make.right.equalTo(self->_customButton.mas_right);
         make.bottom.equalTo(self.contentView);
         make.height.mas_equalTo(0.5f);
     }];
    
}

- (void)homeButtonDidClick
{
    
}

- (void)companyButtonDidClick
{
    
}


- (void)schoolButtonDidClick
{
    
}

- (void)customButtonDidClick
{
    
}


- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x666666);
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.text = @"地址标签";
    }
    return _titleLabel;
}

- (UIButton *)homeButton {
    if (_homeButton == nil) {
        _homeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_homeButton setTitle:@"家" forState:UIControlStateNormal];
        [_homeButton setTitleColor:RGBColorHex(0x0f0f0f) forState:UIControlStateNormal];
        _homeButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _homeButton.layer.borderWidth = 1.0f;
        _homeButton.layer.borderColor = RGBColorHex(0x999999).CGColor;
        _homeButton.layer.cornerRadius = 3;
        _homeButton.clipsToBounds = YES;
        [_homeButton addTarget:self action:@selector(homeButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _homeButton;
}

- (UIButton *)companyButton {
    if (_companyButton == nil) {
        _companyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_companyButton setTitle:@"  公司  " forState:UIControlStateNormal];
        [_companyButton setTitleColor:RGBColorHex(0x0f0f0f) forState:UIControlStateNormal];
        _companyButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _companyButton.layer.borderWidth = 1.0f;
        _companyButton.layer.borderColor = RGBColorHex(0x999999).CGColor;
        _companyButton.layer.cornerRadius = 3;
        _companyButton.clipsToBounds = YES;
        [_companyButton addTarget:self action:@selector(companyButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _companyButton;
}

- (UIButton *)schoolButton {
    if (_schoolButton == nil) {
        _schoolButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_schoolButton setTitle:@"  学校  " forState:UIControlStateNormal];
        [_schoolButton setTitleColor:RGBColorHex(0x0f0f0f) forState:UIControlStateNormal];
        _schoolButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _schoolButton.layer.borderWidth = 1.0f;
        _schoolButton.layer.borderColor = RGBColorHex(0x999999).CGColor;
        _schoolButton.layer.cornerRadius = 3;
        _schoolButton.clipsToBounds = YES;
        [_schoolButton addTarget:self action:@selector(schoolButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _schoolButton;
}


- (UIButton *)customButton {
    if (_customButton == nil) {
        _customButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_customButton setTitle:@" 自定义 " forState:UIControlStateNormal];
        [_customButton setTitleColor:RGBColorHex(0x999999) forState:UIControlStateNormal];
        _customButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _customButton.layer.borderWidth = 1.0f;
        _customButton.layer.borderColor = RGBColorHex(0x999999).CGColor;
        _customButton.layer.cornerRadius = 3;
        _customButton.clipsToBounds = YES;
        [_customButton addTarget:self action:@selector(customButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _customButton;
}

@end
