//
//  DZNEmptyDataSetVC.h
//  XV
//
//  Created by apple on 29/03/2019.
//  Copyright © 2019 XR. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 用于空白页显示的ViewController基类
 */
@interface DZNEmptyDataSetVC : UIViewController

@property (nonatomic, weak) UITableView *weaktableView;
@property (nonatomic, assign) BOOL isShowEmptyData;

//是否加载失败，对于特殊的vc需要强制判断此字段
@property (nonatomic, assign) BOOL isLoadFailed;

@end

NS_ASSUME_NONNULL_END
