
//
//  ZFMyDynamicsTableCell.m
//  ZF
//
//  Created by admin on 2019/3/19.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMyDynamicsTableCell.h"

@interface ZFMyDynamicsTableCell()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ZFMyDynamicsTableCell

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
    self.contentView.backgroundColor = RGBColorHex(0xffffff);
    [self.contentView addSubview:self.iconView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.titleLabel];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(15);
        make.width.height.mas_equalTo(90);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(8);
        make.top.mas_equalTo(15);
        make.right.mas_equalTo(-25);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(8);
        make.top.equalTo(self->_nameLabel.mas_bottom).offset(8);
        make.right.mas_equalTo(-25);
    }];
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xcccccc);
    [self.contentView addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(self->_iconView.mas_left);
         make.right.mas_equalTo(-0);
         make.bottom.equalTo(self.contentView);
         make.height.mas_equalTo(0.5f);
     }];
    
    
}


- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"tupian_image"];
    }
    return _iconView;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x333333);
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.text = @"2019年2月3号 18点18分 张某人捐赠18元商品";
        _nameLabel.numberOfLines = 0;
    }
    return _nameLabel;
}


- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x999999);
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.text = @"2019年2月3号 18点18分 张某人捐赠18元商品2019年2月3号 18点18分 张某人捐赠18元商品";
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}


@end
