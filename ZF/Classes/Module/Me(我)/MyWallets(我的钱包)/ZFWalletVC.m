//
//  ZFWalletVC.m
//  ETH
//
//  Created by admin on 2019/4/3.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ZFWalletVC.h"
#import "ZFMyWalletHeadView.h"
#import "ZFMyWalletCollectionCell.h"
#import "RefreshGifHeader.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "http_mine.h"
#import "ZFOrdersModel.h"
#import "ZFDetailBalanceWMVC.h"
#import "ZFRechargeRecordVC.h"

@interface ZFWalletVC ()

/* collectionView */
@property (strong , nonatomic)UICollectionView *collectionView;

@property (nonatomic, strong)ZFOrdersModel *orderModel;

@end

@implementation ZFWalletVC

/* cell */
static NSString *const ZFMyWalletCollectionCellID = @"ZFMyWalletCollectionCellID";
/* head */
static NSString *const ZFMyWalletHeadViewID = @"ZFMyWalletHeadViewID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的钱包";
    
    // Do any additional setup after loading the view.
    
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
    self.view.backgroundColor = TableViewBGColor;
    self.collectionView.backgroundColor = TableViewBGColor;
    
    self.collectionView.mj_header = [RefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    
    [self.collectionView.mj_header beginRefreshing];
}

-(void)loadData
{
    ZWeakSelf
    [http_mine my_wallet:^(id responseObject)
     {
         [weakSelf.collectionView.mj_header endRefreshing];
         [weakSelf showData:responseObject];
     } failure:^(NSError *error) {
         [weakSelf.collectionView.mj_header endRefreshing];
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)showData:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    self.orderModel = [ZFOrdersModel mj_objectWithKeyValues:responseObject];
    
    [self.collectionView reloadData];
}



#pragma mark - <UICollectionViewDataSource>
//有多少分组
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *gridcell = nil;
    if (indexPath.section == 0)
    {
        ZFMyWalletCollectionCell *oell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFMyWalletCollectionCellID forIndexPath:indexPath];
        
        if (indexPath.row==0)
        {
            oell.iconName = @"withdraw";
            oell.title = @"申请提现";
        }
        else if (indexPath.row==1)
        {
            oell.iconName = @"Balance";
            oell.title = @"余额明细";
        }
        else if (indexPath.row==2)
        {
            oell.iconName = @"Recharge";
            oell.title = @"充值记录";
        }
        else if (indexPath.row==3)
        {
            oell.iconName = @"recording";
            oell.title = @"提现记录";
        }
        
        gridcell = oell;
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
            ZFMyWalletHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFMyWalletHeadViewID forIndexPath:indexPath];
            headerView.orderModel = self.orderModel;
            reusableview = headerView;
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
        return CGSizeMake((LL_ScreenWidth - 4)/2, (LL_ScreenWidth - 4)/2 - 60);
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
        return CGSizeMake(LL_ScreenWidth, 100+70);
    }
    return CGSizeZero;
}

#pragma mark - foot宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
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
//            ETHInvestmentRecordVC* vc = [[ETHInvestmentRecordVC alloc]init];
//            [self.navigationController pushViewController:vc animated:YES];
//            vc.type = @"1";
        }
        else if (indexPath.row==1)
        {
            ZFDetailBalanceWMVC* vc = [[ZFDetailBalanceWMVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row==2)
        {
            ZFRechargeRecordVC* vc = [[ZFRechargeRecordVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
//        else if (indexPath.row==3)
//        {
//            ZFDetailBalanceWMVC* vc = [[ZFDetailBalanceWMVC alloc]init];
//            [self.navigationController pushViewController:vc animated:YES];
//        }
    }
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
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


- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.frame = CGRectMake(0, 0, LL_ScreenWidth, LL_ScreenHeight);
        _collectionView.showsVerticalScrollIndicator = NO;
        //首页
        [_collectionView registerClass:[ZFMyWalletCollectionCell class] forCellWithReuseIdentifier:ZFMyWalletCollectionCellID];
        
        [_collectionView registerClass:[ZFMyWalletHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFMyWalletHeadViewID];
        
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

@end
