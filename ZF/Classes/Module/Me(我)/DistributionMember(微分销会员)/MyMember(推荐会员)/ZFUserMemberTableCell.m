//
//  ZFUserMemberTableCell.m
//  ZF
//
//  Created by admin on 2019/5/11.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFUserMemberTableCell.h"

@interface ZFUserMemberTableCell ()

@property (nonatomic, strong) UILabel *userLabel;
@property (nonatomic, strong) UILabel *companyLabel;
@property (nonatomic, strong) UIButton *seeButton;

@end

@implementation ZFUserMemberTableCell

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
    self.contentView.backgroundColor = RGBColorHex(0xf7e7e8);
    [self.contentView addSubview:self.userLabel];
    [self.contentView addSubview:self.companyLabel];
    [self.contentView addSubview:self.seeButton];
    
    [_userLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_companyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(self.contentView);
    }];
    
    [_seeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.mas_equalTo(-10);
    }];
    
}

-(void)seeButtonDidClick
{
    
}


- (UILabel *)userLabel {
    if (_userLabel == nil) {
        _userLabel = [[UILabel alloc] init];
        _userLabel.textColor = RGBColorHex(0x333333);
        _userLabel.font = [UIFont systemFontOfSize:14];
        _userLabel.text = @"用户ID";
    }
    return _userLabel;
}

- (UILabel *)companyLabel {
    if (_companyLabel == nil) {
        _companyLabel = [[UILabel alloc] init];
        _companyLabel.textColor = RGBColorHex(0x333333);
        _companyLabel.font = [UIFont systemFontOfSize:14];
        _companyLabel.text = @"公司名称";
    }
    return _companyLabel;
}

- (UIButton *)seeButton {
    if (_seeButton == nil) {
        _seeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_seeButton setTitle:@"查看" forState:UIControlStateNormal];
        [_seeButton setTitleColor:RGBColorHex(0x333333) forState:UIControlStateNormal];
        _seeButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_seeButton addTarget:self action:@selector(seeButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _seeButton;
}

@end
