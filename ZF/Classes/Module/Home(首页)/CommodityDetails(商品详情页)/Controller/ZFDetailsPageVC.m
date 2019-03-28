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


@interface ZFDetailsPageVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) ZFCommDetHeadView *headView;
@property (nonatomic, strong) ZFDetailsPageFooterView *footerView;

@property (nonatomic, strong) UIImage *AvatarImage;
@property (nonatomic, assign) BOOL isUploadAvatar;

@property (strong , nonatomic)NSMutableArray *imageUrls;

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


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ZFTool isHiddenNavigationBarSeparatorLine:YES vc:self];
    self.title = @"";
    self.view.backgroundColor = TableViewBGColor;
    [self setupUI];
    [self setupTableView];
    
    UIImage *imgRight = [UIImage imageNamed:@"share"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[imgRight imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(shareButtonDidClick)];
    
}

-(void)shareButtonDidClick
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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


-(void)showData:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
}

-(void)setupUI
{
    _headView = [[ZFCommDetHeadView alloc] initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 375)];
    _headView.imageUrls = self.imageUrls;
    self.tableView.tableHeaderView = _headView;
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
        make.bottom.equalTo(self->_footerView.mas_top);
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
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==1)
    {
        return 2;
    }
    else if (section==9)
    {
        return 5;
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
        //        dcell.delegate = self;
        cell = dcell;
    }
    else if (indexPath.section==1)
    {
        ZFDeliveryTableCell* ocell  = [tableView dequeueReusableCellWithIdentifier:ZFDeliveryTableCelllD];
        ocell = [[ZFDeliveryTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFDeliveryTableCelllD];
        if (indexPath.row==0)
        {
            ocell.name = @"配送";
            ocell.title = @"至 广州荔湾区";
        }
        else if (indexPath.row==1)
        {
            ocell.name = @"运费";
            ocell.title = @"免运费";
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
        ZFevaluationHeadTableCell* qcell = [tableView dequeueReusableCellWithIdentifier:ZFevaluationHeadTableCelllD];
        qcell = [[ZFevaluationHeadTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFevaluationHeadTableCelllD];
        cell = qcell;
    }
    else if (indexPath.section==4)
    {
        ZFCommodityEvaluationTableCell* acell = [tableView dequeueReusableCellWithIdentifier:ZFCommodityEvaluationTableCelllD];
        acell = [[ZFCommodityEvaluationTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFCommodityEvaluationTableCelllD];
        cell = acell;
    }
    else if (indexPath.section==5)
    {
        ZFAskEveryoneHeadTableCell* ncell = [tableView dequeueReusableCellWithIdentifier:ZFAskEveryoneHeadTableCelllD];
        ncell = [[ZFAskEveryoneHeadTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFAskEveryoneHeadTableCelllD];
        cell = ncell;
    }
    else if (indexPath.section==6)
    {
        ZFAskEveryoneTableCell* vcell = [tableView dequeueReusableCellWithIdentifier:ZFAskEveryoneTableCelllD];
        vcell = [[ZFAskEveryoneTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFAskEveryoneTableCelllD];
        cell = vcell;
    }
    else if (indexPath.section==7)
    {
        ZFMerchandiseSaleHeadTableCell* vcell = [tableView dequeueReusableCellWithIdentifier:ZFMerchandiseSaleHeadTableCelllD];
        vcell = [[ZFMerchandiseSaleHeadTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFMerchandiseSaleHeadTableCelllD];
        cell = vcell;
    }
    else if (indexPath.section==8)
    {
        ZFSimilarRecommendTableCell* vcell = [tableView dequeueReusableCellWithIdentifier:ZFSimilarRecommendTableCelllD];
        vcell = [[ZFSimilarRecommendTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFSimilarRecommendTableCelllD];
        cell = vcell;
    }
    else if (indexPath.section==9)
    {
        ZFDetailsImageTextTableCell* vcell = [tableView dequeueReusableCellWithIdentifier:ZFDetailsImageTextTableCelllD];
        vcell = [[ZFDetailsImageTextTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFDetailsImageTextTableCelllD];
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
    else if (indexPath.section==4)
    {
        return 130;
    }
    else if (indexPath.section==7)
    {
        return 265;
    }
    else if (indexPath.section==8)
    {
        return 385;
    }
    return 35;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==3) {
        return 20;
    }
    else if (section==7) {
        return 20;
    }
    else if (section==8) {
        return 20;
    }
    else if (section==9) {
        return 130;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==8)
    {
        return 20;
    }
    else if (section==9)
    {
        return 35;
    }
    
    return 0;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==9)
    {
        ZFDetailsImageTextHeadView* headView = [[ZFDetailsImageTextHeadView alloc]init];
        return headView;
    }
    UIView* view = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section==9)
    {
        ZFDetailsImageTextFootView* footView = [[ZFDetailsImageTextFootView alloc]init];
        return footView;
    }
    
    UIView* view = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}


#pragma mark - TableViewDelegate
//点击了哪个cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        
    }
}


-(NSMutableArray*)imageUrls
{
    if (_imageUrls==nil) {
        _imageUrls = [[NSMutableArray alloc]init];
        [_imageUrls addObject:@"http://gfs5.gomein.net.cn/T1obZ_BmLT1RCvBVdK.jpg"];
        [_imageUrls addObject:@"http://gfs9.gomein.net.cn/T1C3J_B5LT1RCvBVdK.jpg"];
        [_imageUrls addObject:@"http://gfs5.gomein.net.cn/T1CwYjBCCT1RCvBVdK.jpg"];
        [_imageUrls addObject:@"http://gfs7.gomein.net.cn/T1u8V_B4ET1RCvBVdK.jpg"];
        [_imageUrls addObject:@"http://gfs7.gomein.net.cn/T1zODgB5CT1RCvBVdK.jpg"];
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
        _footerView.backgroundColor = RGBColorHex(0xffffff);
        
        //UIView增加点击事件
        _footerView.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [_footerView addGestureRecognizer:singleTap];
    }
    
    return _footerView;
}


@end
