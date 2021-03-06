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

//获取当前时间戳
+(NSString*)UnixTimeString;

//获取时间显示字符串
+ (NSString*)dateTimeAgoText:(NSString*)datelineString;

//竟拍日期
+(NSString*)dateTextJP:(NSString*)dateline;

//开始竞拍日期
+(NSString*)startDate:(NSString*)dateline;

//团购日期
+(NSString*)GroupBuying:(NSString*)dateline;

//日期
+(NSString*)dateText:(NSString*)dateline;

//我的订单日期
+(NSString*)Orderdate:(NSString*)dateline;

//充值日期
+(NSString*)Rechargedate:(NSString*)dateline;

//将图片字符串转换为URL
+(NSURL *)IconStringToUrl:(NSString*)iconString;

//颜色转图片
+(UIImage*)Color2Image:(UIColor*)color;

/**
 处理图片大小
 @param oldImage 原图片
 @param ShowSize 最大宽或者高
 @param FileSize 最大文件大小
 @return <#return value description#>
 */
+ (UIImage*)handleImage:(UIImage *)oldImage ShowSize:(NSInteger)ShowSize FileSize:(NSInteger)FileSize;


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


/**
 *  获取时间差值  截止时间-当前时间
 *  nowDateStr : 当前时间
 *  deadlineStr : 截止时间
 *  @return 时间戳差值
 */
+ (NSInteger)getDateDifferenceWithNowDateStr:(NSString*)nowDateStr deadlineStr:(NSString*)deadlineStr;

/**
 *  获取当天的字符串
 *
 *  @return 格式为年-月-日 时分秒
 */
+ (NSString *)getCurrentTimeyyyymmdd;
@end

NS_ASSUME_NONNULL_END
