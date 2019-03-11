//
//  ZFSelectedCategoriesCell.m
//  ZF
//
//  Created by apple on 2019/3/1.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFSelectedCategoriesCell.h"

@interface ZFSelectedCategoriesCell()

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* vLineView;

@end

@implementation ZFSelectedCategoriesCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.contentView.backgroundColor = RGBColorHex(0x0E264A);;
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.vLineView];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.mas_equalTo(10);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_iconView.mas_bottom).offset(4);
        make.centerX.equalTo(self->_iconView);
    }];
    
    //竖线
    [_vLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(self->_iconView.mas_right).offset(25);
         make.centerY.equalTo(self.contentView);
         make.width.mas_equalTo(0.5f);
         make.height.mas_equalTo(40.0f);
     }];
    
}

-(void)setShowhLineView:(BOOL)showhLineView
{
    _showhLineView = showhLineView;
    _vLineView.hidden = !_showhLineView;
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    _nameLabel.text = _title;
}

-(void)setIconName:(NSString *)iconName
{
    _iconName = iconName;
    _iconView.image = [UIImage imageNamed:_iconName];
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"jx"];
    }
    return _iconView;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0xFFFFFF);
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.text = @"精选榜单";
    }
    return _nameLabel;
}

- (UILabel *)vLineView {
    if (_vLineView == nil) {
        _vLineView = [[UILabel alloc] init];
        _vLineView.backgroundColor = RGBColorHex(0xFFFFFF);
    }
    return _vLineView;
}

@end
