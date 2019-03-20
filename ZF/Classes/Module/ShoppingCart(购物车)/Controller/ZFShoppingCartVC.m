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
#import "ZFEmptyCartView.h"
@interface ZFShoppingCartVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak)UITableView *shoppingCart;
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
    [btn addTarget:self action:@selector(editCell:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
   //判断购物车是否为空
    if (/* DISABLES CODE */ (0)) {
        ZFEmptyCartView *emptyCart = [[ZFEmptyCartView alloc]initWithFrame:self.view.frame];
        [self.view addSubview:emptyCart];
    }else{
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, LL_ScreenHeight- LL_TabbarSafeBottomMargin- 88) style:UITableViewStyleGrouped];
        tableView.backgroundColor = RGBColorHex(0xf4f4f4);
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = 270;
        self.shoppingCart = tableView;
        [self.view addSubview:tableView];
    }
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
- (void)editCell: (UIButton *)button{
    button.selected = !button.selected;
    self.shoppingCart.editing = button.selected;
}
#pragma mark --tableview的协议
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
