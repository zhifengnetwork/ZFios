//
//  ZFHomeVC.m
//  ZF
//
//  Created by apple on 27/02/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFHomeVC.h"
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
#import "ZFDetailsPageVC.h"
#import "ZFSearchVC.h"
#import "PYSearchViewController.h"
#import "http_home.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "RefreshGifHeader.h"
#import "ZFHomeModel.h"
#import "ZFADModel.h"
#import "ZFCumulativeVC.h"
#import "ZFPlantingModel.h"
#import "ZFTool.h"
#import "ZFAuctionVC.h"
#import "ZFZFMyOrderVC.h"
#import "ZFShoppingCartVC.h"
#import "ZFSpikeVC.h"
#import "ZFGroupBuyingVC.h"
#import "ZFGroupBuyingWMVC.h"


@interface ZFHomeVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,ZFHomeSpikeHeadViewDelegate>

/* 顶部工具View */
@property (nonatomic, strong) ZFHomeTopToolView *topToolView;

/* collectionView */
@property (strong , nonatomic)UICollectionView *collectionView;

//
@property (strong , nonatomic)NSMutableArray *imageUrls;

//秒杀倒计时
@property (strong, nonatomic) CountDown *countDown;

@property (strong , nonatomic)ZFPlantingListModel *plantingLisModel;

@property (strong , nonatomic)NSMutableArray *hots;

@property (nonatomic, strong)ZFDistribListModel *distribListModel;

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
//static NSString *const ZFTopLineFootViewID = @"ZFTopLineFootViewID";

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
    
    [self setupUI];
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
    
    self.collectionView.mj_header = [RefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData2)];
    
    [self.collectionView.mj_header beginRefreshing];
    
    
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
        // 1. 创建热门搜索数组
        //NSArray *hotSeaches = @[@"周大福", @"新款连衣裙", @"连衣裙"];
        // 2. 创建搜索控制器
        PYSearchViewController *searchViewController = [PYSearchViewController searchViewControllerWithHotSearches:self.hots searchBarPlaceholder:@"商品 店铺" didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
            // 开始(点击)搜索时执行以下代码
            // 如：跳转到指定控制器
            ZFSearchVC* vc = [[ZFSearchVC alloc] init];
            vc.text = searchText;
            [searchViewController.navigationController pushViewController:vc animated:YES];
        }];
        
        [searchViewController setSearchHistoryTitle:@"搜索历史"];
        
        // 3. 跳转到搜索控制器
        [weakSelf.navigationController pushViewController:searchViewController animated:YES];
    };
    [self.view addSubview:_topToolView];
}

-(void)loadData2
{
    ZWeakSelf
    [http_home getHotKeywords:^(id responseObject)
     {
         // 拿到当前的下拉刷新控件，结束刷新状态
         [weakSelf.collectionView.mj_header endRefreshing];
         [weakSelf loadData2_success:responseObject];
         
     } failure:^(NSError *error) {
         
         // 拿到当前的下拉刷新控件，结束刷新状态
         [weakSelf.collectionView.mj_header endRefreshing];
         [SVProgressHUD showInfoWithStatus:error.domain];
     }];
}

-(void)loadData2_success:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    NSString* str = responseObject;
    
    self.hots = [ZFTool strToArr:str Separator:@"|"];

    [self.collectionView reloadData];
    [self loadData];
}

-(void)loadData
{
    ZWeakSelf
    [http_home index:9 cat_id:15 name:nil success:^(id responseObject)
     {
         [self.collectionView.mj_header endRefreshing];
         [weakSelf showData:responseObject];
     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
         [self.collectionView.mj_header endRefreshing];
     }];
}

-(void)showData:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    self.plantingLisModel = [ZFPlantingListModel mj_objectWithKeyValues:responseObject];
    
    [self.imageUrls removeAllObjects];
    for (int i=0; i<self.plantingLisModel.adlist.count; i++)
    {
        ZFADModel* ad = [self.plantingLisModel.adlist objectAtIndex:i];
        NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,ad.ad_code];
        [self.imageUrls addObject:str];
    }
    
    [self.collectionView reloadData];
    [self loadData4];
}

-(void)loadData4
{
    ZWeakSelf
    [http_home index:9 cat_id:15 name:nil success:^(id responseObject)
     {
         [self.collectionView.mj_header endRefreshing];
         [weakSelf showData4:responseObject];
     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
         [self.collectionView.mj_header endRefreshing];
     }];
}

-(void)showData4:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    self.plantingLisModel = [ZFPlantingListModel mj_objectWithKeyValues:responseObject];
    
    [self.collectionView reloadData];
    [self loadData3];
}


