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

@interface ZFCouponVC ()

@end

@implementation ZFCouponVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup{
    self.tableView.backgroundColor = RGBColorHex(0xf5f5f5);
    self.tableView.rowHeight = 186;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
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
    
//    self.listModel = [ETHBetRecordListModel mj_objectWithKeyValues:responseObject];
    
    [self.tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* ID = @"ZFCouponCell";
    ZFCouponCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[ZFCouponCell alloc]init];
        [cell setCellType:_type];
    }
    return cell;
}


@end
