//
//  GJDUtils.m
//  CN
//
//  Created by PetroChina Co Ltd on 16/1/14.
//  Copyright © 2016年 PetroChina Co Ltd. All rights reserved.
//

#import "GJDUtil.h"

@implementation GJDUtil
+(void)alertWithMessage:(NSString *)msg andWithVC:(UIViewController *)vc
{
    UIAlertController * ac=[UIAlertController alertControllerWithTitle:@"温馨提示" message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * action=[UIAlertAction actionWithTitle:@"朕知道了" style:UIAlertActionStyleCancel handler:nil];
    [ac addAction:action];
    [vc presentViewController:ac animated:YES completion:nil];
}
+(NSString *)trim:(NSString *)str
{
    return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}
+(NSString *)path:(NSString *)str
{
    NSString * home=NSHomeDirectory();
    NSString * doc=[home stringByAppendingPathComponent:@"Documents"];
    return [doc stringByAppendingPathComponent:str];
}

@end
