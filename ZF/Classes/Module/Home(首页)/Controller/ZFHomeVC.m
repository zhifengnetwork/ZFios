//
//  ZFHomeVC.m
//  ZF
//
//  Created by apple on 27/02/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFHomeVC.h"
#import "RefreshGifHeader.h"
#import "ZFBannerHeadView.h"
#import "ZFCommodityTableCell.h"
#import "ZFClassificationTableCell.h"
#import "ZFSpikeMerchandiseTableCell.h"
#import "ZFHomeTopToolView.h"
#import "ZFSelectedVC.h"
#import "ZFHomePageTitleHeadView.h"
#import "ZFFillOrderVC.h"
#import "ZFAuctionWMVC.h"
#import "ZFHomeSpikeHeadView.h"
#import "ZFTopLineFootView.h"
#import "CountDown.h"
#import "ZFStationNewsVC.h"


@interface ZFHomeVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,ZFHomeSpikeHeadViewDelegate>

/* 顶部工具View */
@property (nonatomic, strong) ZFHomeTopToolView *topToolView;

/* collectionView */
@property (strong , nonatomic)UICollectionView *collectionView;

//
@property (strong , nonatomic)NSMutableArray *imageUrls;

//秒杀倒计时
@property (strong, nonatomic) CountDown *countDown;

@end

@implementation ZFHomeVC


/* cell */
static NSString *const ZFCommodityTableCellID = @"ZFCommodityTableCellID";
static NSString *const ZFClassificationTableCellID = @"ZFClassificationTableCellID";
static NSString *const ZFSpikeMerchandiseTableCelllD = @"ZFSpikeMerchandiseTableCelllD";
/* head */
static NSString *const ZFBannerHeadViewID = @"ZFBannerHeadViewID";
static NSString *const ZFHomeSpikeHeadViewID = @"ZFHomeSpikeHeadViewID";
static NSString *const ZFHomePageTitleHeadViewID = @"ZFHomePageTitleHeadViewID";
/* foot */
static NSString *const ZFTopLineFootViewID = @"ZFTopLineFootViewID";

static NSString *const SpikeHeadTime = @"2019-03-06 14:24:02";


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupUI];
    
    _countDown = [[CountDown alloc] init];
    __weak __typeof(self) weakSelf= self;
    ///每秒回调一次
    [self.countDown countDownWithPER_SECBlock:^{
        [weakSelf updateTimeInVisibleCells];
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}


- (void)setupUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = TableViewBGColor;
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    self.collectionView.mj_header = [RefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    
    _topToolView = [[ZFHomeTopToolView alloc] initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 64)];
    ZWeakSelf
    _topToolView.leftItemClickBlock = ^{
        NSLog(@"点击了首页扫一扫");
    };
    _topToolView.rightItemClickBlock = ^{
        //站内消息
        ZFStationNewsVC *vc = [[ZFStationNewsVC alloc]init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    _topToolView.searchButtonClickBlock = ^{
        NSLog(@"点击了首页搜索");
    };
    [self.view addSubview:_topToolView];
}

-(void)loadData
{
    
}



#pragma mark - <UICollectionViewDataSource>
//有多少分组
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0)
    {
        return 8;
    }
    else if (section==1)
    {
        return 4;
    }
    else if (section==2)
    {
        return 10;
    }
    
    return 0;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *gridcell = nil;
    if (indexPath.section == 0)
    {
        //分类
        ZFClassificationTableCell *oell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFClassificationTableCellID forIndexPath:indexPath];
        
        if (indexPath.row==0)
        {
            oell.iconName = @"jx";
            oell.title = @"精选";
        }
        else if (indexPath.row==1)
        {
            oell.iconName = @"zb";
            oell.title = @"视频直播";
        }
        else if (indexPath.row==2)
        {
            oell.iconName = @"qd";
            oell.title = @"签到";
        }
        else if (indexPath.row==3)
        {
            oell.iconName = @"hd";
            oell.title = @"活动专区";
        }
        else if (indexPath.row==4)
        {
            oell.iconName = @"mr";
            oell.title = @"美容专区";
        }
        else if (indexPath.row==5)
        {
            oell.iconName = @"ph";
            oell.title = @"佣金排行榜";
        }
        else if (indexPath.row==6)
        {
            oell.iconName = @"sc";
            oell.title = @"素材区";
        }
        else if (indexPath.row==7)
        {
            oell.iconName = @"xyx";
            oell.title = @"小游戏";
        }
        
        gridcell = oell;
    }
    else if (indexPath.section == 1)
    {
        //秒杀商品
        ZFSpikeMerchandiseTableCell *xell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFSpikeMerchandiseTableCelllD forIndexPath:indexPath];
        gridcell = xell;
    }
    else if (indexPath.section == 2)
    {
        //推荐
        ZFCommodityTableCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFCommodityTableCellID forIndexPath:indexPath];
        gridcell = cell;
    }
    return gridcell;
}


