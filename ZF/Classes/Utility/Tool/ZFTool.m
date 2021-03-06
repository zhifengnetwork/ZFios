//
//  ZFTool.m
//  ZF
//
//  Created by apple on 2018/12/30.
//  Copyright © 2018 LS. All rights reserved.
//

#import "ZFTool.h"
#import "SDWebImageManager.h"
#import <DateTools.h>


@implementation ZFTool

/**
 *  是否是邮箱
 *
 *  @param email email description
 *
 *  @return <#return value description#>
 */
+ (BOOL) isEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:email];
}

/**
 *  手机号码判断
 *
 *  @return <#return value description#>
 */
+ (BOOL) isPhoneNumber:(NSString *)PhoneNumber
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0678])\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:PhoneNumber];
}

/**
 *  将一个带有分隔符的字符串拆分成数组
 *
 *  @param strData     带有分隔符的字符串
 *  @param strSeparator     分隔符
 *  @return NSMutableArray 拆分后的数组
 */
+(NSMutableArray *)strToArr: (NSString*)strData Separator:(NSString*)strSeparator
{
    NSMutableArray * arr = [[NSMutableArray alloc]initWithArray:[strData componentsSeparatedByString:strSeparator]];
    
    return arr;
}

/**
 *  将一个数组拆分组成带有分隔符的字符串
 *
 *  @param NSMutableArray 拆分的数组
 *  @param strSeparator     分隔符
 *  @return strData     带有分隔符的字符串
 */
+(NSString *)ArrTostr: (NSMutableArray*)arrData Separator:(NSString*)strSeparator
{
    NSString *str = nil;
    if (arrData==nil)
    {
        return str;
    }
    
    str = [arrData componentsJoinedByString:strSeparator];
    return str;
}


//时间戳转日期
+ (NSDate*)UnixTimeToDate:(long long)lTime
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:lTime];
    return date;
}

//获取当前时间戳
+(NSString*)UnixTimeString
{
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0]; // 获取当前时间0秒后的时间
    NSTimeInterval time = [date timeIntervalSince1970];// *1000 是精确到毫秒(13位),不乘就是精确到秒(10位)
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}

//获取时间显示字符串
+ (NSString*)dateTimeAgoText:(NSString*)datelineString
{
    if (kStringIsEmpty(datelineString))
    {
        return nil;
    }
    
    NSDate* date = [ZFTool UnixTimeToDate:datelineString.longLongValue];
    return date.timeAgoSinceNow;
}

//竟拍日期
+(NSString*)dateTextJP:(NSString*)dateline
{
    if (kStringIsEmpty(dateline))
    {
        return nil;
    }
    
    NSString* str = nil;
    long long lltime = [dateline longLongValue];
    if (lltime==0)
    {
        return str;
    }
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:lltime];
    str = [date formattedDateWithFormat:@"   MM月dd号 HH:mm:ss准时开拍"];
    
    return str;
}

//开始竞拍日期
+(NSString*)startDate:(NSString*)dateline
{
    if (kStringIsEmpty(dateline))
    {
        return nil;
    }
    
    NSString* str = nil;
    long long lltime = [dateline longLongValue];
    if (lltime==0)
    {
        return str;
    }
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:lltime];
    str = [date formattedDateWithFormat:@" 距离结束还有HH:mm:ss"];
    
    return str;
}

//团购日期
+(NSString*)GroupBuying:(NSString*)dateline
{
    if (kStringIsEmpty(dateline))
    {
        return nil;
    }
    
    NSString* str = nil;
    long long lltime = [dateline longLongValue];
    if (lltime==0)
    {
        return str;
    }
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:lltime];
    str = [date formattedDateWithFormat:@"剩余 dd天HH小时mm分ss秒"];
    
    return str;
}

//日期
+(NSString*)dateText:(NSString*)dateline
{
    if (kStringIsEmpty(dateline))
    {
        return nil;
    }
    
    NSString* str = nil;
    long long lltime = [dateline longLongValue];
    if (lltime==0)
    {
        return str;
    }
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:lltime];
    str = [date formattedDateWithFormat:@"yyyy-MM-dd HH:mm:ss"];//2019年04-28 11:10:10
    
    return str;
}

//我的订单日期
+(NSString*)Orderdate:(NSString*)dateline
{
    if (kStringIsEmpty(dateline))
    {
        return nil;
    }
    
    NSString* str = nil;
    long long lltime = [dateline longLongValue];
    if (lltime==0)
    {
        return str;
    }
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:lltime];
    str = [date formattedDateWithFormat:@"yyyy/MM/dd HH:mm:ss"];//2019年04-28 11:10:10
    
    return str;
}

//充值日期
+(NSString*)Rechargedate:(NSString*)dateline
{
    if (kStringIsEmpty(dateline))
    {
        return nil;
    }
    
    NSString* str = nil;
    long long lltime = [dateline longLongValue];
    if (lltime==0)
    {
        return str;
    }
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:lltime];
    str = [date formattedDateWithFormat:@"yyyy-MM-dd"];
    
    return str;
}

/**
 *  获取当天的字符串
 *
 *  @return 格式为年-月-日 时分秒
 */
