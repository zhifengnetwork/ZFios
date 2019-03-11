//
//  HMEmoticonAttachment.m
//  表情键盘
//
//  Created by 刘凡 on 16/3/5.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "HMEmoticonAttachment.h"
#import "HMEmoticon.h"
#import "UIImage+HMEmoticon.h"

#import "YYText.h"

@implementation HMEmoticonAttachment

- (instancetype)initWithEmoticon:(HMEmoticon *)emoticon font:(UIFont *)font {
    self = [super init];
    if (self) {
        _text = emoticon.chs;
        
        self.image = [UIImage hm_imageNamed:emoticon.imagePath];
        CGFloat lineHeight = font.lineHeight;
        self.bounds = CGRectMake(0, -4, lineHeight, lineHeight);
    }
    return self;
}

+ (NSAttributedString *)emoticonStringWithEmoticon:(HMEmoticon *)emoticon font:(UIFont *)font textColor:(UIColor * _Nonnull)textColor {
    
    HMEmoticonAttachment *attachment = [[HMEmoticonAttachment alloc] initWithEmoticon:emoticon font:font];
    
    NSMutableAttributedString *emoticonStr = [[NSMutableAttributedString alloc] initWithAttributedString:
                                              [NSAttributedString attributedStringWithAttachment:attachment]];
    
    [emoticonStr addAttributes: @{NSFontAttributeName: font,
                                  NSForegroundColorAttributeName: textColor}
                         range:NSMakeRange(0, 1)];

    return emoticonStr.copy;
}

+ (NSAttributedString *)emoticonStringWithEmoticonForYYLabel:(HMEmoticon *)emoticon font:(UIFont *)font textColor:(UIColor *)textColor {
    NSMutableAttributedString *emoticonStr = [NSMutableAttributedString yy_attachmentStringWithEmojiImage:[UIImage hm_imageNamed:emoticon.imagePath] fontSize:font.pointSize];
    [emoticonStr yy_setAttribute:NSFontAttributeName value:font range:NSMakeRange(0, 1)];
    [emoticonStr yy_setAttribute:NSForegroundColorAttributeName value:textColor range:NSMakeRange(0, 1)];
    return emoticonStr.copy;
}

@end
