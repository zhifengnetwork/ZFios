//
//  ZFMenu.h
//  ZF
//
//  Created by weiming zhang on 2019/3/13.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFMenu : UITableViewController
//显示字体设置
@property (nonatomic, assign)UIFont *cusFont;
//点击回调，返回所点的角标以及点击的内容
@property (nonatomic, copy) void (^didSelectedCallback)(NSInteger index,NSString *content);
//数据源
@property (nonatomic, strong)NSArray *arrMDataSource;
//tableview以及cell的颜色，如果不设置默认为白色
@property (nonatomic, strong)UIColor *tabColor;
//文字的颜色
@property (nonatomic, strong)UIColor *txtColor;
@end
