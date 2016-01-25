//
//  ZhanzhangViewController.m
//  CN
//
//  Created by PetroChina Co Ltd on 16/1/13.
//  Copyright © 2016年 PetroChina Co Ltd. All rights reserved.
//

#import "ZhanzhangViewController.h"
#import "HomePageViewController.h"
#import "RepairViewController.h"
#import "ReimbursementViewController.h"
#import <RESideMenu.h> //左 侧边栏

@interface ZhanzhangViewController ()

@end

@implementation ZhanzhangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"维修端"];
    self.tabBar.tintColor = [UIColor colorWithRed:220./255 green:20./255 blue:50./255 alpha:1];
    
    HomePageViewController * homeVC=[[HomePageViewController alloc]init];
    homeVC.title=@"首页";
    homeVC.tabBarItem.image=[UIImage imageNamed:@"DashboardTabBarItemProfile@2x 2.png"];
    homeVC.tabBarItem.title=@"首页";
    UINavigationController * homeNav=[[UINavigationController alloc]initWithRootViewController:homeVC];
    
    RepairViewController * RepairVC=[[RepairViewController alloc]init];
    RepairVC.tabBarItem.image=[UIImage imageNamed:@"DashboardTabBarItemDailyHot@2x 2.png"];
    RepairVC.title=@"维修";
    RepairVC.tabBarItem.title=@"报修项目";
    UINavigationController * RepairNav=[[UINavigationController alloc]initWithRootViewController:RepairVC];
    
    ReimbursementViewController * ReimbursementVC=[[ReimbursementViewController alloc]init];
    ReimbursementVC.tabBarItem.image=[UIImage imageNamed:@"DashboardTabBarItemSubscription@2x 2.png"];
    ReimbursementVC.title=@"报销";
    ReimbursementVC.tabBarItem.title=@"报销";
    UINavigationController * ReimbursementNav=[[UINavigationController alloc]initWithRootViewController:ReimbursementVC];
    
    // 左 侧边栏
//    LeftController *leftVC = [[LeftController alloc] init];
//    RESideMenu *resideMenu = [[RESideMenu alloc] initWithContentViewController:homeVC leftMenuViewController:leftVC rightMenuViewController:nil];
//    resideMenu.scaleContentView = NO; //缩放效果
//    resideMenu.tabBarItem.title = @"首页";
//    resideMenu.tabBarItem.image = [UIImage imageNamed:@"DashboardTabBarItemProfile@2x 2.png"];
//    
    UITabBarController * tab=[[UITabBarController alloc]init];
    [tab setViewControllers:[NSArray arrayWithObjects:homeNav,RepairNav,ReimbursementNav,nil]];
    
    // 设置根视图
    self.viewControllers = @[homeNav,RepairNav,ReimbursementNav];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationItem setHidesBackButton:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
