//
//  ZFWithdrawDepositVC.m
//  ZF
//
//  Created by admin on 2019/3/16.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFWithdrawDepositVC.h"
#import "RefreshGifHeader.h"
#import "ZFWithdrawDepositTableCell.h"
#import "ZFTotalAssetsTableCell.h"
#import "ZFDistributionMemTableCell.h"
#import "ZFBannerHeadView.h"
#import "ZFDistribuCommoVC.h"
#import "http_mine.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "ZFWithdrawModel.h"
#import "ZFMyMemberVC.h"
#import "ZFwithdrawalVC.h"

@interface ZFWithdrawDepositVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,ZFDistributionMemTableCellDelegate,ZFWithdrawDepositTableCellDelegate>

/* collectionView */
@property (strong , nonatomic)UICollectionView *collectionView;

@property (strong , nonatomic)NSMutableArray *imageUrls;

@property (nonatomic, strong)ZFWithdrawModel *withdrawModel;

@end

@implementation ZFWithdrawDepositVC

/* cell */
static NSString *const ZFWithdrawDepositTableCellID = @"ZFWithdrawDepositTableCellID";
static NSString *const ZFTotalAssetsTableCellID = @"ZFTotalAssetsTableCellID";
static NSString *const ZFDistributionMemTableCellID = @"ZFDistributionMemTableCellID";
/* head */
static NSString *const ZFBannerHeadViewID = @"ZFBannerHeadViewID";
/* foot */


- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"微分销会员";
    
    [self setupUI];
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
    [self loadData];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //    [self.navigationController setNavigationBarHidden:NO animated:animated];
}


- (void)setupUI
{
    self.view.backgroundColor = RGBColorHex(0xffffff);
    self.collectionView.backgroundColor = TableViewBGColor;
    
    self.collectionView.mj_header = [RefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
   
}

-(void)loadData
{
    ZWeakSelf
    [http_mine distribut_index:^(id responseObject)
     {
         [weakSelf loadData_ok:responseObject];
         
     } failure:^(NSError *error) {
         
         [SVProgressHUD showInfoWithStatus:error.domain];
     }];
}

//加载数据完成
-(void)loadData_ok:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    //jsonToModel
    self.withdrawModel = [ZFWithdrawModel mj_objectWithKeyValues:responseObject];
    
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
    return 1;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *gridcell = nil;
    if (indexPath.section == 0)
    {
        ZFWithdrawDepositTableCell *oell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFWithdrawDepositTableCellID forIndexPath:indexPath];
        oell.withdraModel = self.withdrawModel;
        oell.delegate = self;
        gridcell = oell;
    }
    else if (indexPath.section == 1)
    {
        ZFTotalAssetsTableCell *xell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFTotalAssetsTableCellID forIndexPath:indexPath];
        xell.withdraModel = self.withdrawModel;
        gridcell = xell;
    }
    else if (indexPath.section == 2)
    {
        ZFDistributionMemTableCell *uell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFDistributionMemTableCellID forIndexPath:indexPath];
        uell.delegate = self;
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
        return CGSizeMake(LL_ScreenWidth, 70);
    }
    else if (indexPath.section == 1)
    {
        return CGSizeMake(LL_ScreenWidth, 70);
    }
    else if (indexPath.section == 2)
    {
        return CGSizeMake(LL_ScreenWidth, 135);
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
    return 5.0f;
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
        [_collectionView registerClass:[ZFWithdrawDepositTableCell class] forCellWithReuseIdentifier:ZFWithdrawDepositTableCellID];
        [_collectionView registerClass:[ZFTotalAssetsTableCell class] forCellWithReuseIdentifier:ZFTotalAssetsTableCellID];
        [_collectionView registerClass:[ZFDistributionMemTableCell class] forCellWithReuseIdentifier:ZFDistributionMemTableCellID];
        
        [_collectionView registerClass:[ZFBannerHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFBannerHeadViewID];
        
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

//1:升级会员 2:分润商品 3:推荐会员 4:账户管理
- (void)ZFDistributionMemTableCellDidClick:(int)type
{
    if (type==1)
    {
        //跳转到升级会员
    }
    else if (type==2)
    {
        //跳转到分润商品
        ZFDistribuCommoVC* vc = [[ZFDistribuCommoVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (type==3)
    {
        //跳转到推荐会员
        ZFMyMemberVC* vc = [[ZFMyMemberVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

//提现按钮被点击
- (void)ZFWithdrawDepositTableCellDidClick
{
    ZFwithdrawalVC *vc = [[ZFwithdrawalVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
