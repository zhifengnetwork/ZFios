//
//  ZFMenu.m
//  ZF
//
//  Created by weiming zhang on 2019/3/12.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFMenu.h"
#define KBounds self.bounds
#define KFrame self.frame
#define KSetFrameHeight(A,B) CGRectMake(A.frame.origin.x,A.frame.origin.y,A.frame.size.width,B)
#define KRowHeight 30
@interface ZFMenu()
@property (nonatomic,strong)UIButton *mainBtn;//主按钮
@property (nonatomic,assign)BOOL isShow; //标记视图显示状态
@property  (nonatomic,strong)UIView *bgroundView;//标记背景视图
@property (nonatomic,assign)CGRect tempFrame; //记录按钮初始值
@property (nonatomic, nonnull,strong)CAShapeLayer *sanjiaoLayer;
@end
@implementation ZFMenu
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        self.tempFrame = frame;
        self.isShow = NO;
    }
    return self;
}
- (CAShapeLayer *)sanjiaoLayer{
    if (!_sanjiaoLayer) {
        self.sanjiaoLayer = [self createLayer];
    }
    return _sanjiaoLayer;
}
- (UIView *)bgroundView{
    if (!_bgroundView) {
        self.bgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(KBounds), CGRectGetWidth(KBounds), 0)];
    }
    return _bgroundView;
}
// 设置主按钮
- (UIButton *)mainBtn{
    if (!_mainBtn) {
        self.mainBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_mainBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [_mainBtn addTarget:self action:@selector(mainBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        _mainBtn.backgroundColor = [UIColor lightGrayColor];
        _mainBtn.frame = KBounds;
        [_mainBtn.layer addSublayer:self.sanjiaoLayer];
    }
    return _mainBtn;
}
// 设置主按钮点击事件
- (void)mainBtnAction:(UIButton *)sender{
    if (_isShow) {    // 如果显示,就隐藏
        [self hiddenMenu];
    }else {          // 如果隐藏,就显示
        [self openMenu];
    }
}
// 设置子视图
- (void)setup{
    [self addSubview:self.mainBtn];
    [self addSubview:self.bgroundView];
    self.layer.masksToBounds = YES;
    self.bgroundView.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor redColor];
}
// 设置菜单标题
- (void)setMainMenuTitle:(NSString *)title chlidTitleAry:(NSArray *)childTitleAry{
    [self.mainBtn setTitle:title forState:(UIControlStateNormal)];
    [childTitleAry enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = [self createChildBtnTitle:obj rect:CGRectMake(0, idx * KRowHeight, CGRectGetWidth(KFrame), KRowHeight)];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        btn.tag = 2000 + idx;
        [self->_bgroundView addSubview:btn];
    }];
}
// 设置子按钮点击事件
- (void)btnAction:(UIButton *)sender{
    if (!self.delegate) {NSLog(@"没有设置代理"); return;}
    if ([self.delegate respondsToSelector:@selector(zfMenu: selectChildMenu:)]) {
        [self.delegate zfMenu:self selectChildMenu:sender.tag - 2000];
    }
}
// 菜单将要出现
- (void)downMenuWillShow{
    NSLog(@"222222");
    if (!self.delegate) {NSLog(@"没有设置代理"); return;}
    if ([self.delegate respondsToSelector:@selector(downMenuWillShow)]) {
        [self.delegate zfMenuWillShow];
    }
}
// 菜单已经出现
- (void)downMenuDidShow{
    if (!self.delegate) {NSLog(@"没有设置代理"); return;}
    if ([self.delegate respondsToSelector:@selector(downMenuDidShow)]) {
        [self.delegate zfMenuDidShow];
    }
}
// 菜单将要消失
- (void)downMenuWillHidden{
    if (!self.delegate) {NSLog(@"没有设置代理"); return;}
    if ([self.delegate respondsToSelector:@selector(downMenuWillHidden)]) {
        [self.delegate zfMenuWillHidden];
    }
}
// 菜单已经消失
- (void)downMenuDidHidden{
    if (!self.delegate) {NSLog(@"没有设置代理"); return;}
    if ([self.delegate respondsToSelector:@selector(downMenuDidHidden)]) {
        [self.delegate zfMenuDidHidden];
    }
}
// 展开菜单
- (void)openMenu{
    [self downMenuWillShow];
    [UIView animateWithDuration:0.3 delay:0 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        self.frame = KSetFrameHeight(self, self.tempFrame.size.height + KRowHeight * (self.subviews[1].subviews.count));
        self.bgroundView.frame = KSetFrameHeight(self.bgroundView, KRowHeight * (self.subviews[1].subviews.count));
        self.sanjiaoLayer.transform = CATransform3DRotate(CATransform3DIdentity, M_PI, 1, 0, 0);
        self.isShow = YES;
    } completion:^(BOOL finished) {
        [self downMenuDidShow];
    }];
}
// 收回菜单
- (void)hiddenMenu{
    [self downMenuWillHidden];
    [UIView animateWithDuration:0.3 delay:0 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        self.frame = KSetFrameHeight(self, self.tempFrame.size.height);
        self.bgroundView.frame = KSetFrameHeight(self.bgroundView, 0);
        self.sanjiaoLayer.transform = CATransform3DIdentity;
        self.isShow = NO;
    } completion:^(BOOL finished) {
        [self downMenuDidHidden];
    }];
}
// 创建一个btn
- (UIButton *)createChildBtnTitle:(NSString *)title rect:(CGRect)frame{
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn setTitle:title forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    btn.frame = frame;
    return btn;
}
// 创建小三角
- (CAShapeLayer *)createLayer{
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.position = CGPointMake(self.mainBtn.frame.size.width - 16, CGRectGetMidY(self.mainBtn.frame));
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(10, 0)];
    [path addLineToPoint:CGPointMake(5, cos(30 * M_PI_2 / 180) * 5)];
    [path addLineToPoint:CGPointMake(0, 0)];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor blackColor].CGColor;
    return layer;
}

@end
