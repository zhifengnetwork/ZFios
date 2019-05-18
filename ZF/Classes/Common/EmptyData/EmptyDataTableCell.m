//
//  EmptyDataTableCell.m
//  XV
//
//  Created by apple on 29/03/2019.
//  Copyright © 2019 XR. All rights reserved.
//

#import "EmptyDataTableCell.h"

@interface EmptyDataTableCell()

//图片
@property (nonatomic, strong) UIImageView * iconView;
//title
@property (nonatomic, strong) UILabel *titleLabel;
//按钮
@property (nonatomic, strong) UIButton *okButton;

@end


@implementation EmptyDataTableCell

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
    [self.contentView addSubview:self.iconView];
    _iconView.hidden = YES;
    
    [self.contentView addSubview:self.titleLabel];
    _titleLabel.hidden = YES;
    
    [self.contentView addSubview:self.okButton];
    _okButton.hidden = YES;
    
    self.bgColor = TableViewBGColor;
}


-(void)setImage:(UIImage *)image
{
    _image = image;
    
    if (!_image)
    {
        _iconView.hidden = YES;
    }
    else
    {
        _iconView.image = _image;
        _iconView.hidden = NO;
    }
    
    [self updateUI];
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    
    if (!_title)
    {
        _titleLabel.hidden = YES;
    }
    else
    {
        _titleLabel.text = _title;
        _titleLabel.hidden = NO;
    }
    
    [self updateUI];
}

-(void)setAttributedTitle:(NSAttributedString *)attributedTitle
{
    _attributedTitle = attributedTitle;
    
    if (!_attributedTitle)
    {
        _titleLabel.hidden = YES;
    }
    else
    {
        _titleLabel.attributedText = _attributedTitle;
        _titleLabel.hidden = NO;
    }
    
    [self updateUI];
}

-(void)setBgColor:(UIColor *)bgColor
{
    _bgColor = bgColor;
    
    self.contentView.backgroundColor = _bgColor;
}

-(void)updateUI
{
    if (_iconView.hidden==NO && _titleLabel.hidden==NO)
    {
        [_iconView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView.mas_centerY).offset(-5);
        }];
        
        [_titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(self.contentView.mas_centerY).offset(5);
        }];
    }
    else if (_iconView.hidden==NO && _titleLabel.hidden==YES)
    {
        [_iconView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.centerY.equalTo(self.contentView);
        }];
    }
    else if (_iconView.hidden==YES && _titleLabel.hidden==NO)
    {
        [_titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.centerY.equalTo(self.contentView);
        }];
    }
}



#pragma mark - getter

- (UIImageView *)iconView
{
    if (_iconView == nil)
    {
        _iconView = [[UIImageView alloc] init];
        
        _iconView.contentMode = UIViewContentModeScaleAspectFill;
        _iconView.clipsToBounds = YES;
    }
    return _iconView;
}

- (UILabel *)titleLabel
{
    if (_titleLabel == nil)
    {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = RGBColor(173, 173, 173);
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.text = @"title";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UIButton *)okButton
{
    if (_okButton == nil)
    {
        _okButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_okButton addTarget:self action:@selector(ButtonDidSelected:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _okButton;
}

- (void)ButtonDidSelected:(UIButton *)sender
{
    
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(EmptyDataTableCellButtonDidClick:)])
    {
        [self.delegate EmptyDataTableCellButtonDidClick:_indexPath];
    }
}

@end
