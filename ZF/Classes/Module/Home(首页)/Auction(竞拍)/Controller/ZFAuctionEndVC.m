//
//  ZFAuctionEndVC.m
//  ZF
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFAuctionEndVC.h"
#import "ZFAuctionEndTableCell.h"
#import "ZFAuctionPeopleTableCell.h"
#import "RefreshGifHeader.h"
#import "ZFAuctionRulesTableCell.h"

@interface ZFAuctionEndVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

/* collectionView */
@property (strong , nonatomic)UICollectionView *collectionView;

@end

@implementation ZFAuctionEndVC

static NSString *const ZFAuctionEndTableCellID = @"ZFAuctionEndTableCellID";
static NSString *const ZFAuctionPeopleTableCellID = @"ZFAuctionPeopleTableCellID";
static NSString *const ZFAuctionRulesTableCellID = @"ZFAuctionRulesTableCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]  initWithTitle:@"竞拍"
                                                               style:UIBarButtonItemStylePlain target:self action:@selector(auctionButtonDidClick)];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"拼团"
                                                              style:UIBarButtonItemStylePlain target:self action:@selector(assembleButtonDidClick)];
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithTitle:@"秒杀"
                                                              style:UIBarButtonItemStylePlain target:self action:@selector(spikeButtonDidClick)];
    
    //设置图片与按钮间距
    [item2 setImageInsets:UIEdgeInsetsMake(0, 15, 0, -15)];
    self.navigationItem.rightBarButtonItems = @[item1,item2,item3];
    
    [self setupUI];
    
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
    if (section==1)
    {
        return 5;
    }
    return 1;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *gridcell = nil;
    if (indexPath.section == 0)
    {
        ZFAuctionEndTableCell *oell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFAuctionEndTableCellID forIndexPath:indexPath];
        
        gridcell = oell;
    }
    else if (indexPath.section == 1)
    {
        ZFAuctionPeopleTableCell *xell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFAuctionPeopleTableCellID forIndexPath:indexPath];
        gridcell = xell;
    }
    else if(indexPath.section==2)
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
        return CGSizeMake(LL_ScreenWidth/5 , LL_ScreenWidth/5 + 25);
    }
    else if (indexPath.section == 2)
    {
        return CGSizeMake(LL_ScreenWidth, 130);
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
        _collectionView.frame = CGRectMake(0, 0, LL_ScreenWidth, LL_ScreenHeight);
        _collectionView.showsVerticalScrollIndicator = NO;
        //竞拍
        [_collectionView registerClass:[ZFAuctionEndTableCell class] forCellWithReuseIdentifier:ZFAuctionEndTableCellID];
        [_collectionView registerClass:[ZFAuctionPeopleTableCell class] forCellWithReuseIdentifier:ZFAuctionPeopleTableCellID];
        [_collectionView registerClass:[ZFAuctionRulesTableCell class] forCellWithReuseIdentifier:ZFAuctionRulesTableCellID];
        
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}


@end
