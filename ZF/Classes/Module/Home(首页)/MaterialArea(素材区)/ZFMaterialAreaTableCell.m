//
//  ZFMaterialAreaTableCell.m
//  ZF
//
//  Created by admin on 2019/5/16.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMaterialAreaTableCell.h"

@interface ZFMaterialAreaTableCell()

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* titleLabel;

@end

@implementation ZFMaterialAreaTableCell

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
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(80);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(10);
        make.top.mas_equalTo(30);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(10);
        make.top.equalTo(self->_nameLabel.mas_bottom).offset(7);
    }];
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xdadada);
    [self.contentView addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.mas_equalTo(0);
         make.right.mas_equalTo(-0);
         make.bottom.equalTo(self.contentView);
         make.height.mas_equalTo(0.5f);
     }];
    
}

-(void)setMaterialAreaModel:(ZFMaterialAreaModel *)materialAreaModel
{
    _materialAreaModel = materialAreaModel;
    
    if (!kStringIsEmpty(materialAreaModel.thumb))
    {
        NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,materialAreaModel.thumb];
        [_iconView sd_setImageWithURL:[NSURL URLWithString:str]];
    }
    _nameLabel.text = _materialAreaModel.title;
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"image"];
        _iconView.clipsToBounds = YES;
        _iconView.layer.cornerRadius = 3.0f;
    }
    return _iconView;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x151515);
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.text = @"DC口红拍摄素材";
    }
    return _nameLabel;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x505050);
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.text = @"需要下载请长按保存，图片";
    }
    return _titleLabel;
}

@end
