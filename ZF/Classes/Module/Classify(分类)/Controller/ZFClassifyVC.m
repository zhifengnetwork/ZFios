//
//  ZFClassifyVC.m
//  ZF
//
//  Created by apple on 27/02/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFClassifyVC.h"
#import "ZFClassifyTableCell.h"
#import "ZFClassifyCollectionCell.h"
#import "ZFClassifyHeadView.h"
#import "ZFClassifyTopToolView.h"
#import "ZFClassifyBannerHeadView.h"
#import "http_home.h"
#import "http_good.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "RefreshGifHeader.h"
#import "ZFHomeModel.h"
#import "ZFADModel.h"
#import "ZFClassifyModel.h"
#import "ZFPlantingModel.h"
#import "ZFDetailsPageVC.h"
#import "ZFTool.h"
#import "ZFStationNewsVC.h"
#import "PYSearchViewController.h"
#import "ZFSearchVC.h"


@interface ZFClassifyVC ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

/* tableView */
@property (strong , nonatomic)UITableView *tableView;
/* collectionViw */
@property (strong , nonatomic)UICollectionView *collectionView;
/* 顶部工具View */
@property (nonatomic, strong) ZFClassifyTopToolView *topToolView;

@property (strong , nonatomic)NSMutableArray *hots;
//
@property (strong , nonatomic)NSMutableArray *imageUrls;

@property (strong , nonatomic)NSMutableArray *lists;
@property (strong , nonatomic)NSMutableArray *lists2;

@property (strong , nonatomic)ZFPlantingListModel *plantingLisModel;
@property (nonatomic, strong)ZFSearchListModel *searchListModel;

@end

@implementation ZFClassifyVC

static NSString *const ZFClassifyTableCellID = @"ZFClassifyTableCellID";
static NSString *const ZFClassifyCollectionCellID = @"ZFClassifyCollectionCellID";
static NSString *const ZFClassifyHeadViewID = @"ZFClassifyHeadViewID";
static NSString *const ZFClassifyBannerHeadViewID = @"ZFClassifyBannerHeadViewID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
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
}


- (void)setup
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.tableView.tableFooterView = [UIView new];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    self.collectionView.mj_header = [RefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    
    [self.collectionView.mj_header beginRefreshing];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -10;
    
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:@"news"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"news"] forState:UIControlStateHighlighted];
    button.frame = CGRectMake(0, 0, 44, 44);
    [button addTarget:self action:@selector(messButtonBarItemClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    self.navigationItem.rightBarButtonItems = @[negativeSpacer, backButton];
    
    _topToolView = [[ZFClassifyTopToolView alloc] init];
    [self.view addSubview:_topToolView];
    _topToolView.frame = CGRectMake(0, LL_StatusBarHeight, LL_ScreenWidth, 44);
//    self.navigationItem.titleView = _topToolView;
    
    ZWeakSelf
    _topToolView.searchButtonClickBlock = ^{
        // 1. 创建热门搜索数组
        //NSArray *hotSeaches = @[@"周大福", @"新款连衣裙", @"连衣裙"];
        // 2. 创建搜索控制器
        PYSearchViewController *searchViewController = [PYSearchViewController searchViewControllerWithHotSearches:weakSelf.hots searchBarPlaceholder:@"商品 店铺" didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
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
    
}

-(void)loadData4
{
    ZWeakSelf
    [http_home getHotKeywords:^(id responseObject)
     {
         // 拿到当前的下拉刷新控件，结束刷新状态
         [weakSelf.collectionView.mj_header endRefreshing];
         [weakSelf loadData4_success:responseObject];
         
     } failure:^(NSError *error) {
         
         // 拿到当前的下拉刷新控件，结束刷新状态
         [weakSelf.collectionView.mj_header endRefreshing];
         [SVProgressHUD showInfoWithStatus:error.domain];
     }];
}

-(void)loadData4_success:(id)responseObject
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


#pragma mark - 消息点击
- (void)messButtonBarItemClick
{
    
}

-(void)loadData3
{
    ZWeakSelf
    [http_home index:9 cat_id:15 name:nil success:^(id responseObject)
     {
         [self.collectionView.mj_header endRefreshing];
         [weakSelf showData3:responseObject];
     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
         [self.collectionView.mj_header endRefreshing];
     }];
}

-(void)showData3:(id)responseObject
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
}


-(void)loadData
{
    ZWeakSelf
    [http_good categoryList:^(id responseObject)
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
    
    self.lists = [ZFClassifyModel mj_objectArrayWithKeyValuesArray:responseObject];
    [self.tableView reloadData];
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
    if (self.lists.count>0)
    {
        ZFClassifyModel* model = [self.lists objectAtIndex:0];
        [self loadData2:model.ID];
    }
    
    [self loadData3];
}

-(void)loadData2:(NSString*)ID
{
    ZWeakSelf
    [http_home Products:ID success:^(id responseObject)
     {
         [self.collectionView.mj_header endRefreshing];
         [weakSelf showData2:responseObject];
     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
         [self.collectionView.mj_header endRefreshing];
     }];
}

-(void)showData2:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    self.lists2 = [ZFHomeModel mj_objectArrayWithKeyValuesArray:responseObject];
    
    [self.collectionView reloadData];
}


#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.lists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZFClassifyTableCell *cell = [tableView dequeueReusableCellWithIdentifier:ZFClassifyTableCellID forIndexPath:indexPath];
    ZFClassifyModel* model = [self.lists objectAtIndex:indexPath.row];
    cell.title = model.name;
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZFClassifyModel* model = [self.lists objectAtIndex:indexPath.row];
    [self loadData2:model.ID];
}



- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0) {
        return 0;
    }
    return self.lists2.count;
}

