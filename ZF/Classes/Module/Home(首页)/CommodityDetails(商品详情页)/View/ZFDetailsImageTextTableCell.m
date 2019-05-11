//
//  ZFDetailsImageTextTableCell.m
//  ZF
//
//  Created by apple on 28/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDetailsImageTextTableCell.h"


@interface ZFDetailsImageTextTableCell()

@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* titleLabel;

@property (nonatomic, strong) UIView* line1View;
@property (nonatomic, strong) UIView* line2View;

@end

@implementation ZFDetailsImageTextTableCell

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
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.line1View];
    [self.contentView addSubview:self.line2View];
    
    [_line1View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.equalTo(self.contentView);
        make.height.mas_equalTo(0.5f);
    }];
    
    [_line2View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(0.5f);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(130);
        make.centerY.equalTo(self.contentView);
        make.right.mas_equalTo(-50);
    }];
    
    //竖线
    UIView *hLineView1 = [[UIView alloc] init];
    hLineView1.backgroundColor = RGBColorHex(0xbbbbbb);
    [self addSubview:hLineView1];
    
    [hLineView1 mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.mas_equalTo(15);
         make.top.bottom.equalTo(self.contentView);
         make.width.mas_equalTo(0.5f);
     }];
    
    //竖线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xbbbbbb);
    [self addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.mas_equalTo(115);
         make.top.bottom.equalTo(self.contentView);
         make.width.mas_equalTo(0.5f);
     }];
    
    //竖线
    UIView *hLineView2 = [[UIView alloc] init];
    hLineView2.backgroundColor = RGBColorHex(0xbbbbbb);
    [self addSubview:hLineView2];
    
    [hLineView2 mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.right.mas_equalTo(-15);
         make.top.bottom.equalTo(self.contentView);
         make.width.mas_equalTo(0.5f);
     }];
    
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0xbbbbbb);
        _nameLabel.font = [UIFont systemFontOfSize:13];
        _nameLabel.text = @"质地";
    }
    return _nameLabel;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x0f0f0f);
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.text = @"玻璃材质";
    }
    return _titleLabel;
}

- (UIView *)line1View {
    if (_line1View == nil) {
        _line1View = [[UIView alloc] init];
        _line1View.backgroundColor = RGBColorHex(0xbbbbbb);
    }
    return _line1View;
}

- (UIView *)line2View {
    if (_line2View == nil) {
        _line2View = [[UIView alloc] init];
        _line2View.backgroundColor = RGBColorHex(0xbbbbbb);
    }
    return _line2View;
}

- (void)setAttributemodel:(ZFGoodModel *)attributemodel{
    _attributemodel = attributemodel;
    _titleLabel.text = [NSString stringWithFormat:@"%@",attributemodel.attr_name];
}
@end
