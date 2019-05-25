//
//  ZFDetailsPageVC.m
//  ZF
//
//  Created by admin on 2019/3/25.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDetailsPageVC.h"
#import "ZFCommDetHeadView.h"
#import "ZFTool.h"
#import "ZFDetCommInformationTableCell.h"
#import "ZFDeliveryTableCell.h"
#import "ZFExplainTableCell.h"
#import "ZFevaluationHeadTableCell.h"
#import "ZFCommodityEvaluationTableCell.h"
#import "ZFAskEveryoneHeadTableCell.h"
#import "ZFAskEveryoneTableCell.h"
#import "ZFMerchandiseSaleHeadTableCell.h"
#import "ZFDetailsPageFooterView.h"
#import "ZFSimilarRecommendTableCell.h"
#import "ZFDetailsImageTextHeadView.h"
#import "ZFDetailsImageTextFootView.h"
#import "ZFDetailsImageTextTableCell.h"
#import "TYAlertController.h"
#import "ZFShareView.h"
#import "ZFGoodModel.h"
#import "ZFAddressEditModel.h"
#import "http_good.h"
#import "http_address.h"
#import "SVProgressHUD.h"
#import "ZFGoodModel.h"
#import "MJExtension.h"
#import "ZFGoodCommentModel.h"
#import "ZFDetailsWebViewTableCell.h"
#import "DXLAddressPickView.h"


@interface ZFDetailsPageVC ()<UITableViewDelegate,UITableViewDataSource,ZFDetailsImageTextHeadViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) ZFCommDetHeadView *headView;
@property (nonatomic, strong) ZFDetailsPageFooterView *footerView;

@property (nonatomic, strong) UIImage *AvatarImage;
@property (nonatomic, assign) BOOL isUploadAvatar;

@property (strong , nonatomic)NSMutableArray *imageUrls;
@property (nonatomic, copy)NSString *address;//配送地址
@property (nonatomic, copy)NSString *freight;//运费
@property (nonatomic, copy)NSString *itemID;//规格id
@property (nonatomic, copy)NSString *itemName;//规格名称

@property (nonatomic, strong) ZFDetailListModel* detailListModel;
@property (nonatomic, strong) ZFGoodModel* attributeModel;
@property (nonatomic, strong) ZFGoodCommentListModel* commentListModel;

@property (nonatomic, assign) BOOL isShowIt;
@property (nonatomic, strong) NSMutableDictionary* heightDic;


@property (nonatomic, strong)  ZFAddressEditModel *addressEditModel;
@property(nonatomic,strong) DXLAddressPickView *pickerView;

@property(nonatomic,strong) NSMutableArray *arr1;
@property(nonatomic,strong) NSMutableArray *arr2;
@property(nonatomic,strong) NSMutableArray *arr3;

@end

@implementation ZFDetailsPageVC

static NSString *const ZFDetCommInformationTableCelllD = @"ZFDetCommInformationTableCelllD";
static NSString *const ZFDeliveryTableCelllD = @"ZFDeliveryTableCelllD";
static NSString *const ZFExplainTableCelllD = @"ZFExplainTableCelllD";
static NSString *const ZFevaluationHeadTableCelllD = @"ZFevaluationHeadTableCelllD";
static NSString *const ZFCommodityEvaluationTableCelllD = @"ZFCommodityEvaluationTableCelllD";
static NSString *const ZFAskEveryoneHeadTableCelllD = @"ZFAskEveryoneHeadTableCelllD";
static NSString *const ZFAskEveryoneTableCelllD = @"ZFAskEveryoneTableCelllD";
static NSString *const ZFMerchandiseSaleHeadTableCelllD = @"ZFMerchandiseSaleHeadTableCelllD";
static NSString *const ZFSimilarRecommendTableCelllD = @"ZFSimilarRecommendTableCelllD";
static NSString *const ZFDetailsImageTextTableCelllD = @"ZFDetailsImageTextTableCelllD";
static NSString *const ZFDetailsWebViewTableCelllD = @"ZFDetailsWebViewTableCelllD";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ZFTool isHiddenNavigationBarSeparatorLine:YES vc:self];
    self.title = @"";
    self.view.backgroundColor = TableViewBGColor;
    [self setupUI];
    [self setupTableView];
    
    // 用于缓存cell高度
    self.heightDic = [[NSMutableDictionary alloc] init];
    [self.heightDic setObject:@"375" forKey:@"0"];
    
    UIImage *imgRight = [UIImage imageNamed:@"share"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[imgRight imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(shareButtonDidClick)];
    
    [self loadData];
}

