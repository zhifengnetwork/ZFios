//
//  ZFTool.h
//  ZF
//
//  Created by apple on 2018/12/30.
//  Copyright © 2018 LS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/**
 通用工具类
 */
@interface ZFTool : NSObject

/**
 *  是否是邮箱
 *
 *  @param email <#email description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL) isEmail:(NSString *)email;

/**
 *  手机号码判断
 *
 *  @return <#return value description#>
 */
+ (BOOL) isPhoneNumber:(NSString *)PhoneNumber;

/**
 *  将一个带有分隔符的字符串拆分成数组
 *
 *  @param strData     带有分隔符的字符串
 *  @param strSeparator     分隔符
 *  @return NSMutableArray 拆分后的数组
 */
+(NSMutableArray *)strToArr: (NSString*)strData Separator:(NSString*)strSeparator;

/**
 *  将一个数组拆分组成带有分隔符的字符串
 *
 *  @param NSMutableArray 折分的数组
 *  @param strSeparator     分隔符
 *  @return strData     带有分隔符的字符串
 */
+(NSString *)ArrTostr: (NSMutableArray*)arrData Separator:(NSString*)strSeparator;


//时间戳转日期
+ (NSDate*)UnixTimeToDate:(long long)lTime;

//获取时间显示字符串
+ (NSString*)dateTimeAgoText:(NSString*)datelineString;


//将图片字符串转换为URL
+(NSURL *)IconStringToUrl:(NSString*)iconString;

//颜色转图片
+(UIImage*)Color2Image:(UIColor*)color;

//得到缓存大小
+(NSUInteger)getCacheSize;

/**
 清除app缓存
 */
+(void)clearAppCache;

//DocumentDirectory
+(NSString*)GetAppDocPath;

/**
 *  得到app的家目录下tmp目录路径，在应用退出后清空。
 *
 *  @return <#return value description#>
 */
+(NSString*)GetAppTmpPath;

//隐藏线
+(void)isHiddenNavigationBarSeparatorLine:(BOOL)hide vc:(UIViewController*)viewController;


@end

NS_ASSUME_NONNULL_END
