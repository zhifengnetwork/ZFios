//
//  HMInputView.h
//  LS
//
//  Created by apple on 09/01/2019.
//  Copyright © 2019 LS. All rights reserved.
//

#import "HMInputView.h"
#import "HMEmoticonTextView.h"
#import "HMEmoticonInputView.h"

@interface HMInputView ()<UITextViewDelegate>

@property (nonatomic, strong) HMEmoticonTextView *inputerView;
@property (nonatomic, strong) UIButton *sendButton;
@property (nonatomic, strong) UIButton *emojiButton;

@property (nonatomic, strong) HMEmoticonInputView *emoticoninputView;

@property (nonatomic, assign) NSInteger index;

@end

@implementation HMInputView

#pragma mark - lifecycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _index = -1;
        [self setup];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - private

- (void)setup
{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.inputerView];
    [self addSubview:self.sendButton];
    [self addSubview:self.emojiButton];
    
    [_sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self).offset(-5);
        make.size.mas_equalTo(CGSizeMake(50, 28));
    }];
    
    [_emojiButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self->_sendButton.mas_leading).offset(-5);
        make.size.mas_equalTo(CGSizeMake(50, 28));
    }];
    
    [_inputerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).offset(5);
        make.height.mas_equalTo(34);
        //        make.bottom.equalTo(self).offset(-5);
        make.centerY.equalTo(self);
        make.trailing.equalTo(self->_emojiButton.mas_leading).offset(-5);
    }];
    
    [@[_sendButton, _emojiButton] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self->_inputerView);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(inputerViewDidChange) name:UITextViewTextDidChangeNotification object:_inputerView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(inputerViewDidEndEditing) name:UITextViewTextDidEndEditingNotification object:_inputerView];
}

#pragma mark - action

- (void)sendButtonDidClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(HMInputViewSendButtonDidClick: index:)]) {
        [self.delegate HMInputViewSendButtonDidClick:_inputerView.emoticonText index:_index];
    }
}

- (void)emojiButtonDidClick:(UIButton *)sender {
    _inputerView.inputView = _inputerView.inputView == nil ? self.emoticoninputView : nil;
    sender.selected = _inputerView.inputView != nil;
    [_inputerView reloadInputViews];
    [_inputerView becomeFirstResponder];
}

#pragma mark - notification

- (void)inputerViewDidChange {
    _sendButton.enabled = [_inputerView hasText];
    if (_sendButton.enabled)
    {
        [_sendButton setBackgroundColor:RGBMainColor];
    }
    else
    {
        [_sendButton setBackgroundColor:[UIColor grayColor]];
    }
}

- (void)inputerViewDidEndEditing
{
    //    if (!_isAt) {
    //        _inputerView.text = nil;
    //        _inputerView.placeholder = @"写评论...";
    //        [self inputerViewDidChange];
    //    } else {
    //        _isAt = NO;
    //    }
}


#pragma mark - UITextViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"@"]) {
        [_inputerView replaceRange:_inputerView.selectedTextRange withText:text];
        [self inputerViewDidChange];
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(HMInputViewTextView:shouldChangeTextInRange:replacementText:)]) {
            [self.delegate HMInputViewTextView:textView shouldChangeTextInRange:range replacementText:text];
        }
    }
    return YES;
}


#pragma mark - public

- (void)setPlaceholderWithNickname:(NSString *)nickname index:(NSInteger)index {
    _index = index;
    
    if (kStringIsEmpty(nickname)) {
        _inputerView.text = nil;
    } else {
        _inputerView.text = [NSString stringWithFormat:@"回复@%@:", nickname];
    }
    [_inputerView becomeFirstResponder];
    [self inputerViewDidChange];
}

- (void)setAtPersonWithNickname:(NSString *)nickname {
    [_inputerView replaceRange:_inputerView.selectedTextRange withText:nickname];
    [self inputerViewDidChange];
}


//得到当前输入的内容
-(NSString*)getInputText
{
    return _inputerView.emoticonText;
}

-(void)setFirstResponder
{
    [_inputerView becomeFirstResponder];
}

- (void)setPlaceholder:(NSString *)text index:(NSInteger)index
{
    _index = index;
    
    if (kStringIsEmpty(text)) {
        _inputerView.text = nil;
    } else {
        _inputerView.text = text;
    }
    [_inputerView becomeFirstResponder];
    [self inputerViewDidChange];
}

#pragma mark - getter

- (HMEmoticonInputView *)emoticoninputView {
    if (_emoticoninputView == nil) {
        __weak typeof(self) weakSelf = self;
        _emoticoninputView = [[HMEmoticonInputView alloc] initWithSelectedEmoticon:^(HMEmoticon * _Nullable emoticon, BOOL isRemoved) {
            [weakSelf.inputerView insertEmoticon:emoticon isRemoved:isRemoved];
        }];
    }
    return _emoticoninputView;
}

- (HMEmoticonTextView *)inputerView {
    if (_inputerView == nil) {
        _inputerView = [[HMEmoticonTextView alloc] init];
        _inputerView.placeholder = @"写评论...";
        _inputerView.textColor = RGBColor(46, 46, 46);
        _inputerView.font = [UIFont systemFontOfSize:14];
        _inputerView.delegate = self;
        // 监听文本框文字高度改变
        //        _inputerView.textHeightChangeBlock = ^(NSString *text, CGFloat textHeight){
        //            // 文本框文字高度改变会自动执行这个【block】，可以在这【修改底部View的高度】
        //            // 设置底部条的高度 = 文字高度 + textView距离上下间距约束
        //            // 为什么添加10 ？（10 = 底部View距离上（5）底部View距离下（5）间距总和）
        //            //            _bottomHCons.constant = textHeight + 10;
        //        };
        //
        //        // 设置文本框最大行数
        //        _inputerView.maxNumberOfLines = 4;
    }
    return _inputerView;
}

- (UIButton *)sendButton {
    if (_sendButton == nil) {
        _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendButton.layer.cornerRadius = 4;
        _sendButton.clipsToBounds = YES;
        _sendButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_sendButton setTitle:@"发送" forState:UIControlStateNormal];
        [_sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_sendButton setTitleColor:RGBColor(177, 177, 177) forState:UIControlStateDisabled];
        [_sendButton setBackgroundColor:RGBMainColor];
        [_sendButton addTarget:self action:@selector(sendButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
        _sendButton.enabled = NO;
    }
    return _sendButton;
}

- (UIButton *)emojiButton {
    if (_emojiButton == nil) {
        _emojiButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_emojiButton setImage:[UIImage imageNamed:@"icon_expression_samll"] forState:UIControlStateNormal];
        [_emojiButton setImage:[UIImage imageNamed:@"icon_clavier_samll"] forState:UIControlStateSelected];
        [_emojiButton setImage:[UIImage imageNamed:@"icon_clavier_samll"] forState:UIControlStateSelected | UIControlStateHighlighted];
        [_emojiButton addTarget:self action:@selector(emojiButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _emojiButton;
}

@end
