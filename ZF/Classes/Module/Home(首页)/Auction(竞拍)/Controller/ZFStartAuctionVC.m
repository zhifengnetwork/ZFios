//
//  ZFStartAuctionVC.m
//  ZF
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFStartAuctionVC.h"
#import "ZFAuctionEndTableCell.h"
#import "ZFAuctionPeopleTableCell.h"
#import "RefreshGifHeader.h"
#import "ZFAuctionRulesTableCell.h"
#import "ZFConfirmationTableCell.h"
#import "MJExtension.h"
#import "SVProgressHUD.h"
#import "RefreshGifHeader.h"
#import "http_activity.h"
#import "ZFdetailsModel.h"
#import "ZFTool.h"
#import "JX_GCDTimerManager.h"
#import "ZFStartAuctionModel.h"

@interface ZFStartAuctionVC()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,ETHAmountInvesTableCellDelegate>

/* collectionView */
@property (strong , nonatomic)UICollectionView *collectionView;

@property (nonatomic, strong) ZFdetailListModel *detailList;
@property (nonatomic, strong) ZFStartAuctionModel *startAuction;

@end

@implementation ZFStartAuctionVC

static NSString *const ZFAuctionEndTableCellID = @"ZFAuctionEndTableCellID";
static NSString *const ZFAuctionPeopleTableCellID = @"ZFAuctionPeopleTableCellID";
static NSString *const ZFConfirmationTableCellID = @"ZFConfirmationTableCellID";
static NSString *const ZFAuctionRulesTableCellID = @"ZFAuctionRulesTableCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"开始竞拍";
    
    [self setupUI];
    //start
    __weak typeof(self) weakSelf = self;
    [[JX_GCDTimerManager sharedInstance] scheduledDispatchTimerWithName:@"myTime_hash"
                                                           timeInterval:5.0
                                                                  queue:dispatch_get_main_queue()
                                                                repeats:YES
                                                          fireInstantly:NO
                                                                 action:^{
                                                                     [weakSelf loadDatanew];
                                                                 }];
    
}

- (void)auctionButtonDidClick
{
    
}

- (void)assembleButtonDidClick
{
    
}

- (void)spikeButtonDidClick
{
    
}


- (void)setupUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = RGBColorHex(0xffffff);
    
    self.collectionView.mj_header = [RefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    
    [self.collectionView.mj_header beginRefreshing];
    
}

-(void)loadData
{
    ZWeakSelf
    [http_activity auction_detail:self.ID success:^(id responseObject)
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
    
    self.detailList = [ZFdetailListModel mj_objectWithKeyValues:responseObject];
    
    [self.collectionView reloadData];
}





#pragma mark - <UICollectionViewDataSource>
//有多少分组
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==1)
    {
        return self.detailList.bondUser.count;
    }
    return 1;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *gridcell = nil;
    if (indexPath.section == 0)
    {
        ZFAuctionEndTableCell *oell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFAuctionEndTableCellID forIndexPath:indexPath];
        
        oell.detailsModel = self.detailList.auction;
        if (self.detailList.bondUser.count>0) {
            ZFBondUserModel* model = [self.detailList.bondUser objectAtIndex:indexPath.section];
            oell.bondUserModel = model;
        }
        oell.startAuctionModel = self.startAuction;
        
        gridcell = oell;
    }
    else if (indexPath.section == 1)
    {
        ZFAuctionPeopleTableCell *xell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFAuctionPeopleTableCellID forIndexPath:indexPath];
        ZFBondUserModel* model = [self.detailList.bondUser objectAtIndex:indexPath.item];
        xell.bondUserModel = model;
        gridcell = xell;
    }
    else if (indexPath.section == 2)
    {
        ZFConfirmationTableCell *xell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFConfirmationTableCellID forIndexPath:indexPath];
        xell.delegate = self;
        gridcell = xell;
    }
    else if(indexPath.section==3)
    {
        ZFAuctionRulesTableCell *oell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFAuctionRulesTableCellID forIndexPath:indexPath];
        NSMutableString * str = [[NSMutableString alloc]init];
        [str appendString:@"1.集满福袋的人才可参与竞拍；\n"];
        [str appendString:@"2.竞拍时间30分钟，价高者得；\n"];
        [str appendString:@"3.竞拍成功需要在24小时内支付，如不支付购买，奖品取消，并且取消已获得的福袋；\n"];
        [str appendString:@"4.对于恶意抬价，活动方有取消该用户以后参与活动的权利。\n"];
        oell.title = str;
        return oell;
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
            //            ZFBannerHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFBannerHeadViewID forIndexPath:indexPath];
            //            headerView.imageUrls = self.imageUrls;
            //            reusableview = headerView;
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
        return CGSizeMake(LL_ScreenWidth, 10 + 350);
    }
    else if (indexPath.section == 1)
    {
        return CGSizeMake(LL_ScreenWidth/5 , LL_ScreenWidth/5 + 20);
    }
    else if (indexPath.section == 2)
    {
        return CGSizeMake(LL_ScreenWidth, 50);
    }
    else if (indexPath.section == 3)
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
    //    if (section == 0)
    //    {
    //        return CGSizeMake(LL_ScreenWidth, 100+64); //图片滚动的宽高
    //    }
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
    if (indexPath.section==2)
    {
        // 初始化对话框
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"竞拍成功" message:@"恭喜您拍到商品，请在24小时内付款" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"付款购买" style:UIAlertActionStyleDefault handler:nil]];
        // 弹出对话框
        [self presentViewController:alert animated:true completion:nil];
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
        //竞拍
        [_collectionView registerClass:[ZFAuctionEndTableCell class] forCellWithReuseIdentifier:ZFAuctionEndTableCellID];
        [_collectionView registerClass:[ZFAuctionPeopleTableCell class] forCellWithReuseIdentifier:ZFAuctionPeopleTableCellID];
        [_collectionView registerClass:[ZFAuctionRulesTableCell class] forCellWithReuseIdentifier:ZFAuctionRulesTableCellID];
        [_collectionView registerClass:[ZFConfirmationTableCell class] forCellWithReuseIdentifier:ZFConfirmationTableCellID];
        
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}


//正在输入中
-(void)ETHAmountInvesTableCellInputing:(NSString*)text indexPath:(NSIndexPath*)indexPath
{
//    self.tz.creditmy = text;
}

- (void)ZFConfirmationTableCellDidClick
{
    ZWeakSelf
    [http_activity offerPrice:1 price:nil success:^(id responseObject)
     {
         [weakSelf confirm_ok:responseObject];

     } failure:^(NSError *error) {

         [SVProgressHUD showInfoWithStatus:error.domain];
     }];
}

-(void)confirm_ok:(id)responseObject
{
//    self.detailList = [ZFdetailListModel mj_objectWithKeyValues:responseObject];

    // 初始化对话框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"竟拍成功" message:@"24小时内付款" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    // 弹出对话框
    [self presentViewController:alert animated:YES completion:nil];

}

//获取最新竞拍
- (void)loadDatanew
{
    ZWeakSelf
    [http_activity GetAucMaxPrice:1 num:5 success:^(id responseObject)
     {
         [weakSelf loadDatanew_ok:responseObject];
         
     } failure:^(NSError *error) {
         
         [SVProgressHUD showInfoWithStatus:error.domain];
     }];
}

-(void)loadDatanew_ok:(id)responseObject
{
    self.startAuction = [ZFStartAuctionModel mj_objectWithKeyValues:responseObject];
    [self.collectionView reloadData];
}


@end
