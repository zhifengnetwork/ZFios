//
//  HMInputView.h
//  LS
//
//  Created by apple on 09/01/2019.
//  Copyright © 2019 LS. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol HMInputViewDelegate <NSObject>

@optional
//发送按钮点击
- (void)HMInputViewSendButtonDidClick:(NSString *)content index:(NSInteger)index;

//输入文字有变化
- (void)HMInputViewTextView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;

@end


NS_ASSUME_NONNULL_BEGIN

/**
 用于发评论的输入框view
 */
@interface HMInputView : UIView

@property (nonatomic, weak) id<HMInputViewDelegate> delegate;

/**
 *  textView最大行数
 */
@property (nonatomic, assign) NSUInteger maxNumberOfLines;

/**
 *  文字高度改变block → 文字高度改变会自动调用
 *  block参数(text) → 文字内容
 *  block参数(textHeight) → 文字高度
 */
@property (nonatomic, strong) void(^textHeightChangeBlock)(NSString *text,CGFloat textHeight);

//
- (void)setPlaceholderWithNickname:(NSString *)nickname index:(NSInteger)index;
- (void)setAtPersonWithNickname:(NSString *)nickname;

//得到当前输入的内容
-(NSString*)getInputText;
//弹出键盘
-(void)setFirstResponder;
//设置默认显示文本
- (void)setPlaceholder:(NSString *)text index:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
