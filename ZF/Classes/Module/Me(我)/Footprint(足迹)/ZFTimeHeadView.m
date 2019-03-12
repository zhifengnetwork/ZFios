//
//  ZFTimeHeadView.m
//  ZF
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFTimeHeadView.h"

@interface ZFTimeHeadView()

@property (nonatomic, strong) UILabel* timeLabel;

@end

@implementation ZFTimeHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.backgroundColor = TableViewBGColor;
    [self addSubview:self.timeLabel];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.equalTo(self);
    }];
    
}


- (UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = RGBColorHex(0x1a1a1a);
        _timeLabel.font = [UIFont systemFontOfSize:15];
        _timeLabel.text = @"2019年2月15日";
    }
    return _timeLabel;
}


@end
