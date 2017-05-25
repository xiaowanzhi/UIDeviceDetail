//
//  RegularJudement.h
//  CCBPay
//
//  Created by HB_YDZD on 15/10/23.
//  Copyright (c) 2015年 administrator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegularJudement : NSObject
#pragma 正则匹配用户密码6-18位数字和字母组合
+(BOOL)checkPassword:(NSString *) password;
#pragma 正则匹配用户姓名,20位的中文或英文
+(BOOL)checkUserName : (NSString *) userName;
#pragma 正则匹配用户身份证号位数
+(BOOL)checkUserIdCard: (NSString *) idCard;
#pragma 正则匹配用户身份证号
+ (BOOL) validateIdentityCard: (NSString *)value;
#pragma 正则匹配邮箱
+ (BOOL)checkUserEmail:(NSString *)email;
#pragma 正则匹配银行卡号
+ (BOOL)checkUserBankNumber:(NSString *)BankNumber;


@end
