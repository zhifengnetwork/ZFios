//
//  ZFDetailBalanceWMVC.m
//  ZF
//
//  Created by admin on 2019/3/19.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDetailBalanceWMVC.h"
#import "ZFDetailBalanceVC.h"


@interface ZFDetailBalanceWMVC ()

@property (nonatomic, strong) ZFDetailBalanceVC *walletVC;
@property (nonatomic, strong) ZFDetailBalanceVC *recordVC;
@property (nonatomic, strong) ZFDetailBalanceVC *moneyVC;

@end

@implementation ZFDetailBalanceWMVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"账户明细";
    self.view.backgroundColor = RGBColorHex(0xffffff);
    
    UISegmentedControl* segment = [[UISegmentedControl alloc]initWithFrame:CGRectMake(10, 10, LL_ScreenWidth-20, 40)];
    //在索引值为0的位置上插入一个标题为red的按钮，第三个参数为是否开启动画
    [segment insertSegmentWithTitle:@"全部" atIndex:0 animated:YES];
    [segment insertSegmentWithTitle:@"赚取" atIndex:1 animated:YES];
    [segment insertSegmentWithTitle:@"消费" atIndex:2 animated:YES];
    
    //设置Segment的字体
    NSDictionary *dic = @{
                          //1.设置字体样式:例如黑体,和字体大小
                          NSFontAttributeName:[UIFont fontWithName:@"Arial" size:17],
                          //2.字体颜色
                          NSForegroundColorAttributeName:RGBColorHex(0x585859)
                          };
    
    [segment setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    //设置Segment选中的字体
    NSDictionary *dic2 = @{
                           //1.设置字体样式:例如黑体,和字体大小
                           NSFontAttributeName:[UIFont fontWithName:@"Arial" size:17],
                           //2.字体颜色
                           NSForegroundColorAttributeName:RGBColorHex(0xf10a0a)
                           };
    
    [segment setTitleTextAttributes:dic2 forState:UIControlStateSelected];
    
    //设置未选中时的背景色
    [segment setBackgroundImage:[UIImage imageNamed:@"select"]
                       forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];

    //设置选中时的背景色
    [segment setBackgroundImage:[UIImage imageNamed:@"select"]
                       forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    //设置标题和边框的颜色
    segment.tintColor = RGBColorHex(0xe4edf4);
    //设置初始选中值，默认是没有选中
    segment.selectedSegmentIndex = 0;
    //    self.view.backgroundColor = [UIColor magentaColor];
    //绑定事件
    [segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segment];
    
    self.walletVC.view.hidden = NO;
}

-(void)segmentAction:(UISegmentedControl*)sender
{
    if (_walletVC!=nil)
    {
        self.walletVC.view.hidden = YES;
    }
    
    if (_recordVC!=nil)
    {
        self.recordVC.view.hidden = YES;
    }
    
    if (_moneyVC!=nil)
    {
        self.moneyVC.view.hidden = YES;
    }
    
    if (sender.selectedSegmentIndex==0)
    {
        //全部
        self.walletVC.view.hidden = NO;
    }
    else if (sender.selectedSegmentIndex==1)
    {
        //赚取
        self.recordVC.view.hidden = NO;
    }
    else if (sender.selectedSegmentIndex==2)
    {
        //消费
        self.moneyVC.view.hidden = NO;
    }
    //titleForSegmentAtIndex通过索引值获取被选中的分段控制器的按钮标题，selectedSegmentIndex 是获取被选中按钮的索引值
    NSLog(@"----%@",[sender titleForSegmentAtIndex:sender.selectedSegmentIndex]);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAippear:(BOOL)animated{
    
    [super viewWillAppear:animated];
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}


-(ZFDetailBalanceVC*)walletVC
{
    if (_walletVC==nil) {
        _walletVC = [[ZFDetailBalanceVC alloc]init];
        _recordVC.type = @"all";
        [self addChildViewController:_walletVC];
        [self.view addSubview:_walletVC.view];
        [_walletVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(50);
        }];
    }
    
    return _walletVC;
}

-(ZFDetailBalanceVC *)recordVC
{
    if (_recordVC==nil) {
        _recordVC = [[ZFDetailBalanceVC alloc]init];
        _recordVC.type = @"plus";
        [self addChildViewController:_recordVC];
        [self.view addSubview:_recordVC.view];
        [_recordVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(50);
        }];
    }
    
    return _recordVC;
}

-(ZFDetailBalanceVC *)moneyVC
{
    if (_moneyVC==nil) {
        _moneyVC = [[ZFDetailBalanceVC alloc]init];
        _moneyVC.type = @"minus";
        [self addChildViewController:_moneyVC];
        [self.view addSubview:_moneyVC.view];
        [_moneyVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.top.mas_equalTo(50);
        }];
    }
    
    return _moneyVC;
}

@end
