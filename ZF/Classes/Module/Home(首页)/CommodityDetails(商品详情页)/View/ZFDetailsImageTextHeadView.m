//
//  ZFDetailsImageTextHeadView.m
//  ZF
//
//  Created by apple on 28/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFDetailsImageTextHeadView.h"

@interface ZFDetailsImageTextHeadView ()

@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) UILabel* nameLabel;
@property (nonatomic, strong) UIView *lineView1;
@property (nonatomic, strong) UIView *lineView2;
@property (nonatomic, strong) UILabel* infoLabel;


@property (nonatomic, strong) NSArray *types;
@property (nonatomic, strong) NSString *type;


@end

@implementation ZFDetailsImageTextHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.nameLabel];
    [self addSubview:self.segmentedControl];
    [self addSubview:self.lineView1];
    [self addSubview:self.lineView2];
    [self addSubview:self.infoLabel];
    
    [_segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(5);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(30);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.mas_equalTo(60);
    }];
    
    [_lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nameLabel);
        make.right.equalTo(self.nameLabel.mas_left).offset(-10);
        make.height.mas_equalTo(0.5f);
        make.width.mas_equalTo(30);
    }];
    
    [_lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nameLabel);
        make.left.equalTo(self.nameLabel.mas_right).offset(10);
        make.height.mas_equalTo(0.5f);
        make.width.mas_equalTo(30);
    }];
    
    [_infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(15);
    }];
    
}

//
//- (UILabel *)nameLabel {
//    if (_nameLabel == nil) {
//        _nameLabel = [[UILabel alloc] init];
//        _nameLabel.textColor = RGBColorHex(0x000000);
//        _nameLabel.font = [UIFont systemFontOfSize:12];
//        _nameLabel.text = @"商品详情";
//    }
//    return _nameLabel;
//}
//
//- (UILabel *)infoLabel {
//    if (_infoLabel == nil) {
//        _infoLabel = [[UILabel alloc] init];
//        _infoLabel.textColor = RGBColorHex(0x000000);
//        _infoLabel.font = [UIFont systemFontOfSize:12];
//        _infoLabel.text = @"规格参数";
//    }
//    return _infoLabel;
//}


-(UISegmentedControl*)segmentedControl
{
    if (!_segmentedControl)
    {
        _segmentedControl = [[UISegmentedControl alloc] initWithItems:self.types];
        [_segmentedControl setSelectedSegmentIndex:0];
        _segmentedControl.tintColor = [UIColor whiteColor];
        //设置普通状态下(未选中)状态下的文字颜色和字体
        [_segmentedControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: RGBColorHex(0x747474)} forState:UIControlStateNormal];
        //设置选中状态下的文字颜色和字体
        [_segmentedControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName:RGBColorHex(0xda2a20)} forState:UIControlStateSelected];
        //添加监听
        [self.segmentedControl addTarget:self action:@selector(sementedControlClick:) forControlEvents:UIControlEventValueChanged];
    }
    
    return _segmentedControl;
}

-(void)setIsShowIt:(BOOL)isShowIt
{
    _isShowIt = isShowIt;
    if (_isShowIt) {
        [_segmentedControl setSelectedSegmentIndex:1];
    }
    else
    {
        [_segmentedControl setSelectedSegmentIndex:0];
    }
}


//点击不同分段就会有不同的事件进行相应
-(void)sementedControlClick:(UISegmentedControl *)sender
{
    self.type = [self.types objectAtIndex:sender.selectedSegmentIndex];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFDetailsImageTextHeadViewDidClick:)])
    {
        [self.delegate ZFDetailsImageTextHeadViewDidClick:_type];
    }
}


-(NSArray *)types
{
    if (!_types)
    {
        _types = @[@"商品详情",@"规格参数"];
    }
    
    return _types;
}


//- (UIView *)lineView1 {
//    if (_lineView1 == nil) {
//        _lineView1 = [[UIView alloc] init];
//        _lineView1.backgroundColor = RGBColorHex(0x000000);
//    }
//    return _lineView1;
//}
//
//- (UIView *)lineView2 {
//    if (_lineView2 == nil) {
//        _lineView2 = [[UIView alloc] init];
//        _lineView2.backgroundColor = RGBColorHex(0x000000);
//    }
//    return _lineView2;
//}

@end