-(void)loadData
{
    ZWeakSelf
    //获取商品详情
    [http_good goodsInfo:_goods_id success:^(id responseObject)
     {
         [weakSelf showData:responseObject];
         
     } failure:^(NSError *error) {
         
         [SVProgressHUD showInfoWithStatus:error.domain];
     }];
    
    [self loadData6];//获取默认地址
    
    //商品属性
    [http_good goodsAttr:_goods_id success:^(id responseObject)
     {
         if (kObjectIsEmpty(responseObject))
         {
             return;
         }
         
         self.attributeModel = [ZFGoodModel mj_objectWithKeyValues:responseObject];
         
         
     }
    failure:^(NSError *error) {
                     [SVProgressHUD showErrorWithStatus:error.domain];
                 }];
    
}



- (void)setItemID:(NSString *)itemID{
    _itemID = itemID;
    [http_good getPricePic:_itemID goods_id:self.goods_id success:^(id responseObject) {
        if (kObjectIsEmpty(responseObject))
        {
            return;
        }
        ZFGoodModel *pricemodel = [ZFGoodModel mj_objectWithKeyValues:responseObject];
        self.itemName = pricemodel.spec_key_name;
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
}

- (void)setRegion_id:(NSInteger)region_id{
    _region_id = region_id;
    //    获取地址id
    [http_good dispatching:self.goods_id region_id:self.region_id buy_num:1 success:^(id responseObject) {
        if (kObjectIsEmpty(responseObject))
        {
            return;
        }
        //获取运费
        self.freight = [responseObject objectForKey:@"freight"];
        
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
    [self.tableView reloadData];
}

-(void)showData:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    self.detailListModel = [ZFDetailListModel mj_objectWithKeyValues:responseObject];
    
    [self.imageUrls removeAllObjects];
    for (int i=0; i<self.detailListModel.goods.goods_images.count; i++)
    {
        NSString* url = [self.detailListModel.goods.goods_images objectAtIndex:i];
        NSString* str = [NSString stringWithFormat:@"%@%@",ImageUrl,url];
        [self.imageUrls addObject:str];
    }
    _headView.imageUrls = self.imageUrls;
    _footerView.detailsPageModel = self.detailListModel.goods;
    [self loadData2];
    [self.tableView reloadData];
}

-(void)loadData2
{
    //获取好评评论
    ZWeakSelf
    [http_good getGoodsComment:_goods_id commentType:2 success:^(id responseObject)
     {
         [weakSelf showData2:responseObject];

         }
    failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
    }];
}

-(void)showData2:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    self.commentListModel = [ZFGoodCommentListModel mj_objectWithKeyValues:responseObject];
    
    [self.tableView reloadData];
}


-(void)shareButtonDidClick
{
    ZFShareView *shareView = [[ZFShareView alloc]initWithFrame:CGRectMake(0, LL_ScreenHeight - 125, LL_ScreenWidth, 299)];
    TYAlertController *alertController = [TYAlertController alertControllerWithAlertView:shareView preferredStyle:TYAlertControllerStyleActionSheet];
    alertController.backgoundTapDismissEnable = YES;
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //    [self.navigationController setNavigationBarHidden:YES animated:animated];
    // 注册加载完成高度的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noti:) name:@"WEBVIEW_HEIGHT" object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"WEBVIEW_HEIGHT" object:nil];
}

-(void)setupUI
{
    _headView = [[ZFCommDetHeadView alloc] initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 375)];
    _headView.imageUrls = self.imageUrls;
    self.tableView.tableHeaderView = _headView;
//    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self->_headView1.mas_bottom);
//        make.left.right.equalTo(self);
//        make.height.mas_equalTo(300);
//    }];
}


