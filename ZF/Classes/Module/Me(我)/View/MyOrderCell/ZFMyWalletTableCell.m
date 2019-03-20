//
//  ZFMyWalletTableCell.m
//  ZF
//
//  Created by admin on 2019/3/20.
//  Copyright © 2019 hyy. All rights reserved.
//

#import "ZFMyWalletTableCell.h"
#import "ZFMyOrderHeadView.h"
#import "ZFMyWalletControllerCell.h"

@interface ZFMyWalletTableCell()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) ZFMyOrderHeadView* orderHeadView;
@property (nonatomic, strong) UICollectionView* collectionView;

@end


@implementation ZFMyWalletTableCell

static NSString *const ZFMyWalletControllerCellID = @"ZFMyWalletControllerCellID";


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
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZFMyWalletControllerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZFMyWalletControllerCellID forIndexPath:indexPath];
    if (indexPath.item==0)
    {
        cell.iconName = @"JF1";
        cell.title = @"积分";
        cell.number = @"3000";
    }
    else if (indexPath.item==1)
    {
        cell.iconName = @"YHJ1";
        cell.title = @"优惠券";
        cell.number = @"30";
    }
    
    return cell;
}


//预览cell点击
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}


-(ZFMyOrderHeadView*)orderHeadView
{
    if (_orderHeadView==nil)
    {
        _orderHeadView = [[ZFMyOrderHeadView alloc]init];
        _orderHeadView.leftTitle = @"我的钱包";
        _orderHeadView.rightTitle = @"查看钱包";
    }
    
    return _orderHeadView;
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil)
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        float fw = (kScreenWidth-30)/2;
        layout.itemSize = CGSizeMake(fw, 74);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[ZFMyWalletControllerCell class] forCellWithReuseIdentifier:ZFMyWalletControllerCellID];
    }
    return _collectionView;
}
@end
