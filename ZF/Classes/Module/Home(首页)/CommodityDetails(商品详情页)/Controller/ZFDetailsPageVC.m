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


@interface ZFDetailsPageVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) ZFCommDetHeadView *headView;

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
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 8;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==1)
    {
        return 2;
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
    return 0;
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



@end
