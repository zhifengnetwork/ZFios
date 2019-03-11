//
//  StaticTableViewCell.h
//  LS
//
//  Created by apple on 2019/02/25.
//  Copyright © 2019 LS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LKChatListModel;

#define DefaultIconNameRight @"icon-right-arrows"

typedef void (^iconRightClickBlock)(BOOL isSelect);

/**
 静态TableViewCell
 */
@interface StaticTableViewCell : UITableViewCell

//标题
@property (nonatomic, strong) NSString *title;
//中间标题
@property (nonatomic, strong) NSString *middle;

//左2标题
@property (nonatomic, strong) NSString *titleLeft;
@property (nonatomic, strong) UIColor *titleLeftTextColor;

//右标题
@property (nonatomic, strong) NSString *titleRight;
@property (nonatomic, strong) UIColor *titleRightTextColor;

//菜单图标
@property (nonatomic, strong) NSString *iconName;
//右边菜单图标
@property (nonatomic, strong) NSString *iconNameRight;


//
@property (nonatomic, copy) iconRightClickBlock rightClickBlock;

@property (nonatomic, assign) BOOL isiconRightClick;

@property (nonatomic, strong) LKChatListModel *chatListModel;

@property (nonatomic, assign) BOOL isHideBottomLine;

@property (nonatomic, assign) BOOL isShowRedDot;

@end
