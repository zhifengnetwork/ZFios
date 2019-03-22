//
//  ZFClassifyHeadView.m
//  ZF
//
//  Created by apple on 22/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFClassifyHeadView.h"


@interface ZFClassifyHeadView()

@property (nonatomic, strong) UILabel* nameLabel;

@end

@implementation ZFClassifyHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    [self addSubview:self.nameLabel];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.mas_equalTo(10);
    }];
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = RGBColorHex(0x434343);
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.text = @"精选品牌";
    }
    return _nameLabel;
}

@end
