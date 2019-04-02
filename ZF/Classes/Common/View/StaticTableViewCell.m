//
//  StaticTableViewCell.m
//  LS
//
//  Created by apple on 2019/02/25.
//  Copyright © 2019 LS. All rights reserved.
//

#import "StaticTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface StaticTableViewCell()
//标题
@property (nonatomic, strong) UILabel * titleLabel;
//中间部分
@property (nonatomic, strong) UILabel * middleLabel;
//菜单图标
@property (nonatomic, strong) UIImageView * iconView;
//右图
@property (nonatomic, strong) UIImageView * iconViewRight;

//左2标题
@property (nonatomic, strong) UILabel * titleLeftLabel;
//右标题
@property (nonatomic, strong) UILabel * titleRightLabel;

@property (nonatomic, strong) UIView *hLineView;

//红点
@property (nonatomic, strong) UILabel* redDotLabel;

@end

@implementation StaticTableViewCell

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
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.middleLabel];
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.iconViewRight];
    [self.contentView addSubview:self.titleLeftLabel];
    [self.contentView addSubview:self.titleRightLabel];
    [self.contentView addSubview:self.redDotLabel];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(LeadingTrailingMargin);
        make.centerY.equalTo(self.contentView);
        //make.width.height.mas_equalTo(28);
    }];
    _iconView.hidden =  YES;
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(10);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_middleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.centerY.equalTo(self.contentView);
    }];
    _middleLabel.hidden = YES;
    
    [_iconViewRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-LeadingTrailingMargin);
        make.centerY.equalTo(self.contentView);
    }];
    _iconViewRight.hidden = YES;
    
    [_titleLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_titleLabel.mas_right).offset(10);
        make.centerY.equalTo(self.contentView);
    }];
    _titleLeftLabel.hidden = YES;
    
    [_titleRightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-LeadingTrailingMargin);
        make.centerY.equalTo(self.contentView);
    }];
    _titleRightLabel.hidden = YES;
    
    //下面横线
    self.hLineView = [[UIView alloc] init];
    self.hLineView.backgroundColor = RGBColor(224, 224, 224);
    [self.contentView addSubview:self.hLineView];
    
    [self.hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.right.bottom.equalTo(self.contentView);
         make.height.mas_equalTo(0.5f);
     }];
    
    [_redDotLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_titleRightLabel.mas_left).offset(-20);
        make.width.height.mas_equalTo(10);
        make.centerY.equalTo(self.contentView);
    }];
    _redDotLabel.hidden = YES;
    
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    _titleLabel.text = _title;
    
    if (kStringIsEmpty(_iconName))
    {
        [_titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(LeadingTrailingMargin);
            make.centerY.equalTo(self.contentView);
        }];
    }
    else
    {
        [_titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self->_iconView.mas_right).offset(10);
            make.centerY.equalTo(self.contentView);
        }];
    }
}

-(void)setMiddle:(NSString *)middle
{
    _middle = middle;
    _middleLabel.hidden = NO;
    _middleLabel.text = _middle;
}

-(void)setTitleLeft:(NSString *)titleLeft
{
    _titleLeft = titleLeft;
    _titleLeftLabel.hidden = NO;
    _titleLeftLabel.text = _titleLeft;
}

-(void)setTitleLeftTextColor:(UIColor *)titleLeftTextColor
{
    _titleLeftTextColor = titleLeftTextColor;
    _titleLeftLabel.textColor = _titleLeftTextColor;
}

-(void)setTitleRight:(NSString *)titleRight
{
    _titleRight = titleRight;
    _titleRightLabel.hidden = NO;
    _titleRightLabel.text = _titleRight;
    if (kStringIsEmpty(_iconNameRight))
    {
        [_titleRightLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-LeadingTrailingMargin);
            make.centerY.equalTo(self.contentView);
        }];
    }
    else
    {
        [_titleRightLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self->_iconViewRight.mas_left).offset(-10);
            make.centerY.equalTo(self.contentView);
        }];
    }
}

-(void)setTitleRightTextColor:(UIColor *)titleRightTextColor
{
    _titleRightTextColor = titleRightTextColor;
    _titleRightLabel.textColor = _titleRightTextColor;
}

-(void)setIconName:(NSString *)iconName
{
    _iconName = iconName;
    if (kStringIsEmpty(_iconName))
    {
        _iconView.hidden = YES;
    }
    else
    {
        _iconView.image = [UIImage imageNamed:_iconName];
        _iconView.hidden = NO;
    }
}

-(void)setIconNameRight:(NSString *)iconNameRight
{
    _iconNameRight = iconNameRight;
    if (kStringIsEmpty(_iconNameRight))
    {
        _iconViewRight.hidden = YES;
    }
    else
    {
        _iconViewRight.image = [UIImage imageNamed:_iconNameRight];
        _iconViewRight.hidden = NO;
    }
}

- (void)setIsiconRightClick:(BOOL)isiconRightClick
{
    _isiconRightClick = isiconRightClick;
    if (_isiconRightClick)
    {
        //点击事件
        _iconViewRight.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap1:)];
        [_iconViewRight addGestureRecognizer:singleTap];    }
}

- (void)handleSingleTap1:(UITouch *)touch
{
    if (self.rightClickBlock)
    {
        self.rightClickBlock(YES);
    }
}

-(void)setIsHideBottomLine:(BOOL)isHideBottomLine
{
    _isHideBottomLine = isHideBottomLine;
    
    self.hLineView.hidden = _isHideBottomLine;
}

-(void)setIsShowRedDot:(BOOL)isShowRedDot
{
    _isShowRedDot = isShowRedDot;
    self.redDotLabel.hidden = !_isShowRedDot;
}

#pragma mark - getter

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColor(46, 46, 46);
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.text = @"";
    }
    return _titleLabel;
}

- (UILabel *)middleLabel {
    if (_middleLabel == nil) {
        _middleLabel = [[UILabel alloc] init];
        _middleLabel.textColor = RGBColor(46, 46, 46);
        _middleLabel.font = [UIFont systemFontOfSize:15];
        _middleLabel.text = @"";
        _middleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _middleLabel;
}

- (UIImageView *)iconView
{
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}

- (UIImageView *)iconViewRight
{
    if (_iconViewRight == nil) {
        _iconViewRight = [[UIImageView alloc] init];
        _iconViewRight.image = [UIImage imageNamed:DefaultIconNameRight];
    }
    return _iconViewRight;
}

//左2标题
- (UILabel *)titleLeftLabel {
    if (_titleLeftLabel == nil) {
        _titleLeftLabel = [[UILabel alloc] init];
        _titleLeftLabel.textColor = RGBColor(122, 122, 122);
        _titleLeftLabel.font = [UIFont systemFontOfSize:15];
        _titleLeftLabel.text = @"";
    }
    return _titleLeftLabel;
}

//右标题
- (UILabel *)titleRightLabel {
    if (_titleRightLabel == nil) {
        _titleRightLabel = [[UILabel alloc] init];
        _titleRightLabel.textColor = RGBColorHex(0x999999);
        _titleRightLabel.font = [UIFont systemFontOfSize:15];
        _titleRightLabel.text = @"";
    }
    return _titleRightLabel;
}


- (UILabel *)redDotLabel {
    if (_redDotLabel == nil) {
        _redDotLabel = [[UILabel alloc] init];
        _redDotLabel.backgroundColor = [UIColor redColor];
        _redDotLabel.layer.cornerRadius = 5.0f;
        _redDotLabel.clipsToBounds = YES;
    }
    return _redDotLabel;
}

@end
