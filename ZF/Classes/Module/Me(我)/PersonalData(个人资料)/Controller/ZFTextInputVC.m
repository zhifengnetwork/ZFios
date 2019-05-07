//
//  ZFTextInputVC.m
//  LK
//
//  Created by apple on 2018/6/19.
//  Copyright © 2018年 LKQN. All rights reserved.
//

#import "ZFTextInputVC.h"
#import "SVProgressHUD.h"
#import "FSTextView.h"


@interface ZFTextInputVC()<UITextFieldDelegate,UITextViewDelegate>

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) FSTextView *textView;
//
@property (nonatomic, strong) UILabel *countLabel;

@property (nonatomic, strong) UIButton *clickButton;

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
    
    [self.view addSubview:self.bgView];
    [self.view addSubview:self.textView];
    [self.view addSubview:self.countLabel];
    [self.view addSubview:self.clickButton];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.top.mas_equalTo(20);
        make.height.mas_equalTo(45);
    }];
    
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.centerY.equalTo(self->_bgView);
    }];
    
    [_countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_textView.mas_left).offset(15);
        make.centerY.equalTo(self->_textView);
    }];
    _countLabel.hidden = YES;
    
    [_clickButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_textView.mas_bottom).offset(20);
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
    if (_type==1)
    {
        self.title = @"修改名称";
        
        _textView.text = _text;
        [_textView becomeFirstResponder];
        _textView.placeholder = @"4-20字符，可有中英文，数字组成";
        _textView.maxLength = 20;
    }
    
    if (_type==6)
    {
//        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonDidClick)];
//        self.navigationItem.rightBarButtonItem.tintColor = [UIColor blueColor];
    }
    
}

- (void)clickButtonDidClick{
    
    if (_type==1)
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

//是否为合法输入
-(BOOL)isLegitimateText
{
    if (_type==1)
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

- (FSTextView *)textView {
    if (_textView == nil) {
        _textView = [[FSTextView alloc]init];
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

-(UIView *)bgView
{
    if (_bgView==nil) {
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}

@end
