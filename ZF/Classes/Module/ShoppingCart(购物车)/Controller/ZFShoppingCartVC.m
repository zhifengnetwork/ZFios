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
#import "MJExtension.h"
#import "SVProgressHUD.h"
#import "http_shopping.h"
#import "ZFGoodModel.h"
#import "RefreshGifHeader.h"

@interface ZFShoppingCartVC ()<UITableViewDelegate,UITableViewDataSource,ZFShoppingCartCellDelegate,ZFSettlementViewDelegate>
@property (nonatomic, weak)UITableView *shoppingCart;
@property (nonatomic, weak)ZFSettlementView *settleView;
@property (nonatomic, weak)UIButton *managementButton;
@property (nonatomic, strong)ZFEmptyCartView *emptyCart;
@property (nonatomic, strong)ZFListModel *listModel;

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
    btn.hidden = NO;
    self.managementButton = btn;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, LL_ScreenWidth, LL_ScreenHeight- LL_TabbarSafeBottomMargin- 88) style:UITableViewStyleGrouped];
    tableView.backgroundColor = RGBColorHex(0xf4f4f4);
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 120;
    self.shoppingCart = tableView;
    [tableView registerClass:[ZFShoppingCartCell class]forCellReuseIdentifier:ZFShoppingCartTableCellID];
    [self.view addSubview:tableView];
    
    tableView.allowsMultipleSelectionDuringEditing = YES;
    //结算界面
    self.settleView = [ZFSettlementView CartView];
    [self.view addSubview:self.settleView];
    _settleView.delegate = self;
    [_settleView setSettleMent];
    [_settleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(LL_ScreenWidth);
        make.height.mas_equalTo(44);
        make.bottom.mas_equalTo(self.view.mas_bottom).with.offset(-48);
    }];
    
    self.shoppingCart.mj_header = [RefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    
    [self.shoppingCart.mj_header beginRefreshing];
    
    _emptyCart = [[ZFEmptyCartView alloc]initWithFrame:self.view.frame];
    [self.shoppingCart addSubview:_emptyCart];
    _emptyCart.hidden = YES;
    
}

- (void)reloadTableView{
    [self loadData];
}

- (void)loadData{
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
    
    self.listModel = [ZFListModel mj_objectWithKeyValues:responseObject];
    self.settleView.settleModel = self.listModel;
    [self.shoppingCart reloadData];
    [self.shoppingCart.mj_header endRefreshing];
}

//判断settleview的按钮状态
- (void)editCell: (UIButton *)button{
    button.selected = !button.selected;
    [self.shoppingCart setEditing:!self.shoppingCart.isEditing animated:YES];
    if (self.shoppingCart.isEditing) {
        [self.settleView setEditing];
        //选中时传给settleview购物车id
        NSMutableArray *idArray = [NSMutableArray new];
        for (ZFGoodModel* goodModel in self.listModel.list) {
            if (goodModel.selected == 1) {
                [idArray addObject:[NSNumber numberWithInt:(int)goodModel.ID]];
            }
        }
        self.settleView.idArray = idArray;
    }else{
        [self.settleView setSettleMent];
    }
    
}
#pragma mark --tableview的协议
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.listModel.list.count == 0) {//判断购物车是否为空
        _emptyCart.hidden = NO;
        _managementButton.hidden = YES;
        self.settleView.hidden = YES;
    }else{
        _emptyCart.hidden = YES;
        _managementButton.hidden = NO;
        self.settleView.hidden = NO;
    }
    return  self.listModel.list.count;
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
    cell.delegate = self;
    return cell;
}

- (void)viewWillAppear:(BOOL)animated{
    [self.shoppingCart.mj_header beginRefreshing];
}

- (void)updateSpec_key{
    [self.shoppingCart.mj_header beginRefreshing];
}

- (void)selectGood:(NSString *)isSelected goods_id:(NSInteger)goods_id{
        ZWeakSelf
        //勾选购物车时返回计算结果
        [http_shopping AsyncUpdateCart:goods_id selected:isSelected success:^(id responseObject) {
            [weakSelf loadData:responseObject];
        } failure:^(NSError *error) {
            [SVProgressHUD showErrorWithStatus:error.domain];
        }];
    
}

- (void)loadData:(id)responseObject{
    if (responseObject == nil) {
        return;
    }
    //获取金额
    ZFListModel *model = [ZFListModel mj_objectWithKeyValues:responseObject];
    ZFCartPriceModel *priceModel = model.cart_price_info;
    self.settleView.price = priceModel.total_fee;
}

- (void)changeGoodsNum:(NSInteger)number Cell:(ZFShoppingCartCell *)cell{
//    商品数量改变
    [http_shopping changeNum:cell.model.ID goods_num:number success:^(id responseObject) {
        
        if (kObjectIsEmpty(responseObject))
        {
            return;
        }
        //获取当前购物车商品的总价
        self.listModel = [ZFListModel mj_objectWithKeyValues:responseObject];
        self.settleView.price = self.listModel.cart_price_info.total_fee;
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
}
@end
