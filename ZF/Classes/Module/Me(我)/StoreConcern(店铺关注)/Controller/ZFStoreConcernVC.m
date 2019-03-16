//
//  ZFStoreConcernVC.m
//  ZF
//
//  Created by admin on 2019/3/15.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFStoreConcernVC.h"
#import "ZFStoreConcernViewCell.h"
#import "ZFFavoriteShopViewCell.h"
#import "ZFShopImgeViewCell.h"
#import "ZFCommodityHeadView.h"
#import "RefreshGifHeader.h"

@interface ZFStoreConcernVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

/* collectionView */
@property (strong , nonatomic)UICollectionView *collectionView;

@end

@implementation ZFStoreConcernVC

/* cell */
static NSString *const ZFStoreConcernViewCellID = @"ZFStoreConcernViewCellID";
static NSString *const ZFFavoriteShopViewCellID = @"ZFFavoriteShopViewCellID";
static NSString *const ZFShopImgeViewCellID = @"ZFShopImgeViewCellID";
/* head */
static NSString *const ZFCommodityHeadViewID = @"ZFCommodityHeadViewID";
/* foot */


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
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
        return 3;
    }
    else if (section==2)
    {
        return 4;
    }
    return 1;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *gridcell = nil;
    if (indexPath.section == 0)
    {
        //关注店铺
        ZFStoreConcernViewCell *oell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFStoreConcernViewCellID forIndexPath:indexPath];
        
        gridcell = oell;
    }
    else if (indexPath.section == 1)
    {
        //猜您喜欢的店铺
        ZFFavoriteShopViewCell *xell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFFavoriteShopViewCellID forIndexPath:indexPath];
        gridcell = xell;
    }
    else if (indexPath.section == 2)
    {
        //猜您喜欢的店铺图片
        ZFShopImgeViewCell *kell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFShopImgeViewCellID forIndexPath:indexPath];
        gridcell = kell;
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
        if (indexPath.section == 1)
        {
            ZFCommodityHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFCommodityHeadViewID forIndexPath:indexPath];
            headerView.title = @"猜您喜欢的店铺";
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
        return CGSizeMake(LL_ScreenWidth, 80);
    }
    else if (indexPath.section == 1)
    {
        return CGSizeMake(LL_ScreenWidth, 70);
    }
    else if (indexPath.section == 2)
    {
//        return CGSizeMake((LL_ScreenWidth - 4)/4, (LL_ScreenWidth - 4)/4 + 40);
        return CGSizeMake(LL_ScreenWidth/4 , LL_ScreenWidth/4 + 10);
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
    if (section==1)
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
    if (section==0)
    {
        return 5.0f;
    }
    else   if (section==1)
    {
        return 5.0f;
    }
    
    return 0;
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
        [_collectionView registerClass:[ZFStoreConcernViewCell class] forCellWithReuseIdentifier:ZFStoreConcernViewCellID];
        [_collectionView registerClass:[ZFFavoriteShopViewCell class] forCellWithReuseIdentifier:ZFFavoriteShopViewCellID];
        [_collectionView registerClass:[ZFShopImgeViewCell class] forCellWithReuseIdentifier:ZFShopImgeViewCellID];
        
        [_collectionView registerClass:[ZFCommodityHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFCommodityHeadViewID];
        
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

@end
