//
//  BaseViewController.m
//  CN
//
//  Created by PetroChina Co Ltd on 16/1/11.
//  Copyright © 2016年 PetroChina Co Ltd. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDefaultNavigationBackGround];
    
  }
- (void) setDefaultNavigationBackGround;

{
    [self.navigationController.navigationBar setBarTintColor:RGB_MD(233, 67, 74)];
    [self.navigationController.navigationBar setTitleTextAttributes:
  @{NSFontAttributeName:[UIFont systemFontOfSize:16],
    NSForegroundColorAttributeName:[UIColor whiteColor]}];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