//分组的头部尾部
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionReusableView *reusableview = nil;
    
    //头部
    if (kind == UICollectionElementKindSectionHeader)
    {
        if (indexPath.section == 0)
        {
            ZFBannerHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFBannerHeadViewID forIndexPath:indexPath];
            headerView.imageUrls = self.imageUrls;
            reusableview = headerView;
        }
        else if (indexPath.section == 1)
        {
            ZFHomeSpikeHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFHomeSpikeHeadViewID forIndexPath:indexPath];
            headerView.timeString = [self getNowTimeWithString:SpikeHeadTime];
            headerView.delegate = self;
            reusableview = headerView;
        }
        else if (indexPath.section == 2)
        {
            ZFHomePageTitleHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFHomePageTitleHeadViewID forIndexPath:indexPath];
            reusableview = headerView;
        }
        
    }
    else if (kind == UICollectionElementKindSectionFooter)
    {
        if (indexPath.section == 0)
        {
            ZFTopLineFootView *footview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:ZFTopLineFootViewID forIndexPath:indexPath];
            reusableview = footview;
        }
    }
    
    return reusableview;
}

//这里我为了直观的看出每组的CGSize设置用if 后续我会用简洁的三元表示
#pragma mark - item宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        //9宫格组
        return CGSizeMake(LL_ScreenWidth/4 , LL_ScreenWidth/4 - 15);
    }
    else if (indexPath.section == 1)
    {
        //9宫格组
        return CGSizeMake(LL_ScreenWidth/4 , LL_ScreenWidth/4 + 20);
    }
//    if (indexPath.section == 1) {//广告
//        return CGSizeMake(ScreenW, 180);
//    }
//    if (indexPath.section == 4) {//推荐组
//        return [self layoutAttributesForItemAtIndexPath:indexPath].size;
//    }
    else if (indexPath.section == 2) {//猜你喜欢
        return CGSizeMake((LL_ScreenWidth - 4)/2, (LL_ScreenWidth - 4)/2 + 40);
    }
    return CGSizeZero;
}

//返回rect中的所有的元素的布局属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    if (indexPath.section == 4)
    {
//        if (indexPath.row == 0)
//        {
//            layoutAttributes.size = CGSizeMake(ScreenW, ScreenW * 0.38);
//        }
//        else if (indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4)
//        {
//            layoutAttributes.size = CGSizeMake(ScreenW * 0.5, ScreenW * 0.24);
//        }
//        else
//        {
//            layoutAttributes.size = CGSizeMake(ScreenW * 0.25, ScreenW * 0.35);
//        }
    }
    return layoutAttributes;
}

#pragma mark - head宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return CGSizeMake(LL_ScreenWidth, 100+64); //图片滚动的宽高
    }
    else if (section == 1)
    {
        return CGSizeMake(LL_ScreenWidth, 22);
    }
    else if (section == 2)
    {
        return CGSizeMake(LL_ScreenWidth, 38);
    }
    return CGSizeZero;
}

#pragma mark - foot宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    if (section == 0)
    {
        return CGSizeMake(LL_ScreenWidth, 44);  //Top头条的宽高
    }
    
    return CGSizeZero;
}

#pragma mark - <UICollectionViewDelegateFlowLayout>
#pragma mark - X间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return (section == 5) ? 4 : 0;
}

#pragma mark - Y间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return (section == 5) ? 4 : 0;
}

