//
//  ZFMenu.m
//  ZF
//
//  Created by weiming zhang on 2019/3/13.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFMenu.h"

@interface ZFMenu ()

@end

@implementation ZFMenu

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}
- (void)setTabColor:(UIColor *)tabColor{
    _tabColor = tabColor;
    self.tableView.backgroundColor = tabColor;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,99, 22)];
    tableView.showsVerticalScrollIndicator = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    tableView.rowHeight = 22;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"zfmenualert"];
    [self addSubview:tableView];
    
}
- (void)setArrMDataSource:(NSArray *)arrMDataSource{
    _arrMDataSource = arrMDataSource;
    [self.tableView reloadData];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.didSelectedCallback) {
        self.didSelectedCallback(indexPath.row, _arrMDataSource[indexPath.row]);
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrMDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zfmenualert" forIndexPath:indexPath];
    cell.textLabel.text = _arrMDataSource[indexPath.row];
    cell.textLabel.textColor =_txtColor ? _txtColor :RGBColor(102, 102, 102);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.contentView.backgroundColor = RGBColor(249, 249, 249);
    cell.textLabel.backgroundColor = RGBColor(102, 102, 102);
    cell.textLabel.font = _cusFont ? _cusFont :[UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    return cell;
}

@end
