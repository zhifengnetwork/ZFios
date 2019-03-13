//
//  ZFMenuView.h
//  ZF
//
//  Created by weiming zhang on 2019/3/13.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZFMenuView;
@protocol ZFMenuViewDelegate <NSObject>
//代理下拉操作
- (void)selectAtIndex:(int)index WithZFMenu:(ZFMenuView *)zfview;
@end;
@interface ZFMenuView : UIView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UILabel *label;
@property (nonatomic, strong)UIButton *button;//点击的按钮
@property (nonatomic, strong)UITableView *tableview;
@property (nonatomic, assign)CGFloat buttonWidth;

//数据方面
@property (nonatomic, strong)NSMutableArray *arr;
@property (nonatomic, assign)bool buttonImageFlag;//判断表格是否打开
@property (nonatomic, assign)id <ZFMenuViewDelegate>delegate;

- (void)setViewOriginx:(int)originx viewOriginy:(int)originy buttonHeight:(int)buttonHeight buttonWeight:(int)buttonWeight tableViewHeight:(int)tableViewHeight;
//隐藏数据源
- (void)reloadataTableView;
- (void)closeTableView;



@end
