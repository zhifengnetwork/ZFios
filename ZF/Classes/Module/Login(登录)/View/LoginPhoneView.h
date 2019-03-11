//
//  LoginPhoneView.h
//  LK
//
//  Created by apple on 2018/4/30.
//  Copyright © 2018年 LKQN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKCountDownButton.h"


@protocol LoginPhoneViewDelegate <NSObject>

/**
 获取验证码

 @param phone 手机号码
 @return yes手机号码正确
 */
- (BOOL)LoginPhoneViewDidClick:(NSString*)phone;

@end


/**
 手机号登录或绑定view
 */
@interface LoginPhoneView : UIView

@property (nonatomic, weak) id<LoginPhoneViewDelegate> delegate;

@property (nonatomic, strong) UILabel *phoneLabel;
@property (nonatomic, strong) UITextField *phoneTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UITextField *vcodeTextField;
@property (nonatomic, strong) JKCountDownButton *vcodeButton;

@end
