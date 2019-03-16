//
//  ZFShoppingCartVC.m
//  ZF
//
//  Created by apple on 27/02/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFShoppingCartVC.h"
#import "ZFShoppingCartCell.h"
#import "ZFSettlementView.h"
@interface ZFShoppingCartVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ZFShoppingCartVC

/*cell */
static NSString *const ZFShoppingCartTableCellID =@"ZFShoppingCartTableCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"购物车";
    //右边按钮
    UIButton * btn = [[UIButton alloc]init];
    [btn setBackgroundImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
    [btn setTitle:@"管理" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btn sizeToFit];        
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, LL_ScreenHeight- LL_TabbarSafeBottomMargin- 88) style:UITableViewStyleGrouped];
    tableView.backgroundColor = RGBColorHex(0xf4f4f4);
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 270;
    [self.view addSubview:tableView];
    //结算界面
    ZFSettlementView *view = [ZFSettlementView CartView];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(LL_ScreenWidth);
        make.height.mas_equalTo(44);
        make.bottom.mas_equalTo(self.view.mas_bottom).with.offset(-48);
    }];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZFShoppingCartCell *cell = [tableView dequeueReusableCellWithIdentifier:ZFShoppingCartTableCellID];
    if (cell == nil) {
        cell = [ZFShoppingCartCell  ShoppingCartCell];
    }
    return cell;
}
@end
