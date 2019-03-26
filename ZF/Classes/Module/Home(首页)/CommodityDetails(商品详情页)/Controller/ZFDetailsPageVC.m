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


@interface ZFDetailsPageVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) ZFCommDetHeadView *headView;

@property (nonatomic, strong) UIImage *AvatarImage;
@property (nonatomic, assign) BOOL isUploadAvatar;

@property (strong , nonatomic)NSMutableArray *imageUrls;

@end

@implementation ZFDetailsPageVC

static NSString *const ZFDetCommInformationTableCelllD = @"ZFDetCommInformationTableCelllD";


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
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
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
    
    return cell;
}

//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
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
