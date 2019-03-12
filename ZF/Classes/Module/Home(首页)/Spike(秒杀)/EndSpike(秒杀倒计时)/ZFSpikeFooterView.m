//
//  ZFSpikeFooterView.m
//  ZF
//
//  Created by apple on 2019/3/7.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFSpikeFooterView.h"


@interface ZFSpikeFooterView()

@property (nonatomic, strong) UILabel* nameLabel;

@end


@implementation ZFSpikeFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    [self addSubview:self.nameLabel];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
    }];
    
}


-(void)setName:(NSString *)name
{
    _name = name;
    
    self.nameLabel.text = _name;
}


- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.backgroundColor = RGBColorHex(0xff5722);
        _nameLabel.font = [UIFont systemFontOfSize:18];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.layer.cornerRadius = 5.0f;
        _nameLabel.clipsToBounds = YES;
    }
    return _nameLabel;
}

@end
