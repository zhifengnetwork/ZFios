//
//  ZFCommodityInforVC.m
//  ZF
//
//  Created by admin on 2019/3/14.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFCommodityInforVC.h"
#import "RefreshGifHeader.h"
#import "ZFCommodityInforViewCell.h"
#import "ZFCommodityHeadView.h"
#import "ZFCommodityTableCell.h"
#import "ZFClassificationHeadView.h"
#import "http_mine.h"
#import "SVProgressHUD.h"
#import "RefreshGifHeader.h"
#import "MJExtension.h"
#import "ZFGoodModel.h"
#import "http_home.h"
#import "ZFSeeParagraphVC.h"
#import "ZFDetailsPageVC.h"

@interface ZFCommodityInforVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,ZFCommodityInforViewCellDelegate>

/* collectionView */
@property (strong , nonatomic)UICollectionView *collectionView;
@property (nonatomic, strong)ZFListModel *listModel;

@property (nonatomic, strong)ZFDistribListModel *distribListModel;

@end

@implementation ZFCommodityInforVC
/* cell */
static NSString *const ZFCommodityInforViewCellID = @"ZFCommodityInforViewCellID";
static NSString *const ZFCommodityTableCellID = @"ZFCommodityTableCellID";
/* head */
//static NSString *const ZFClassificationHeadViewID = @"ZFClassificationHeadViewID";
static NSString *const ZFCommodityHeadViewID = @"ZFCommodityHeadViewID";
/* foot */


- (void)viewDidLoad {
    [super viewDidLoad];
    
        self.title = @"我的关注";
//
//        UIImage *imgRight = [UIImage imageNamed:@"All"];
//        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[imgRight imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(editButtonDidClick)];
    
    [self setupUI];
    
}

//-(void)editButtonDidClick
//{
//    if (type == 0) {
//        for (int i = 0; i<self.listModel.list.count; i++) {
//            ZFCommodityInforViewCell *cell = (ZFCommodityInforViewCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
//            [cell setDelete:NO];
//        }
//        type = 1;
//    }else{
//        for (int i = 0; i<self.listModel.list.count; i++) {
//            ZFCommodityInforViewCell *cell = (ZFCommodityInforViewCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
//            [cell setDelete:YES];
//        }
//        type = 0;
//    }
//
//
//
//    //    LKEditingInformationVC* vc = [[LKEditingInformationVC alloc]init];
//    //    vc.userInfo = self.userInfo;
//    //    [self.navigationController pushViewController:vc animated:YES];
//}

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
    
    [self.collectionView.mj_header beginRefreshing];
}

-(void)loadData
{
    ZWeakSelf
    
    [http_mine collect_list:^(id responseObject)
     {
         [weakSelf.collectionView.mj_header endRefreshing];
         [weakSelf showData:responseObject];
     } failure:^(NSError *error)
    {
        // 拿到当前的下拉刷新控件，结束刷新状态
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
    
    self.listModel = [ZFListModel mj_objectWithKeyValues:responseObject];
    
    [self.collectionView reloadData];
    [self loadData2];
}

-(void)loadData2
{
    ZWeakSelf
    [http_home goodsList:@"is_recommend" page:1 success:^(id responseObject)
     {
         [self.collectionView.mj_header endRefreshing];
         [weakSelf showData2:responseObject];
     } failure:^(NSError *error) {
         [self.collectionView.mj_header endRefreshing];
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)showData2:(id)responseObject
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
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0)
    {
        return self.listModel.list.count;
    }
    return self.distribListModel.goods_list.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *gridcell = nil;
    if (indexPath.section == 0)
    {
        //关注商品
        ZFCommodityInforViewCell *oell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFCommodityInforViewCellID forIndexPath:indexPath];
        oell.commodityModel = [self.listModel.list objectAtIndex:indexPath.row];
        oell.delegate = self;
        gridcell = oell;

    }
    else if (indexPath.section == 1)
    {
        //猜您喜欢的商品
        ZFCommodityTableCell *xell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFCommodityTableCellID forIndexPath:indexPath];
        xell.isShowButton = NO;
        ZFDistribuCommModel *distribuCommModel = [self.distribListModel.goods_list objectAtIndex:indexPath.row];
        xell.distribuCommModel = distribuCommModel;
        
        gridcell = xell;
    }
    return gridcell;
}




- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
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
//            ZFClassificationHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFClassificationHeadViewID forIndexPath:indexPath];
//            reusableview = headerView;
        }
        else if (indexPath.section == 1)
        {
            ZFCommodityHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFCommodityHeadViewID forIndexPath:indexPath];
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
        return CGSizeMake(LL_ScreenWidth, 110);
    }
    else if (indexPath.section == 1)
    {
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
//        return CGSizeMake(LL_ScreenWidth, 40);
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
    if (section==0)
    {
        return 5.0f;
    }
    
    return 0;
}

//点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==1)
    {
        ZFDistribuCommModel *distribuCommModel = [self.distribListModel.goods_list objectAtIndex:indexPath.row];
        ZFDetailsPageVC* vc = [[ZFDetailsPageVC alloc]init];
        vc.goods_id = distribuCommModel.goods_id.intValue;
        [self.navigationController pushViewController:vc animated:YES];
    }
}


//商品关注headview被点击 1:分类 2:有券 3:促销 4:降价 5:有货
- (void)ZFClassificationHeadViewDidClick:(int)type;
{
    if (type==1)
    {
        //跳转到分类
//        ZFPersonalVC* vc = [[ZFPersonalVC alloc]init];
//        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

//查看同款被点击
- (void)ZFCommodityInforViewCellDidClick:(ZFGoodModel *)commodityModel
{
    ZFSeeParagraphVC* vc = [[ZFSeeParagraphVC alloc]init];
    vc.commodityModel = commodityModel;
    [self.navigationController pushViewController:vc animated:YES];
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
        [_collectionView registerClass:[ZFCommodityInforViewCell class] forCellWithReuseIdentifier:ZFCommodityInforViewCellID];
        [_collectionView registerClass:[ZFCommodityTableCell class] forCellWithReuseIdentifier:ZFCommodityTableCellID];
        
//        [_collectionView registerClass:[ZFClassificationHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFClassificationHeadViewID];
        [_collectionView registerClass:[ZFCommodityHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFCommodityHeadViewID];
        
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}


@end
