//
//  ZFEditorialConsigneeVC.m
//  ZF
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFEditorialConsigneeVC.h"
#import "ZFEditorialHeadTableCell.h"
#import "ZFAddressTagTableCell.h"
#import "ZFDefaultAddressTableCell.h"
#import "ZFSubmissionTableCell.h"
#import "ZFTool.h"
#import "http_address.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"


@interface ZFEditorialConsigneeVC ()

@end

@implementation ZFEditorialConsigneeVC

static NSString *const ZFEditorialHeadTableCellID = @"ZFEditorialHeadTableCellID";
static NSString *const ZFAddressTagTableCellID = @"ZFAddressTagTableCellID";
static NSString *const ZFDefaultAddressTableCellID = @"ZFDefaultAddressTableCellID";
static NSString *const ZFSubmissionTableCellID = @"ZFSubmissionTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ZFTool isHiddenNavigationBarSeparatorLine:YES vc:self];
    self.title = @"编辑收货人";
    [self setupTableView];
    
    UIImage *imgRight = [UIImage imageNamed:@"delete"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[imgRight imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(deleteButtonDidClick)];
}

- (void)deleteButtonDidClick
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAippear:(BOOL)animated{
    
    [super viewWillAppear:animated];
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)setupTableView
{
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.backgroundColor = RGBTableViewBGColor;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    [self.tableView registerClass:[ZFEditorialHeadTableCell class] forCellReuseIdentifier:ZFEditorialHeadTableCellID];
    [self.tableView registerClass:[ZFAddressTagTableCell class] forCellReuseIdentifier:ZFAddressTagTableCellID];
    [self.tableView registerClass:[ZFDefaultAddressTableCell class] forCellReuseIdentifier:ZFDefaultAddressTableCellID];
    [self.tableView registerClass:[ZFSubmissionTableCell class] forCellReuseIdentifier:ZFSubmissionTableCellID];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0)
    {
        return 4;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    if (indexPath.section==0)
    {
        ZFEditorialHeadTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ZFEditorialHeadTableCellID];
        scell = [[ZFEditorialHeadTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFEditorialHeadTableCellID];
        if (indexPath.row==0) {
            scell.title = @"收货人：";
            scell.name  = self.addressEditModel.consignee;
        }
        else if (indexPath.row==1) {
            scell.title = @"手机号码：";
            scell.name  = self.addressEditModel.mobile;
        }
        else if (indexPath.row==2) {
            scell.title = @"所在地区：";
            scell.name  = [NSString stringWithFormat:@"%@%@%@",self.addressEditModel.province_name,self.addressEditModel.city_name,self.addressEditModel.district_name];
        }
        else if (indexPath.row==3) {
            scell.title = @"详细地址：";
            scell.name  = self.addressEditModel.address;
        }
        scell.indexPath = indexPath;
        scell.delegate = self;
        
        cell = scell;
    }
    else if (indexPath.section==1)
    {
        ZFAddressTagTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ZFAddressTagTableCellID];
        pcell = [[ZFAddressTagTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFAddressTagTableCellID];
    
        cell = pcell;
    }
    else if (indexPath.section==2)
    {
        ZFDefaultAddressTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ZFDefaultAddressTableCellID];
        pcell = [[ZFDefaultAddressTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFDefaultAddressTableCellID];
        
        cell = pcell;
    }
    else if (indexPath.section==3)
    {
        ZFSubmissionTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ZFSubmissionTableCellID];
        scell = [[ZFSubmissionTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFSubmissionTableCellID];
        scell.title = @"确认";
        
        cell = scell;
    }
    
    return cell;
}


//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0)
    {
        return 20;
    }
    else if (section==3)
    {
        return 20;
    }
    return 0;
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

#pragma mark - TableViewDelegate
//点击了哪个cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==3)
    {
        //确定
        [self loadData];
    }
}


//正在输入中
-(void)ZFEditorialHeadTableCellInputing:(NSString*)text indexPath:(NSIndexPath*)indexPath
{
    if (indexPath.row==0) {
        self.addressEditModel.consignee = text;
    }
    else if (indexPath.row==1) {
        self.addressEditModel.mobile = text;
    }
    else if (indexPath.row==2) {
        
    }
    else if (indexPath.row==3) {
        self.addressEditModel.address = text;
    }
}


-(void)loadData
{
    ZWeakSelf
    [http_address edit_address:self.addressEditModel.address_id.intValue consignee:self.addressEditModel.consignee mobile:self.addressEditModel.mobile province:self.addressEditModel.province.intValue city:self.addressEditModel.city.intValue district:self.addressEditModel.district.intValue address:self.addressEditModel.address addressModel:self.addressEditModel success:^(id responseObject)
     {
         [weakSelf showData:responseObject];
     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)showData:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}



@end