#pragma mark - <UICollectionViewDelegate>
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *gridcell = nil;
    //商品
    ZFClassifyCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFClassifyCollectionCellID forIndexPath:indexPath];
    ZFHomeModel *homeModel = [self.lists2 objectAtIndex:indexPath.item];
    cell.homeModel = homeModel;
    gridcell = cell;
    
    return gridcell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader)
    {
        if (indexPath.section==0)
        {
            ZFClassifyBannerHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFClassifyBannerHeadViewID forIndexPath:indexPath];
            headerView.imageUrls = self.imageUrls;
            reusableview = headerView;
        }
        else
        {
            ZFClassifyHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFClassifyHeadViewID forIndexPath:indexPath];
            reusableview = headerView;
        }
        
    }
    return reusableview;
}
#pragma mark - item宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake((LL_ScreenWidth - 100 - 6 - 15)/3, (LL_ScreenWidth - 100 - 6 - 15)/3 + 40);
    
    return CGSizeZero;
}

#pragma mark - head宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return CGSizeMake(LL_ScreenWidth, 110);
    }
    return CGSizeMake(LL_ScreenWidth, 25);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了个第%zd分组第%zd几个Item",indexPath.section,indexPath.row);
    
    ZFDetailsPageVC* vc = [[ZFDetailsPageVC alloc]init];
    ZFHomeModel *homeModel = [self.lists2 objectAtIndex:indexPath.item];
    vc.goods_id = homeModel.goods_id;
    [self.navigationController pushViewController:vc animated:YES];
    
}




#pragma mark - LazyLoad
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.frame = CGRectMake(0, LL_StatusBarAndNavigationBarHeight, 100, LL_ScreenHeight);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_tableView];
        
        [_tableView registerClass:[ZFClassifyTableCell class] forCellReuseIdentifier:ZFClassifyTableCellID];
    }
    return _tableView;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.minimumInteritemSpacing = 3; //X
        layout.minimumLineSpacing = 5;  //Y
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self.view addSubview:_collectionView];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.frame = CGRectMake(100, LL_StatusBarAndNavigationBarHeight, LL_ScreenWidth - 100,LL_ScreenHeight - LL_TabbarHeight - LL_StatusBarAndNavigationBarHeight);
        //注册Cell
        [_collectionView registerClass:[ZFClassifyCollectionCell class] forCellWithReuseIdentifier:ZFClassifyCollectionCellID];
        //注册Header
        [_collectionView registerClass:[ZFClassifyHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFClassifyHeadViewID];
        [_collectionView registerClass:[ZFClassifyBannerHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFClassifyBannerHeadViewID];
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

-(NSMutableArray *)lists
{
    if (_lists==nil) {
        _lists = [[NSMutableArray alloc]init];
    }
    return _lists;
}

-(NSMutableArray *)lists2
{
    if (_lists2==nil) {
        _lists2 = [[NSMutableArray alloc]init];
    }
    return _lists2;
}

@end

