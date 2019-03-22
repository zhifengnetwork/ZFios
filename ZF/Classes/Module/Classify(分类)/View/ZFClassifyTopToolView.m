//
//  ZFClassifyTopToolView.m
//  ZF
//
//  Created by apple on 22/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFClassifyTopToolView.h"

@interface ZFClassifyTopToolView ()

/* 搜索 */
@property (strong , nonatomic)UIView *topSearchView;
/* 搜索按钮 */
@property (strong , nonatomic)UIButton *searchButton;
/* 扫描按钮 */
@property (strong , nonatomic)UIButton *scanButton;
/* 通知 */
@property (weak ,nonatomic) id dcObserve;

@end

@implementation ZFClassifyTopToolView

#pragma mark - Intial
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpUI];
        
        [self acceptanceNote];
    }
    return self;
}

- (void)setUpUI
{
    self.backgroundColor = [UIColor clearColor];
    
    CAGradientLayer * layer = [[CAGradientLayer alloc] init];
    layer.frame = self.bounds;
    layer.colors = @[(id)[UIColor colorWithWhite:0 alpha:0.2].CGColor,(id)[UIColor colorWithWhite:0 alpha:0.15].CGColor,(id)[UIColor colorWithWhite:0 alpha:0.1].CGColor,(id)[UIColor colorWithWhite:0 alpha:0.05].CGColor,(id)[UIColor colorWithWhite:0 alpha:0.03].CGColor,(id)[UIColor colorWithWhite:0 alpha:0.01].CGColor,(id)[UIColor colorWithWhite:0 alpha:0.0].CGColor];
    [self.layer addSublayer:layer];
    
    _topSearchView = [[UIView alloc] init];
    _topSearchView.backgroundColor = RGBColor(240, 240, 240);
    _topSearchView.layer.cornerRadius = 16;
    [_topSearchView.layer masksToBounds];
    [self addSubview:_topSearchView];
    
    _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_searchButton setTitle:@"连衣裙" forState:0];
    [_searchButton setTitleColor:[UIColor lightGrayColor] forState:0];
    _searchButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [_searchButton setImage:[UIImage imageNamed:@"ss"] forState:0];
    [_searchButton adjustsImageWhenHighlighted];
    _searchButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _searchButton.titleEdgeInsets = UIEdgeInsetsMake(0, 2 * 10, 0, 0);
    _searchButton.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [_searchButton addTarget:self action:@selector(searchButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [_topSearchView addSubview:_searchButton];
    
    _scanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _scanButton.adjustsImageWhenHighlighted = NO;
    [_scanButton addTarget:self action:@selector(scanButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [_scanButton setImage:[UIImage imageNamed:@"sweep"] forState:0];
    [_topSearchView addSubview:_scanButton];
    
}

#pragma mark - 接受通知
- (void)acceptanceNote
{
    //滚动到详情
    ZWeakSelf
    _dcObserve = [[NSNotificationCenter defaultCenter]addObserverForName:UserShowTopToolViewNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        weakSelf.backgroundColor = [UIColor whiteColor];
        self->_topSearchView.backgroundColor = RGBColor(240, 240, 240);
    }];
    
    _dcObserve = [[NSNotificationCenter defaultCenter]addObserverForName:UserHideTopToolViewNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        weakSelf.backgroundColor = [UIColor clearColor];
        self->_topSearchView.backgroundColor = [UIColor whiteColor];
    }];
}

#pragma mark - 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_topSearchView mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.left.mas_equalTo(10);
        make.right.equalTo(self);
        make.height.mas_equalTo(44);
        make.centerY.mas_equalTo(self);
        
    }];
    
    [_searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->_topSearchView);
        make.top.mas_equalTo(self->_topSearchView);
        make.height.mas_equalTo(self->_topSearchView);
        [make.right.mas_equalTo(self->_topSearchView)setOffset:-2*10];
    }];
    
    [_scanButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_topSearchView);
        make.height.mas_equalTo(self->_topSearchView);
        make.right.equalTo(self->_topSearchView).offset(-10);
    }];
}

#pragma mark - 消失
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:_dcObserve];
}

#pragma mark - 搜索按钮点击
- (void)searchButtonClick
{
    !_searchButtonClickBlock ? : _searchButtonClickBlock();
}

#pragma mark - 语音点击
- (void)scanButtonClick
{
    
}

@end
