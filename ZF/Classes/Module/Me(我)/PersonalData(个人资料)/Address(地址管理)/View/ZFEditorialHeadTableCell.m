//
//  ZFEditorialHeadTableCell.m
//  ZF
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFEditorialHeadTableCell.h"

@interface ZFEditorialHeadTableCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UITextField* nameTextField;

@end

@implementation ZFEditorialHeadTableCell

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
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.nameTextField];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(105);
        make.right.mas_equalTo(-25);
        make.top.bottom.equalTo(self.contentView);
    }];
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xf5f5f5);
    [self.contentView addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(self->_titleLabel.mas_left);
         make.right.equalTo(self->_bgView.mas_right).offset(-15);
         make.bottom.equalTo(self.contentView);
         make.height.mas_equalTo(0.5f);
     }];
    
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    _titleLabel.text = _title;
}

-(void)setName:(NSString *)name
{
    _name = name;
    _nameTextField.text = _name;
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

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x0f0f0f);
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.text = @"收货人：";
    }
    return _titleLabel;
}

- (UITextField *)nameTextField {
    if (_nameTextField == nil) {
        _nameTextField = [[UITextField alloc] init];
        _nameTextField.placeholder = @"";
        _nameTextField.font = [UIFont systemFontOfSize:14];
        _nameTextField.textColor = RGBColorHex(0x666666);
        _nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _nameTextField;
}

@end
