//
//  ZFSpikeVC.m
//  ZF
//
//  Created by apple on 2019/3/2.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFSpikeVC.h"
#import "RefreshGifHeader.h"
#import "ZFSpikeDetailsTableCell.h"
#import "ZFSpikeTitleHeadView.h"
#import "ZFSpikeMerchandiseTableViewCell.h"
#import "ZFBannerHeadView.h"

@interface ZFSpikeVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

/* collectionView */
@property (strong , nonatomic)UICollectionView *collectionView;

@property (strong , nonatomic)NSMutableArray *imageUrls;

@end

@implementation ZFSpikeVC

/* cell */
static NSString *const ZFSpikeDetailsTableCellID = @"ZFSpikeDetailsTableCellID";
static NSString *const ZFSpikeMerchandiseTableViewCellID = @"ZFSpikeMerchandiseTableViewCellID";
/* head */
static NSString *const ZFBannerHeadViewID = @"ZFBannerHeadViewID";
static NSString *const ZFSpikeTitleHeadViewID = @"ZFSpikeTitleHeadViewID";
/* foot */


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.title = @"";
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]  initWithImage:[UIImage  imageNamed: @"Share"]
                                                               style:UIBarButtonItemStylePlain
                                                              target:self action:@selector(shareButtonDidClick)];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fanye"]
                                                              style:UIBarButtonItemStylePlain target:self action:@selector(editButtonDidClick)];
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithTitle:@"秒杀"
                                                              style:UIBarButtonItemStylePlain target:self action:@selector(spikeButtonDidClick)];
    
    //设置图片与按钮间距
    [item2 setImageInsets:UIEdgeInsetsMake(0, 15, 0, -15)];
    self.navigationItem.rightBarButtonItems = @[item1,item2,item3];
    
    //    UIImage *imgRight = [UIImage imageNamed:@"All"];
    //    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[imgRight imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(editButtonDidClick)];
    
    [self setupUI];
    
}

- (void)spikeButtonDidClick
{
    
}

-(void)shareButtonDidClick
{
    
}

-(void)editButtonDidClick
{
    //    LKEditingInformationVC* vc = [[LKEditingInformationVC alloc]init];
    //    vc.userInfo = self.userInfo;
    //    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:animated];
}


- (void)setupUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = TableViewBGColor;
    
    self.collectionView.mj_header = [RefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
//
//    self.collectionView.mj_header = [RefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
//
//    _topToolView = [[ZFHomeTopToolView alloc] initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 64)];
//    ZWeakSelf
//    _topToolView.leftItemClickBlock = ^{
//        NSLog(@"点击了首页扫一扫");
//    };
//    _topToolView.rightItemClickBlock = ^{
//        NSLog(@"点击了首页分类");
//    };
//    _topToolView.searchButtonClickBlock = ^{
//        NSLog(@"点击了首页搜索");
//    };
//    [self.view addSubview:_topToolView];
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
        return 2;
    }
    else if (section==1)
    {
        return 3;
    }
    return 1;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *gridcell = nil;
    if (indexPath.section == 0)
    {
        //秒杀商品
        ZFSpikeDetailsTableCell *oell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFSpikeDetailsTableCellID forIndexPath:indexPath];
        
        gridcell = oell;
    }
    else if (indexPath.section == 1)
    {
        //秒杀商品
        ZFSpikeMerchandiseTableViewCell *xell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFSpikeMerchandiseTableViewCellID forIndexPath:indexPath];
        gridcell = xell;
    }
    else if (indexPath.section == 2)
    {
        //秒杀商品
        ZFSpikeDetailsTableCell *uell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFSpikeDetailsTableCellID forIndexPath:indexPath];
        
        gridcell = uell;
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
            ZFSpikeTitleHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFSpikeTitleHeadViewID forIndexPath:indexPath];
            reusableview = headerView;
        }
        
    }
    else if (kind == UICollectionElementKindSectionFooter)
    {
        //        if (indexPath.section == 0)
        //        {
        //            DCTopLineFootView *footview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:DCTopLineFootViewID forIndexPath:indexPath];
        //            reusableview = footview;
        //        }
    }
    
    return reusableview;
}

//这里我为了直观的看出每组的CGSize设置用if 后续我会用简洁的三元表示
#pragma mark - item宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return CGSizeMake(LL_ScreenWidth, 130);
    }
    else if (indexPath.section == 1)
    {
        //9宫格组
        return CGSizeMake(LL_ScreenWidth/3 , LL_ScreenWidth/3 + 60);
    }
    else if (indexPath.section == 2)
    {
        return CGSizeMake(LL_ScreenWidth, 140);
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
        return CGSizeMake(LL_ScreenWidth, 50);
    }
    return CGSizeZero;
}

#pragma mark - foot宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    //    if (section == 0) {
    //        return CGSizeMake(ScreenW, 180);  //Top头条的宽高
    //    }
    //    if (section == 3) {
    //        return CGSizeMake(ScreenW, 80); // 滚动广告
    //    }
    //    if (section == 5) {
    //        return CGSizeMake(ScreenW, 40); // 结束
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
//        if (indexPath.row==0)
//        {
//            ZFSelectedVC* vc = [[ZFSelectedVC alloc]init];
//            [self.navigationController pushViewController:vc animated:YES];
//        }
    }
}


- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.frame = CGRectMake(0, 0, LL_ScreenWidth, LL_ScreenHeight-LL_StatusBarAndNavigationBarHeight);
        _collectionView.showsVerticalScrollIndicator = NO;
        //注册
        [_collectionView registerClass:[ZFSpikeDetailsTableCell class] forCellWithReuseIdentifier:ZFSpikeDetailsTableCellID];
        [_collectionView registerClass:[ZFSpikeMerchandiseTableViewCell class] forCellWithReuseIdentifier:ZFSpikeMerchandiseTableViewCellID];
        
        [_collectionView registerClass:[ZFBannerHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFBannerHeadViewID];
        [_collectionView registerClass:[ZFSpikeTitleHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFSpikeTitleHeadViewID];
        
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
