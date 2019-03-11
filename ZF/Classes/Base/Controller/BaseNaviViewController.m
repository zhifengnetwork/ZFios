//
//  BaseNaviViewController.m
//  LS
//
//  Created by ZMac on 2018/11/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "BaseNaviViewController.h"

@interface BaseNaviViewController ()<UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@end

@implementation BaseNaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    __weak BaseNaviViewController *weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])  {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        self.delegate = weakSelf;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController<UIGestureRecognizerDelegate> *)viewController animated:(BOOL)animated
{
    
    if (self.childViewControllers.count == 0)
    {
        self.interactivePopGestureRecognizer.enabled = NO;
        
    }
    else
    {
        self.interactivePopGestureRecognizer.delegate = viewController;
        
        //隐藏底部条
        viewController.hidesBottomBarWhenPushed = YES;
        
        [self setNaviagtionItem:viewController];
    }
    
    [super pushViewController:viewController animated:animated];
}

#pragma mark - UINavigationControllerDelegate

// 在控制器已经出现的时候，将右划返回打开
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        if (self.viewControllers.count <= 1)
        {
            self.interactivePopGestureRecognizer.enabled = NO;
        }
        else
        {
            self.interactivePopGestureRecognizer.enabled = YES;
        }
    }
}


- (void)setNaviagtionItem:(UIViewController<UIGestureRecognizerDelegate> *)viewController
{
    //添加左边按钮
    UIImage *img = [UIImage imageNamed:@"icon-left-arrows2"];
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:img style:UIBarButtonItemStylePlain target:self action:@selector(LeftButtonDidClick:)];
}

#pragma mark - action
- (void)LeftButtonDidClick:(UIButton *)button
{
    [self popViewControllerAnimated:YES];
}


@end
