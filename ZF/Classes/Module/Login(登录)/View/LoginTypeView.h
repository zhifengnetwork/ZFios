//
//  LoginTypeView.h
//  LK
//
//  Created by ZMac on 2018/4/27.
//  Copyright © 2018年 LKQN. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginTypeViewDelegate <NSObject>


/**
 登录类型view按扭被点击

 @param type 2:微信 1:QQ 3:新浪 4:手机
 */
- (void)LoginTypeViewDidClick:(int)type;

@end


/**
 登录类型view
 */
@interface LoginTypeView : UIView

@property (nonatomic, weak) id<LoginTypeViewDelegate> delegate;

//是否隐藏手机号
@property (nonatomic, assign) BOOL isHidePhone;

@end
