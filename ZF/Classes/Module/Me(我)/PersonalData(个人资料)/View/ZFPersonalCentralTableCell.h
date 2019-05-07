//
//  ZFPersonalCentralTableCell.h
//  ZF
//
//  Created by apple on 2019/3/11.
//  Copyright © 2019 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfoModel.h"


NS_ASSUME_NONNULL_BEGIN

/**
 个人资料中部cell
 */
@interface ZFPersonalCentralTableCell : UITableViewCell

@property (nonatomic, strong) UserInfoModel *userInfo;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *name;
///头部圆角
@property (nonatomic, assign) BOOL roundTop;
///底部圆角
@property (nonatomic, assign) BOOL roundBottom;

@property (nonatomic, assign) BOOL isShowButton;

@property (nonatomic, assign) BOOL isShowTitleButton;

@property (nonatomic, assign) BOOL isShowNextButton;

@end

NS_ASSUME_NONNULL_END
