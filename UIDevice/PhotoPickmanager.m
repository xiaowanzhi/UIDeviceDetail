//
//  PhotoPickmanager.m
//  相册封装
//
//  Created by WanDing on 16/10/13.
//  Copyright © 2016年 李宏亮. All rights reserved.
//

#import "PhotoPickmanager.h"

@interface PhotoPickmanager()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImagePickerController *_imgPickC;
    UIViewController *_vc;
    CallbackBlock _callBackBlock;
}

@end



@implementation PhotoPickmanager

+(instancetype)shareInstance{
    static dispatch_once_t onceToken;
    static PhotoPickmanager *pickmanager;
    dispatch_once(&onceToken, ^{
        pickmanager = [[PhotoPickmanager alloc]init];
    });
    return pickmanager ;
}

- (instancetype)init{
    if ([super init]) {
        if (!_imgPickC) {
            _imgPickC = [[UIImagePickerController alloc]init];
        }
    }
    return self;
}

- (void)pressentPicker:(PickerType)pcikertype target:(UIViewController *)vc callBackBlock:(CallbackBlock)callbackBlock{
    _vc = vc;
    _callBackBlock = callbackBlock;
    if(pcikertype == 0){
        // 拍照
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
            _imgPickC.delegate = self;
            _imgPickC.sourceType = UIImagePickerControllerSourceTypeCamera;
            _imgPickC.allowsEditing = YES;
            _imgPickC.showsCameraControls = YES;
            UIView *view = [[UIView  alloc] init];
            view.backgroundColor = [UIColor grayColor];
            _imgPickC.cameraOverlayView = view;
            [_vc presentViewController:_imgPickC animated:YES completion:nil];
        }else{
            UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"" message:@"相机不可用" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [alertV show];
        }
    }
    
    else if(pcikertype == 1){
        // 相册
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]){
            _imgPickC.delegate = self;
            _imgPickC.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            _imgPickC.allowsEditing = YES;
            [_vc presentViewController:_imgPickC animated:YES completion:nil];
        }else{
            UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"" message:@"相册不可用" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [alertV show];
        }
        
    }

#pragma mark ---- UIImagePickerControllerDelegate
    
    
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [_vc dismissViewControllerAnimated:YES completion:^{
        _callBackBlock(info, NO); // block回调
    }];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [_vc dismissViewControllerAnimated:YES completion:^{
        _callBackBlock(nil, YES); // block回调
    }];
}


@end
