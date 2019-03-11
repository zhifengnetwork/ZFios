//
//  ZFSubmitTableCell.m
//  ZF
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFSubmitTableCell.h"

@interface ZFSubmitTableCell()

@property (nonatomic, strong) UIButton *submissionButton;

@end

@implementation ZFSubmitTableCell

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
    
    [self.contentView addSubview:self.submissionButton];
    
    [_submissionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(50);
    }];
}

- (void)submissionButtonDidClick
{
    
}

- (UIButton *)submissionButton {
    if (_submissionButton == nil) {
        _submissionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _submissionButton.backgroundColor = RGBColorHex(0xff5722);
        [_submissionButton setTitle:@"提交订单" forState:UIControlStateNormal];
        _submissionButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_submissionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_submissionButton addTarget:self action:@selector(submissionButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _submissionButton;
}

@end
