//
//  ZFSelectedVC.m
//  ZF
//
//  Created by apple on 2019/3/1.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFSelectedVC.h"
#import "ZFPicturesDisplayingHeadView.h"
#import "ZFSelectedCategoriesCell.h"
#import "RefreshGifHeader.h"
#import "ZFCommodityTableCell.h"
#import "ZFClassificationTableCell.h"
#import "ZFSelectedTitleHeadView.h"
#import "ZFNewProductsTableCell.h"


@interface ZFSelectedVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

/* collectionView */
@property (strong , nonatomic)UICollectionView *collectionView;

@end

@implementation ZFSelectedVC

static NSString *const ZFClassificationTableCelllD = @"ZFClassificationTableCelllD";
static NSString *const ZFSelectedCategoriesCellID = @"ZFSelectedCategoriesCellID";
static NSString *const ZFNewProductsTableCellID = @"ZFNewProductsTableCellID";

/* head */
static NSString *const ZFPicturesDisplayingHeadViewID = @"ZFPicturesDisplayingHeadViewID";
static NSString *const ZFSelectedTitleHeadViewID = @"ZFSelectedTitleHeadViewID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"精选地区馆";
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]  initWithImage:[UIImage  imageNamed: @"All"]
                                                               style:UIBarButtonItemStylePlain
                                                              target:self action:@selector(shareButtonDidClick)];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Share"]
                                                              style:UIBarButtonItemStylePlain target:self action:@selector(editButtonDidClick)];
    //设置图片与按钮间距
    [item2 setImageInsets:UIEdgeInsetsMake(0, 15, 0, -15)];
    self.navigationItem.rightBarButtonItems = @[item1,item2];
    
//    UIImage *imgRight = [UIImage imageNamed:@"All"];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[imgRight imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(editButtonDidClick)];
    
    [self setupUI];
    
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
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    //[self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    //[self.navigationController setNavigationBarHidden:NO animated:animated];
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
        return 10;
    }
    else if (section==1)
    {
        return 5;
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
        //分类
        ZFClassificationTableCell *oell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFClassificationTableCelllD forIndexPath:indexPath];
        
        if (indexPath.row==0)
        {
            oell.iconName = @"guoqi";
            oell.title = @"韩国馆";
        }
        else if (indexPath.row==1)
        {
            oell.iconName = @"zb";
            oell.title = @"泰国馆";
        }
        else if (indexPath.row==2)
        {
            oell.iconName = @"qd";
            oell.title = @"日本馆";
        }
        else if (indexPath.row==3)
        {
            oell.iconName = @"hd";
            oell.title = @"法国馆";
        }
        else if (indexPath.row==4)
        {
            oell.iconName = @"mr";
            oell.title = @"美国馆";
        }
        else if (indexPath.row==5)
        {
            oell.iconName = @"ph";
            oell.title = @"芬兰馆";
        }
        else if (indexPath.row==6)
        {
            oell.iconName = @"sc";
            oell.title = @"加拿大馆";
        }
        else if (indexPath.row==7)
        {
            oell.iconName = @"xyx";
            oell.title = @"新加坡馆";
        }
        else if (indexPath.row==8)
        {
            oell.iconName = @"xyx";
            oell.title = @"南欧馆";
        }
        else if (indexPath.row==9)
        {
            oell.iconName = @"xyx";
            oell.title = @"英国馆";
        }
        
        gridcell = oell;
    }
    else if (indexPath.section == 1)
    {
        //精选类别
        ZFSelectedCategoriesCell *xell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFSelectedCategoriesCellID forIndexPath:indexPath];
        if (indexPath.row==0)
        {
            xell.iconName = @"choiceness";
            xell.title = @"精选榜单";
        }
        else if (indexPath.row==1)
        {
            xell.iconName = @"NewProducts";
            xell.title = @"新品速递";
        }
        else if (indexPath.row==2)
        {
            xell.iconName = @"nice";
            xell.title = @"CEO种草";
        }
        else if (indexPath.row==3)
        {
            xell.iconName = @"commodity";
            xell.title = @"各国好物";
        }
        else if (indexPath.row==4)
        {
            xell.iconName = @"More";
            xell.title = @"更多精彩";
            xell.showhLineView = NO;
        }
        gridcell = xell;
    }
    else if (indexPath.section == 2)
    {
        //新品
        ZFNewProductsTableCell *xell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFNewProductsTableCellID forIndexPath:indexPath];
        gridcell = xell;
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
            ZFPicturesDisplayingHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFPicturesDisplayingHeadViewID forIndexPath:indexPath];
            reusableview = headerView;
        }
        else if (indexPath.section == 1)
        {
            ZFPicturesDisplayingHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFPicturesDisplayingHeadViewID forIndexPath:indexPath];
            reusableview = headerView;
        }
        else if (indexPath.section == 2)
        {
            ZFSelectedTitleHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFSelectedTitleHeadViewID forIndexPath:indexPath];
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
        //9宫格组
        return CGSizeMake(LL_ScreenWidth/5 , LL_ScreenWidth/4 - 15);
    }
    else if (indexPath.section == 1)
    {
        //9宫格组
        return CGSizeMake(LL_ScreenWidth/5 , LL_ScreenWidth/5 - 15);
    }
    //    if (indexPath.section == 1) {//广告
    //        return CGSizeMake(ScreenW, 180);
    //    }
    //    if (indexPath.section == 4) {//推荐组
    //        return [self layoutAttributesForItemAtIndexPath:indexPath].size;
    //    }
    else if (indexPath.section == 2)
    {
        //9宫格组
        return CGSizeMake(LL_ScreenWidth/4 , LL_ScreenWidth/4 + 30);
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
        return CGSizeMake(LL_ScreenWidth, 130); //图片滚动的宽高
    }
    else if (section == 1)
    {
        return CGSizeMake(LL_ScreenWidth, 110); //图片滚动的宽高
    }
    else if (section == 2)
    {
        return CGSizeMake(LL_ScreenWidth, 60); //图片滚动的宽高
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
    
}



#pragma mark - <UIScrollViewDelegate>
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    //判断顶部工具View的显示和隐形
//    _topToolView.hidden = (scrollView.contentOffset.y < 0) ? YES : NO;
//
//    if (scrollView.contentOffset.y > 44)
//    {
//        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
//        [[NSNotificationCenter defaultCenter] postNotificationName:UserShowTopToolViewNotification object:nil];
//    }else
//    {
//        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
//        [[NSNotificationCenter defaultCenter] postNotificationName:UserHideTopToolViewNotification object:nil];
//    }
//}


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
        [_collectionView registerClass:[ZFClassificationTableCell class] forCellWithReuseIdentifier:ZFClassificationTableCelllD];
        [_collectionView registerClass:[ZFSelectedCategoriesCell class] forCellWithReuseIdentifier:ZFSelectedCategoriesCellID];
        [_collectionView registerClass:[ZFNewProductsTableCell class] forCellWithReuseIdentifier:ZFNewProductsTableCellID];
        
        [_collectionView registerClass:[ZFPicturesDisplayingHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFPicturesDisplayingHeadViewID];
        [_collectionView registerClass:[ZFSelectedTitleHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZFSelectedTitleHeadViewID];
        //
        //        [_collectionView registerClass:[DCTopLineFootView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:DCTopLineFootViewID];
        
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}



@end
