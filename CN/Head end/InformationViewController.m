//
//  InformationViewController.m
//  CN
//
//  Created by JD－高 on 16/1/24.
//  Copyright © 2016年 PetroChina. All rights reserved.
//

#import "InformationViewController.h"
#import "ConfirmViewController.h"

@interface InformationViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSArray *provinces, *cities, *areas;
}

@property (weak, nonatomic) IBOutlet UIPickerView *ppView;

@end

@implementation InformationViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setDefaultNavigationBackGround];
    //配置地区选择器
    self.ppView.delegate = self;
    self.ppView.dataSource = self;
    
    //加载数据
    provinces = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"area.plist" ofType:nil]];
    cities = [[provinces objectAtIndex:0] objectForKey:@"cities"];
    
    self.state = [[provinces objectAtIndex:0] objectForKey:@"state"];
    self.city = [[cities objectAtIndex:0] objectForKey:@"city"];
    
    areas = [[cities objectAtIndex:0] objectForKey:@"areas"];
    if (areas.count > 0) {
        self.district = [areas objectAtIndex:0];
    } else{
        self.district = @"";
    }
    
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    switch (component) {
        case 0:
            return [provinces count];
            break;
        case 1:
            return [cities count];
            break;
            
        default:
            return [areas count];
            break;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    switch (component) {
        case 0:
            return [[provinces objectAtIndex:row] objectForKey:@"state"];
            break;
        case 1:
            return [[cities objectAtIndex:row] objectForKey:@"city"];
            break;
        case 2:
            if ([areas count] > 0) {
                return [areas objectAtIndex:row];
                break;
            }
        default:
            return  @"";
            break;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    switch (component) {
        case 0:
            cities = [[provinces objectAtIndex:row] objectForKey:@"cities"];
            [self.ppView selectRow:0 inComponent:1 animated:YES];
            [self.ppView reloadComponent:1];
            
            areas = [[cities objectAtIndex:0] objectForKey:@"areas"];
            [self.ppView selectRow:0 inComponent:2 animated:YES];
            [self.ppView reloadComponent:2];
            
            self.state = [[provinces objectAtIndex:row] objectForKey:@"state"];
            self.city = [[cities objectAtIndex:0] objectForKey:@"city"];
            if ([areas count] > 0) {
                self.district = [areas objectAtIndex:0];
            } else{
                self.district = @"";
            }
            break;
        case 1:
            areas = [[cities objectAtIndex:row] objectForKey:@"areas"];
            [self.ppView selectRow:0 inComponent:2 animated:YES];
            [self.ppView reloadComponent:2];
            
            self.city = [[cities objectAtIndex:row] objectForKey:@"city"];
            if ([areas count] > 0) {
                self.district = [areas objectAtIndex:0];
            } else{
                self.district = @"";
            }
            break;
        case 2:
            if ([areas count] > 0) {
                self.district = [areas objectAtIndex:row];
            } else{
                self.district = @"";
            }
            break;
        default:
            break;
    }
}

#pragma mark -- 导航栏设置
- (void)setDefaultNavigationBackGround;{
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:16],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationItem setTitle:@"选择地点"];
    //设置backbutton 隐藏文字
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //隐藏系统的返回按钮
    [self.navigationItem setHidesBackButton:YES];
    //添加导航栏左右按钮
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"DashboardTabBarItemProfile@2x 2"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnThing:)];
    self.navigationItem.rightBarButtonItem = rightBtn;
   //[self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
}

#pragma mark -- 右侧确定按钮点击事件
- (void)rightBtnThing:(UIButton *)btn{
    ConfirmViewController *confirmVC = [[ConfirmViewController alloc] init];
    [self.navigationController pushViewController:confirmVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
