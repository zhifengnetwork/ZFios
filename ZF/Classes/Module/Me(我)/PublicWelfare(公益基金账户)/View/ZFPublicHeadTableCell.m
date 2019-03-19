//
//  ZFPublicHeadTableCell.m
//  ZF
//
//  Created by admin on 2019/3/19.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFPublicHeadTableCell.h"

@interface ZFPublicHeadTableCell()

@property (nonatomic, strong) UIImageView *iconView;

@end

@implementation ZFPublicHeadTableCell

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
    [self.contentView addSubview:self.iconView];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.contentView);
        make.height.mas_equalTo(212);
    }];
    
}


- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"zhaopian"];
    }
    return _iconView;
}


@end
