//
//  ZFXuXianView.m
//  ZF
//
//  Created by weiming zhang on 2019/3/12.
//  Copyright © 2019年 hyy. All rights reserved.
//

#import "ZFXuXianView.h"

@implementation ZFXuXianView

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(currentContext, [UIColor lightGrayColor].CGColor);//设置线的颜色
    //设置虚线宽度
    CGContextSetLineWidth(currentContext, 1);
    //设置虚线绘制起点
    CGContextMoveToPoint(currentContext, 0, 0);
    //设置虚线绘制终点
    CGContextAddLineToPoint(currentContext, self.frame.origin.x + self.frame.size.width, 0);
    //设置虚线排列的宽度间隔:下面的arr中的数字表示先绘制3个点再绘制1个点
    CGFloat arr[] = {3,1};
    //下面最后一个参数“2”代表排列的个数。
    CGContextSetLineDash(currentContext, 4, arr, 1);
    CGContextDrawPath(currentContext, kCGPathStroke);
}

@end