+ (NSString *)getCurrentTimeyyyymmdd {
    
    NSDate *now = [NSDate date];
    NSDateFormatter *formatDay = [[NSDateFormatter alloc] init];
    formatDay.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *dayStr = [formatDay stringFromDate:now];
    
    return dayStr;
}

/**
 *  获取时间差值  截止时间-当前时间
 *  nowDateStr : 当前时间
 *  deadlineStr : 截止时间
 *  @return 时间戳差值
 */
+ (NSInteger)getDateDifferenceWithNowDateStr:(NSString*)nowDateStr deadlineStr:(NSString*)deadlineStr {
    
    NSInteger timeDifference = 0;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yy-MM-dd HH:mm:ss"];
    NSDate *nowDate = [formatter dateFromString:nowDateStr];
    NSDate *deadline = [formatter dateFromString:deadlineStr];
    NSTimeInterval oldTime = [nowDate timeIntervalSince1970];
    NSTimeInterval newTime = [deadline timeIntervalSince1970];
    timeDifference = newTime - oldTime;
    
    return timeDifference;
}


//将图片字符串转换为URL
+(NSURL *)IconStringToUrl:(NSString*)iconString
{
    if (kStringIsEmpty(iconString))
    {
        return nil;
    }
    
    NSString* str = [NSString stringWithFormat:@"%@%@",MainUrl,iconString];
    return [NSURL URLWithString:str];
}

//颜色转图片
+(UIImage*)Color2Image:(UIColor*)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}


/**
 处理图片大小
 @param oldImage 原图片
 @param ShowSize 最大宽或者高
 @param FileSize 最大文件大小K
 @return <#return value description#>
 */
+ (UIImage*)handleImage:(UIImage *)oldImage ShowSize:(NSInteger)ShowSize FileSize:(NSInteger)FileSize
{
    //转字节
    FileSize = FileSize*1024;
    UIImage *newImage = oldImage;
    //新UIImage的Data
    NSData * newimageDataSrc = UIImageJPEGRepresentation(newImage,1);
    if (newimageDataSrc.length<FileSize)
    {
        return newImage;
    }
    
    float fmax = MAX(oldImage.size.width, oldImage.size.height);
    if ( fmax>ShowSize )
    {
        float ssize = fmax/ShowSize;
        
        CGSize newsize = CGSizeMake(oldImage.size.width/ssize, oldImage.size.height/ssize);
        
        UIGraphicsBeginImageContext(newsize);
        
        CGRect rect = CGRectMake(0,
                                 0,
                                 newsize.width,
                                 newsize.height);
        
        [oldImage drawInRect:rect];
        
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
    }
    
    //大小
    CGFloat compression    = 0.9f;
    CGFloat minCompression = 0.01f;
    NSData *imageData = UIImageJPEGRepresentation(newImage,
                                                  compression);
    
    //每次减少的比例
    float scale = 0.1;
    
    //新UIImage的Data
    NSData * newimageData = UIImageJPEGRepresentation(newImage,1);
    
    //循环条件：没到最小压缩比例，且没压缩到目标大小
    while ((compression > minCompression)&&
           (newimageData.length>FileSize))
    {
        imageData = UIImageJPEGRepresentation(newImage,
                                              compression);
        UIImage *compressedImage = [UIImage imageWithData:imageData];
        newimageData= UIImageJPEGRepresentation(compressedImage,1);
        
        //        NSLog(@"%f,%lu",compression,(unsigned long)newimageData.length);
        
        compression -= scale;
    }
    UIImage *compressedImage = [UIImage imageWithData:newimageData];
    
    
    return compressedImage;
}


//得到缓存大小
+(NSUInteger)getCacheSize
{
    SDImageCache * cache = [SDImageCache sharedImageCache];
    NSUInteger size = [cache getSize];
    return size;
}

/**
 清除app缓存
 */
+(void)clearAppCache
{
    SDImageCache * cache = [SDImageCache sharedImageCache];
    [cache clearDiskOnCompletion:nil];
    [cache clearMemory];
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    //错误信息
    NSError *error;
    
    //清空tmp目录
    NSString* path = [ZFTool GetAppTmpPath];
    [fileMgr removeItemAtPath:path error:&error];
}

//DocumentDirectory
+(NSString*)GetAppDocPath
{
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return doc;
}

/**
 *  得到app的家目录下tmp目录路径，在应用退出后清空。
 *
 *  @return <#return value description#>
 */
+(NSString*)GetAppTmpPath
{
    NSString *strTmpPath = NSTemporaryDirectory();
    
    return strTmpPath;
}


//隐藏线
+(void)isHiddenNavigationBarSeparatorLine:(BOOL)hide vc:(UIViewController*)viewController
{
    if ([viewController.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        NSArray *list=viewController.navigationController.navigationBar.subviews;
        for (id obj in list) {
            if ([obj isKindOfClass:[UIView class]]) {
                UIView *imageView=(UIView *)obj;
                NSArray *list2=imageView.subviews;
                for (id obj2 in list2) {
                    if ([obj2 isKindOfClass:[UIImageView class]]) {
                        UIImageView *imageView2=(UIImageView *)obj2;
                        if (hide)
                        {
                            imageView2.hidden = imageView2.bounds.size.height < 1;
                        }
                        else
                        {
                            imageView2.hidden = NO;
                        }
                    }
                }
            }
        }
    }
}


@end
