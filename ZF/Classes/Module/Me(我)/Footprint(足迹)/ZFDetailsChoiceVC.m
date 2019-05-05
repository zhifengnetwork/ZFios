//
//  ZFDetailsChoiceVC.m
//  ZF
//
//  Created by admin on 2019/3/14.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDetailsChoiceVC.h"
#import "ZFTool.h"
#import "ZFTimeHeadView.h"
#import "ZFDetailsChoiceTableCell.h"
#import "ZFFootprintFooterView.h"
#import "ZFGoodModel.h"
#import "http_mine.h"
#import "RefreshGifHeader.h"
#import "MJExtension.h"
#import "SVProgressHUD.h"

@interface ZFDetailsChoiceVC ()<UITableViewDelegate,UITableViewDataSource,ZFFootprintFooterViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ZFFootprintFooterView *footerView;

@property (nonatomic, strong)  NSMutableArray * datas;

@end

@implementation ZFDetailsChoiceVC

static NSString *const ZFDetailsChoiceTableCellID = @"ZFDetailsChoiceTableCellID";

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
    [rightButton setTitle:@"完成" forState:UIControlStateNormal];
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
    
    self.datas = [ZFGoodModel mj_objectArrayWithKeyValuesArray:responseObject];
    
    [self.tableView reloadData];
}

- (void)rightButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupTableView
{
    [self.view addSubview:self.footerView];
    [_footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.bottom.equalTo(self->_footerView.mas_top);
    }];
    
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 10;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.backgroundColor = RGBColorHex(0xf3f5f7);
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerClass:[ZFDetailsChoiceTableCell class] forCellReuseIdentifier:ZFDetailsChoiceTableCellID];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    ZFDetailsChoiceTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ZFDetailsChoiceTableCellID];
    scell = [[ZFDetailsChoiceTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFDetailsChoiceTableCellID];
    ZFGoodModel *detailModel = [self.datas objectAtIndex:indexPath.section];
    scell.detailModel = detailModel;
    cell = scell;
    
    return cell;
}

//哪个分组显示哪个View
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    ZFTimeHeadView* view = [[ZFTimeHeadView alloc]init];
    ZFGoodModel *model = [self.datas objectAtIndex:section];
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
    ZFDetailsChoiceTableCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell selectionButtonDidClick];
}


//我的底部footview被点击 1:全选 2:删除
- (void)ZFFootprintFooterViewDidClick:(int)type
{
    if (type==1)
    {
        NSInteger i =0;
        for (i=0; i<self.datas.count; i++) {
            ZFGoodModel * model = self.datas[i];
            model.selected = YES;
            [self.tableView reloadData];
        }
        
       
    }
    else if (type==2)
    {
        
        NSInteger i =0;
        //判断是否全选
        NSInteger type = 0;
        for (i=0; i<self.datas.count; i++) {
            ZFGoodModel * model = self.datas[i];
            if (model.selected == NO) {
                type = 0;//有一个未选中
            }else{
                type = 1;//全选
            }
        }
            //清空
        if (type == 1) {
            [http_mine clear_visit_log:^(id responseObject)
             {
                 [SVProgressHUD showSuccessWithStatus:@"清空成功"];
                 
             } failure:^(NSError *error) {
                 [SVProgressHUD showErrorWithStatus:error.domain];
             }];
        }else{
            //未全选，所以一个一个删除
        for (ZFGoodModel *model in self.datas) {
            if (model.selected == YES) {
                
                [http_mine del_visit_log:model.visit_id success:^(id responseObject)
                 {
                     [SVProgressHUD showSuccessWithStatus:@"删除成功"];
                     
                 } failure:^(NSError *error) {
                     [SVProgressHUD showErrorWithStatus:error.domain];
                 }];
                }
            }
        }
    [self.tableView reloadData];
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

-(ZFFootprintFooterView *)footerView
{
    if (_footerView==nil)
    {
        _footerView = [[ZFFootprintFooterView alloc]init];
        _footerView.delegate = self;
    }
    
    return _footerView;
}


@end
