//
//  ZFSubmissionTableCell.m
//  ZF
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFSubmissionTableCell.h"

@interface ZFSubmissionTableCell()

@end

@implementation ZFSubmissionTableCell

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
        make.top.mas_equalTo(20);
        make.left.mas_equalTo(15);
        make.width.mas_equalTo(345);
        make.height.mas_equalTo(42);
        make.centerX.equalTo(self.contentView);
    }];
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    
    [_submissionButton setTitle:_title forState:UIControlStateNormal];
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
        _submissionButton.layer.cornerRadius = 5;
        _submissionButton.clipsToBounds = YES;
        //不接受点击事件
        _submissionButton.userInteractionEnabled = NO;
        [_submissionButton addTarget:self action:@selector(submissionButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _submissionButton;
}


@end
