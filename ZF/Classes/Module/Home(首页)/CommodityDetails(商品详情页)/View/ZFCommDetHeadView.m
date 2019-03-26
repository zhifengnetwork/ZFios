//
//  ZFCommDetHeadView.m
//  ZF
//
//  Created by admin on 2019/3/25.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFCommDetHeadView.h"
#import <SDCycleScrollView.h>

@interface ZFCommDetHeadView ()<SDCycleScrollViewDelegate>

/* 轮播图 */
@property (strong , nonatomic)SDCycleScrollView *cycleScrollView;

@property (nonatomic, strong) UILabel* numberLabel;

@end

@implementation ZFCommDetHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    self.backgroundColor = RGBMainColor;
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 375) delegate:self placeholderImage:nil];
    _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    _cycleScrollView.autoScroll = NO;
    _cycleScrollView.showPageControl = NO;
    
    [self addSubview:_cycleScrollView];
    [self addSubview:self.numberLabel];
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_cycleScrollView.mas_right).offset(-15);
        make.bottom.equalTo(self->_cycleScrollView.mas_bottom).offset(-7);
        make.width.mas_equalTo(42);
        make.height.mas_equalTo(20);
    }];
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xcccccc);
    [self addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.mas_equalTo(0);
         make.right.mas_equalTo(-0);
         make.bottom.equalTo(self);
         make.height.mas_equalTo(0.5f);
     }];
    
}

- (void)setImageUrls:(NSArray *)imageUrls
{
    _imageUrls = imageUrls;
    _cycleScrollView.placeholderImage = [UIImage imageNamed:@"default_160"];
    if (_imageUrls.count == 0) return;
    _cycleScrollView.imageURLStringsGroup = _imageUrls;
    
}

- (UILabel *)numberLabel {
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.textColor = RGBColorHex(0xffffff);
        _numberLabel.font = [UIFont systemFontOfSize:12];
        _numberLabel.backgroundColor = RGBColorHex(0xCDCDCD);
        _numberLabel.layer.cornerRadius = 10;
        _numberLabel.clipsToBounds = YES;
        _numberLabel.text = @"    1/2";
    }
    return _numberLabel;
}


#pragma mark - 点击图片Bannar跳转
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"点击了%zd轮播图",index);
}


@end