//点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        if (indexPath.row==0)
        {
            ZFSelectedVC* vc = [[ZFSelectedVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row==1)
        {
            ZFFillOrderVC* vc = [[ZFFillOrderVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row==2)
        {
            
        }
        else if (indexPath.row==3)
        {
            
        }
    }
    else if (indexPath.section==1)
    {
        [self toAuctionWMVC];
    }
}

/**
 首页秒杀headview被点击
 */
- (void)ZFHomeSpikeHeadViewDidClick
{
    [self toAuctionWMVC];
}

-(void)toAuctionWMVC
{
    //秒杀
    ZFAuctionWMVC *wmvc = [[ZFAuctionWMVC alloc] init];
    wmvc.menuViewStyle = WMMenuViewStyleLine;
    wmvc.automaticallyCalculatesItemWidths = YES;
    wmvc.showOnNavigationBar = YES;
    wmvc.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
    wmvc.titleColorSelected = RGBColorHex(0x333333);
    wmvc.titleColorNormal = RGBColorHex(0x333333);
    wmvc.progressColor = RGBColorHex(0x333333);
    wmvc.titleSizeSelected = 16.0f;
    wmvc.titleSizeNormal = 16.0f;
    wmvc.itemMargin = 30.0f;
    [self.navigationController pushViewController:wmvc animated:YES];
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //判断顶部工具View的显示和隐形
    _topToolView.hidden = (scrollView.contentOffset.y < 0) ? YES : NO;
    
    if (scrollView.contentOffset.y > 44)
    {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
        [[NSNotificationCenter defaultCenter] postNotificationName:UserShowTopToolViewNotification object:nil];
    }else
    {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
        [[NSNotificationCenter defaultCenter] postNotificationName:UserHideTopToolViewNotification object:nil];
    }
}


-(void)updateTimeInVisibleCells
{
    //重新刷新section，防止闪烁
    [UIView performWithoutAnimation:^{
        [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:1]];
    }];
    
//    [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:1]];
//    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:0 inSection:1];
//    ZFHomeSpikeHeadView *headerView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFHomeSpikeHeadViewID forIndexPath:indexPath];
//    if (headerView!=nil)
//    {
//        headerView.timeString = [self getNowTimeWithString:SpikeHeadTime];
//    }
}

-(NSString *)getNowTimeWithString:(NSString *)aTimeString
{
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // 截止时间date格式
    NSDate  *expireDate = [formater dateFromString:aTimeString];
    NSDate  *nowDate = [NSDate date];
    // 当前时间字符串格式
    NSString *nowDateStr = [formater stringFromDate:nowDate];
    // 当前时间date格式
    nowDate = [formater dateFromString:nowDateStr];
    
    NSTimeInterval timeInterval =[expireDate timeIntervalSinceDate:nowDate];
    
    int days = (int)(timeInterval/(3600*24));
    int hours = (int)((timeInterval-0*24*3600)/3600);
    int minutes = (int)(timeInterval-0*24*3600-hours*3600)/60;
    int seconds = timeInterval-0*24*3600-hours*3600-minutes*60;
    
    NSString *dayStr;NSString *hoursStr;NSString *minutesStr;NSString *secondsStr;
    //天
    dayStr = [NSString stringWithFormat:@"%d",days];
    //小时
    if(hours<10)
        hoursStr = [NSString stringWithFormat:@"0%d",hours];
    else
        hoursStr = [NSString stringWithFormat:@"%d",hours];
    //分钟
    if(minutes<10)
        minutesStr = [NSString stringWithFormat:@"0%d",minutes];
    else
        minutesStr = [NSString stringWithFormat:@"%d",minutes];
    //秒
    if(seconds < 10)
        secondsStr = [NSString stringWithFormat:@"0%d", seconds];
    else
        secondsStr = [NSString stringWithFormat:@"%d",seconds];
    if (hours<=0&&minutes<=0&&seconds<=0)
    {
        return @"00:00:00";
    }
    
    return [NSString stringWithFormat:@"%@:%@:%@",hoursStr,minutesStr,secondsStr];
}


- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.frame = CGRectMake(0, 0, LL_ScreenWidth, LL_ScreenHeight);
        _collectionView.showsVerticalScrollIndicator = NO;
        //注册
        [_collectionView registerClass:[ZFCommodityTableCell class] forCellWithReuseIdentifier:ZFCommodityTableCellID];
        [_collectionView registerClass:[ZFClassificationTableCell class] forCellWithReuseIdentifier:ZFClassificationTableCellID];
        [_collectionView registerClass:[ZFSpikeMerchandiseTableCell class] forCellWithReuseIdentifier:ZFSpikeMerchandiseTableCelllD];
        
        [_collectionView registerClass:[ZFBannerHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFBannerHeadViewID];
        [_collectionView registerClass:[ZFHomeSpikeHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFHomeSpikeHeadViewID];
        [_collectionView registerClass:[ZFHomePageTitleHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFHomePageTitleHeadViewID];

        [_collectionView registerClass:[ZFTopLineFootView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:ZFTopLineFootViewID];
        
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

-(NSMutableArray*)imageUrls
{
    if (_imageUrls==nil) {
        _imageUrls = [[NSMutableArray alloc]init];
        [_imageUrls addObject:@"http://gfs5.gomein.net.cn/T1obZ_BmLT1RCvBVdK.jpg"];
        [_imageUrls addObject:@"http://gfs9.gomein.net.cn/T1C3J_B5LT1RCvBVdK.jpg"];
        [_imageUrls addObject:@"http://gfs5.gomein.net.cn/T1CwYjBCCT1RCvBVdK.jpg"];
        [_imageUrls addObject:@"http://gfs7.gomein.net.cn/T1u8V_B4ET1RCvBVdK.jpg"];
        [_imageUrls addObject:@"http://gfs7.gomein.net.cn/T1zODgB5CT1RCvBVdK.jpg"];
    }
    return _imageUrls;
}

@end
