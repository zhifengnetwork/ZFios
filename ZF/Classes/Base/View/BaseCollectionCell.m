//
//  BaseCollectionCell.m
//  ZF
//
//  Created by apple on 15/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "BaseCollectionCell.h"
#import "UIView+HJViewStyle.h"

@interface BaseCollectionCell()

@property (nonatomic, strong) UIView* bgView;

@end

@implementation BaseCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self mySetup];
        [self setup];
    }
    return self;
}

- (void)mySetup
{
    [self.contentView addSubview:self.bgView];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}

- (void)setup
{
    
}


-(void)setIsHead:(BOOL)isHead
{
    _isHead = isHead;
    [_bgView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self.contentView);
        make.left.mas_equalTo(10);
    }];
    
    _bgView.roundLeft = YES;
    _bgView.cornerRadius = 15.0f;
}

-(void)setIsFoot:(BOOL)isFoot
{
    _isFoot = isFoot;
    [_bgView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.equalTo(self.contentView);
        make.right.mas_equalTo(-10);
    }];
    _bgView.roundRight = YES;
    _bgView.cornerRadius = 15.0f;
}



- (UIView *)bgView {
    if (_bgView == nil) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}


@end
