//
//  ZFSelectedTitleHeadView.m
//  ZF
//
//  Created by apple on 2019/3/1.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFSelectedTitleHeadView.h"


@interface ZFSelectedTitleHeadView()

@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* title2Label;

@end



@implementation ZFSelectedTitleHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    [self addSubview:self.titleLabel];
    [self addSubview:self.title2Label];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(17);
        make.centerX.equalTo(self);
    }];
    
    [_title2Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_titleLabel.mas_bottom).offset(5);
        make.centerX.equalTo(self);
    }];
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x101010);
        _titleLabel.font = [UIFont systemFontOfSize:20];
        _titleLabel.text = @"新品速递";
    }
    return _titleLabel;
}

- (UILabel *)title2Label {
    if (_title2Label == nil) {
        _title2Label = [[UILabel alloc] init];
        _title2Label.textColor = RGBColorHex(0x636363);
        _title2Label.font = [UIFont systemFontOfSize:12];
        _title2Label.text = @"各国好物 每日上新";
    }
    return _title2Label;
}


@end
