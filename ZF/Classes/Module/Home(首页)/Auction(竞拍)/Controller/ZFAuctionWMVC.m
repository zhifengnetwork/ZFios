//
//  ZFAuctionWMVC.h
//  ZF
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFAuctionWMVC.h"
#import "ZFAuctionVC.h"
#import "ZFAuctionEndVC.h"
#import "ZFSpikeVC.h"
#import "ZFTool.h"
#import "ZFStartAuctionVC.h"
#import "ZFAssembleVC.h"
#import "ZFEndSpikeVC.h"



@interface ZFAuctionWMVC ()

@end

@implementation ZFAuctionWMVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [ZFTool isHiddenNavigationBarSeparatorLine:YES vc:self];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [ZFTool isHiddenNavigationBarSeparatorLine:NO vc:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController
{
    return 3;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index
{
    if (index==0)
    {
        return @"竞拍";
    }
    else if (index==1)
    {
        return @"拼团";
    }
    else if (index==2)
    {
        return @"秒杀";
    }
    
    return @"";
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index
{
    if (index==0)
    {
        ZFStartAuctionVC *vc = [[ZFStartAuctionVC alloc]init];
        return vc;
    }
    else if (index==1)
    {
        ZFEndSpikeVC *vc = [[ZFEndSpikeVC alloc]init];
        return vc;
    }
    else if (index==2)
    {
        ZFSpikeVC *vc = [[ZFSpikeVC alloc]init];
        return vc;
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
    CGFloat leftMargin = self.showOnNavigationBar ? 50 : 0;
    CGFloat originY = self.showOnNavigationBar ? 0 : CGRectGetMaxY(self.navigationController.navigationBar.frame);
    return CGRectMake(leftMargin, originY, self.view.frame.size.width - 2*leftMargin, 44);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView
{
    CGFloat originY = CGRectGetMaxY([self pageController:pageController preferredFrameForMenuView:self.menuView]);
    return CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}



@end
