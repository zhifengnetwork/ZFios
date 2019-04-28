//
//  ZFGoodDetailVC.m
//  ZF
//
//  Created by weiming zhang on 2019/4/28.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFGoodDetailVC.h"
#import <SDCycleScrollView.h>

@interface ZFGoodDetailVC ()<SDCycleScrollViewDelegate,UIScrollViewDelegate>
@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UIButton *backButton;
@property (nonatomic, strong)UIButton *shareButton;
/* 轮播图 */
@property (strong , nonatomic)SDCycleScrollView *cycleScrollView;
@property (nonatomic, strong)NSMutableArray *imageUrls;

@property (nonatomic, strong)UILabel *activityNameLabel;
@property (nonatomic, strong)UILabel *endTimeLabel;
@property (nonatomic, strong)UIView *lineView;
@property (nonatomic, strong)UILabel *goodNameLabel;

@end

@implementation ZFGoodDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup{
    self.navigationController.navigationBar.hidden = YES;
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.cycleScrollView];
    [self.cycleScrollView addSubview:self.backButton];
    [self.cycleScrollView addSubview:self.shareButton];
    [self.scrollView addSubview:self.activityNameLabel];
    [self.scrollView addSubview:self.endTimeLabel];
    _lineView = [[UIView alloc]init];
    _lineView.backgroundColor = RGBColor(245, 245, 245);
    [self.scrollView addSubview:self.lineView];
    
    
    [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cycleScrollView).with.offset(27.5);
        make.top.equalTo(self.cycleScrollView).with.offset(42.5);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    
    [_shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.cycleScrollView).with.offset(-27.5);
        make.top.equalTo(self.cycleScrollView).with.offset(42.5);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    
    [_activityNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cycleScrollView.mas_bottom).with.offset(15);
        make.left.equalTo(self.view).with.offset(25);
    }];
    
    [_endTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cycleScrollView.mas_bottom).with.offset(15);
        make.right.equalTo(self.view).with.offset(-25);
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.activityNameLabel.mas_bottom).with.offset(15);
        make.height.mas_equalTo(1);
    }];
}

- (UIScrollView *)scrollView{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, LL_ScreenHeight)];
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake(0,1000);
    }return _scrollView;
}

- (UIButton *)backButton{
    if (_backButton == nil) {
        _backButton = [[UIButton alloc]init];
        [_backButton setImage:[UIImage imageNamed:@"zuojiantou"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    }return _backButton;
}

- (UIButton *)shareButton{
    if (_shareButton == nil) {
        _shareButton = [[UIButton alloc]init];
        [_shareButton setImage:[UIImage imageNamed:@"fenxiang"] forState:UIControlStateNormal];
        [_shareButton addTarget:self action:@selector(shareClick) forControlEvents:UIControlEventTouchUpInside];
    }return _shareButton;
}

- (SDCycleScrollView *)cycleScrollView{
    if (_cycleScrollView == nil) {
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 423) delegate:self placeholderImage:nil];
        _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
        _cycleScrollView.autoScrollTimeInterval = 3.0;
        _cycleScrollView.imageURLStringsGroup = self.imageUrls;
    }return _cycleScrollView;
}

-(NSMutableArray*)imageUrls
{
    if (_imageUrls==nil) {
        _imageUrls = [[NSMutableArray alloc]init];
        [_imageUrls addObject:@"http://gfs5.gomein.net.cn/T1obZ_BmLT1RCvBVdK.jpg"];
        [_imageUrls addObject:@"http://gfs9.gomein.net.cn/T1C3J_B5LT1RCvBVdK.jpg"];
        [_imageUrls addObject:@"http://gfs5.gomein.net.cn/T1CwYjBCCT1RCvBVdK.jpg"];
    }
    return _imageUrls;
}

- (UILabel *)activityNameLabel{
    if (_activityNameLabel == nil) {
        _activityNameLabel = [[UILabel alloc]init];
        _activityNameLabel.font = [UIFont systemFontOfSize:14];
        _activityNameLabel.textColor = RGBColor(232, 47, 92);
        _activityNameLabel.text = @"小团";
    }return _activityNameLabel;
}

- (UILabel *)endTimeLabel{
    if (_endTimeLabel == nil) {
        _endTimeLabel = [[UILabel alloc]init];
        _endTimeLabel.font = [UIFont systemFontOfSize:12];
        _endTimeLabel.textColor = RGBColor(232, 47, 92);
        _endTimeLabel.text = @"距离结束还有00:10:00";
    }return _endTimeLabel;
}

#pragma mark - 点击图片Bannar跳转
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"点击了%zd轮播图",index);
}

#pragma mark --方法
- (void)backClick{
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)shareClick{
    
}

@end
