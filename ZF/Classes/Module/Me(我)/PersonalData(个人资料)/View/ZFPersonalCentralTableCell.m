//
//  ZFPersonalCentralTableCell.m
//  ZF
//
//  Created by apple on 2019/3/11.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFPersonalCentralTableCell.h"

@interface ZFPersonalCentralTableCell()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UIImageView* nextView;

@end

@implementation ZFPersonalCentralTableCell

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
    self.contentView.backgroundColor = RGBColorHex(0xf3f5f7);
    [self.contentView addSubview:self.bgView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.nextView];
    
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(343);
        make.height.mas_equalTo(261);
        make.top.mas_equalTo(20);
        make.centerX.equalTo(self.contentView);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_bgView.mas_right).offset(15);
        make.centerY.equalTo(self->_bgView);
    }];
    
    [_nextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_bgView.mas_right).offset(-15);
        make.centerY.equalTo(self->_bgView);
    }];
    
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    _nameLabel.text = _title;
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

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x1a1a1a);
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.text = @"地址管理";
    }
    return _nameLabel;
}

- (UIImageView *)nextView {
    if (_nextView == nil) {
        _nextView = [[UIImageView alloc] init];
        _nextView.image = [UIImage imageNamed:@"ZJT"];
        _nextView.clipsToBounds = YES;
        _nextView.layer.cornerRadius = 3.0f;
    }
    return _nextView;
}


@end
