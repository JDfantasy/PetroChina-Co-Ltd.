//
//  GJDUtils.h
//  CN
//
//  Created by PetroChina Co Ltd on 16/1/14.
//  Copyright © 2016年 PetroChina Co Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GJDUtil : NSObject
+(void)alertWithMessage:(NSString *)msg andWithVC:(UIViewController *)vc;
+(NSString *)trim:(NSString *)str;
+(NSString *)path:(NSString *)str;
@end
