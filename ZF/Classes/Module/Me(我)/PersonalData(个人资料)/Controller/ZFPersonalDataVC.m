//
//  ZFPersonalDataVC.m
//  ZF
//
//  Created by apple on 2019/3/11.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFPersonalDataVC.h"
#import "ZFPersonalCentralTableCell.h"
#import "ZFTextInputVC.h"
#import "TZImagePickerController.h"
#import "http_home.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"

@interface ZFPersonalDataVC ()

@end

@implementation ZFPersonalDataVC

static NSString *const ZFPersonalCentralTableCellID = @"ZFPersonalCentralTableCellID";


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
    
    [self.tableView registerClass:[ZFPersonalCentralTableCell class] forCellReuseIdentifier:ZFPersonalCentralTableCellID];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    if (indexPath.section==0)
    {
        ZFPersonalCentralTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ZFPersonalCentralTableCellID];
        pcell = [[ZFPersonalCentralTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFPersonalCentralTableCellID];
        if (indexPath.row==0) {
            pcell.title = @"头像";
            pcell.isShowButton = YES;
            pcell.roundTop = YES;
            pcell.userInfo = self.userInfo;
        }
        else if (indexPath.row==1) {
            pcell.title = @"用户名";
            pcell.isShowTitleButton = YES;
            pcell.isShowNextButton = NO;
            pcell.name = @"12446655";
        }
        else if (indexPath.row==2) {
            pcell.title = @"名称";
            pcell.isShowTitleButton = YES;
            pcell.name = self.userInfo.nickname;
        }
        else if (indexPath.row==3) {
            pcell.title = @"性别";
            pcell.isShowTitleButton = YES;
            pcell.name = @"保密";
        }
        else if (indexPath.row==4) {
            pcell.title = @"出生日期";
            pcell.isShowTitleButton = YES;
            pcell.name = @"2018-3-2";
            pcell.roundBottom = YES;
        }
        
        cell = pcell;
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
        if (indexPath.row==0) {
            [self changeIcon];
        }
        else if (indexPath.row==2) {
            ZFTextInputVC* vc = [[ZFTextInputVC alloc]init];
            vc.type = 1;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
        
}

#pragma mark -- 方法
- (void)changeIcon{
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    ZWeakSelf
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto)
     {
         [weakSelf saveClick:[photos firstObject]];
     }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}

- (void)saveClick:(UIImage*)image{
    
    ZWeakSelf
    [http_home update_head_pic:image success:^(id responseObject)
     {
         [weakSelf face_ok:responseObject];
     } failure:^(NSError *error)
     {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)face_ok:(id)responseObject
{
    //解析需要的数据
    NSError *error = nil;
    NSDictionary *dcattributes = nil;
    //判断是否需要转换
    if (![responseObject isKindOfClass:[NSDictionary class]])
    {
        dcattributes =[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
    }
    else
    {
        dcattributes = responseObject;
    }
    
    id dicdata = [dcattributes objectForKey:@"data"];
    id dicstatus = [dcattributes objectForKey:@"status"];
    
    if ( dicstatus!=0 )
    {
        if (dicdata!=nil)
        {
            [SVProgressHUD showErrorWithStatus:dicdata];
        }
        else
        {
            [SVProgressHUD showErrorWithStatus:@"上传失败"];
        }
        return;
    }
    
    NSString* str = dicdata;
    self.userInfo.head_pic = str;
    [self.tableView reloadData];
}


@end
