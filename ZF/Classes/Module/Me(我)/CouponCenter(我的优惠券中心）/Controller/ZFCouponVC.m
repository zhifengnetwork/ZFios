//
//  ZFCouponVC.m
//  ZF
//
//  Created by weiming zhang on 2019/3/21.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFCouponVC.h"
#import "ZFCouponCell.h"
@interface ZFCouponVC ()

@end

@implementation ZFCouponVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup{
    
    self.tableView.rowHeight = 200;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* ID = @"ZFCouponCell";
    ZFCouponCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[ZFCouponCell alloc]init];
    }
    return cell;
}



@end
