//
//  ZFMaterialVC.m
//  ETH
//
//  Created by apple on 2019/4/22.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ZFMaterialVC.h"
#import "http_home.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "ZFMaterialModel.h"


@interface ZFMaterialVC ()

@property (nonatomic, strong)UIWebView *webView;
@property (nonatomic, strong)ZFinfoModel *infoModel;

@end

@implementation ZFMaterialVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"阅读区";
    [self.view addSubview:self.webView];
    [self loadData];
}


-(void)loadData
{
    ZWeakSelf
    //中奖记录
    [SVProgressHUD showWithStatus:@"正在加载"];
    [http_home getMaterialDetail:self.materialAreaModel.material_id success:^(id responseObject)
     {
         [SVProgressHUD dismiss];
         [weakSelf showData:responseObject];
     } failure:^(NSError *error) {
         [SVProgressHUD showErrorWithStatus:error.domain];
     }];
}

-(void)showData:(id)responseObject
{
    if (kObjectIsEmpty(responseObject))
    {
        return;
    }
    
    self.infoModel = [ZFinfoModel mj_objectWithKeyValues:responseObject];
    [self.webView loadHTMLString:self.infoModel.content baseURL:nil];
}


-(UIWebView *)webView
{
    if (_webView==nil)
    {
        _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    }
    
    return _webView;
}

@end
