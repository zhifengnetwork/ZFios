//
//  ZFMyColumnTableCell.m
//  ZF
//
//  Created by admin on 2019/3/20.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMyColumnTableCell.h"
#import "ZFMyOrderHeadView.h"
#import "ZFMyOrderCollectionCell.h"


@interface ZFMyColumnTableCell ()<UICollectionViewDelegate, UICollectionViewDataSource,ZFMyOrderCollectionCellDelegate>

@property (nonatomic, strong) ZFMyOrderHeadView* orderHeadView;
@property (nonatomic, strong) UICollectionView* collectionView;

@end


@implementation ZFMyColumnTableCell

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
    _collectionView.backgroundColor = [UIColor whiteColor];
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
        make.height.mas_equalTo(180);
    }];
}


#pragma mark - dataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZFMyOrderCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFMyOrderCollectionCellID forIndexPath:indexPath];
    if (indexPath.item==0)
    {
        cell.title = @"账户明细";
        cell.iconName = @"zhmx1";
    }
    else if (indexPath.item==1)
    {
        cell.title = @"奖金提现";
        cell.iconName = @"JJTX";
    }
    else if (indexPath.item==2)
    {
        cell.title = @"拍卖";
        cell.iconName = @"PM";
    }
    else if (indexPath.item==3)
    {
        cell.title = @"拼团";
        cell.iconName = @"PT";
    }
    else if (indexPath.item==4)
    {
        cell.title = @"我的团队";
        cell.iconName = @"TU2";
    }
    else if (indexPath.item==5)
    {
        cell.title = @"我的分享";
        cell.iconName = @"Share";
    }
    else if (indexPath.item==6)
    {
        cell.title = @"签到次数";
        cell.iconName = @"Sign in";
    }
    else if (indexPath.item==7)
    {
        cell.title = @"我的信息";
        cell.iconName = @"Information";
    }
    else if (indexPath.item==8)
    {
        cell.title = @"我的分销";
        cell.iconName = @"Distribution";
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
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(ZFMyColumnTableCellDidClick:)])
    {
        [self.delegate ZFMyColumnTableCellDidClick:indexPath];
    }
}


-(ZFMyOrderHeadView*)orderHeadView
{
    if (_orderHeadView==nil)
    {
        _orderHeadView = [[ZFMyOrderHeadView alloc]init];
        _orderHeadView.leftTitle = @"我的专栏";
        _orderHeadView.isShowButton = NO;
//        _orderHeadView.rightTitle = @"查看全部专栏";
        //头部点击事件
        _orderHeadView.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [_orderHeadView addGestureRecognizer:singleTap];
    }
    
    return _orderHeadView;
}

- (void)handleSingleTap:(UITouch *)touch
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFMyColumnHeadViewDidClick)])
    {
        [self.delegate ZFMyColumnHeadViewDidClick];
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
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[ZFMyOrderCollectionCell class] forCellWithReuseIdentifier:ZFMyOrderCollectionCellID];
    }
    return _collectionView;
}


@end
