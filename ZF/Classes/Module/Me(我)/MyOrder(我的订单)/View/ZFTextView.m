//
//  ZFTextView.m
//  ZF
//
//  Created by weiming zhang on 2019/5/14.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFTextView.h"

@implementation ZFTextView

- (instancetype)initWithFrame:(CGRect)frame

{
    
    self = [super initWithFrame:frame];
    
    if(self) {
        
        self.backgroundColor= [UIColor clearColor];
        
        UILabel *placeholderLabel = [[UILabel alloc]init];//添加一个占位label
        
//        placeholderLabel.backgroundColor= [UIColor clearColor];
        
        placeholderLabel.numberOfLines=0; //设置可以输入多行文字时可以自动换行
        
        [self addSubview:placeholderLabel];
        
        self.placeholderLabel= placeholderLabel; //赋值保存
        
        self.placeholderLabel.textColor = RGBColorHex(0x999999); //设置占位文字默认颜色
        
        self.placeholderLabel.font= [UIFont systemFontOfSize:12]; //设置默认的字体
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self]; //通知:监听文字的改变
        
    }
    
    return self;
    
}



@end
