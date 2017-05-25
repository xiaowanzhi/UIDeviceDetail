//
//  PhotoPickmanager.h
//  相册封装
//
//  Created by WanDing on 16/10/13.
//  Copyright © 2016年 李宏亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,PickerType) {
    PickerType_camera ,//拍照
    PickerType_photo //照片
    
};

typedef void (^CallbackBlock)(NSDictionary *infoDict,BOOL isCancel);

@interface PhotoPickmanager : NSObject

+ (instancetype)shareInstance;
- (void)pressentPicker:(PickerType)pcikertype target:(UIViewController *)vc callBackBlock:(CallbackBlock)callbackBlock;

/**
 
 PhotoPickmanager *pickManager = [PhotoPickmanager shareInstance];
 [pickManager pressentPicker:buttonIndex target:self callBackBlock:^(NSDictionary *infoDict, BOOL isCancel) {
 
 
 NSLog(@"%@",infoDict);
 }];

 
 */

@end
