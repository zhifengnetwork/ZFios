//
//  ZFEndSpikeVC.m
//  ZF
//
//  Created by apple on 2019/3/7.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFEndSpikeVC.h"
#import "ZFSecondkillMerTableCell.h"
#import "ZFSpikeFooterView.h"
#import "ZFEndSpikeHeadView.h"


@interface ZFEndSpikeVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) ZFSpikeFooterView *footerView;
@property (nonatomic, strong) ZFEndSpikeHeadView *headView;

@property (nonatomic, strong) UIImage *AvatarImage;
@property (nonatomic, assign) BOOL isUploadAvatar;

@property (strong , nonatomic)NSMutableArray *imageUrls;

@end

@implementation ZFEndSpikeVC

static NSString *const ZFSecondkillMerTableCelllD = @"ZFSecondkillMerTableCelllD";


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"";
    self.view.backgroundColor = TableViewBGColor;
    [self setupUI];
    [self setupTableView];
    
    // Do any additional setup after loading the view.
//    [self loadData];
}

-(void)editButtonDidClick
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
//
//    self.communityInformationModel = [LKCommunityInformationModel mj_objectWithKeyValues:responseObject];
//
//    self.title = self.communityInformationModel.association_name;
//    [self.tableView reloadData];
//
//    if (!self.communityInformationModel.is_master_flag
//        && !self.communityInformationModel.is_admin_flag
//        && !self.communityInformationModel.isMemberFlag)
//    {
//        self.footerView.name = @"立即购买";
//        //不允许或者已经发送过请求加入就变灰色
//        if (self.communityInformationModel.is_vertify==0
//            || self.communityInformationModel.isApply==YES)
//        {
//            self.footerView.userInteractionEnabled = NO;
//            self.footerView.backgroundColor = RGBColorHex(0xb7d7f8);
//        }
//    }
//    else
//    {
//        self.footerView.name = @"已抢光";
//    }
}

-(void)setupUI
{
    _headView = [[ZFEndSpikeHeadView alloc] initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 435)];
    _headView.imageUrls = self.imageUrls;
    self.tableView.tableHeaderView = _headView;
}


- (void)setupTableView
{
    [self.view addSubview:self.footerView];
    [_footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(40);
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
    [self.tableView registerClass:[ZFSecondkillMerTableCell class] forCellReuseIdentifier:ZFSecondkillMerTableCelllD];
   
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
        ZFSecondkillMerTableCell* dcell = [tableView dequeueReusableCellWithIdentifier:ZFSecondkillMerTableCelllD];
        dcell = [[ZFSecondkillMerTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFSecondkillMerTableCelllD];
//        dcell.delegate = self;
        cell = dcell;
    }
    
    return cell;
}

//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 170.0f;
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


-(ZFSpikeFooterView *)footerView
{
    if (_footerView==nil)
    {
        _footerView = [[ZFSpikeFooterView alloc]init];
        _footerView.name = @"立即购买";
        _footerView.backgroundColor = RGBColorHex(0xff5722);
        
        //UIView增加点击事件
        _footerView.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [_footerView addGestureRecognizer:singleTap];
    }
    
    return _footerView;
}



@end
