//
//  ZFGroupBuyingVC.m
//  ZF
//
//  Created by admin on 2019/5/14.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFGroupBuyingVC.h"
#import "ZFGroupBuyingTableCell.h"
#import "RefreshGifHeader.h"
#import "ZFClusterWindowView.h"
#import "TYShowAlertView.h"
#import "ZFHarvestAddressView.h"
#import "TYAlertController.h"
#import "ZFGoodDetailVC.h"
#import "http_good.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "RefreshGifHeader.h"
#import "ZFAssembleModel.h"

@interface ZFGroupBuyingVC()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong , nonatomic)UICollectionView *collectionView;

@property (strong , nonatomic)ZFGroupBuyListModel *groupBuyListModel;

@end


@implementation ZFGroupBuyingVC

static NSString *const ZFGroupBuyingTableCellID = @"ZFGroupBuyingTableCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"团购";
    [self setupUI];
}

- (void)setupUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = TableViewBGColor;
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    self.collectionView.mj_header = [RefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    [self.collectionView.mj_header beginRefreshing];
    
}

-(void)loadData
{
    ZWeakSelf
    [http_good activityGroupList:self.type page:1 success:^(id responseObject)
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
    self.groupBuyListModel = [ZFGroupBuyListModel mj_objectWithKeyValues:responseObject];
    
    [self.collectionView reloadData];
}


#pragma mark - <UICollectionViewDataSource>
//有多少分组
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.groupBuyListModel.list.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *gridcell = nil;
    
    //团购
    ZFGroupBuyingTableCell *oell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFGroupBuyingTableCellID forIndexPath:indexPath];
    ZFGroupBuyingModel *groupBuyingModel = [self.groupBuyListModel.list objectAtIndex:indexPath.section];
    oell.groupBuyingModel = groupBuyingModel;
    gridcell = oell;
    
    return gridcell;
}


//分组的头部尾部
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionReusableView *reusableview = nil;
    
    //头部
    if (kind == UICollectionElementKindSectionHeader)
    {
        
    }
    
    return reusableview;
}

//这里我为了直观的看出每组的CGSize设置用if 后续我会用简洁的三元表示
#pragma mark - item宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {//猜你喜欢
        return CGSizeMake((LL_ScreenWidth - 4)/2, (LL_ScreenWidth - 4)/2 + 50);
    }
    return CGSizeZero;
}

//返回rect中的所有的元素的布局属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    if (indexPath.section == 4)
    {
        
    }
    return layoutAttributes;
}

#pragma mark - head宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
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
            ZFGoodDetailVC *vc = [[ZFGoodDetailVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            return;
            //            ZFSelectedVC* vc = [[ZFSelectedVC alloc]init];
            //            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    
    //    ZFClusterWindowView* windowView = [[ZFClusterWindowView alloc]initWithFrame:CGRectMake(0, 0, 300, 400)];
    //    [TYShowAlertView showAlertViewWithView:windowView backgoundTapDismissEnable:YES];
    
    ZFHarvestAddressView* addressView = [[ZFHarvestAddressView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 400)];
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:addressView preferredStyle:TYAlertControllerStyleActionSheet];
    alertController.backgoundTapDismissEnable = YES;
    [self presentViewController:alertController animated:YES completion:nil];
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
        //拼团
        [_collectionView registerClass:[ZFGroupBuyingTableCell class] forCellWithReuseIdentifier:ZFGroupBuyingTableCellID];
        
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

@end
