//
//  ZFMyShareVC.m
//  ZF
//
//  Created by weiming zhang on 2019/5/25.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMyShareVC.h"
#import "http_user.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "UserInfoModel.h"

@interface ZFMyShareVC ()
@property (nonatomic, strong)UIWebView *webView;
@end

@implementation ZFMyShareVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.view);
    }];
    
    [http_user GetSharePic:^(id responseObject) {
        [self loadData:responseObject];
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
    
}

- (void)loadData:(id)responseObject{
    if (kObjectIsEmpty(responseObject)) {
        return;
    }
    NSString *pic = [responseObject objectForKey:@"pic"];
    [_webView loadHTMLString:pic baseURL:nil];
}
- (UIWebView *)webView{
    if (_webView == nil) {
        _webView = [[UIWebView alloc]init];
        
    }return _webView;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
