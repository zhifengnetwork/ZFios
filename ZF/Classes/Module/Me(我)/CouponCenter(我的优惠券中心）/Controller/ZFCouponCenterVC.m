//
//  LKCouponWMVC.m
//  LK
//
//  Created by hyy on 2018/11/29.
//  Copyright © 2018 LKQN. All rights reserved.
//

#import "ZFCouponCenterVC.h"
#import "ZFCouponVC.h"
//#import "LKTool.h"


@interface ZFCouponCenterVC ()

@property (nonatomic, strong) ZFCouponVC *vc1;
@property (nonatomic, strong) ZFCouponVC *vc2;
@property (nonatomic, strong) ZFCouponVC *vc3;
//@property (nonatomic, strong) UIView *lineView;
@end

@implementation ZFCouponCenterVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"优惠券";
    
    self.navigationItem.leftBarButtonItem.image = [UIImage imageNamed:@"Back"];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor blackColor];
//    UIImage *imgRight = [UIImage imageNamed:@"icon_more"];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[imgRight imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonDidClick)];
}
- (WMMenuViewStyle)menuViewStyle{
    return WMMenuViewStyleLine;
}

- (void)rightButtonDidClick
{
    //更多
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    
    self.menuViewStyle = WMMenuViewStyleLine;
//    [LKTool isHiddenNavigationBarSeparatorLine:NO vc:self];
    [self.vc1 addObserver:self forKeyPath:@"ccount" options:NSKeyValueObservingOptionNew context:nil];
    [self.vc2 addObserver:self forKeyPath:@"ccount" options:NSKeyValueObservingOptionNew context:nil];
    [self.vc3 addObserver:self forKeyPath:@"ccount" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    [LKTool isHiddenNavigationBarSeparatorLine:YES vc:self];
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
        return @"未使用";
    }
    else if (index==1)
    {
        return @"使用记录";
    }
    else if (index==2)
    {
        return @"已过期";
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
    return width + 20;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView
{
    
    CGFloat leftMargin = 0;
    CGFloat originY = 0;
    return CGRectMake(leftMargin, originY, self.view.frame.size.width - 2*leftMargin, 44);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView
{
    CGFloat originY = CGRectGetMaxY([self pageController:pageController preferredFrameForMenuView:self.menuView]);
    return CGRectMake(0, originY, self.view.frame.size.width, self.view.frame.size.height - originY);
}

-(ZFCouponVC *)vc1
{
    if (_vc1==nil)
    {
        _vc1 = [[ZFCouponVC alloc]init];
        _vc1.type = 0;
    }
    return _vc1;
}

-(ZFCouponVC *)vc2
{
    if (_vc2==nil)
    {
        _vc2 = [[ZFCouponVC alloc]init];
        _vc2.type = 1;
    }
    return _vc2;
}

-(ZFCouponVC *)vc3
{
    if (_vc3==nil)
    {
        _vc3 = [[ZFCouponVC alloc]init];
        _vc3.type = 2;
    }
    return _vc3;
}


//当key路径对应的属性值发生改变时，监听器就会回调自身的监听方法，如下
//- (void)observeValueForKeyPath:(NSString *)keyPath
//                      ofObject:(id)object
//                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
//                       context:(void *)contex
//{
//    ZFCouponVC* vc = (ZFCouponVC*)object;
//    int type = vc.type.intValue;
//    if (type==0)
//    {
//        [self updateTitle:[NSString stringWithFormat:@"未使用(%d)",vc.ccount.intValue] atIndex:type];
//    }
//    else if (type==1)
//    {
//        [self updateTitle:[NSString stringWithFormat:@"使用记录(%d)",vc.ccount.intValue] atIndex:type];
//    }
//    else if (type==2)
//    {
//        [self updateTitle:[NSString stringWithFormat:@"已过期(%d)",vc.ccount.intValue] atIndex:type];
//    }
//}



@end