- (void)setupTableView
{
    [self.view addSubview:self.footerView];
    [_footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(50);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.bottom.mas_equalTo(-50);
    }];
    
    //自动计算高度
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.backgroundColor = RGBTableViewBGColor;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[ZFDetCommInformationTableCell class] forCellReuseIdentifier:ZFDetCommInformationTableCelllD];
    [self.tableView registerClass:[ZFDeliveryTableCell class] forCellReuseIdentifier:ZFDeliveryTableCelllD];
    [self.tableView registerClass:[ZFExplainTableCell class] forCellReuseIdentifier:ZFExplainTableCelllD];
    [self.tableView registerClass:[ZFevaluationHeadTableCell class] forCellReuseIdentifier:ZFevaluationHeadTableCelllD];
    [self.tableView registerClass:[ZFCommodityEvaluationTableCell class] forCellReuseIdentifier:ZFCommodityEvaluationTableCelllD];
    [self.tableView registerClass:[ZFAskEveryoneHeadTableCell class] forCellReuseIdentifier:ZFAskEveryoneHeadTableCelllD];
    [self.tableView registerClass:[ZFAskEveryoneTableCell class] forCellReuseIdentifier:ZFAskEveryoneTableCelllD];
    [self.tableView registerClass:[ZFMerchandiseSaleHeadTableCell class] forCellReuseIdentifier:ZFMerchandiseSaleHeadTableCelllD];
    [self.tableView registerClass:[ZFSimilarRecommendTableCell class] forCellReuseIdentifier:ZFSimilarRecommendTableCelllD];
    [self.tableView registerClass:[ZFDetailsImageTextTableCell class] forCellReuseIdentifier:ZFDetailsImageTextTableCelllD];
    [self.tableView registerClass:[ZFDetailsWebViewTableCell class] forCellReuseIdentifier:ZFDetailsWebViewTableCelllD];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 7;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==1)
    {
        return 3;
    }
    else if (section==5)
    {
        if (self.isShowIt) {
            return 6;
        }
        return 0;
    }
    else if (section==6)
    {
        if (self.isShowIt) {
            return 0;
        }
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    if (indexPath.section==0)
    {
        ZFDetCommInformationTableCell* dcell = [tableView dequeueReusableCellWithIdentifier:ZFDetCommInformationTableCelllD];
        dcell = [[ZFDetCommInformationTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFDetCommInformationTableCelllD];
        dcell.detailsPageModel = self.detailListModel.goods;
        dcell.freight = _freight;
        cell = dcell;
    }
    else if (indexPath.section==1)
    {
        
        ZFDeliveryTableCell* ocell  = [tableView dequeueReusableCellWithIdentifier:ZFDeliveryTableCelllD];
        ocell = [[ZFDeliveryTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFDeliveryTableCelllD];
        if (indexPath.row == 0) {
            ocell.name = @"领券";
            ocell.title = @"";
            
        }else if (indexPath.row==1)
        {
            ocell.name = @"地址";
            ocell.title = [NSString stringWithFormat:@"%@",self.address];
        }
        else if (indexPath.row==2)
        {
            ocell.name = @"规格";
            if (!kStringIsEmpty(self.itemName)) {
                ocell.title = [NSString stringWithFormat:@"%@",self.itemName];
            }else{
                ocell.title = @"一件";
            }
            
            
        }
        
        cell = ocell;
    }
    else if (indexPath.section==2)
    {
        ZFExplainTableCell* xcell = [tableView dequeueReusableCellWithIdentifier:ZFExplainTableCelllD];
        xcell = [[ZFExplainTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFExplainTableCelllD];
        cell = xcell;
    }
    else if (indexPath.section==3)
    {
        //评价cell
        ZFevaluationHeadTableCell* qcell = [tableView dequeueReusableCellWithIdentifier:ZFevaluationHeadTableCelllD];
        qcell = [[ZFevaluationHeadTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFevaluationHeadTableCelllD];
        qcell.goodsID = self.goods_id;
        qcell.comment_fr = self.detailListModel.goods.comment_fr;
        cell = qcell;
    }
//    else if (indexPath.section==4)
//    {
//
//        ZFCommodityEvaluationTableCell* acell = [tableView dequeueReusableCellWithIdentifier:ZFCommodityEvaluationTableCelllD];
//        acell = [[ZFCommodityEvaluationTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFCommodityEvaluationTableCelllD];
//        if (self.commentListModel.commentlist.count>0)
//        {
//            acell.commentModel = [self.commentListModel.commentlist objectAtIndex:0];
//        }
//        cell = acell;
//    }
//    else if (indexPath.section==5)
//    {
//        ZFAskEveryoneHeadTableCell* ncell = [tableView dequeueReusableCellWithIdentifier:ZFAskEveryoneHeadTableCelllD];
//        ncell = [[ZFAskEveryoneHeadTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFAskEveryoneHeadTableCelllD];
//        cell = ncell;
//    }
//    else if (indexPath.section==4)
//    {
//        ZFAskEveryoneTableCell* vcell = [tableView dequeueReusableCellWithIdentifier:ZFAskEveryoneTableCelllD];
//        vcell = [[ZFAskEveryoneTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFAskEveryoneTableCelllD];
//        cell = vcell;
//    }
//    else if (indexPath.section==4)
//    {
//        ZFMerchandiseSaleHeadTableCell* vcell = [tableView dequeueReusableCellWithIdentifier:ZFMerchandiseSaleHeadTableCelllD];
//        vcell = [[ZFMerchandiseSaleHeadTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFMerchandiseSaleHeadTableCelllD];
//        ZFDetailsPageModel *shopModel = self.detailListModel.goods.seller_info;
//        vcell.shopModel = shopModel;
//        cell = vcell;
//    }
    else if (indexPath.section==4)
    {
        ZFSimilarRecommendTableCell* vcell = [tableView dequeueReusableCellWithIdentifier:ZFSimilarRecommendTableCelllD];
        vcell = [[ZFSimilarRecommendTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFSimilarRecommendTableCelllD];
        vcell.goods = self.detailListModel.goods.seller_info.goods;
        cell = vcell;
    }
    else if (indexPath.section==5)
    {
        
        ZFDetailsImageTextTableCell* vcell = [tableView dequeueReusableCellWithIdentifier:ZFDetailsImageTextTableCelllD];
        vcell = [[ZFDetailsImageTextTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFDetailsImageTextTableCelllD];
        vcell.attributemodel = self.attributeModel.goods_attribute[indexPath.row];
        
        cell = vcell;
    }
    else if (indexPath.section==6)
    {
        ZFDetailsWebViewTableCell* vcell = [tableView dequeueReusableCellWithIdentifier:ZFDetailsWebViewTableCelllD];
        vcell = [[ZFDetailsWebViewTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFDetailsWebViewTableCelllD];
        vcell.goods_content = self.detailListModel.goods_content;
        
        cell = vcell;
    }
    
    return cell;
}

//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        return UITableViewAutomaticDimension;
    }
    else if (indexPath.section==1)
    {
        return 40;
    }
    else if (indexPath.section==2)
    {
        return 50;
    }
    else if (indexPath.section==5)
    {
        return 25;
    }
    else if (indexPath.section==6)
    {
        NSNumber* h = [self.heightDic objectForKey:@"0"];
        return h.floatValue;
    }
    else if (indexPath.section==4)
    {
        return 385;
    }
    return 35;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==3) {
        return 1;
    }
    if (section==4) {
        return 5;
    }
    else if (section==7) {
        return 20;
    }
    else if (section==8) {
        return 20;
    }
    else if (section==5) {
        return 40;
    }
    return 0;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==8)
    {
        return 20;
    }
    else if (section==5)
    {
//        return 200;
    }
    
    return 0;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==5)
    {
        ZFDetailsImageTextHeadView *headerView = [[ZFDetailsImageTextHeadView alloc]init];
        headerView.isShowIt = self.isShowIt;
        headerView.delegate = self;
        return headerView;
    }
    UIView* view = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section==5)
    {
//        ZFDetailsImageTextFootView *footView = [[ZFDetailsImageTextFootView alloc]init];
//        return footView;
//        UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 200)];
//        [webView loadHTMLString:self.detailListModel.goods_content baseURL:nil];
        
    }
    
    UIView* view = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (void)ZFDetailsImageTextHeadViewDidClick:(NSString *)type{
    if ([type isEqualToString:@"商品详情"]) {
        self.isShowIt = NO;
    }else{
        self.isShowIt = YES;
    }
    
    [self.tableView reloadData];
}

- (void)noti:(NSNotification *)sender
{
    ZFDetailsWebViewTableCell *cell = [sender object];
    
    if (![self.heightDic objectForKey:@"0"]||[[self.heightDic objectForKey:@"0"] floatValue] != cell.height)
    {
        [self.heightDic setObject:[NSNumber numberWithFloat:cell.height] forKey:@"0"];
        [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:6]] withRowAnimation:UITableViewRowAnimationNone];
    }
}

