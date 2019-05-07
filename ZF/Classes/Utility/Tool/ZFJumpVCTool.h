//
//  ZFJumpVCTool.h
//  LK
//
//  Created by ZMac on 2018/5/3.
//  Copyright © 2018年 LKQN. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 用于常用VC跳转工具类
 */
@interface ZFJumpVCTool : NSObject

+ (instancetype)sharedManager;

//第三方登录type 2:微信 1:QQ 3:新浪 4:手机
+(void)to_ThirdpartyLogin:(int)type srcVC:(UIViewController*)vc;

//跳转到搜索界面
+(void)to_SearchVC:(NSString*)type srcVC:(UIViewController*)vc;

//跳转到红包界面
+(void)to_RedEnvelopesVC:(NSString*)rid srcVC:(UIViewController*)vc;

//跳转到社群界面
+(void)to_GroupVC:(NSString*)gid srcVC:(UIViewController*)vc;

//二维码跳转界面
+(void)to_QRCodeVC:(NSString*)qrcode srcVC:(UIViewController*)vc;

//允许弹框
+(void)showAllowDlg:(NSString*)msg srcVC:(UIViewController*)vc;

//第三方账号绑定type 2:微信 1:QQ 3:新浪
+(void)to_ThirdpartyBind:(int)type srcVC:(UIViewController*)vc;

@end
