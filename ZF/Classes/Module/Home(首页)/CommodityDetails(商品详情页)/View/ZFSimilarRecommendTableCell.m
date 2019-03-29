//
//  ZFSimilarRecommendTableCell.m
//  ZF
//
//  Created by apple on 28/03/2019.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFSimilarRecommendTableCell.h"
#import "ZFMerchandiseSaleCollectionCell.h"

@interface ZFSimilarRecommendTableCell ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UIButton* button1;
@property (nonatomic, strong) UIButton* button2;
@property (nonatomic, strong) UIView *lineView1;
@property (nonatomic, strong) UIView *lineView2;

@property (nonatomic, strong) UICollectionView* collectionView;

@property (nonatomic, assign) BOOL isSimilar;

@end

@implementation ZFSimilarRecommendTableCell

static NSString *const ZFMerchandiseSaleCollectionCellID = @"ZFMerchandiseSaleCollectionCellID";

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setup];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setup
{
    self.contentView.backgroundColor = RGBColorHex(0xffffff);
    
    [self addSubview:self.button1];
    [self addSubview:self.button2];
    [self addSubview:self.lineView1];
    [self addSubview:self.lineView2];
    [self.contentView addSubview:self.collectionView];
    
    [_button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(15);
        make.right.equalTo(self.mas_centerX).offset(-30);
    }];
    
    [_button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(15);
        make.left.equalTo(self.mas_centerX).offset(30);
    }];
    
    [_lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.button1.mas_bottom).offset(1);
        make.left.right.equalTo(self.button1);
        make.height.mas_equalTo(1);
    }];
    
    [_lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.button2.mas_bottom).offset(1);
        make.left.right.equalTo(self.button2);
        make.height.mas_equalTo(1);
    }];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_button1.mas_bottom).offset(10);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(330);
    }];
    
    
    //下面横线
    UIView *hLineView = [[UIView alloc] init];
    hLineView.backgroundColor = RGBColorHex(0xE8E8E8);
    [self addSubview:hLineView];
    
    [hLineView mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.mas_equalTo(0);
         make.right.mas_equalTo(-0);
         make.top.equalTo(self->_button1.mas_bottom).offset(1);
         make.height.mas_equalTo(0.25f);
     }];
    
    self.isSimilar = YES;
    [self updateUI];
}

-(void)button1DidClick
{
    self.isSimilar = YES;
    [self updateUI];
}

-(void)button2DidClick
{
    self.isSimilar = NO;
    [self updateUI];
}

-(void)updateUI
{
    if (self.isSimilar)
    {
        self.lineView1.hidden = NO;
        self.lineView2.hidden = YES;
    }
    else
    {
        self.lineView1.hidden = YES;
        self.lineView2.hidden = NO;
    }
}


#pragma mark - dataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZFMerchandiseSaleCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFMerchandiseSaleCollectionCellID forIndexPath:indexPath];
    
    return cell;
}


//预览cell点击
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}


- (UIButton *)button1
{
    if (_button1 == nil) {
        _button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button1 setTitle:@"相似推荐" forState:UIControlStateNormal];
        [_button1 setTitleColor:RGBColorHex(0x2E2E2E) forState:UIControlStateNormal];
        _button1.titleLabel.font = [UIFont systemFontOfSize:17];
        [_button1 addTarget:self action:@selector(button1DidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button1;
}

- (UIButton *)button2
{
    if (_button2 == nil) {
        _button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button2 setTitle:@"同类热销排行" forState:UIControlStateNormal];
        [_button2 setTitleColor:RGBColorHex(0x2E2E2E) forState:UIControlStateNormal];
        _button2.titleLabel.font = [UIFont systemFontOfSize:17];
        [_button2 addTarget:self action:@selector(button2DidClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button2;
}

- (UIView *)lineView1 {
    if (_lineView1 == nil) {
        _lineView1 = [[UIView alloc] init];
        _lineView1.backgroundColor = RGBColorHex(0x000000);
    }
    return _lineView1;
}

- (UIView *)lineView2 {
    if (_lineView2 == nil) {
        _lineView2 = [[UIView alloc] init];
        _lineView2.backgroundColor = RGBColorHex(0x000000);
    }
    return _lineView2;
}


- (UICollectionView *)collectionView {
    if (_collectionView == nil)
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        float fw = (kScreenWidth-30-10*3)*0.33;
        layout.itemSize = CGSizeMake(fw, 160);
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        [_collectionView registerClass:[ZFMerchandiseSaleCollectionCell class] forCellWithReuseIdentifier:ZFMerchandiseSaleCollectionCellID];
    }
    return _collectionView;
}

@end
