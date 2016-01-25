//
//  detailViewController.m
//  CN
//
//  Created by PetroChina Co Ltd on 16/1/21.
//  Copyright © 2016年 PetroChina Co Ltd. All rights reserved.
//

#import "detailViewController.h"

@interface detailViewController ()

@property (nonatomic , strong)UILabel *label;
@end

@implementation detailViewController
-(void)viewWillAppear:(BOOL)animated
{
    [self.tabBarController.tabBar setHidden:YES];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [self.tabBarController.tabBar setHidden:NO];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置导航返回按钮的颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    NSInteger k,h,m;
    for (NSInteger i=0; i<self.deleteButton.count; i++)
    {
        
        // [self.label setFrame:CGRectMake(MDXFrom6(50), MDXFrom6(100)+MDXFrom6(40)*i,MDXFrom6(80), MDXFrom6(30))];
        self.label=[[UILabel alloc]initWithFrame:CGRectMake(MDXFrom6(50), MDXFrom6(100)+MDXFrom6(40)*i,MDXFrom6(80), MDXFrom6(30))];
        UIButton *button=(UIButton *)self.deleteButton[i];
        k=button.tag-100;
        if (k<=5) {
            h=0;
            m=k-1;
        }
        else
        {
            h=k/5;
            m=k-5*h-1;
        }
        
        NSString *str=self.buttonArr[h][m];
        
        self.label.text=str;
        NSLog(@"%@",str);
        [self.view addSubview:self.label];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
