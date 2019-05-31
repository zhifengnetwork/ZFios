//
//  ZFCommodityEvaluationTableCell.m
//  ZF
//
//  Created by admin on 2019/3/26.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFCommodityEvaluationTableCell.h"


@interface ZFCommodityEvaluationTableCell()

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* phoneLabel;
@property (nonatomic, strong) UIImageView* experienceView;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UIImageView* iconImageView;
@property (nonatomic, strong) UILabel* numberLabel;

@end

@implementation ZFCommodityEvaluationTableCell

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
    [self.contentView addSubview:self.phoneLabel];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.experienceView];
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.numberLabel];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.top.mas_equalTo(10);
        make.width.height.mas_equalTo(28);
    }];
    
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_iconView.mas_right).offset(10);
        make.centerY.equalTo(self->_iconView);
    }];
    
    [_experienceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.top.equalTo(self->_iconView.mas_bottom).offset(8);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.top.equalTo(self->_iconView.mas_bottom).offset(10);
        make.right.mas_equalTo(-220);
    }];
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-90);
        make.top.mas_equalTo(5);
        make.width.height.mas_equalTo(115);
    }];
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_iconImageView.mas_right).offset(-5);
        make.top.equalTo(self->_iconImageView.mas_top).offset(5);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(10);
    }];
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xE8E8E8);
    [self.contentView addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.mas_equalTo(0);
         make.right.mas_equalTo(-0);
         make.bottom.equalTo(self.contentView);
         make.height.mas_equalTo(0.5f);
     }];
}

- (NSAttributedString *)setLabelIndent:(CGFloat)indent text:(NSString *)text {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.firstLineHeadIndent = indent * 3;
    [paragraphStyle setLineSpacing:5];//行间距
    NSDictionary *attributeDic = @{NSParagraphStyleAttributeName : paragraphStyle};
    NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:text attributes:attributeDic];
    
    return attrText;
}

- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"w12"];
    }
    return _iconView;
}

- (UILabel *)phoneLabel {
    if (_phoneLabel == nil) {
        _phoneLabel = [[UILabel alloc] init];
        _phoneLabel.textColor = RGBColorHex(0x7c7c7c);
        _phoneLabel.font = [UIFont systemFontOfSize:12];
        _phoneLabel.text = @"1*****98";
    }
    return _phoneLabel;
}

- (UIImageView *)experienceView {
    if (_experienceView == nil) {
        _experienceView = [[UIImageView alloc] init];
        _experienceView.image = [UIImage imageNamed:@"xd"];
    }
    return _experienceView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x0f0f0f);
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.attributedText = [self setLabelIndent:12 text:@"商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称商品名称"];
        [_titleLabel sizeToFit];
        _titleLabel.numberOfLines = 99;
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UIImageView *)iconImageView {
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.image = [UIImage imageNamed:@"image"];
    }
    return _iconImageView;
}

- (UILabel *)numberLabel {
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.textColor = RGBColorHex(0xffffff);
        _numberLabel.font = [UIFont systemFontOfSize:8];
        _numberLabel.backgroundColor = RGBColorHex(0x595959);
        _numberLabel.layer.cornerRadius = 5;
        _numberLabel.clipsToBounds = YES;
        _numberLabel.text = @" 4张";
    }
    return _numberLabel;
}

- (void)setCommentModel:(ZFGoodCommentModel *)commentModel{
    _commentModel = commentModel;
    if (!kStringIsEmpty(_commentModel.head_pic))
    {
        [_iconView sd_setImageWithURL:[NSURL URLWithString:_commentModel.head_pic]];
    }
    _phoneLabel.text = [NSString stringWithFormat:@"%@",_commentModel.username];
    _titleLabel.attributedText = [self setLabelIndent:12 text:[NSString stringWithFormat:@"%@",_commentModel.content]];
    
    _numberLabel.text = [NSString stringWithFormat:@"%ld",(long)_commentModel.img.count];
    if (_commentModel.img.count == 0) {
        _iconImageView.hidden = YES;
        _numberLabel.hidden = YES;
    }else{
        [_iconImageView sd_setImageWithURL:[NSURL URLWithString:_commentModel.img[0]]];
    }
}
@end
