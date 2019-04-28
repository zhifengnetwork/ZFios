//
//  ZFSpellListCell.m
//  ZF
//
//  Created by weiming zhang on 2019/4/28.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFSpellListCell.h"
@interface ZFSpellListCell()
@property (nonatomic, strong)UIImageView *iconImageView;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *lackNumberLabel;
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UIButton *spellListButton;
@end
@implementation ZFSpellListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.lackNumberLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.spellListButton];
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(25);
        make.centerY.equalTo(self.mas_centerY);
        make.width.height.mas_equalTo(10);
    }];
    
//    _nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.
//    }
}
- (UIImageView *)iconImageView{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.layer.cornerRadius = 5;
    }return _iconImageView;
}
@end
