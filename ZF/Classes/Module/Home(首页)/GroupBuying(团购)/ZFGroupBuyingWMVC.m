//
//  ZFGroupBuyingWMVC.m
//  ZF
//
//  Created by admin on 2019/5/15.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFGroupBuyingWMVC.h"
#import "ZFGroupBuyingVC.h"
#import "ZFTool.h"


@interface ZFGroupBuyingWMVC ()

@property (nonatomic, strong) ZFGroupBuyingVC *vc1;
@property (nonatomic, strong) ZFGroupBuyingVC *vc2;
@property (nonatomic, strong) ZFGroupBuyingVC *vc3;

@end

@implementation ZFGroupBuyingWMVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"团购";
    
//    UIImage *imgRight = [UIImage imageNamed:@"All"];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[imgRight imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(editButtonDidClick)];
//    self.scrollEnable = NO;
}


- (void)editButtonDidClick
{
    //更多
//    [self.vc1 editButtonDidClick];
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
    [self.vc3 addObserver:self forKeyPath:@"ccount" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [ZFTool isHiddenNavigationBarSeparatorLine:YES vc:self];
    [self.vc1 removeObserver:self forKeyPath:@"ccount" context:nil];
    [self.vc2 removeObserver:self forKeyPath:@"ccount" context:nil];
    [self.vc3 removeObserver:self forKeyPath:@"ccount" context:nil];
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController
{
    return 3;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index
{
    if (index==0)
    {
        return @"默认";
    }
    else if (index==1)
    {
        return @"最新";
    }
    else if (index==2)
    {
        return @"评论数";
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
    else if (index==2)
    {
        return self.vc3;
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
    return CGRectMake(leftMargin, originY, self.view.frame.size.width - 3*leftMargin, 40);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView
{
    CGFloat originY = CGRectGetMaxY([self pageController:pageController preferredFrameForMenuView:self.menuView]);
    return CGRectMake(0, originY, self.view.frame.size.width, self.view.frame.size.height - originY);
}

-(ZFGroupBuyingVC *)vc1
{
    if (_vc1==nil)
    {
        _vc1 = [[ZFGroupBuyingVC alloc]init];
        _vc1.type = @"0";
    }
    return _vc1;
}

-(ZFGroupBuyingVC *)vc2
{
    if (_vc2==nil)
    {
        _vc2 = [[ZFGroupBuyingVC alloc]init];
        _vc2.type = @"1";
    }
    return _vc2;
}

-(ZFGroupBuyingVC *)vc3
{
    if (_vc3==nil)
    {
        _vc3 = [[ZFGroupBuyingVC alloc]init];
        _vc3.type = @"2";
    }
    return _vc3;
}

//当key路径对应的属性值发生改变时，监听器就会回调自身的监听方法，如下
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)contex
{
    ZFGroupBuyingVC* vc = (ZFGroupBuyingVC*)object;
    int type = vc.type.intValue;
    if (type==0)
    {
        [self updateTitle:[NSString stringWithFormat:@"默认"] atIndex:type];
    }
    else if (type==1)
    {
        [self updateTitle:[NSString stringWithFormat:@"最新"] atIndex:type];
    }
    else if (type==2)
    {
        [self updateTitle:[NSString stringWithFormat:@"评论数"] atIndex:type];
    }
}


@end