#pragma mark - TableViewDelegate
//点击了哪个cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        
    }
    else if (indexPath.section==1)
    {
        if (indexPath.row==1)
        {
            [self.pickerView show];
            
            __weak typeof(self) weakSelf = self;
            self.pickerView.determineBtnBlock = ^(NSString *shengId, NSString *shiId, NSString *xianId, NSString *shengName, NSString *shiName, NSString *xianName, NSString *postCode)
            {
                weakSelf.addressEditModel.province_name = shengName;
                weakSelf.addressEditModel.city_name = shiName;
                weakSelf.addressEditModel.district_name = xianName;
                weakSelf.address = [NSString stringWithFormat:@"%@%@%@",weakSelf.addressEditModel.province_name,weakSelf.addressEditModel.city_name,weakSelf.addressEditModel.district_name];
                [weakSelf.tableView reloadData];
                [weakSelf loadData3];
            };
        }
    }
}


-(NSMutableArray*)imageUrls
{
    if (_imageUrls==nil) {
        _imageUrls = [[NSMutableArray alloc]init];
    }
    return _imageUrls;
}

- (void)handleSingleTap:(UITouch *)touch
{
    
}


- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        //设置数据源，注意必须实现对应的UITableViewDataSource协议
        _tableView.dataSource=self;
        //设置代理
        _tableView.delegate=self;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        [self.view addSubview:_tableView];
        
    }
    return _tableView;
}

