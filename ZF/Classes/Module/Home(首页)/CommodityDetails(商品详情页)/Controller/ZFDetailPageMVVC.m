
//
//  ZFDetailPageMVVC.m
//  ZF
//
//  Created by weiming zhang on 2019/5/16.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDetailPageMVVC.h"
#import "ZFTool.h"
#import "ZFDetailsPageVC.h"
#import "ZFEvaluationVC.h"

@interface ZFDetailPageMVVC ()
@property (nonatomic, strong)ZFDetailsPageVC *vc1;
@property (nonatomic, strong)ZFEvaluationVC *vc2;
@property (nonatomic, strong)UIButton *backButton;
@property (nonatomic, strong)UIButton *mainButton;
@end

@implementation ZFDetailPageMVVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.menuView addSubview:self.backButton];
    [self.menuView addSubview:self.mainButton];
    
    [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(12);
        make.centerY.equalTo(self.menuView.mas_centerY);
    }];
    
    [_mainButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).with.offset(-12);
        make.centerY.equalTo(self.menuView.mas_centerY);
    }];
    
    self.navigationController.navigationBar.hidden = YES;
    [ZFTool isHiddenNavigationBarSeparatorLine:NO vc:self];
    [self.vc1 addObserver:self forKeyPath:@"ccount" options:NSKeyValueObservingOptionNew context:nil];
    [self.vc2 addObserver:self forKeyPath:@"ccount" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
    [ZFTool isHiddenNavigationBarSeparatorLine:YES vc:self];
    [self.vc1 removeObserver:self forKeyPath:@"ccount" context:nil];
    [self.vc2 removeObserver:self forKeyPath:@"ccount" context:nil];
}

- (UIButton *)backButton{
    if (_backButton == nil) {
        _backButton = [[UIButton alloc]init];
        [_backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    }return _backButton;
}

- (UIButton *)mainButton{
    if (_mainButton == nil) {
        _mainButton = [[UIButton alloc]init];
        [_mainButton setImage:[UIImage imageNamed:@"More"] forState:UIControlStateNormal];
        [_mainButton addTarget:self action:@selector(mainClick) forControlEvents:UIControlEventTouchUpInside];
    }return _mainButton;
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
        return @"评论";
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
    return 45;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView
{
    CGFloat leftMargin = LL_ScreenWidth-140/2;
    CGFloat originY = 20;
    return CGRectMake(leftMargin, originY, self.view.frame.size.width - 2*leftMargin, 40);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView
{
    CGFloat originY = CGRectGetMaxY([self pageController:pageController preferredFrameForMenuView:self.menuView]);
    return CGRectMake(0, originY, self.view.frame.size.width, self.view.frame.size.height - originY);
}

-(ZFDetailsPageVC *)vc1
{
    if (_vc1==nil)
    {
        _vc1 = [[ZFDetailsPageVC alloc]init];
        _vc1.goods_id = _goods_id;
    }
    return _vc1;
}

-(ZFEvaluationVC *)vc2
{
    if (_vc2==nil)
    {
        _vc2 = [[ZFEvaluationVC alloc]init];
        _vc2.goods_id = _goods_id;
    }
    return _vc2;
}

- (void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)mainClick{
    
}

////当key路径对应的属性值发生改变时，监听器就会回调自身的监听方法，如下
//- (void)observeValueForKeyPath:(NSString *)keyPath
//                      ofObject:(id)object
//                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
//                       context:(void *)contex
//{
//    ZFGroupBuyingVC* vc = (ZFGroupBuyingVC*)object;
//    int type = vc.type.intValue;
//    if (type==0)
//    {
//        [self updateTitle:[NSString stringWithFormat:@"商品"] atIndex:type];
//    }
//    else if (type==1)
//    {
//        [self updateTitle:[NSString stringWithFormat:@"评论"] atIndex:type];
//    }
//
//}


@end

