//
//  ZFMyWalletTableCell.m
//  ZF
//
//  Created by admin on 2019/3/20.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMyWalletTableCell.h"
#import "ZFMyOrderHeadView.h"
#import "ZFBalanceControllerCell.h"

@interface ZFMyWalletTableCell()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) ZFMyOrderHeadView* orderHeadView;
@property (nonatomic, strong) UICollectionView* collectionView;

@end


@implementation ZFMyWalletTableCell

static NSString *const ZFBalanceControllerCellID = @"ZFBalanceControllerCellID";


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
        make.height.mas_equalTo(74);
    }];
}


#pragma mark - dataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZFBalanceControllerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFBalanceControllerCellID forIndexPath:indexPath];
    cell.userInfo = self.userInfo;
//    if (indexPath.item==0)
//    {
//        cell.iconName = @"JF1";
//        cell.title = @"积分";
////        cell.number = @"3000";
//        cell.number = [NSString stringWithFormat:@"%@",_userInfo.pay_points];
//    }
//    else if (indexPath.item==1)
//    {
//        cell.iconName = @"YHJ1";
//        cell.title = @"优惠券";
////        cell.number = @"30";
//        cell.number = [NSString stringWithFormat:@"%@",_userInfo.coupon_num];
//
//    }
//    cell.indexPath = indexPath;
//    cell.delegate = self;
    
    return cell;
}

- (void)setUserInfo:(UserInfoModel *)userInfo{
    _userInfo = userInfo;
    [_collectionView reloadData];
}

//预览cell点击
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

/**
 积分被点击
 */
- (void)ZFMyWalletControllerCellDidClick:(NSIndexPath*)indexPath
{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(ZFMyWalletTableCellDidClick:)])
    {
        [self.delegate ZFMyWalletTableCellDidClick:indexPath];
    }
}


-(ZFMyOrderHeadView*)orderHeadView
{
    if (_orderHeadView==nil)
    {
        _orderHeadView = [[ZFMyOrderHeadView alloc]init];
        _orderHeadView.leftTitle = @"我的钱包";
        _orderHeadView.rightTitle = @"查看钱包";
        //头部点击事件
        _orderHeadView.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [_orderHeadView addGestureRecognizer:singleTap];
    }
    
    return _orderHeadView;
}

- (void)handleSingleTap:(UITouch *)touch
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(ZFMyWalletHeadViewDidClick)])
    {
        [self.delegate ZFMyWalletHeadViewDidClick];
    }
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil)
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        float fw = (kScreenWidth-30);
        layout.itemSize = CGSizeMake(fw, 74);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[ZFBalanceControllerCell class] forCellWithReuseIdentifier:ZFBalanceControllerCellID];
    }
    return _collectionView;
}
@end
