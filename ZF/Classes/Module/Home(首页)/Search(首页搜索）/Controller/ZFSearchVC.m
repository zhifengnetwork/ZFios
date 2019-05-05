//
//  ZFSearchVC.m
//  ZF
//
//  Created by weiming zhang on 2019/3/30.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFSearchVC.h"
#import "ZFTitleView.h"
#import "ZFSearchTableViewCell.h"
#import "ZFSearchCollectionViewCell.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "RefreshGifHeader.h"
#import "ZFPlantingModel.h"
#import "ZFADModel.h"
#import "http_home.h"
#import "ZFSpikeModel.h"

@interface ZFSearchVC ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong)UIView *screenView;
@property (nonatomic, strong)UIButton *multipleBtn;
@property (nonatomic, strong)UIButton *salesBtn;
@property (nonatomic, strong)UIButton *priceBtn;
@property (nonatomic, strong)UIButton *ProductBtn;
@property (nonatomic, strong)UIButton *filterBtn;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)UIImageView *loadImageView;
@property (nonatomic, strong)UILabel *loadLabel;
@end

@implementation ZFSearchVC
static NSString *const ZFSearchTableViewCellID = @"ZFSearchTableViewCellID";
static NSString *const ZFSearchCollectViewCellID = @"ZFSearchCollectViewCellID";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    
}
- (void)setup{
    self.navigationItem.leftBarButtonItem.image = [UIImage imageNamed:@"Back"];
    UIButton *btn = [[UIButton alloc]init];
    [btn setImage:[UIImage imageNamed:@"listing_o"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"listing"] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(cellControl:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    ZFTitleView *titleView = [[ZFTitleView alloc] initWithFrame:CGRectMake(0, 0, 261, 35)];
    titleView.intrinsicContentSize = CGSizeMake(261, 35);
    titleView.backgroundColor = RGBColorHex(0xf2f2f2);
    titleView.layer.cornerRadius = 5;
    titleView.userInteractionEnabled = YES;
    self.navigationItem.titleView = titleView;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickTitle)];
    [tapGesture setNumberOfTapsRequired:1];
    [titleView addGestureRecognizer:tapGesture];
    
    [self.view addSubview:self.screenView];
    [self.screenView addSubview:self.multipleBtn];
    [self.screenView addSubview:self.salesBtn];
    [self.screenView addSubview:self.priceBtn];
    [self.screenView addSubview:self.ProductBtn];
    [self.screenView addSubview:self.filterBtn];
    [_screenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(5);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(39);
    }];
    [_multipleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.screenView).with.offset(16);
        make.centerY.equalTo(self.screenView.mas_centerY);
    }];
    [_multipleBtn setTitleEdgeInsets:UIEdgeInsetsMake(0,  -_multipleBtn.imageView.frame.size.width - 4, 0, _multipleBtn.imageView.frame.size.width + 4)];
    [_multipleBtn setImageEdgeInsets:UIEdgeInsetsMake(0 , _multipleBtn.titleLabel.bounds.size.width , 0,
                                                      -_multipleBtn.titleLabel.bounds.size.width )];
    [_salesBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.multipleBtn.mas_right).with.offset(47);
        make.centerY.equalTo(self.screenView.mas_centerY);
    }];
    [_priceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.salesBtn.mas_right).with.offset(47);
        make.centerY.equalTo(self.screenView.mas_centerY);
    }];
    [_priceBtn setTitleEdgeInsets:UIEdgeInsetsMake(0,  -_priceBtn.imageView.frame.size.width - 4, 0, _priceBtn.imageView.frame.size.width + 4)];
    [_priceBtn setImageEdgeInsets:UIEdgeInsetsMake(0 , _priceBtn.titleLabel.bounds.size.width , 0,
                                                      -_priceBtn.titleLabel.bounds.size.width )];
    [_ProductBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.priceBtn.mas_right).with.offset(47);
        make.centerY.equalTo(self.screenView.mas_centerY);
    }];
    [_filterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.ProductBtn.mas_right).with.offset(47);
        make.centerY.equalTo(self.screenView.mas_centerY);
    }];
    [_filterBtn setTitleEdgeInsets:UIEdgeInsetsMake(0,  -_filterBtn.imageView.frame.size.width - 4, 0, _filterBtn.imageView.frame.size.width + 4)];
    [_filterBtn setImageEdgeInsets:UIEdgeInsetsMake(0 , _filterBtn.titleLabel.bounds.size.width , 0,
                                                   -_filterBtn.titleLabel.bounds.size.width )];
    _tableView = [[UITableView alloc]init];
    [self.view addSubview:self.tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.rowHeight = 121;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.screenView.mas_bottom).with.offset(5);
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.bottom.equalTo(self.view);
    }];
    UIView *footerView =[[UIView alloc]initWithFrame:CGRectMake(0,0,0,100)];
    [_tableView setTableFooterView:footerView];
    [footerView addSubview:self.loadImageView];
    [footerView addSubview:self.loadLabel];
    [_loadImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(footerView).with.offset(25);
        make.left.equalTo(footerView).with.offset(150);
    }];
    [_loadLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.loadImageView.mas_right).with.offset(15);
        make.centerY.equalTo(self.loadImageView.mas_centerY);
    }];
    
    
    [self.view addSubview:self.collectionView];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.screenView.mas_bottom).with.offset(5);
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.bottom.equalTo(self.view);
    }];
    _collectionView.hidden = YES;
    
}
- (UIView *)screenView{
    if (_screenView == nil) {
        _screenView = [[UIView alloc]init];
        _screenView.backgroundColor = RGBColorHex(0xf2f2f2);
    }
    return _screenView;
}
//综合按钮
- (UIButton *)multipleBtn{
    if (_multipleBtn == nil) {
        _multipleBtn = [[UIButton alloc]init];
        _multipleBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_multipleBtn setTitleColor:RGBColorHex(0xe73339) forState:UIControlStateNormal];
        [_multipleBtn setTitle:@"综合" forState:UIControlStateNormal];
        [_multipleBtn setImage:[UIImage imageNamed:@"down_r"] forState:UIControlStateNormal];
        
        
    }
    return _multipleBtn;
}
//销量按钮
- (UIButton *)salesBtn{
    if (_salesBtn == nil) {
        _salesBtn = [[UIButton alloc]init];
        _salesBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_salesBtn setTitleColor:RGBColorHex(0x484848) forState:UIControlStateNormal];
        [_salesBtn setTitle:@"销量" forState:UIControlStateNormal];
    }
    return _salesBtn;
}
//价格按钮
- (UIButton *)priceBtn{
    if (_priceBtn == nil) {
        _priceBtn = [[UIButton alloc]init];
        _priceBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_priceBtn setTitleColor:RGBColorHex(0x484848) forState:UIControlStateNormal];
        [_priceBtn setTitle:@"价格" forState:UIControlStateNormal];
        [_priceBtn setImage:[UIImage imageNamed:@"arrow_r"] forState:UIControlStateNormal];
    }
    return _priceBtn;
}
//新品按钮
- (UIButton *)ProductBtn{
    if (_ProductBtn == nil) {
        _ProductBtn = [[UIButton alloc]init];
        _ProductBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_ProductBtn setTitleColor:RGBColorHex(0x484848) forState:UIControlStateNormal];
        [_ProductBtn setTitle:@"新品" forState:UIControlStateNormal];
    }
    return _ProductBtn;
}
//筛选按钮
- (UIButton *)filterBtn{
    if (_filterBtn == nil) {
        _filterBtn = [[UIButton alloc]init];
        _filterBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_filterBtn setTitleColor:RGBColorHex(0x484848) forState:UIControlStateNormal];
        [_filterBtn setTitle:@"筛选" forState:UIControlStateNormal];
        [_filterBtn setImage:[UIImage imageNamed:@"screen"] forState:UIControlStateNormal];
    }
    return _filterBtn;
}
- (UIImageView *)loadImageView{
    if (_loadImageView == nil) {
        _loadImageView = [[UIImageView alloc]init];
        [_loadImageView setImage:[UIImage imageNamed:@"loading"]];
        
    }
    return _loadImageView;
}
- (UILabel *)loadLabel{
    if (_loadLabel == nil) {
        _loadLabel = [[UILabel alloc]init];
        _loadLabel.font = [UIFont systemFontOfSize:13];
        _loadLabel.textColor = RGBColorHex(0xb3b3b3);
        _loadLabel.text = @"正在加载..";
    }
    return _loadLabel;
}
- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *fl = [[UICollectionViewFlowLayout alloc]init];
        fl.minimumLineSpacing = 15;
        fl.minimumInteritemSpacing = 19;
        fl.scrollDirection = UICollectionViewScrollDirectionVertical;
        fl.itemSize = CGSizeMake((LL_ScreenWidth -60)/2, 285);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 100) collectionViewLayout:fl];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[ZFSearchCollectionViewCell class] forCellWithReuseIdentifier:ZFSearchCollectViewCellID];
    }
    return _collectionView;
}

