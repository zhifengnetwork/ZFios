//
//  ZFCommodityWMVC.m
//  LK
//
//  Created by hyy on 2018/11/29.
//  Copyright © 2018 LKQN. All rights reserved.
//

#import "ZFCommodityWMVC.h"
#import "ZFCommodityInforVC.h"
#import "ZFStoreConcernVC.h"
#import "ZFTool.h"


@interface ZFCommodityWMVC ()

@property (nonatomic, strong) ZFCommodityInforVC *vc1;
@property (nonatomic, strong) ZFStoreConcernVC *vc2;

@end

@implementation ZFCommodityWMVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的关注";
    
    UIImage *imgRight = [UIImage imageNamed:@"All"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[imgRight imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(editButtonDidClick)];
    
}


- (void)editButtonDidClick
{
    //更多
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [ZFTool isHiddenNavigationBarSeparatorLine:NO vc:self];
    [self.vc1 addObserver:self forKeyPath:@"ccount" options:NSKeyValueObservingOptionNew context:nil];
    [self.vc2 addObserver:self forKeyPath:@"ccount" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [ZFTool isHiddenNavigationBarSeparatorLine:YES vc:self];
    [self.vc1 removeObserver:self forKeyPath:@"ccount" context:nil];
    [self.vc2 removeObserver:self forKeyPath:@"ccount" context:nil];
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController
{
    return 2;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index
{
    if (index==0)
    {
        return @"商品";
    }
    else if (index==1)
    {
        return @"店铺";
    }
    
    return @"";
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index
{
    if (index==0)
    {
        return self.vc1;
    }
    else if (index==1)
    {
        return self.vc2;
    }
    
    return nil;
}

- (CGFloat)menuView:(WMMenuView *)menu widthForItemAtIndex:(NSInteger)index
{
    CGFloat width = [super menuView:menu widthForItemAtIndex:index];
    return width + 1;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView
{
    CGFloat leftMargin = 0;
    CGFloat originY = 0;
    return CGRectMake(leftMargin, originY, self.view.frame.size.width - 2*leftMargin, 30);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView
{
    CGFloat originY = CGRectGetMaxY([self pageController:pageController preferredFrameForMenuView:self.menuView]);
    return CGRectMake(0, originY, self.view.frame.size.width, self.view.frame.size.height - originY);
}

-(ZFCommodityInforVC *)vc1
{
    if (_vc1==nil)
    {
        _vc1 = [[ZFCommodityInforVC alloc]init];
        _vc1.type = @"0";
    }
    return _vc1;
}

-(ZFStoreConcernVC *)vc2
{
    if (_vc2==nil)
    {
        _vc2 = [[ZFStoreConcernVC alloc]init];
        _vc2.type = @"1";
    }
    return _vc2;
}

//当key路径对应的属性值发生改变时，监听器就会回调自身的监听方法，如下
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)contex
{
    ZFCommodityInforVC* vc = (ZFCommodityInforVC*)object;
    int type = vc.type.intValue;
    if (type==0)
    {
        [self updateTitle:[NSString stringWithFormat:@"商品"] atIndex:type];
    }
    else if (type==1)
    {
        [self updateTitle:[NSString stringWithFormat:@"店铺"] atIndex:type];
    }
}



@end
