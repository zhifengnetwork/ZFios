//
//  ZFPersonalCentralTableCell.m
//  ZF
//
//  Created by apple on 2019/3/11.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFPersonalCentralTableCell.h"
#import "UIView+HJViewStyle.h"
#import "UIImageView+WebCache.h"


@interface ZFPersonalCentralTableCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UIImageView* nextView;

@end

@implementation ZFPersonalCentralTableCell

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
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.nextView];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self->_nextView.mas_left).offset(-20);
        make.centerY.equalTo(self.contentView);
    }];
    self.isShowTitleButton = NO;
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self->_nextView.mas_left).offset(-20);
        make.width.height.mas_equalTo(35);
        make.centerY.equalTo(self.contentView);
    }];
    self.isShowButton = NO;
    
    [_nextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-30);
        make.centerY.equalTo(self.contentView);
    }];
    self.isShowNextButton = YES;
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xf5f5f5);
    [self.contentView addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(self->_nameLabel.mas_left);
         make.right.equalTo(self->_nextView.mas_right);
         make.bottom.equalTo(self.contentView);
         make.height.mas_equalTo(0.5f);
     }];
    
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    _nameLabel.text = _title;
}

- (void)setName:(NSString *)name
{
    _name = name;
    _titleLabel.text = _name;
}

-(void)setUserInfo:(UserInfoModel *)userInfo
{
    _userInfo = userInfo;
    //显示头像
    [_iconView sd_setImageWithURL:[NSURL URLWithString:_userInfo.head_pic]];
}

-(void)setRoundTop:(BOOL)roundTop
{
    _roundTop = roundTop;
    _bgView.roundTop = _roundTop;
}

-(void)setRoundBottom:(BOOL)roundBottom
{
    _roundBottom = roundBottom;
    _bgView.roundBottom = _roundBottom;
}

-(void)setIsShowButton:(BOOL)isShowButton
{
    _isShowButton = isShowButton;
    
    _iconView.hidden = !_isShowButton;
}

- (void)setIsShowTitleButton:(BOOL)isShowTitleButton
{
    _isShowTitleButton = isShowTitleButton;
    
    _titleLabel.hidden = !_isShowTitleButton;
}

- (void)setIsShowNextButton:(BOOL)isShowNextButton
{
    _isShowNextButton = isShowNextButton;
    
    _nextView.hidden = !_isShowNextButton;
}



-(UIView *)bgView
{
    if(_bgView==nil)
    {
        _bgView = [[UIView alloc]initWithFrame:CGRectZero];
        _bgView.backgroundColor = RGBColorHex(0xffffff);
        _bgView.clipsToBounds = YES;
        _bgView.layer.cornerRadius = 3.0f;
    }
    return _bgView;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x1a1a1a);
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.text = @"地址管理";
    }
    return _nameLabel;
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"hd"];
        _iconView.clipsToBounds = YES;
        _iconView.layer.cornerRadius = 3.0f;
    }
    return _iconView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x666666);
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.text = @"Tony";
    }
    return _titleLabel;
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
