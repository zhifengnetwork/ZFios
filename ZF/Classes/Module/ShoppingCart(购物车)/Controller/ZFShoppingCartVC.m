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
#import "ZFTool.h"
#import "SVProgressHUD.h"
#import "http_shopping.h"
#import "ZFGoodModel.h"
#import "MJExtension.h"

@interface ZFShoppingCartVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak)UITableView *shoppingCart;
@property (nonatomic, weak)ZFSettlementView *settleView;

@property (nonatomic, weak)ZFGoodListModel *listModel;
@end

@implementation ZFShoppingCartVC

/*cell */
static NSString *const ZFShoppingCartTableCellID =@"ZFShoppingCartTableCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setup];
}
- (void)setup{
    self.title = @"购物车";
//    self.navigationController.navigationBar.translucent  = YES; // 导航栏透明
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationController.navigationBar setBackgroundColor:RGBColorHex(0xf4f4f4)];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    //右边按钮
    UIButton * btn = [[UIButton alloc]init];
    [btn setBackgroundImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
    [btn setTitle:@"管理" forState:UIControlStateNormal];
    [btn setTitle:@"取消" forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(editCell:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    //判断购物车是否为空
//    ZFEmptyCartView *emptyCart = [[ZFEmptyCartView alloc]initWithFrame:self.view.frame];
//    [self.view addSubview:emptyCart];
//    btn.hidden = YES;
        btn.hidden = NO;
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, LL_ScreenWidth, LL_ScreenHeight- LL_TabbarSafeBottomMargin- 88) style:UITableViewStyleGrouped];
        tableView.backgroundColor = RGBColorHex(0xf4f4f4);
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = 200;
        self.shoppingCart = tableView;
    [tableView registerClass:[ZFShoppingCartCell class] forCellReuseIdentifier:ZFShoppingCartTableCellID];
        [self.view addSubview:tableView];
        
        tableView.allowsMultipleSelectionDuringEditing = YES;
        //结算界面
        self.settleView = [ZFSettlementView CartView];
        [self.view addSubview:self.settleView];
    
        [_settleView setPrice];
        [_settleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.width.mas_equalTo(LL_ScreenWidth);
            make.height.mas_equalTo(44);
            make.bottom.mas_equalTo(self.view.mas_bottom).with.offset(-48);
        }];
    
    ZWeakSelf
    [http_shopping cartlist:^(id responseObject)
     {
         [weakSelf showData:responseObject];
         
     } failure:^(NSError *error)
     {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];

    
}

-(void)showData:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    self.listModel = [ZFGoodListModel mj_objectWithKeyValues:responseObject];

}

//判断settleview的按钮状态
- (void)editCell: (UIButton *)button{
    button.selected = !button.selected;
    [self.shoppingCart setEditing:!self.shoppingCart.isEditing animated:YES];
    if (self.shoppingCart.isEditing) {
        [self.settleView setEditing];
    }else{
        [self.settleView setPrice];
    }
    
}
#pragma mark --tableview的协议
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.listModel.list.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZFShoppingCartCell *cell = [tableView dequeueReusableCellWithIdentifier:ZFShoppingCartTableCellID];
    cell.model = [self.listModel.list objectAtIndex:indexPath.section];
    return cell;
}
@end
