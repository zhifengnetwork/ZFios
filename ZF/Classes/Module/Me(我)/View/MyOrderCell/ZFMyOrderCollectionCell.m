//
//  ZFMyOrderCollectionCell.m
//  ZF
//
//  Created by apple on 08/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMyOrderCollectionCell.h"
#import "UIView+HJViewStyle.h"

@interface ZFMyOrderCollectionCell()

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* nuberLabel;

@end

@implementation ZFMyOrderCollectionCell

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
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.nuberLabel];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.mas_equalTo(10);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_iconView.mas_bottom).offset(8);
        make.centerX.equalTo(self->_iconView);
    }];
    
    //竖线
    [_nuberLabel mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(self->_iconView.mas_right).offset(25);
         make.centerY.equalTo(self.contentView);
         make.width.mas_equalTo(0.5f);
         make.height.mas_equalTo(40.0f);
     }];
    
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
        //图标点击事件
        _iconView.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [_iconView addGestureRecognizer:singleTap];
    }
    return _iconView;
}

- (void)handleSingleTap:(UITouch *)touch
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFMyOrderCollectionCellDidClick:)])
    {
        [self.delegate ZFMyOrderCollectionCellDidClick:self.indexPath];
    }
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.textColor = RGBColorHex(0x333333);
        _nameLabel.text = @"待付款";
        //Label点击事件
        _nameLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [_nameLabel addGestureRecognizer:singleTap];
    }
    return _nameLabel;
}

- (UILabel *)nuberLabel {
    if (_nuberLabel == nil) {
        _nuberLabel = [[UILabel alloc] init];
    }
    return _nuberLabel;
}

@end
