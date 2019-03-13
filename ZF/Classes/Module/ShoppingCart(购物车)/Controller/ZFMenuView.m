//
//  ZFMenuView.m
//  ZF
//
//  Created by weiming zhang on 2019/3/13.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFMenuView.h"
#import "ZFMenuCell.h"
@implementation ZFMenuView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBColor(249, 249, 249);
        
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_button];
        
        self.label = [[UILabel alloc]init];
        [self addSubview:_label];
    }
    return self;
}
- (void)setViewOriginx:(int)originx viewOriginy:(int)originy buttonHeight:(int)buttonHeight buttonWeight:(int)buttonWeight tableViewHeight:(int)tableViewHeight{
    [self.tableview registerClass:[ZFMenuCell class] forCellReuseIdentifier:@"cell"];
    self.layer.borderColor = RGBColor(249, 249, 249).CGColor;
    self.layer.borderWidth = 1;
    //button的高度
    self.buttonWidth = buttonWeight;
    self.frame = CGRectMake(originx, originy,100,buttonHeight +tableViewHeight);
    _buttonImageFlag = YES;
    
    [self.label setText:@"套餐"];
    [self.label setFont:[UIFont systemFontOfSize:9]];
    [self.label setTextColor:RGBColor(153, 153, 153)];
    _label.frame = CGRectMake(6, 0, 20, 20 );
    
    //button的宽度以及tableview的宽度都和view一样
    _button.frame = CGRectMake(CGRectGetMaxX(self.label.frame) + 6, 0, buttonWeight, buttonHeight);
    [_button addTarget:self action:@selector(tableShowAndHide:) forControlEvents:UIControlEventTouchUpInside];
    [_button setTitleColor:RGBColor(102, 102, 102) forState:UIControlStateNormal];
    
    self.tableview.frame = CGRectMake(0, buttonHeight, self.bounds.size.width, 0);
    
}
- (UITableView *)tableview{
    if (!_tableview) {
        self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 0) style:UITableViewStylePlain];
        _tableview.backgroundColor = RGBColor(249, 249, 249);
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.hidden = YES;
        _tableview.delegate = self;
        _tableview.dataSource = self;
        
        [self addSubview:_tableview];
    }
    return _tableview;
}
- (void)tableShowAndHide:(UIButton *)btn{
    if (_buttonImageFlag == YES) {
        //刷新数据
        [self reloadataTableView];
        self.tableview.frame = CGRectMake(0, _button.frame.size.height, self.bounds.size.width, _arr.count*23);
        [self.tableview flashScrollIndicators];
        CGRect rect = self.frame;
        rect.size.height = _button.frame.size.height + _tableview.frame.size.height;
        self.frame = rect;
        _buttonImageFlag = NO;
        _tableview.hidden = NO;
    }else{
        [self closeTableView];
    }
}
- (void)reloadataTableView{
    [self.tableview reloadData];
}
- (void)closeTableView{
    _buttonImageFlag = YES;
    CGRect rect = self.frame;
    rect.size.height = _button.frame.size.height;
    self.frame = rect;
    _tableview.hidden = YES;
//    [_tableview selectRowAtIndexPath:0 animated:YES scrollPosition:UITableViewScrollPositionNone];
}
//代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentifier = @"cell";
    ZFMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[ZFMenuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    [cell configureWithStr:_arr[indexPath.row] boundsWidth:_buttonWidth];
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _button.bounds.size.height -2;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [_button setTitle:_arr[indexPath.row] forState:UIControlStateNormal];
    
    [self closeTableView];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([_delegate respondsToSelector:@selector(selectAtIndex:WithZFMenu:)]) {
        [_delegate selectAtIndex:(int)indexPath.row WithZFMenu:self];
    }
}
@end
