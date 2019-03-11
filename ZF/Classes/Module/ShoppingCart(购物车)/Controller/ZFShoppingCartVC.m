//
//  ZFShoppingCartVC.m
//  ZF
//
//  Created by apple on 27/02/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFShoppingCartVC.h"
#import "ZFShoppingCartCell.h"
#import "ZFShoppingCartView.h"
@interface ZFShoppingCartVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ZFShoppingCartVC

/*cell */
static NSString *const ZFShoppingCartTableCellID =@"ZFShoppingCartTableCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"购物车";
   
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, LL_ScreenHeight- LL_TabbarSafeBottomMargin- 88) style:UITableViewStyleGrouped];
    tableView.backgroundColor = RGBColorHex(0xf4f4f4);
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 270;
    [self.view addSubview:tableView];
    
    ZFShoppingCartView *view = [ZFShoppingCartView CartView];
    
    view.frame = CGRectMake(0,tableView.frame.size.height - LL_StatusBarAndNavigationBarHeight, LL_ScreenWidth, 55);
    [self.view addSubview:view];
    
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
