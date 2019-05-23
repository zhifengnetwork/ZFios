//
//  ZFClusterWindowTableCell.m
//  ZF
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFClusterWindowTableCell.h"
#import "UIImageView+WebCache.h"
#import "ZFTool.h"

@interface ZFClusterWindowTableCell()

@property (nonatomic, strong) UIImageView* iconView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* timeLabel;
@property (nonatomic, strong) UIButton* goSpellButton;

@end

@implementation ZFClusterWindowTableCell

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
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.goSpellButton];

    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.equalTo(self.contentView);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-170);
        make.top.equalTo(self->_iconView.mas_top).offset(5);
        make.left.equalTo(self->_iconView.mas_right).offset(5);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_nameLabel.mas_right).offset(35);
        make.top.equalTo(self->_nameLabel.mas_top);
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_nameLabel.mas_right).offset(30);
        make.top.equalTo(self->_titleLabel.mas_bottom).offset(5);
    }];
    
    [_goSpellButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self->_titleLabel.mas_right).offset(10);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(28);
    }];
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xcccccc);
    [self.contentView addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.mas_equalTo(0);
         make.right.mas_equalTo(-0);
         make.bottom.equalTo(self.contentView);
         make.height.mas_equalTo(0.5f);
     }];
    
}

- (void)goSpellButtonDidClick
{
    
}


- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"mr"];
    }
    return _iconView;
}


- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x333333);
        _nameLabel.font = [UIFont systemFontOfSize:10];
        _nameLabel.text = @"强泰家居水果店";
    }
    return _nameLabel;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x333333);
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.text = @"还差2人拼成";
    }
    return _titleLabel;
}

- (UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = RGBColorHex(0x333333);
        _timeLabel.font = [UIFont systemFontOfSize:10];
        _timeLabel.text = @"剩余00:40:30";
    }
    return _timeLabel;
}

- (UIButton *)goSpellButton {
    if (_goSpellButton == nil) {
        _goSpellButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _goSpellButton.backgroundColor = RGBColorHex(0xFF5722);
        [_goSpellButton setTitle:@"去拼单" forState:UIControlStateNormal];
        _goSpellButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_goSpellButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _goSpellButton.layer.cornerRadius = 3;
        _goSpellButton.clipsToBounds = YES;
        [_goSpellButton addTarget:self action:@selector(goSpellButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _goSpellButton;
}

- (void)setFoundModel:(ZFTeamFoundModel *)foundModel{
    _foundModel = foundModel;

    if (!kStringIsEmpty(_foundModel.head_pic))
    {
        [_iconView sd_setImageWithURL:[NSURL URLWithString:_foundModel.head_pic]];
    }
    _titleLabel.text = [NSString stringWithFormat:@"还差%ld人拼成",_foundModel.need];
    _nameLabel.text = _foundModel.nickname;
    _timeLabel.text = [ZFTool dateText:[NSString stringWithFormat:@"%ld",_foundModel.found_end_time]];
    
    
}
@end
