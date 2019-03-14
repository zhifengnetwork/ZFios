//
//  ZFMenuView.m
//  ZF
//
//  Created by weiming zhang on 2019/3/13.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFMenuView.h"
#import "ZFMenuCell.h"
@interface ZFMenuView()

@end
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
        
        self.image = [[UIImageView alloc]init];
        [self addSubview:_image];
    }
    return self;
}

- (void)setButtonHeight:(int)buttonHeight{
    [self.tableview registerClass:[ZFMenuCell class] forCellReuseIdentifier:@"cell"];
    self.layer.borderColor = RGBColor(249, 249, 249).CGColor;
    self.layer.borderWidth = 1;
    
    
    _buttonImageFlag = YES;
    
    [self.label setText:@"套餐"];
    [self.label setFont:[UIFont systemFontOfSize:9]];
    [self.label setTextColor:RGBColor(153, 153, 153)];
    _label.frame = CGRectMake(0, 0, 20, 20);
    
    //button的宽度以及tableview的宽度都和view一样
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.label.mas_right).with.offset(6);
        make.centerY.equalTo(self.label.mas_centerY);
        make.height.equalTo(@22);
    }];
    self.buttonWidth = 88;
    [_button addTarget:self action:@selector(tableShowAndHide:) forControlEvents:UIControlEventTouchUpInside];
    [_button setTitleColor:RGBColor(102, 102, 102) forState:UIControlStateNormal];
    _button.titleLabel.font = [UIFont systemFontOfSize:12];
    [_button setTitle:_arr[0] forState:UIControlStateNormal];
    
    [_image setImage:[UIImage imageNamed:@"down"]];
    [_image sizeToFit];
    [_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->_button.mas_right).with.offset(6);
        make.centerY.equalTo(self->_button.mas_centerY);
        make.right.mas_equalTo(self).with.offset(-6);
    }];
    
    
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
        //tableview的位置
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
    
    [_image setImage:[UIImage imageNamed:@"down_b"]];
    [self closeTableView];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([_delegate respondsToSelector:@selector(selectAtIndex:WithZFMenu:)]) {
        [_delegate selectAtIndex:(int)indexPath.row WithZFMenu:self];
    }
}
@end
