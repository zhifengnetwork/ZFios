//
//  ZFMenu.h
//  ZF
//
//  Created by weiming zhang on 2019/3/12.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZFMenu;
@protocol ZFMenuDelegate <NSObject>
- (void)zfMenu: (ZFMenu *)menu selectChildMenu: (NSInteger)index;
@optional
// 菜单将要出现
- (void)zfMenuWillShow;
// 菜单已经出现
- (void)zfMenuDidShow;
// 菜单将要消失
- (void)zfMenuWillHidden;
// 菜单已经消失
- (void)zfMenuDidHidden;
@end
@interface ZFMenu : UIView
@property (nonatomic, assign)id <ZFMenuDelegate>delegate;
//设置菜单标题
- (void)setMainMenuTitle: (NSString *)title childTitleAry:(NSArray *)childTitleAry;

@end