-(void)loadData3
{
    ZWeakSelf
    [http_home goodsList:@"is_recommend" page:1 success:^(id responseObject)
     {
         [self.collectionView.mj_header endRefreshing];
         [weakSelf showData3:responseObject];
     } failure:^(NSError *error) {
         [self.collectionView.mj_header endRefreshing];
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)showData3:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    self.distribListModel = [ZFDistribListModel mj_objectWithKeyValues:responseObject];
    
    [self.collectionView reloadData];
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
        return self.plantingLisModel.flash_sale_goods.count;
    }
    else if (section==2)
    {
        return self.distribListModel.goods_list.count;
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
            oell.iconName = @"Auction";
            oell.title = @"竞拍";
        }
        else if (indexPath.row==1)
        {
            oell.iconName = @"GroupBuy";
            oell.title = @"团购";
        }
        else if (indexPath.row==2)
        {
            oell.iconName = @"SignIn2";
            oell.title = @"签到2天免费领";
        }
        else if (indexPath.row==3)
        {
            oell.iconName = @"SignIn";
            oell.title = @"签到";
        }
        else if (indexPath.row==4)
        {
            oell.iconName = @"dingdan";
            oell.title = @"我的订单";
        }
        else if (indexPath.row==5)
        {
            oell.iconName = @"MaterialArea";
            oell.title = @"素材区";
        }
        else if (indexPath.row==6)
        {
            oell.iconName = @"shoppingCart";
            oell.title = @"购物车";
        }
        else if (indexPath.row==7)
        {
            oell.iconName = @"activity";
            oell.title = @"优惠活动";
        }
        
        gridcell = oell;
    }
    else if (indexPath.section == 1)
    {
        //秒杀商品
        ZFSpikeMerchandiseTableCell *xell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFSpikeMerchandiseTableCelllD forIndexPath:indexPath];
        ZFPlantingModel *plantingModel = [self.plantingLisModel.flash_sale_goods objectAtIndex:indexPath.row];
        xell.plantingModel = plantingModel;
        gridcell = xell;
    }
    else if (indexPath.section == 2)
    {
        //推荐
        ZFCommodityTableCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFCommodityTableCellID forIndexPath:indexPath];
        ZFDistribuCommModel *distribuCommModel = [self.distribListModel.goods_list objectAtIndex:indexPath.row];
        cell.distribuCommModel = distribuCommModel;
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
//    else if (kind == UICollectionElementKindSectionFooter)
//    {
//        if (indexPath.section == 0)
//        {
//            ZFTopLineFootView *footview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:ZFTopLineFootViewID forIndexPath:indexPath];
//            reusableview = footview;
//        }
//    }
    
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
//    if (section == 0)
//    {
//        return CGSizeMake(LL_ScreenWidth, 44);  //Top头条的宽高
//    }
    
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
            //竞拍
            [self toAuctionWMVC];
        }
        else if (indexPath.row==1)
        {
            //跳转到团购
            ZFGroupBuyingWMVC *cwmVC = [[ZFGroupBuyingWMVC alloc] init];
            cwmVC.menuViewStyle = WMMenuViewStyleLine;
            cwmVC.automaticallyCalculatesItemWidths = YES;
            cwmVC.showOnNavigationBar = NO;
            cwmVC.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
            cwmVC.titleColorSelected = RGBColorHex(0xfa0404);
            cwmVC.titleColorNormal = RGBColorHex(0x151515);
            cwmVC.progressColor = RGBColorHex(0xE51C23);
            cwmVC.titleSizeSelected = 15.0f;
            cwmVC.titleSizeNormal = 15.0f;
            cwmVC.itemMargin = 65.0f;
            [self.navigationController pushViewController:cwmVC animated:YES];
        }
        else if (indexPath.row==2)
        {
            //签到2天免费领
            ZFSearchVC* vc = [[ZFSearchVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row==3)
        {
            //签到天数
            ZFCumulativeVC* vc = [[ZFCumulativeVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row==4)
        {
            //我的订单
            ZFZFMyOrderVC* vc = [[ZFZFMyOrderVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row==5)
        {
            //素材区
//            ZFCumulativeVC* vc = [[ZFCumulativeVC alloc]init];
//            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row==6)
        {
            //购物车
            ZFShoppingCartVC* vc = [[ZFShoppingCartVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row==7)
        {
            //优惠活动
//            ZFCumulativeVC* vc = [[ZFCumulativeVC alloc]init];
//            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    else if (indexPath.section==1)
    {
        [self toAuctionWMVC];
    }
    else if (indexPath.section==2)
    {
        ZFDetailsPageVC* vc = [[ZFDetailsPageVC alloc]init];
        ZFDistribuCommModel *distribuCommModel = [self.distribListModel.goods_list objectAtIndex:indexPath.row];
        vc.goods_id = distribuCommModel.goods_id.integerValue;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

/**
 首页秒杀headview被点击
 */
- (void)ZFHomeSpikeHeadViewDidClick
{
    ZFSpikeVC* vc = [[ZFSpikeVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
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
        _collectionView.frame = CGRectMake(0, 0, LL_ScreenWidth, LL_ScreenHeight-LL_TabbarHeight);
        
        _collectionView.showsVerticalScrollIndicator = NO;
        //注册
        [_collectionView registerClass:[ZFCommodityTableCell class] forCellWithReuseIdentifier:ZFCommodityTableCellID];
        [_collectionView registerClass:[ZFClassificationTableCell class] forCellWithReuseIdentifier:ZFClassificationTableCellID];
        [_collectionView registerClass:[ZFSpikeMerchandiseTableCell class] forCellWithReuseIdentifier:ZFSpikeMerchandiseTableCelllD];
        
        [_collectionView registerClass:[ZFBannerHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFBannerHeadViewID];
        [_collectionView registerClass:[ZFHomeSpikeHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFHomeSpikeHeadViewID];
        [_collectionView registerClass:[ZFHomePageTitleHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFHomePageTitleHeadViewID];

//        [_collectionView registerClass:[ZFTopLineFootView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:ZFTopLineFootViewID];
        
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

-(NSMutableArray*)imageUrls
{
    if (_imageUrls==nil) {
        _imageUrls = [[NSMutableArray alloc]init];
    }
    return _imageUrls;
}

-(NSMutableArray*)hots
{
    if (_hots==nil) {
        _hots = [[NSMutableArray alloc]init];
    }
    return _hots;
}


@end
