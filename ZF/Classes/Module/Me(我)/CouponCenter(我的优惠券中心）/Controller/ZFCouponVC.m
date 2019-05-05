//
//  ZFCouponVC.m
//  ZF
//
//  Created by weiming zhang on 2019/3/21.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFCouponVC.h"
#import "ZFCouponCell.h"
#import "http_mine.h"
#import "SVProgressHUD.h"
#import "RefreshGifHeader.h"
#import "MJExtension.h"
#import "ZFUserModel.h"

@interface ZFCouponVC ()
@property (nonatomic, strong)NSMutableArray *list;
@end

@implementation ZFCouponVC
    static NSString* const ZFCouponCellID = @"ZFCouponCellID";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup{
    self.tableView.backgroundColor = RGBColorHex(0xf5f5f5);
    self.tableView.rowHeight = 186;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.tableView registerClass:[ZFCouponCell class] forCellReuseIdentifier:ZFCouponCellID];
    ZWeakSelf
    self.tableView.mj_header = [RefreshGifHeader headerWithRefreshingBlock:^{
        
        [weakSelf loadData];
    }];
    [self.tableView.mj_header beginRefreshing];
}


-(void)loadData
{
    ZWeakSelf
    [http_mine coupon_list:_type success:^(id responseObject)
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
    
    self.list = [ZFUserModel mj_objectArrayWithKeyValuesArray:responseObject];
    
    [self.tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    ZFCouponCell *cell = [tableView dequeueReusableCellWithIdentifier:ZFCouponCellID];
    [cell setCellType:_type];
    cell.couponModel = [self.list objectAtIndex:indexPath.row];
    return cell;
}


@end
