//
//  Reminder.m
//  提醒事项
//
//  Created by WanDing on 17/1/9.
//  Copyright © 2017年 李宏亮. All rights reserved.
//

#import "Reminder.h"
#import <EventKit/EventKit.h>
#import <UIKit/UIKit.h>
@implementation Reminder

+(void)addEventNotifyNSDateString:(NSString *)date title:(NSString *)title notes:(NSString *)notes{
    NSDate *newDate = [Reminder GetStringToDate:date];
    [Reminder addEventNotify:newDate title:title notes:notes];
}

+ (void)addEventNotifyStartString:(NSString *)StartString EndString:(NSString *)endString title:(NSString *)title notes:(NSString *)notes{
    NSDate *StartDate = [Reminder GetStringToDate:StartString];
    NSDate *endData = [Reminder GetStringToDate:endString];
    [Reminder addEventNotifyStartData:StartDate EndData:endData title:title notes:notes];
}


+ (void)addReminderNotifyNSDateString:(NSString *)date title:(NSString *)title notes:(NSString *)notes{
    NSDate *newDate = [Reminder GetStringToDate:date];
    [Reminder addReminderNotify:newDate title:title notes:notes];
}

+ (void)addReminderNotifyStartString:(NSString *)StartString endString:(NSString *)endString title:(NSString *)title notes:(NSString *)notes{
    NSDate *StartDate = [Reminder GetStringToDate:StartString];
    NSDate *endData = [Reminder GetStringToDate:endString];
    [Reminder addReminderNotifyStartData:StartDate endData:endData title:title notes:notes];
}

+ ( NSDate*)GetStringToDate:(NSString *)dateStr{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    NSDate* inputDate = [inputFormatter dateFromString:dateStr];
    
    return inputDate;
}



+ (void)addEventNotify:(NSDate *)date title:(NSString *)title notes:(NSString *)notes
{
    //生成事件数据库对象
    
    EKEventStore *eventDB = [[EKEventStore alloc] init];
    //申请事件类型权限
    
    [eventDB requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError * _Nullable error) {
        
        if (granted) { //授权是否成功
            
            EKEvent *myEvent  = [EKEvent eventWithEventStore:eventDB]; //创建一个日历事件
            
            myEvent.title     = title;  //标题
            myEvent.notes = notes;
            myEvent.startDate = date; //开始date   required
            
            myEvent.endDate   = date;  //结束date    required
            
            [myEvent addAlarm:[EKAlarm alarmWithAbsoluteDate:date]]; //添加一个闹钟  optional
            
            [myEvent setCalendar:[eventDB defaultCalendarForNewEvents]]; //添加calendar  required
            
            NSError *err;
            
            [eventDB saveEvent:myEvent span:EKSpanThisEvent error:&err]; //保存
            
        }
        
    }];
    
}

+ (void)addEventNotifyStartData:(NSDate *)Startdate EndData:(NSDate *)endData title:(NSString *)title notes:(NSString *)notes
{
    //生成事件数据库对象
    
    EKEventStore *eventDB = [[EKEventStore alloc] init];
    //申请事件类型权限
    
    [eventDB requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError * _Nullable error) {
        
        if (granted) { //授权是否成功
            
            EKEvent *myEvent  = [EKEvent eventWithEventStore:eventDB]; //创建一个日历事件
            
            myEvent.title     = title;  //标题
            myEvent.notes = notes;
            myEvent.startDate = Startdate; //开始date   required
            
            myEvent.endDate   = endData;  //结束date    required
            
            [myEvent addAlarm:[EKAlarm alarmWithAbsoluteDate:Startdate]]; //添加一个闹钟  optional
            
            [myEvent setCalendar:[eventDB defaultCalendarForNewEvents]]; //添加calendar  required
            
            NSError *err;
            
            [eventDB saveEvent:myEvent span:EKSpanThisEvent error:&err]; //保存
            
        }
        
    }];
    
}



+ (void)addReminderNotify:(NSDate *)date title:(NSString *)title notes:(NSString *)notes

{
    EKEventStore *eventDB = [[EKEventStore alloc] init];
    //申请提醒权限
    
    [eventDB requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError * _Nullable error) {
        
        if (granted) {
            //创建一个提醒功能
            
            EKReminder *reminder = [EKReminder reminderWithEventStore:eventDB];
            //标题
            
            reminder.title = title;
            reminder.notes = notes;
            //添加日历
            
            [reminder setCalendar:[eventDB defaultCalendarForNewReminders]];
            
            NSCalendar *cal = [NSCalendar currentCalendar];
            
            [cal setTimeZone:[NSTimeZone systemTimeZone]];
            
            NSInteger flags = NSCalendarUnitYear | NSCalendarUnitMonth |
            
            NSCalendarUnitDay |NSCalendarUnitHour | NSCalendarUnitMinute |
            
            NSCalendarUnitSecond;
            
            NSDateComponents* dateComp = [cal components:flags fromDate:date];
            
            dateComp.timeZone = [NSTimeZone systemTimeZone];
            
            reminder.startDateComponents = dateComp; //开始时间
            
            reminder.dueDateComponents = dateComp; //到期时间
            
            reminder.priority = 1; //优先级
            
            EKAlarm *alarm = [EKAlarm alarmWithAbsoluteDate:date]; //添加一个车闹钟
            
            [reminder addAlarm:alarm];
            
            NSError *err;
            
            [eventDB saveReminder:reminder commit:YES error:&err];
            
            if (err) {
                
                
            }
            
        }
        
    }];
    
}

+ (void)addReminderNotifyStartData:(NSDate *)Startdate endData:(NSDate *)enddata title:(NSString *)title notes:(NSString *)notes

{
    
    EKEventStore *eventDB = [[EKEventStore alloc] init];
    //申请提醒权限
    
    [eventDB requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError * _Nullable error) {
        
        if (granted) {
            //创建一个提醒功能
            
            EKReminder *reminder = [EKReminder reminderWithEventStore:eventDB];
            //标题
            
            reminder.title = title;
            reminder.notes = notes;
            //添加日历
            
            [reminder setCalendar:[eventDB defaultCalendarForNewReminders]];
            
            NSCalendar *cal = [NSCalendar currentCalendar];
            
            [cal setTimeZone:[NSTimeZone systemTimeZone]];
            
            NSInteger flags = NSCalendarUnitYear | NSCalendarUnitMonth |
            
            NSCalendarUnitDay |NSCalendarUnitHour | NSCalendarUnitMinute |
            
            NSCalendarUnitSecond;
            
            NSDateComponents* StartdateComp = [cal components:flags fromDate:Startdate];
            
            StartdateComp.timeZone = [NSTimeZone systemTimeZone];
            
            NSDateComponents* EnddateComp = [cal components:flags fromDate:enddata];
            
            EnddateComp.timeZone = [NSTimeZone systemTimeZone];
            
            reminder.startDateComponents = StartdateComp; //开始时间
            
            reminder.dueDateComponents = EnddateComp; //到期时间
            
           
            
            reminder.priority = 1; //优先级
            
            EKAlarm *alarm = [EKAlarm alarmWithAbsoluteDate:Startdate]; //添加一个车闹钟
            
            [reminder addAlarm:alarm];
            
            NSError *err;
            
            [eventDB saveReminder:reminder commit:YES error:&err];
            
            if (err) {
                
                
            }
            
        }
        
    }];
    
}



@end
