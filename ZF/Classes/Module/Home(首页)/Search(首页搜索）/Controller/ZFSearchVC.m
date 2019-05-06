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
#import "ZFSearchModel.h"
#import "GHDropMenu.h"
#import "GHDropMenuModel.h"

@interface ZFSearchVC ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,GHDropMenuDelegate>
@property (nonatomic, strong)UIView *screenView;
@property (nonatomic, strong)UIButton *multipleBtn;
@property (nonatomic, strong)UIButton *salesBtn;
@property (nonatomic, strong)UIButton *priceBtn;
@property (nonatomic, strong)UIButton *ProductBtn;
@property (nonatomic, strong)UIButton *filterBtn;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UICollectionView *collectionView;

@property (nonatomic, strong)ZFSearchListModel *searchListModel;

@property (nonatomic , strong) GHDropMenu *dropMenu;
@property (nonatomic , strong) GHDropMenuModel *configuration;

@property (nonatomic , strong) UIButton *btn;

@end

@implementation ZFSearchVC
static NSString *const ZFSearchTableViewCellID = @"ZFSearchTableViewCellID";
static NSString *const ZFSearchCollectViewCellID = @"ZFSearchCollectViewCellID";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    
    self.tableView.mj_header = [RefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    
    [self.tableView.mj_header beginRefreshing];
}
- (void)setup{
    self.navigationItem.leftBarButtonItem.image = [UIImage imageNamed:@"Back"];
    self.btn = [[UIButton alloc]init];
    [self.btn setImage:[UIImage imageNamed:@"listing_o"] forState:UIControlStateNormal];
    [self.btn setImage:[UIImage imageNamed:@"listing"] forState:UIControlStateSelected];
    [self.btn addTarget:self action:@selector(cellControl:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.btn];
    
    ZFTitleView *titleView = [[ZFTitleView alloc] initWithFrame:CGRectMake(0, 0, 261, 35)];
    titleView.intrinsicContentSize = CGSizeMake(261, 35);
    titleView.backgroundColor = RGBColorHex(0xf2f2f2);
    titleView.layer.cornerRadius = 5;
    titleView.userInteractionEnabled = YES;
    self.navigationItem.titleView = titleView;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickTitle)];
    [tapGesture setNumberOfTapsRequired:1];
    [titleView addGestureRecognizer:tapGesture];
    titleView.titleLabel.text = self.text;
    
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
    
    
    [self.view addSubview:self.collectionView];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.screenView.mas_bottom).with.offset(5);
        make.left.equalTo(self.view).with.offset(16);
        make.right.equalTo(self.view).with.offset(-16);
        make.bottom.equalTo(self.view);
    }];
    _collectionView.hidden = YES;
    
}

-(void)multipleBtnDidClick
{
    //综合
    if (_multipleBtn.isSelected)
    {
        _multipleBtn.selected = NO;
    }
    else
    {
        _multipleBtn.selected = YES;
        _salesBtn.selected = NO;
        _priceBtn.selected = NO;
        _ProductBtn.selected = NO;
        self.searchModel.sort = @"comment_count";
    }
    [self loadData];
}

-(void)salesBtnDidClick
{
    //销量
    if (_salesBtn.isSelected)
    {
        _salesBtn.selected = NO;
    }
    else
    {
        _salesBtn.selected = YES;
        _priceBtn.selected = NO;
        _ProductBtn.selected = NO;
        self.searchModel.sort = @"sales_sum";
    }
    [self loadData];
}

-(void)priceBtnDidClick
{
    //价格
    if (_priceBtn.isSelected)
    {
        _priceBtn.selected = NO;
    }
    else
    {
        _priceBtn.selected = YES;
        _salesBtn.selected = NO;
        _ProductBtn.selected = NO;
        self.searchModel.sort = @"shop_price";
    }
    [self loadData];
}


