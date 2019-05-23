//
//  ZFPersonalVC.m
//  ZF
//
//  Created by apple on 2019/3/11.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFPersonalVC.h"
#import "ZFPersonalHeadTableCell.h"
#import "ZFPersonalCentralTableCell.h"
#import "ZFSubmissionTableCell.h"
#import "ZFPersonalDataVC.h"
#import "ZFAddressManagementVC.h"
#import "AppDelegate.h"
#import "UserInfoModel.h"
#import "http_user.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "ZFChangePasswordVC.h"
#import "ZFPaymentPasswordVC.h"


@interface ZFPersonalVC ()

@end

@implementation ZFPersonalVC

static NSString *const ZFPersonalHeadTableCellID = @"ZFPersonalHeadTableCellID";
static NSString *const ZFPersonalCentralTableCellID = @"ZFPersonalCentralTableCellID";
static NSString *const ZFSubmissionTableCellID = @"ZFSubmissionTableCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [ZFTool isHiddenNavigationBarSeparatorLine:YES vc:self];
    self.title = @"个人资料";
    [self setupTableView];
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
    [self loadData];
}

-(void)loadData
{
    ZWeakSelf
    [http_user userinfo:^(id responseObject)
     {
         [weakSelf loadData_ok:responseObject];
         
     } failure:^(NSError *error) {
         
         [SVProgressHUD showInfoWithStatus:error.domain];
     }];
}

//加载数据完成
-(void)loadData_ok:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    //jsonToModel
    self.userInfo = [UserInfoModel mj_objectWithKeyValues:responseObject];
    
    [self.tableView reloadData];
    
}


- (void)setupTableView
{
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.backgroundColor = RGBTableViewBGColor;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.alwaysBounceVertical=NO;
    
    [self.tableView registerClass:[ZFPersonalHeadTableCell class] forCellReuseIdentifier:ZFPersonalHeadTableCellID];
    [self.tableView registerClass:[ZFPersonalCentralTableCell class] forCellReuseIdentifier:ZFPersonalCentralTableCellID];
    [self.tableView registerClass:[ZFSubmissionTableCell class] forCellReuseIdentifier:ZFSubmissionTableCellID];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==1)
    {
        return 3;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    if (indexPath.section==0)
    {
        ZFPersonalHeadTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ZFPersonalHeadTableCellID];
        scell = [[ZFPersonalHeadTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFPersonalHeadTableCellID];
        scell.userInfo = self.userInfo;
        
        cell = scell;
    }
    else if (indexPath.section==1)
    {
        ZFPersonalCentralTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ZFPersonalCentralTableCellID];
        pcell = [[ZFPersonalCentralTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFPersonalCentralTableCellID];
        if (indexPath.row==0) {
            pcell.title = @"地址管理";
            pcell.roundTop = YES;
        }
        else if (indexPath.row==1) {
            pcell.title = @"修改密码";
        }
        else if (indexPath.row==2) {
            pcell.title = @"支付密码";
        }
        
        cell = pcell;
    }
    else if (indexPath.section==2)
    {
        ZFSubmissionTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ZFSubmissionTableCellID];
        scell = [[ZFSubmissionTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFSubmissionTableCellID];
        scell.title = @"退出登录";
        
        cell = scell;
    }
    
    return cell;
}


//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        return 80;
    }
    else if (indexPath.section==2)
    {
        return 60;
    }
    
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==2) {
        return 0;
    }
    return 20;
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
    if (indexPath.section==0)
    {
        ZFPersonalDataVC* vc = [[ZFPersonalDataVC alloc]init];
        vc.userInfo = self.userInfo;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.section==1)
    {
        if (indexPath.row==0) {
            ZFAddressManagementVC* vc = [[ZFAddressManagementVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row==1)
        {
            ZFChangePasswordVC* vc = [[ZFChangePasswordVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row==2)
        {
            ZFPaymentPasswordVC* vc = [[ZFPaymentPasswordVC alloc]init];
            vc.userInfo = self.userInfo;
            [self.navigationController pushViewController:vc animated:YES];
        }
        
    }
    else if (indexPath.section==2)
    {
        ZWeakSelf;
        NSString* message = [NSString stringWithFormat:@"确定退出软件？"];
        UIAlertController *alert =
        [UIAlertController alertControllerWithTitle:nil
                                            message:message
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action1 =
        [UIAlertAction actionWithTitle:@"取消"
                                 style:UIAlertActionStyleDefault
                               handler:nil];
        
        [alert addAction:action1];
        
        UIAlertAction *action =
        [UIAlertAction actionWithTitle:@"确定"
                                 style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * _Nonnull action) {
                                   
                                   [weakSelf toExit];
                               }];
        
        [alert addAction:action];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}



-(void)toExit
{
    //归档清空
    [UserInfoModel removeUserInfo];
    AppDelegate* app = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [app to_LoginVC];
}



@end