#pragma mark --方法
//点击titleview
- (void)clickTitle{
    [self.navigationController popViewControllerAnimated:YES];
}
//控制显示列表还是块
- (void)cellControl: (UIButton *)btn{
    btn.selected = !btn.selected;
    if (btn.selected == NO) {
        self.tableView.hidden = NO;
        self.collectionView.hidden = YES;
    }else{
        self.tableView.hidden = YES;
        self.collectionView.hidden = NO;
    }
}
#pragma mark --协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ZFSearchTableViewCellID];
    if (cell ==nil) {
        cell = [[ZFSearchTableViewCell alloc]init];
    }
    return cell;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
        return 4;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZFSearchCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFSearchCollectViewCellID forIndexPath:indexPath];
    if (cell ==nil) {
        cell = [[ZFSearchCollectionViewCell alloc]init];
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //点击跳转
}

-(void)loadData
{
    if (kStringIsEmpty(self.text))
    {
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.tableView.mj_header endRefreshing];
        return;
    }
    
    ZWeakSelf
    [http_home search:self.searchModel success:^(id responseObject)
     {
         // 拿到当前的下拉刷新控件，结束刷新状态
         [weakSelf.tableView.mj_header endRefreshing];
         [weakSelf loadData_success:responseObject];
         
     } failure:^(NSError *error) {
         
         // 拿到当前的下拉刷新控件，结束刷新状态
         [weakSelf.tableView.mj_header endRefreshing];
         [SVProgressHUD showInfoWithStatus:error.domain];
     }];
}

-(void)loadData_success:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
//    NSDictionary *dictf = [responseObject objectForKey:@"userList"];
//    self.userListDataList = [LKSearchModel mj_objectArrayWithKeyValuesArray:dictf];
    
    [self.tableView reloadData];
}


@end
