//
//  ZFMyOrderTableCell.m
//  ZF
//
//  Created by apple on 2019/3/18.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMyOrderTableCell.h"
#import "ZFMyOrderHeadView.h"
#import "ZFMyOrderCollectionCell.h"


@interface ZFMyOrderTableCell ()<UICollectionViewDelegate, UICollectionViewDataSource,ZFMyOrderCollectionCellDelegate>

@property (nonatomic, strong) ZFMyOrderHeadView* orderHeadView;
@property (nonatomic, strong) UICollectionView* collectionView;

@end


@implementation ZFMyOrderTableCell

static NSString *const ZFMyOrderCollectionCellID = @"ZFMyOrderCollectionCellID";


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
    [self.contentView addSubview:self.orderHeadView];
    [self.contentView addSubview:self.collectionView];
    
    [_orderHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(1);
        make.left.right.equalTo(self.contentView);
        make.height.mas_equalTo(26);
    }];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_orderHeadView.mas_bottom).offset(1);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(60);
    }];
}


#pragma mark - dataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZFMyOrderCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFMyOrderCollectionCellID forIndexPath:indexPath];
    if (indexPath.item==0)
    {
        cell.title = @"待付款";
        cell.iconName = @"Pending Payment ";
    }
    else if (indexPath.item==1)
    {
        cell.title = @"待发货";
        cell.iconName = @"Pending Shipment";
    }
    else if (indexPath.item==2)
    {
        cell.title = @"待收货";
        cell.iconName = @"To be shipped";
    }
    else if (indexPath.item==3)
    {
        cell.title = @"待评价";
        cell.iconName = @"To be evaluated";
    }
    
    cell.indexPath = indexPath;
    cell.delegate = self;
    
    return cell;
}


//预览cell点击
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   
}


/**
 待付款被点击
 */
- (void)ZFMyOrderCollectionCellDidClick:(NSIndexPath*)indexPath
{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(ZFMyOrderTableCellDidClick:)])
    {
        [self.delegate ZFMyOrderTableCellDidClick:indexPath];
    }
}

-(ZFMyOrderHeadView*)orderHeadView
{
    if (_orderHeadView==nil)
    {
        _orderHeadView = [[ZFMyOrderHeadView alloc]init];
        //头部点击事件
        _orderHeadView.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [_orderHeadView addGestureRecognizer:singleTap];
    }
    
    return _orderHeadView;
}


- (void)handleSingleTap:(UITouch *)touch
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFMyOrderHeadViewDidClick)])
    {
        [self.delegate ZFMyOrderHeadViewDidClick];
    }
}


- (UICollectionView *)collectionView {
    if (_collectionView == nil)
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        float fw = (kScreenWidth-30)*0.25;
        layout.itemSize = CGSizeMake(fw, 60);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[ZFMyOrderCollectionCell class] forCellWithReuseIdentifier:ZFMyOrderCollectionCellID];
    }
    return _collectionView;
}

@end
