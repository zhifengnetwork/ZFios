//
//  ZFDetailsWebViewTableCell.h
//  ZF
//
//  Created by apple on 17/05/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDetailsWebViewTableCell.h"

@interface ZFDetailsWebViewTableCell()<UIWebViewDelegate>

@property (nonatomic, strong)UIWebView *webView;

@end

@implementation ZFDetailsWebViewTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setup];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setup
{
    self.contentView.backgroundColor = RGBColorHex(0xffffff);
    [self.contentView addSubview:self.webView];
    
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.contentView);
    }];
}

- (void)setGoods_content:(NSString *)goods_content
{
    _goods_content = goods_content;
    [_webView loadHTMLString:_goods_content baseURL:nil];
}

-(UIWebView *)webView
{
    if (_webView==nil)
    {
        _webView = [[UIWebView alloc]initWithFrame:CGRectZero];
        _webView.scalesPageToFit = YES;
        _webView.scrollView.scrollEnabled = NO;
        _webView.delegate = self;
        [_webView sizeToFit];
    }
    return _webView;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    CGSize fittingSize = [self.webView sizeThatFits:CGSizeZero];
    self.height = fittingSize.height;
    self.webView.frame = CGRectMake(0, 0, fittingSize.width, fittingSize.height);
    
    // 用通知发送加载完成后的高度
    [[NSNotificationCenter defaultCenter] postNotificationName:@"WEBVIEW_HEIGHT" object:self userInfo:nil];
}

@end
