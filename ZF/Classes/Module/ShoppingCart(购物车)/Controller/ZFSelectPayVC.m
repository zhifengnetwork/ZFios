//
//  ZFSelectPayVC.m
//  ZF
//
//  Created by weiming zhang on 2019/3/19.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFSelectPayVC.h"
#import "ZFSelectPayCell.h"
@interface ZFSelectPayVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ZFSelectPayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}
- (void)setup{
    self.vcView = self.view;
    self.view.layer.cornerRadius = 10;
    self.view.backgroundColor = RGBColorHex(0xffffff);
    //设置标题
    UILabel *title = [[UILabel alloc]init];
    [self.view addSubview:title];
    
    
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    tableView.delegate = self;
    tableView.dataSource = self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID =@"zfselectpaycell";
    ZFSelectPayCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[ZFSelectPayCell alloc]init];
    }
    return cell;
}

@end
