//
//  ZFAgreeTableCell.m
//  ZF
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFAgreeTableCell.h"
#import "UIButton+LXMImagePosition.h"

@interface ZFAgreeTableCell()

@property (nonatomic, strong) UIButton *agreeButton;

@end

@implementation ZFAgreeTableCell

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
    [self.contentView addSubview:self.agreeButton];
    
    [_agreeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.equalTo(self.contentView);
    }];

    
}

//同意按钮被点击
- (void)agreeButtonDidClick:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    
}


- (UIButton *)agreeButton {
    if (_agreeButton == nil) {
        _agreeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_agreeButton setTitle:@"本人同意并接受以下协议" forState:UIControlStateNormal];
        [_agreeButton setImage:[UIImage imageNamed:@"J"] forState:UIControlStateNormal];
        [_agreeButton setImage:[UIImage imageNamed:@"J"] forState:UIControlStateSelected];
        [_agreeButton setTitleColor:RGBColorHex(0x101010) forState:UIControlStateNormal];
        _agreeButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_agreeButton setImagePosition:LXMImagePositionLeft spacing:12];
        [_agreeButton addTarget:self action:@selector(agreeButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _agreeButton;
}


@end
