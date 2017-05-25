//
//  EquipmentInformation.h
//  手机设备信息
//
//  Created by WanDing on 16/9/21.
//  Copyright © 2016年 李宏亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface EquipmentInformation : NSObject
@property (nonatomic, copy)void(^Getscreenshot)(NSInteger index);
/**
 *  截图
 *
 *  @param AtView 截取那个图
 */
- (void)Getscreenshot:(UIView *)AtView GetResult:(void(^)(NSInteger result))result;

/**
 *  获取wifi名字
 *
 *  @return <#return value description#>
 */
+ (NSString *)getWifiName;

/**
 *  获取设备ip地址
 *
 *  @return <#return value description#>
 */
+ (NSString *)getIPAddress;

/**
 *  删除缓存
 */
+ (void) resetCache ;

/**
 *  获取缓存目录
 */
+ (NSString*) cacheDirectory;


/**
 *  获取某个路径下文件大小
 */
+ (long long) fileSizeAtPath:(NSString*) filePath;
@end
