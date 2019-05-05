//
//  ZFFootprintFooterView.m
//  ZF
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFFootprintFooterView.h"

@interface ZFFootprintFooterView()

@property (nonatomic, strong) UIButton* allButton;
@property (nonatomic, strong) UIButton* deleteButton;
@end


@implementation ZFFootprintFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.backgroundColor = RGBColorHex(0xffffff);
    [self addSubview:self.allButton];
    [self addSubview:self.deleteButton];

    
    [_allButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.centerY.equalTo(self);
    }];
    
    [_deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-25);
        make.width.mas_equalTo(55);
        make.height.mas_equalTo(28);
        make.centerY.equalTo(self);
    }];
    
}

-(void)allButtonDidClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFFootprintFooterViewDidClick:)])
    {
        [self.delegate ZFFootprintFooterViewDidClick:1];
        self.allButton.selected = YES;
    }
}



-(void)deleteButtonDidClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFFootprintFooterViewDidClick:)])
    {
        [self.delegate ZFFootprintFooterViewDidClick:2];
    }
}

- (UIButton *)allButton {
    if (_allButton == nil) {
        _allButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_allButton setTitle:@" 全选  " forState:UIControlStateNormal];
        [_allButton setImage:[UIImage imageNamed:@"option"] forState:UIControlStateNormal];
        [_allButton setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
        [_allButton setTitleColor:RGBColorHex(0x1a1a1a) forState:UIControlStateNormal];
        _allButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_allButton addTarget:self action:@selector(allButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _allButton;
}


- (UIButton *)deleteButton {
    if (_deleteButton == nil) {
        _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _deleteButton.backgroundColor = RGBColorHex(0xe51c23);
        [_deleteButton setTitle:@"删除" forState:UIControlStateNormal];
        _deleteButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_deleteButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _deleteButton.layer.cornerRadius = 5;
        _deleteButton.clipsToBounds = YES;
        [_deleteButton addTarget:self action:@selector(deleteButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteButton;
}


@end
