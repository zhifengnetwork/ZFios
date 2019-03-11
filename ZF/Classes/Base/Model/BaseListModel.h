//
//  BaseListModel.h
//  LS
//
//  Created by ZMac on 2018/11/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 列表数据基类
 */
@interface BasePageModel : NSObject

//总页数
@property (nonatomic, assign) NSUInteger totalPage;
//当前页码
@property (nonatomic, assign) NSUInteger currentPage;

//获取当前页
-(NSUInteger)getCurrentPage;
//设置首页
-(void)setStartPage;
//设置下一页
-(void)setNextPage;

//是否为首页
-(BOOL)isStartPage;
//是否为最后一页
-(BOOL)isLastPage;

@end


/**
 列表数据基类
 */
@interface BaseListModel : NSObject

//页数
@property (nonatomic, strong) BasePageModel* page;
//结果集存放List
@property (nonatomic, strong) NSMutableArray *result;

//追加一页数据
-(void)addModel:(BaseListModel*)model;

//清空数据
-(void)emptyList;

@end
