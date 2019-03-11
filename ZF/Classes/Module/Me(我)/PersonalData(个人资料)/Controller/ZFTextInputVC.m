//
//  ZFTextInputVC.m
//  LK
//
//  Created by apple on 2018/6/19.
//  Copyright © 2018年 LKQN. All rights reserved.
//

#import "ZFTextInputVC.h"
#import "SVProgressHUD.h"


@interface ZFTextInputVC()<UITextFieldDelegate,UITextViewDelegate>

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITextView *textView;
//
@property (nonatomic, strong) UILabel *countLabel;

@property (nonatomic, strong) UIButton *clickButton;
@property (nonatomic, assign) int max_len;

@end

@implementation ZFTextInputVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"修改名称";
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setup
{
    self.view.backgroundColor = TableViewBGColor;
    
    [self.view addSubview:self.textField];
    [self.view addSubview:self.textView];
    [self.view addSubview:self.countLabel];
    [self.view addSubview:self.clickButton];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(20);
        make.height.mas_equalTo(45);
    }];
    
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(20);
        make.height.mas_equalTo(45);
    }];
    
    [_countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_textField.mas_left).offset(15);
        make.centerY.equalTo(self->_textField);
    }];
    
    [_clickButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_textField.mas_bottom).offset(20);
        make.height.mas_equalTo(40);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
    }];
    
    [self setupType:_type];
}


-(void)setText:(NSString *)text
{
    _text = text;
}

-(void)setType:(int)type
{
    _type = type;
}

-(void)setupType:(int)type
{
    if (_type==1) {
        self.title = @"修改名称";
        _textView.hidden = YES;
        
        _max_len =20;
        _countLabel.text = @"4-20字符，可有中英文，数字组成";
        [_countLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self->_textField.mas_left).offset(15);
            make.centerY.equalTo(self->_textField);
        }];
    }
//    else if (_type==3) {
//        self.title = @"公司";
//        _textView.hidden = YES;
//
//        _max_len = 50;
//        _countLabel.text = @"50字以内";
//        [_countLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(LeadingTrailingMargin);
//            make.top.equalTo(_textField.mas_bottom).offset(15);
//        }];
//    }
    
    
    if (_type==1)
    {
        _textField.text = _text;
        [_textField becomeFirstResponder];
        
    }
//    else if (_type==2 || _type==5 || _type==9)
//    {
//        _textView.text = _text;
//        [_textView becomeFirstResponder];
//    }
    
    if (_type==6)
    {
//        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonDidClick)];
//        self.navigationItem.rightBarButtonItem.tintColor = [UIColor blueColor];
    }
    
}

- (void)clickButtonDidClick
{
    
}

- (void)rightBarButtonDidClick{
    
    if (_type==1 || _type==3  || _type==4 || _type==7 || _type==8)
    {
        _text = _textField.text;
    }
    else if (_type==2 || _type==5 || _type==6)
    {
        _text = _textView.text;
    }
    
    //合法检查
    if (![self isLegitimateText])
    {
        return;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFTextInputVCDidSave: type:)]) {
        
        [self.delegate ZFTextInputVCDidSave:_text type:_type];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldEditChanged:) name:@"UITextFieldTextDidChangeNotification"
                                              object:self.textField];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textViewEditChanged:) name:@"UITextViewTextDidChangeNotification"
                                              object:self.textView];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"UITextFieldTextDidChangeNotification" object:self.textField];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"UITextViewTextDidChangeNotification" object:self.textView];
}

#pragma mark - Notification Method
-(void)textFieldEditChanged:(NSNotification *)obj
{
    UITextField *textField = (UITextField *)obj.object;
    NSString *toBeString = textField.text;
    
    //获取高亮部分
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if (!position)
    {
        if (toBeString.length > _max_len)
        {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:_max_len];
            if (rangeIndex.length == 1)
            {
                textField.text = [toBeString substringToIndex:_max_len];
            }
            else
            {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, _max_len)];
                textField.text = [toBeString substringWithRange:rangeRange];
            }
        }
    }
}

#pragma mark - Notification Method
-(void)textViewEditChanged:(NSNotification *)obj
{
    UITextView *textView = (UITextView *)obj.object;
    NSString *toBeString = textView.text;
    
    //获取高亮部分
    UITextRange *selectedRange = [textView markedTextRange];
    UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
    
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if (!position)
    {
        if (toBeString.length > _max_len)
        {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:_max_len];
            if (rangeIndex.length == 1)
            {
                textView.text = [toBeString substringToIndex:_max_len];
            }
            else
            {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, _max_len)];
                textView.text = [toBeString substringWithRange:rangeRange];
            }
        }
    }
}


//是否为合法输入
-(BOOL)isLegitimateText
{
    if (_type==6)
    {
        if ( kStringIsEmpty(_text) )
        {
            [SVProgressHUD showErrorWithStatus:@"姓名不能为空"];
            return NO;
        }
    }
    
    return YES;
}


#pragma mark - getter

- (UITextField *)textField {
    if (_textField == nil) {
        _textField = [[UITextField alloc]init];
        _textField.keyboardType = UIKeyboardTypeDefault;
        _textField.placeholder = @"";
        _textField.textColor = RGBColor(46, 46, 46);
        _textField.font = [UIFont systemFontOfSize:15];
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [_textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        //屏蔽系统摇一摇出现的那个撤销弹窗，防止闪退
        [_textField.undoManager removeAllActions];
    }
    return _textField;
}

- (UITextView *)textView {
    if (_textView == nil) {
        _textView = [[UITextView alloc]init];
        _textView.keyboardType = UIKeyboardTypeDefault;
        _textView.textColor = RGBColor(46, 46, 46);
        _textView.font = [UIFont systemFontOfSize:15];
        _textView.backgroundColor = [UIColor whiteColor];
        [_textView setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        //屏蔽系统摇一摇出现的那个撤销弹窗，防止闪退
        [_textView.undoManager removeAllActions];
    }
    return _textView;
}

- (UILabel *)countLabel {
    if (_countLabel == nil) {
        _countLabel = [[UILabel alloc] init];
        _countLabel.textColor = RGBColorHex(0xb3b3b3);
        _countLabel.font = [UIFont systemFontOfSize:12];
        [_countLabel sizeToFit];
        _countLabel.text = @"4-20字符，可有中英文，数字组成";
    }
    return _countLabel;
}

- (UIButton *)clickButton {
    if (_clickButton == nil) {
        _clickButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _clickButton.backgroundColor = RGBColorHex(0xff4200);
        [_clickButton setTitle:@"点击修改" forState:UIControlStateNormal];
        _clickButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_clickButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _clickButton.layer.cornerRadius = 5;
        _clickButton.clipsToBounds = YES;
        [_clickButton addTarget:self action:@selector(clickButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clickButton;
}

@end
