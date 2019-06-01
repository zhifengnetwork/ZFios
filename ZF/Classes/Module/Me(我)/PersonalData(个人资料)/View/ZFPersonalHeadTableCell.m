//
//  ZFPersonalHeadTableCell.m
//  ZF
//
//  Created by apple on 2019/3/11.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFPersonalHeadTableCell.h"
#import "UIView+HJViewStyle.h"



@interface ZFPersonalHeadTableCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* userNameLabel;
@property (nonatomic, strong) UIImageView* nextView;

@end

@implementation ZFPersonalHeadTableCell

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
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.userNameLabel];
    [self.contentView addSubview:self.nextView];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(70);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(15);
        make.top.mas_equalTo(15);
    }];
    
    [_userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(15);
        make.top.equalTo(self->_nameLabel.mas_bottom).offset(10);
    }];
    
    [_nextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-30);
        make.centerY.equalTo(self.contentView);
    }];
    
    //切圆角
    _bgView.cornerRadius = 10;
    
}

-(void)setUserInfo:(UserInfoModel *)userInfo
{
    _userInfo = userInfo;
    
    //显示头像
    [_iconView sd_setImageWithURL:[NSURL URLWithString:_userInfo.head_pic]];
    _nameLabel.text = _userInfo.nickname;
    _userNameLabel.text =[NSString stringWithFormat:@"用户名:%@",_userInfo.user_id];
}

-(UIView *)bgView
{
    if(_bgView==nil)
    {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = RGBColorHex(0xffffff);
    }
    return _bgView;
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"hd"];
        _iconView.clipsToBounds = YES;
        _iconView.layer.cornerRadius = 35.0f;
    }
    return _iconView;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x0f0f0f);
        _nameLabel.font = [UIFont systemFontOfSize:19];
        _nameLabel.text = @"Tony";
    }
    return _nameLabel;
}

- (UILabel *)userNameLabel {
    if (_userNameLabel == nil) {
        _userNameLabel = [[UILabel alloc] init];
        _userNameLabel.textColor = RGBColorHex(0x666666);
        _userNameLabel.font = [UIFont systemFontOfSize:15];
        _userNameLabel.text = @"用户名:12345678";
    }
    return _userNameLabel;
}

- (UIImageView *)nextView {
    if (_nextView == nil) {
        _nextView = [[UIImageView alloc] init];
        _nextView.image = [UIImage imageNamed:@"ZJT"];
        _nextView.clipsToBounds = YES;
        _nextView.layer.cornerRadius = 3.0f;
    }
    return _nextView;
}


@end
