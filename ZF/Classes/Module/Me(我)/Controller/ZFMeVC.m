//
//  ZFMeVC.m
//  ZF
//
//  Created by apple on 27/02/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMeVC.h"
#import "RefreshGifHeader.h"
#import "ZFMyHeadView.h"
#import "ZFMyOrderHeadView.h"
#import "ZFMyOrderCollectionCell.h"
#import "ZFPersonalVC.h"
#import "ZFFootprintVC.h"
#import "ZFCommodityInforVC.h"
#import "ZFCommodityWMVC.h"
#import "ZFSignInView.h"
#import "TYShowAlertView.h"
#import "ZFCumulativeVC.h"
#import "ZFOfflinePickupVC.h"
#import "ZFWithdrawDepositVC.h"


@interface ZFMeVC()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,ZFMyHeadViewDelegate>

@property (strong , nonatomic)UICollectionView *collectionView;

@end


@implementation ZFMeVC

static NSString *const ZFMyHeadViewID = @"ZFMyHeadViewID";
static NSString *const ZFMyOrderHeadViewID = @"ZFMyOrderHeadViewID";
static NSString *const ZFMyOrderCollectionCellID = @"ZFMyOrderCollectionCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==1) {
        return 4;
    }
    return 0;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *gridcell = nil;
    if (indexPath.section == 1)
    {
        //订单
        ZFMyOrderCollectionCell *oell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFMyOrderCollectionCellID forIndexPath:indexPath];
        if (indexPath.row==0)
        {
            oell.isHead = YES;
        }
        else if (indexPath.row==3)
        {
            oell.isFoot = YES;
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
        if (indexPath.section==0)
        {
            ZFMyHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFMyHeadViewID forIndexPath:indexPath];
            headerView.delegate = self;
            reusableview = headerView;
        }
        else if (indexPath.section==1)
        {
            ZFMyOrderHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFMyOrderHeadViewID forIndexPath:indexPath];
            reusableview = headerView;
        }
    }
    
    return reusableview;
}

//这里我为了直观的看出每组的CGSize设置用if 后续我会用简洁的三元表示
#pragma mark - item宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        //待付款
        float width = (LL_ScreenWidth-20)*0.25;
        if (indexPath.row==0 || indexPath.row==3)
        {
            return CGSizeMake(width+10,100);
        }
        //待付款...
        return CGSizeMake(width,100);
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
    if (section==0)
    {
        return CGSizeMake(LL_ScreenWidth, 130);
    }
    else if (section==1)
    {
        return CGSizeMake(LL_ScreenWidth, 60);
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
    return (section == 1) ? 0 : 0;
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
            
        }
    }
}


//我的头部headview被点击 1:头像 2:商品关注 3:店关注 4:足迹
- (void)ZFMyHeadViewDidClick:(int)type
{
    if (type==1)
    {
        //跳转到个人资料
        ZFPersonalVC* vc = [[ZFPersonalVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (type==2)
    {
        //跳转到商品关注
        ZFCommodityWMVC *cwmVC = [[ZFCommodityWMVC alloc] init];
        cwmVC.menuViewStyle = WMMenuViewStyleLine;
        cwmVC.automaticallyCalculatesItemWidths = YES;
        cwmVC.showOnNavigationBar = NO;
        cwmVC.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
        cwmVC.titleColorSelected = RGBColorHex(0x151515);
        cwmVC.titleColorNormal = RGBColorHex(0x151515);
        cwmVC.progressColor = RGBColorHex(0xE51C23);
        cwmVC.titleSizeSelected = 13.0f;
        cwmVC.titleSizeNormal = 13.0f;
        cwmVC.itemMargin = 100.0f;
        [self.navigationController pushViewController:cwmVC animated:YES];
    }
    else if (type==4)
    {
        //跳转到足迹
        ZFFootprintVC* vc = [[ZFFootprintVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (type==5)
    {
        //跳转到签到
//            ZFSignInView* windowView = [[ZFSignInView alloc]initWithFrame:CGRectMake(0, 0, 300, 400)];
//            [TYShowAlertView showAlertViewWithView:windowView backgoundTapDismissEnable:YES];
        
//        ZFCumulativeVC* vc = [[ZFCumulativeVC alloc]init];
//        [self.navigationController pushViewController:vc animated:YES];
        
        ZFWithdrawDepositVC* vc = [[ZFWithdrawDepositVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
        
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
        //拼团
        [_collectionView registerClass:[ZFMyOrderCollectionCell class] forCellWithReuseIdentifier:ZFMyOrderCollectionCellID];
        
        [_collectionView registerClass:[ZFMyHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFMyHeadViewID];
        [_collectionView registerClass:[ZFMyOrderHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFMyOrderHeadViewID];
        
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}




@end
