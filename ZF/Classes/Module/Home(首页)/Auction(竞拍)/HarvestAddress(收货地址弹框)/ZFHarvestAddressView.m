//
//  ZFHarvestAddressView.m
//  ZF
//
//  Created by apple on 2019/3/7.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFHarvestAddressView.h"
#import "TYShowAlertView.h"
#import "UIView+TYAlertView.h"
#import "ZFHarvestAddressTableCell.h"
#import "ZFAgreeTableCell.h"
#import "ZFSubmitTableCell.h"

@interface ZFHarvestAddressView()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ZFHarvestAddressView

static NSString *const ZFHarvestAddressTableCellID = @"ZFHarvestAddressTableCellID";
static NSString *const ZFAgreeTableCellID = @"ZFAgreeTableCellID";
static NSString *const ZFSubmitTableCellID = @"ZFSubmitTableCellID";


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
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(LL_ScreenWidth);
        make.height.mas_equalTo(self.frame.size.height);
    }];
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xcccccc);
    [self addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.mas_equalTo(0);
         make.right.mas_equalTo(-0);
         make.top.mas_equalTo(45);
         make.height.mas_equalTo(0.5f);
     }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.right.bottom.equalTo(self);
         make.top.equalTo(hLineView.mas_bottom);
     }];

    self.tableView.backgroundColor = RGBColorHex(0xffffff);
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerClass:[ZFHarvestAddressTableCell class] forCellReuseIdentifier:ZFHarvestAddressTableCellID];
    [self.tableView registerClass:[ZFAgreeTableCell class] forCellReuseIdentifier:ZFAgreeTableCellID];
    [self.tableView registerClass:[ZFSubmitTableCell class] forCellReuseIdentifier:ZFSubmitTableCellID];
}



#pragma mark - Table view data source
//有多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

//每个组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0)
    {
        return 5;
    }
    return 1;
}

//每行使用的Cell是什么
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    if (indexPath.section==0)
    {
        ZFHarvestAddressTableCell* scell = [tableView dequeueReusableCellWithIdentifier:ZFHarvestAddressTableCellID];
        scell = [[ZFHarvestAddressTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFHarvestAddressTableCellID];
        if (indexPath.row==0) {
            scell.name = @"收货地址";
            scell.title = @"请添加收货地址";
        }
        else if (indexPath.row==1) {
            scell.name = @"配送";
            scell.title = @"第三方快递";
        }
        else if (indexPath.row==2) {
            scell.name = @"优惠券";
            scell.title = @"暂无可用";
        }
        else if (indexPath.row==3) {
            scell.name = @"红包";
            scell.title = @"暂无可用";
        }
        else if (indexPath.row==4) {
            scell.name = @"应付总额";
            scell.title = @"¥ 79";
        }
        cell = scell;
    }
    else if (indexPath.section==1)
    {
        ZFAgreeTableCell* pcell = [tableView dequeueReusableCellWithIdentifier:ZFAgreeTableCellID];
        pcell = [[ZFAgreeTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFAgreeTableCellID];
        
        cell = pcell;
    }
    else if (indexPath.section==2)
    {
        ZFSubmitTableCell* acell = [tableView dequeueReusableCellWithIdentifier:ZFSubmitTableCellID];
        acell = [[ZFSubmitTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ZFSubmitTableCellID];
        
        cell = acell;
    }
    
    return cell;
}

//每行的高度是多少
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
