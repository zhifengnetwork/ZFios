//
//  ZFTextInputVC.h
//  LK
//
//  Created by apple on 2018/6/19.
//  Copyright © 2018年 LKQN. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ZFTextInputVCDelegate <NSObject>

@optional
//点击了昵称、简介修改界面的保存
- (void)ZFTextInputVCDidSave:(NSString *)text type:(int)type;

@end


/**
 昵称、简介修改界面
 */
@interface ZFTextInputVC : UIViewController

@property (nonatomic, weak) id <ZFTextInputVCDelegate> delegate;

@property (nonatomic, strong) NSString *text;

//1:昵称 2:简介 3:学校 4:群名称 5:公告 6:反馈 7:微信 8:QQ 9:微博 10:姓名 11:手机
@property (nonatomic, assign) int type;

@end