-(void)productBtnDidClick
{
    //新品
    if (_ProductBtn.isSelected)
    {
        _ProductBtn.selected = NO;
    }
    else
    {
        _ProductBtn.selected = YES;
        _salesBtn.selected = NO;
        _priceBtn.selected = NO;
        self.searchModel.sort = @"is_new";
    }
    [self loadData];
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
        [_multipleBtn addTarget:self action:@selector(multipleBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _multipleBtn;
}
//销量按钮
- (UIButton *)salesBtn{
    if (_salesBtn == nil) {
        _salesBtn = [[UIButton alloc]init];
        _salesBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_salesBtn setTitleColor:RGBColorHex(0x484848) forState:UIControlStateNormal];
        [_salesBtn setTitleColor:RGBColorHex(0xff0000) forState:UIControlStateSelected];
        [_salesBtn setTitle:@"销量" forState:UIControlStateNormal];
        [_salesBtn addTarget:self action:@selector(salesBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _salesBtn;
}
//价格按钮
- (UIButton *)priceBtn{
    if (_priceBtn == nil) {
        _priceBtn = [[UIButton alloc]init];
        _priceBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_priceBtn setTitleColor:RGBColorHex(0x484848) forState:UIControlStateNormal];
        [_priceBtn setTitleColor:RGBColorHex(0xff0000) forState:UIControlStateSelected];
        [_priceBtn setTitle:@"价格" forState:UIControlStateNormal];
        [_priceBtn setImage:[UIImage imageNamed:@"arrow_r"] forState:UIControlStateNormal];
        [_priceBtn addTarget:self action:@selector(priceBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _priceBtn;
}
//新品按钮
- (UIButton *)ProductBtn{
    if (_ProductBtn == nil) {
        _ProductBtn = [[UIButton alloc]init];
        _ProductBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_ProductBtn setTitleColor:RGBColorHex(0x484848) forState:UIControlStateNormal];
        [_ProductBtn setTitleColor:RGBColorHex(0xff0000) forState:UIControlStateSelected];
        [_ProductBtn setTitle:@"新品" forState:UIControlStateNormal];
        [_ProductBtn addTarget:self action:@selector(productBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
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
        [_filterBtn addTarget:self action:@selector(filterBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _filterBtn;
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
        [self.tableView reloadData];
    }else{
        self.tableView.hidden = YES;
        self.collectionView.hidden = NO;
        [self.collectionView reloadData];
    }
}
#pragma mark --协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.searchListModel.goods_list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZFSearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ZFSearchTableViewCellID];
    if (cell==nil) {
        cell = [[ZFSearchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFSearchTableViewCellID];
    }
    
    ZFSearchModel* model = [self.searchListModel.goods_list objectAtIndex:indexPath.row];
    cell.searchModel = model;
    return cell;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
        return self.searchListModel.goods_list.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ZFSearchCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFSearchCollectViewCellID forIndexPath:indexPath];
    
    ZFSearchModel* model = [self.searchListModel.goods_list objectAtIndex:indexPath.item];
    cell.searchModel = model;

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
        [self.collectionView.mj_header endRefreshing];
        return;
    }
    
    ZWeakSelf
    self.searchModel.q = self.text;
    [http_home search:self.searchModel success:^(id responseObject)
     {
         // 拿到当前的下拉刷新控件，结束刷新状态
         [weakSelf.tableView.mj_header endRefreshing];
         [self.collectionView.mj_header endRefreshing];
         [weakSelf loadData_success:responseObject];
         
     } failure:^(NSError *error) {
         
         // 拿到当前的下拉刷新控件，结束刷新状态
         [weakSelf.tableView.mj_header endRefreshing];
         [self.collectionView.mj_header endRefreshing];
         [SVProgressHUD showInfoWithStatus:error.domain];
     }];
}

-(void)loadData_success:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    self.searchListModel = [ZFSearchListModel mj_objectWithKeyValues:responseObject];
    
    if (self.btn.isSelected)
    {
        [self.collectionView reloadData];
    }
    else
    {
        [self.tableView reloadData];
    }
}

-(ZFSearchModel* )searchModel
{
    if (_searchModel==nil) {
        _searchModel = [[ZFSearchModel alloc]init];
    }
    
    return _searchModel;
}

-(void)filterBtnDidClick
{
    GHDropMenuModel *configuration = [[GHDropMenuModel alloc]init];
    
    configuration.titles = [configuration creaFilterDropMenuDatamy];
    /** 配置筛选菜单是否记录用户选中 默认NO */
    configuration.recordSeleted = NO;
    self.configuration = configuration;
    
    weakself(self);
    GHDropMenu *dropMenu = [GHDropMenu creatDropFilterMenuWidthConfiguration:self.configuration dropMenuTagArrayBlock:^(NSArray * _Nonnull tagArray) {
        [weakSelf getStrWith:tagArray];
        
    }];
    dropMenu.titleSeletedImageName = @"up_normal";
    dropMenu.titleNormalImageName = @"down_normal";
    dropMenu.delegate = self;
    dropMenu.durationTime = 0.5;
    self.dropMenu = dropMenu;
    [dropMenu show];
}

#pragma mark - 代理方法
- (void)dropMenu:(GHDropMenu *)dropMenu dropMenuTitleModel:(GHDropMenuModel *)dropMenuTitleModel {
    self.navigationItem.title = [NSString stringWithFormat:@"筛选结果: %@",dropMenuTitleModel.title];
    
    //结果处理
    self.searchModel.sel = @"all";
    [self loadData];
}

- (void)dropMenu:(GHDropMenu *)dropMenu tagArray:(NSArray *)tagArray {
    [self getStrWith:tagArray];
}

- (void)getStrWith: (NSArray *)tagArray {
    NSMutableString *string = [NSMutableString string];
    if (tagArray.count) {
        for (GHDropMenuModel *dropMenuTagModel in tagArray) {
            if (dropMenuTagModel.tagSeleted) {
                if (dropMenuTagModel.tagName.length) {
                    [string appendFormat:@"%@",dropMenuTagModel.tagName];
                }
            }
            if (dropMenuTagModel.maxPrice.length) {
                [string appendFormat:@"最大价格%@",dropMenuTagModel.maxPrice];
            }
            if (dropMenuTagModel.minPrice.length) {
                [string appendFormat:@"最小价格%@",dropMenuTagModel.minPrice];
            }
            if (dropMenuTagModel.singleInput.length) {
                [string appendFormat:@"%@",dropMenuTagModel.singleInput];
            }
        }
    }
    self.navigationItem.title = [NSString stringWithFormat:@"筛选结果: %@",string];
}


@end
