//
//  Reminder.h
//  提醒事项
//
//  Created by WanDing on 17/1/9.
//  Copyright © 2017年 李宏亮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Reminder : NSObject
/**
 *  添加日历提醒
 *
 *  @param date     时间
 *  @param title    标题
 *  @param notes 位置
 */
+(void)addEventNotifyNSDateString:(NSString *)date title:(NSString *)title notes:(NSString *)notes;

/**
 *  添加日历一段时间提醒
 *
 *  @param StartString 开始日期
 *  @param endString 结束日期
 *  @param title   标题
 *  @param notes   内容
 */
+ (void)addEventNotifyStartString:(NSString *)StartString EndString:(NSString *)endString title:(NSString *)title notes:(NSString *)notes;

/**
 *  添加提醒事项
 *
 *  @param date     时间
 *  @param title    标题
 *  @param notes 位置
 */
+ (void)addReminderNotifyNSDateString:(NSString *)date title:(NSString *)title notes:(NSString *)notes;

/**
 *  添加一段时间提醒事项
 *
 *  @param StartString    开始日期
 *  @param endString 结束日期
 *  @param title   标题
 *  @param notes   内容
 */
+ (void)addReminderNotifyStartString:(NSString *)StartString endString:(NSString *)endString title:(NSString *)title notes:(NSString *)notes;
@end
