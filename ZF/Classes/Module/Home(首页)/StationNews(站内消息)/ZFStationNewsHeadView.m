//
//  ZFStationNewsHeadView.m
//  ZF
//
//  Created by apple on 06/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFStationNewsHeadView.h"

@interface ZFStationNewsHeadView()

@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) NSArray *types;
@property (nonatomic, strong) NSString *type;

@end


@implementation ZFStationNewsHeadView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    
    [self addSubview:self.segmentedControl];
    
    [_segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(-1);
        make.right.bottom.mas_equalTo(1);
    }];
}



-(UISegmentedControl*)segmentedControl
{
    if (!_segmentedControl)
    {
        _segmentedControl = [[UISegmentedControl alloc] initWithItems:self.types];
        [_segmentedControl setSelectedSegmentIndex:0];
        _segmentedControl.tintColor = RGBColor(208,107,34);
        //设置普通状态下(未选中)状态下的文字颜色和字体
        [_segmentedControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName: RGBColor(208,107,34)} forState:UIControlStateNormal];
        //设置选中状态下的文字颜色和字体
        [_segmentedControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName: [UIColor whiteColor]} forState:UIControlStateSelected];
        //添加监听
        [self.segmentedControl addTarget:self action:@selector(sementedControlClick:) forControlEvents:UIControlEventValueChanged];
    }
    
    return _segmentedControl;
}


//点击不同分段就会有不同的事件进行相应
-(void)sementedControlClick:(UISegmentedControl *)sender
{
    self.type = [self.types objectAtIndex:sender.selectedSegmentIndex];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFStationNewsHeadViewDidClick:)])
    {
        [self.delegate ZFStationNewsHeadViewDidClick:_type];
    }
}


-(NSArray *)types
{
    if (!_types)
    {
        _types = @[@"信息",@"公告"];
    }
    
    return _types;
}

@end
