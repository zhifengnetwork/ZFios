//
//  ZFFootprintVC.m
//  ZF
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFFootprintVC.h"
#import "ZFTool.h"
#import "ZFTimeHeadView.h"
#import "ZFRecordDetailsTableCell.h"
#import "ZFDetailsChoiceVC.h"
#import "http_mine.h"
#import "SVProgressHUD.h"
#import "RefreshGifHeader.h"
#import "MJExtension.h"
#import "ZFAssembleModel.h"


@interface ZFFootprintVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong)ZFFootPrintListModel *listModel;

@end

@implementation ZFFootprintVC

static NSString *const ZFRecordDetailsTableCellID = @"ZFRecordDetailsTableCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [ZFTool isHiddenNavigationBarSeparatorLine:YES vc:self];
    self.title = @"浏览记录";
    self.view.backgroundColor = TableViewBGColor;
    [self setupTableView];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 50, 27);
    rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
    UIView *rightCustomView = [[UIView alloc] initWithFrame:rightButton.frame];
    [rightCustomView addSubview:rightButton];
    [rightButton setTitle:@"编辑" forState:UIControlStateNormal];
    [rightButton setBackgroundColor:RGBColorHex(0xff0000)];
    rightButton.layer.cornerRadius = 3.0f;
    rightButton.clipsToBounds = YES;
    [rightButton addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightCustomView];
    ZWeakSelf
    self.tableView.mj_header = [RefreshGifHeader headerWithRefreshingBlock:^{
        
        [weakSelf loadData];
    }];
    [self.tableView.mj_header beginRefreshing];
}


-(void)loadData
{
    ZWeakSelf
    [http_mine visit_log:^(id responseObject)
     {
         [self.tableView.mj_header endRefreshing];
         [weakSelf showData:responseObject];
     } failure:^(NSError *error) {
         [self.tableView.mj_header endRefreshing];
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)showData:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    self.listModel = [ZFFootPrintListModel mj_objectWithKeyValues:responseObject];
    
    [self.tableView reloadData];
}

- (void)rightButtonClick
{
    ZFDetailsChoiceVC* vc = [[ZFDetailsChoiceVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupTableView
{
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 10;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.backgroundColor = RGBColorHex(0xf3f5f7);
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerClass:[ZFRecordDetailsTableCell class] forCellReuseIdentifier:ZFRecordDetailsTableCellID];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.listModel.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    ZFRecordDetailsTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ZFRecordDetailsTableCellID];
    scell = [[ZFRecordDetailsTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFRecordDetailsTableCellID];
    ZFAssembleModel *detailModel = [self.listModel.data objectAtIndex:indexPath.row];
    scell.detailModel = detailModel;
    
    cell = scell;
    
    return cell;
}

//哪个分组显示哪个View
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    ZFTimeHeadView* view = [[ZFTimeHeadView alloc]init];
    ZFAssembleModel *model = [self.listModel.data objectAtIndex:section];
    view.date = model.date;
    return view;
}


//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

#pragma mark - TableViewDelegate
//点击了哪个cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        //        ZFPersonalDataVC* vc = [[ZFPersonalDataVC alloc]init];
        //        [self.navigationController pushViewController:vc animated:YES];
    }
}


//我的底部footview被点击 1:全选 2:删除
- (void)ZFFootprintFooterViewDidClick:(int)type
{
    if (type==1)
    {
//        //跳转到个人资料
//        ZFPersonalVC* vc = [[ZFPersonalVC alloc]init];
//        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (type==2)
    {
        
    }
    
}

- (UITableView *)tableView
{
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
