//
//  ZFClassifyBannerHeadView.m
//  ZF
//
//  Created by apple on 29/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFClassifyBannerHeadView.h"
#import <SDCycleScrollView.h>

@interface ZFClassifyBannerHeadView ()<SDCycleScrollViewDelegate>

/* 轮播图 */
@property (strong , nonatomic)SDCycleScrollView *cycleScrollView;

@end

@implementation ZFClassifyBannerHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    self.backgroundColor = [UIColor whiteColor];
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 110) delegate:self placeholderImage:nil];
    _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    _cycleScrollView.autoScrollTimeInterval = 3.0;
    _cycleScrollView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_cycleScrollView];
}

- (void)setImageUrls:(NSArray *)imageUrls
{
    _imageUrls = imageUrls;
    _cycleScrollView.placeholderImage = [UIImage imageNamed:@"default_160"];
    if (_imageUrls.count == 0) return;
    _cycleScrollView.imageURLStringsGroup = _imageUrls;
    
}

#pragma mark - 点击图片Bannar跳转
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"点击了%zd轮播图",index);
}

@end
