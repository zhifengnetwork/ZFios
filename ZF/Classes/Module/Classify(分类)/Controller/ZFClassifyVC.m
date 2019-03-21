//
//  ZFClassifyVC.m
//  ZF
//
//  Created by apple on 27/02/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFClassifyVC.h"
#import "ZFClassifyTableCell.h"


@interface ZFClassifyVC ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

/* tableView */
@property (strong , nonatomic)UITableView *tableView;
/* collectionViw */
@property (strong , nonatomic)UICollectionView *collectionView;

@end

@implementation ZFClassifyVC

static NSString *const ZFClassifyTableCellID = @"ZFClassifyTableCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}


- (void)setup
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.backgroundColor = TableViewBGColor;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.tableView.tableFooterView = [UIView new];
}


#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZFClassifyTableCell *cell = [tableView dequeueReusableCellWithIdentifier:ZFClassifyTableCellID forIndexPath:indexPath];
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    _mainItem = [DCClassMianItem mj_objectArrayWithFilename:_titleItem[indexPath.row].fileName];
    [self.collectionView reloadData];
}



- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 0;
}

#pragma mark - <UICollectionViewDelegate>
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *gridcell = nil;
//    if ([_mainItem[_mainItem.count - 1].title isEqualToString:@"热门品牌"])
//    {
//        if (indexPath.section == _mainItem.count - 1) {//品牌
//            DCBrandSortCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCBrandSortCellID forIndexPath:indexPath];
//            cell.subItem = _mainItem[indexPath.section].goods[indexPath.row];
//            gridcell = cell;
//        }
//        else
//        {//商品
//            DCGoodsSortCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCGoodsSortCellID forIndexPath:indexPath];
//            cell.subItem = _mainItem[indexPath.section].goods[indexPath.row];
//            gridcell = cell;
//        }
//    }else
//    {//商品
//        DCGoodsSortCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCGoodsSortCellID forIndexPath:indexPath];
//        cell.subItem = _mainItem[indexPath.section].goods[indexPath.row];
//        gridcell = cell;
//    }
    
    return gridcell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
//    if (kind == UICollectionElementKindSectionHeader)
//    {
//
//        DCBrandsSortHeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCBrandsSortHeadViewID forIndexPath:indexPath];
//        headerView.headTitle = _mainItem[indexPath.section];
//        reusableview = headerView;
//    }
    return reusableview;
}
#pragma mark - item宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    if ([_mainItem[_mainItem.count - 1].title isEqualToString:@"热门品牌"])
//    {
//        if (indexPath.section == _mainItem.count - 1)
//        {//品牌
//            return CGSizeMake((LL_ScreenWidth - 100 - 6 - 15)/3, 60);
//        }else
//        {//商品
//            return CGSizeMake((LL_ScreenWidth - 100 - 6 - 15)/3, (LL_ScreenWidth - 100 - 6 - 15)/3 + 20);
//        }
//    }else
//    {
//        return CGSizeMake((LL_ScreenWidth - 100 - 6 - 15)/3, (LL_ScreenWidth - 100 - 6 - 15)/3 + 20);
//    }
    return CGSizeZero;
}

#pragma mark - head宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(LL_ScreenWidth, 25);
}

#pragma mark - foot宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeZero;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了个第%zd分组第%zd几个Item",indexPath.section,indexPath.row);
}




#pragma mark - LazyLoad
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.frame = CGRectMake(0, 0, 100, LL_ScreenHeight);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_tableView];
        
        [_tableView registerClass:[ZFClassifyTableCell class] forCellReuseIdentifier:ZFClassifyTableCellID];
    }
    return _tableView;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.minimumInteritemSpacing = 3; //X
        layout.minimumLineSpacing = 5;  //Y
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self.view addSubview:_collectionView];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.frame = CGRectMake(100, 0, LL_ScreenWidth-100,LL_ScreenHeight);
//        //注册Cell
//        [_collectionView registerClass:[DCGoodsSortCell class] forCellWithReuseIdentifier:DCGoodsSortCellID];
//        [_collectionView registerClass:[DCBrandSortCell class] forCellWithReuseIdentifier:DCBrandSortCellID];
//        //注册Header
//        [_collectionView registerClass:[DCBrandsSortHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DCBrandsSortHeadViewID];
    }
    return _collectionView;
}

@end
