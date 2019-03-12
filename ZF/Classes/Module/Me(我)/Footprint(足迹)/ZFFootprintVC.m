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
#import "ZFFootprintFooterView.h"


@interface ZFFootprintVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ZFFootprintFooterView *footerView;

@end

@implementation ZFFootprintVC

static NSString *const ZFRecordDetailsTableCellID = @"ZFRecordDetailsTableCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[ZFTool isHiddenNavigationBarSeparatorLine:YES vc:self];
    self.title = @"浏览记录";
    self.view.backgroundColor = TableViewBGColor;
    [self setupTableView];
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
    
    [self.tableView registerClass:[ZFRecordDetailsTableCell class] forCellReuseIdentifier:ZFRecordDetailsTableCellID];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
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
    
    cell = scell;
    
    return cell;
}

//哪个分组显示哪个View
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    ZFTimeHeadView* view = [[ZFTimeHeadView alloc]init];
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
    }
    
    return _footerView;
}


@end