-(ZFDetailsPageFooterView *)footerView
{
    if (_footerView==nil)
    {
        _footerView = [[ZFDetailsPageFooterView alloc]init];
        _footerView.goodID = self.goods_id;
        _footerView.itemID = self.itemID;
        _footerView.backgroundColor = RGBColorHex(0xffffff);
        
        //UIView增加点击事件
        _footerView.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [_footerView addGestureRecognizer:singleTap];
    }
    
    return _footerView;
}


- (DXLAddressPickView *)pickerView
{
    if (!_pickerView) {
        _pickerView = [[DXLAddressPickView alloc] init];
    }
    return _pickerView;
}

-(NSMutableArray*)arr1
{
    if (_arr1==nil) {
        _arr1 = [[NSMutableArray alloc]init];
    }
    return _arr1;
}

-(NSMutableArray*)arr2
{
    if (_arr2==nil) {
        _arr2 = [[NSMutableArray alloc]init];
    }
    return _arr2;
}

-(NSMutableArray*)arr3
{
    if (_arr3==nil) {
        _arr3 = [[NSMutableArray alloc]init];
    }
    return _arr3;
}

-(ZFAddressEditModel *)addressEditModel
{
    if (_addressEditModel==nil) {
        _addressEditModel = [[ZFAddressEditModel alloc]init];
    }
    
    return _addressEditModel;
}

