//
//  ZFClassifyTableCell.m
//  ZF
//
//  Created by apple on 21/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFClassifyTableCell.h"


@interface ZFClassifyTableCell ()

/* 标题 */
@property (strong , nonatomic)UILabel *nameLabel;
/* 指示View */
@property (strong , nonatomic)UIView *indicatorView;

@end


@implementation ZFClassifyTableCell


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
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.indicatorView];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.contentView);
    }];
    
    [_indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.contentView);
        make.height.mas_equalTo(self.contentView);
        make.width.mas_equalTo(4);
    }];
}

#pragma mark - cell点击
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if (selected)
    {
        _indicatorView.hidden = NO;
        _nameLabel.textColor = [UIColor redColor];
        self.backgroundColor = [UIColor whiteColor];
    }else
    {
        _indicatorView.hidden = YES;
        _nameLabel.textColor = [UIColor blackColor];
        self.backgroundColor = [UIColor clearColor];
    }
}


-(void)setTitle:(NSString *)title
{
    _title = title;
    _nameLabel.text = _title;
}


- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x000000);
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.text = @"为您推荐";
    }
    return _nameLabel;
}


-(UIView *)indicatorView
{
    if(_indicatorView==nil)
    {
        _indicatorView = [[UIView alloc]initWithFrame:CGRectZero];
        _indicatorView.backgroundColor = RGBColorHex(0xff0000);
    }
    return _indicatorView;
}

@end
