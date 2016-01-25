//
//  head.h
//  CN/Users/zhaojianhua/Desktop/图片
//
//  Created by PetroChina Co Ltd on 16/1/19.
//  Copyright © 2016年 PetroChina Co Ltd. All rights reserved.
//

#ifndef head_h
#define head_h



// -- 屏幕宽
#define KScreenWidth [[UIScreen mainScreen] bounds].size.width

// -- 屏幕高
#define KScreenHeight [[UIScreen mainScreen] bounds].size.height

#define RGB_MD(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0]

#define RGBA_MD(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define MDXFrom6(x) ([[UIScreen mainScreen] bounds].size.width / 375.0 *x)

#define KAppDelegate ((AppDelegate *) [UIApplication sharedApplication].delegate)

#ifdef __OBJC__
#import "LoginViewController.h"
#import "HomePageViewController.h"
#import "RepairViewController.h"
#import "ReimbursementViewController.h"



#endif /* head_h */
