//
//  ZFClusterWindowView.m
//  ZF
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFClusterWindowView.h"
#import "TYShowAlertView.h"
#import "UIView+TYAlertView.h"
#import "ZFClusterWindowTableCell.h"
#import "ZFSpellNumberTableCell.h"
#import "ZFAssembleModel.h"

@interface ZFClusterWindowView()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UIButton* closeButton;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ZFClusterWindowView

static NSString *const ZFClusterWindowTableCellID = @"ZFClusterWindowTableCellID";
static NSString *const ZFSpellNumberTableCellID = @"ZFSpellNumberTableCellID";


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        [self setup];
    }
    return self;
}


- (void)setup
{
    [self addSubview:self.titleLabel];
    [self addSubview:self.closeButton];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.centerX.equalTo(self);
    }];
    
    [self.closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_titleLabel.mas_bottom).offset(8);
        make.left.right.bottom.equalTo(self);
    }];
    
    self.tableView.backgroundColor = TableViewBGColor;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerClass:[ZFClusterWindowTableCell class] forCellReuseIdentifier:ZFClusterWindowTableCellID];
    [self.tableView registerClass:[ZFSpellNumberTableCell class] forCellReuseIdentifier:ZFSpellNumberTableCellID];
}

- (void)setTeamArray:(NSArray *)teamArray{
    _teamArray = teamArray;
    [self.tableView reloadData];
}


#pragma mark - Table view data source
//有多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

//每个组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0)
    {
        return self.teamArray.count;
    }
    return 1;
}

//每行使用的Cell是什么
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        ZFClusterWindowTableCell* cell = [tableView dequeueReusableCellWithIdentifier:ZFClusterWindowTableCellID];
        if (cell == nil)
        {
            cell = [[ZFClusterWindowTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFClusterWindowTableCellID];
        }
        ZFTeamFoundModel *foundModel = [self.teamArray objectAtIndex:indexPath.row];
        cell.team_id = self.team_id;
        cell.goodID = self.goodID;
        cell.foundModel = foundModel;
        return cell;
    }
    else if (indexPath.section==1)
    {
        ZFSpellNumberTableCell* cell = [tableView dequeueReusableCellWithIdentifier:ZFSpellNumberTableCellID];
        if (cell == nil)
        {
            cell = [[ZFSpellNumberTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFSpellNumberTableCellID];
        }
        cell.number = self.teamArray.count;
        return cell;
    }
    
    return nil;
}

//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


- (void)closeButtonDidClick
{
    // hide view,or dismiss controller
    [self hideView];
}


- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColorHex(0x151515);
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.text = @"正在拼单";
    }
    return _titleLabel;
}

- (UIButton *)closeButton {
    if (_closeButton == nil) {
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeButton setImage:[UIImage imageNamed:@"chacha"] forState:UIControlStateNormal];
        [_closeButton addTarget:self action:@selector(closeButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeButton;
}


- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain];
        //设置数据源，注意必须实现对应的UITableViewDataSource协议
        _tableView.dataSource=self;
        //设置代理
        _tableView.delegate=self;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        [self addSubview:_tableView];
    }
    return _tableView;
}

@end

