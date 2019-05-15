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
#import "UUPickerView.h"
#import "ZFTool.h"
#import "http_user.h"

@interface ZFPersonalDataVC ()<ZFTextInputVCDelegate,UUPickerViewDelegate>

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
            UserInfoModel* u = [UserInfoModel readUserInfo];
            pcell.name = u.user_id;
        }
        else if (indexPath.row==2) {
            pcell.title = @"名称";
            pcell.isShowTitleButton = YES;
            pcell.name = self.userInfo.nickname;
        }
        else if (indexPath.row==3) {
            pcell.title = @"性别";
            pcell.isShowTitleButton = YES;
            pcell.name = [self.userInfo getSexText];
        }
        else if (indexPath.row==4) {
            pcell.title = @"出生日期";
            pcell.isShowTitleButton = YES;
            if (self.userInfo.date_birth!=nil)
            {
                pcell.name = self.userInfo.date_birth;
            }
            else
            {
                pcell.name = [NSString stringWithFormat:@"%@-%@-%@",self.userInfo.birthyear,self.userInfo.birthmonth,self.userInfo.birthday];
            }
            
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
            vc.text = self.userInfo.nickname;
            vc.delegate = self;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row==3)
        {
            //性别
            UUPickerView* pv = [[UUPickerView alloc ]initPickerViewWithArray:@[@[@"保密",@"男", @"女"]] title:@"性别"];
            pv.delegate = self;
            pv.tag = indexPath.row;
            [pv pickerViewSelectRow:self.userInfo.sex.intValue inComponent:0];
            [pv show];
        }
        else if (indexPath.row==4)
        {
            //日期
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
            [formatter setDateFormat:@"yyyy-MM-dd"];
            NSString* str = @"1990-01-01";
            NSDate *date=[formatter dateFromString:str];
            
            UUPickerView* pv = [[UUPickerView alloc ]initDatePickerWithDate:date datePickerMode:UIDatePickerModeDate title:@"出生日期"];
            pv.delegate = self;
            pv.tag = indexPath.row;
            [pv show];
        }
    }
        
}

//如果是datePicker返回的数组第一个值是选择的时间
- (void)pickerViewClick:(UUPickerView *)pickerView rowArray:(NSArray *)rowArray
{
    if (pickerView.tag==3)
    {
        //
        NSNumber *index = [rowArray objectAtIndex:0];
        //调接口修改
        ZFUserModel* m = [[ZFUserModel alloc]init];
        m.sex = index.stringValue;
        [self edit:m];
    }
    else if (pickerView.tag==4)
    {
        //
        NSDate *date = [rowArray objectAtIndex:0];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy"];
        NSString *strDate1 = [dateFormatter stringFromDate:date];
        [dateFormatter setDateFormat:@"MM"];
        NSString *strDate2 = [dateFormatter stringFromDate:date];
        [dateFormatter setDateFormat:@"dd"];
        NSString *strDate3 = [dateFormatter stringFromDate:date];
        
        //调接口修改
        ZFUserModel* m = [[ZFUserModel alloc]init];
        m.birthyear = strDate1;
        m.birthmonth = strDate2;
        m.birthday = strDate3;
        [self edit:m];
    }
}

//点击了昵称、简介修改界面的保存
- (void)ZFTextInputVCDidSave:(NSString *)text type:(int)type
{
    if (type==1)
    {
        if (kStringIsEmpty(text))
        {
            [SVProgressHUD showInfoWithStatus:@"姓名不能为空"];
            return;
        }
        //调接口修改
        ZFUserModel* m = [[ZFUserModel alloc]init];
        m.nickname = text;
        [self edit:m];
    }
}

-(void)edit:(ZFUserModel*)m
{
    //调接口修改
    ZWeakSelf
    [SVProgressHUD showWithStatus:@"正在加载"];
    [http_home update_username:m success:^(id responseObject)
     {
         [SVProgressHUD dismiss];
         [weakSelf edit_success:responseObject];
         
     } failure:^(NSError *error)
     {
         [SVProgressHUD showErrorWithStatus:error.localizedDescription];
     }];
}

-(void)edit_success:(id)responseObject
{
    [self loadData];
//    self.userInfo = [UserInfoModel mj_objectWithKeyValues:responseObject];
//    [self.tableView reloadData];
}

#pragma mark -- 方法
- (void)changeIcon{
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    //导航栏返回
    imagePickerVc.statusBarStyle = UIStatusBarStyleDefault;
    // 导航栏改为白色
    imagePickerVc.navigationBar.barTintColor = [UIColor whiteColor];
    // 其它文字/icon颜色改为黑色
    imagePickerVc.navigationBar.tintColor = [UIColor blackColor];
    [imagePickerVc.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
    imagePickerVc.barItemTextColor = [UIColor blackColor];
    
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
    
    UIImage* image2 = [ZFTool handleImage:image ShowSize:400 FileSize:100];
    ZWeakSelf
    [SVProgressHUD showWithStatus:@"正在上传"];
    [http_home update_head_pic:image2 success:^(id responseObject)
     {
         [SVProgressHUD dismiss];
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
    NSNumber* dicstatus = [dcattributes objectForKey:@"status"];
    
    if ( dicstatus.intValue !=0 )
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