-(void)loadData3
{
    //调接口修改
    [SVProgressHUD showWithStatus:@"正在加载"];
    ZWeakSelf
    [http_address get_region:nil success:^(id responseObject)
     {
         [SVProgressHUD dismiss];
         weakSelf.arr1 = [ZFAddressServerModel mj_objectArrayWithKeyValuesArray:responseObject];
         
         for (int i=0; i<weakSelf.arr1.count; i++)
         {
             ZFAddressServerModel* model = [weakSelf.arr1 objectAtIndex:i];
             NSRange range = [weakSelf.addressEditModel.province_name rangeOfString:model.name];
             if (range.location != NSNotFound)
             {
                 weakSelf.addressEditModel.province = model.ID;
                 [self loadData4];
                 break;
             }
         }
         
     } failure:^(NSError *error)
     {
         
         [SVProgressHUD showErrorWithStatus:error.localizedDescription];
     }];
}

-(void)loadData4
{
    //调接口修改
    [SVProgressHUD showWithStatus:@"正在加载"];
    ZWeakSelf
    [http_address get_region:weakSelf.addressEditModel.province success:^(id responseObject)
     {
         [SVProgressHUD dismiss];
         weakSelf.arr2 = [ZFAddressServerModel mj_objectArrayWithKeyValuesArray:responseObject];
         
         for (int i=0; i<weakSelf.arr2.count; i++)
         {
             ZFAddressServerModel* model = [weakSelf.arr2 objectAtIndex:i];
             NSRange range = [weakSelf.addressEditModel.city_name rangeOfString:model.name];
             if (range.location != NSNotFound)
             {
                 weakSelf.addressEditModel.city = model.ID;
                 [self loadData5];
                 self.region_id = weakSelf.addressEditModel.city.integerValue;
                 break;
             }
         }
         
     } failure:^(NSError *error)
     {
         
         [SVProgressHUD showErrorWithStatus:error.localizedDescription];
     }];
}

-(void)loadData5
{
    //调接口修改
    [SVProgressHUD showWithStatus:@"正在加载"];
    ZWeakSelf
    [http_address get_region:weakSelf.addressEditModel.city success:^(id responseObject)
     {
         [SVProgressHUD dismiss];
         weakSelf.arr3 = [ZFAddressServerModel mj_objectArrayWithKeyValuesArray:responseObject];
         
         for (int i=0; i<weakSelf.arr3.count; i++)
         {
             ZFAddressServerModel* model = [weakSelf.arr3 objectAtIndex:i];
             NSRange range = [weakSelf.addressEditModel.district_name rangeOfString:model.name];
             if (range.location != NSNotFound)
             {
                 weakSelf.addressEditModel.district = model.ID;
                 break;
             }
         }
         
     } failure:^(NSError *error)
     {
         
         [SVProgressHUD showErrorWithStatus:error.localizedDescription];
     }];
}

- (void)loadData6{
    //获取默认地址
    [http_address address_list:^(id responseObject) {
        if (kObjectIsEmpty(responseObject))
        {
            self.address = @"请输入收货地址";
            return;
        }
        NSArray *addressArray = [ZFAddressEditModel mj_objectArrayWithKeyValuesArray:responseObject];
        
        
            ZFAddressEditModel *addressModel = addressArray[0];
            self.address = [NSString stringWithFormat:@"%@%@",addressModel.city_name,addressModel.district_name];
            self.region_id = addressModel.city.integerValue;
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
}

@end
