//
//  RegistViewController.m
//  CN
//
//  Created by PetroChina Co Ltd on 16/1/22.
//  Copyright © 2016年 PetroChina Co Ltd. All rights reserved.
//

#import "RegistViewController.h"
#import "InformationViewController.h"

@interface RegistViewController ()<UITextFieldDelegate>
@property(nonatomic,strong) UITextField *userNameTextField;
@property(nonatomic,strong) UITextField *numberTextField;
@property(nonatomic,strong) UIView *ownView;
@property(nonatomic,strong) UIButton *nextBtn;
@end

@implementation RegistViewController
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationItem setHidesBackButton:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationItem setTitle:@"报修系统"];
    //设置backbutton 隐藏文字
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self setUpView];
}

#pragma mark -- 配置视图
- (void)setUpView{
    //
    _ownView = [[UIView alloc] initWithFrame:CGRectMake((KScreenWidth-MDXFrom6(350))/2, 250, MDXFrom6(350), MDXFrom6(70))];
    [_ownView.layer setMasksToBounds:YES];
    [_ownView.layer setCornerRadius:6];
    [_ownView.layer setBorderWidth:1];
    [_ownView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    
    [_ownView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:_ownView];
    //
    UILabel *userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 35)];
    [userNameLabel setBackgroundColor:[UIColor clearColor]];
    [userNameLabel setText:@"用户名:"];
    [userNameLabel setTextColor:[UIColor grayColor]];
    [userNameLabel setFont:[UIFont systemFontOfSize:15]];
    [userNameLabel setTextAlignment:NSTextAlignmentCenter];
    
    //创建用户名文本框
    UITextField *userNametextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0,  MDXFrom6(350), MDXFrom6(35))];
    
    [userNametextField setBackgroundColor:[UIColor whiteColor]];
    //设置默认提示文字
    [userNametextField setPlaceholder:@"请输入您的手机号码"];
    //设置字体大小
    [userNametextField setFont:[UIFont systemFontOfSize:12]];
    //
    [userNametextField setTextColor:[UIColor blackColor]];
    
    //设置弹出的键盘的类型
    [userNametextField setKeyboardType:UIKeyboardTypeDefault];
    //设置键盘显示时的样式
    [userNametextField setKeyboardAppearance:UIKeyboardAppearanceAlert];
    //设置清空按钮
    [userNametextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    //设置左视图 放入textField左边
    [userNametextField setLeftView:(UIView *)userNameLabel];
    [userNametextField setLeftViewMode:UITextFieldViewModeAlways];
    
    //添加点击事件
    [userNametextField addTarget:self action:@selector(present8:) forControlEvents:UIControlEventEditingChanged];
    
    //设置代理*******<UITextFieldDelegate>
    [userNametextField setDelegate:self];
    _userNameTextField = userNametextField;
    [_ownView addSubview:userNametextField];
    //****************************************
    //验证码
    UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 35)];
    [numberLabel setBackgroundColor:[UIColor clearColor]];
    [numberLabel setText:@"密  码:"];
    [numberLabel setTextColor:[UIColor grayColor]];
    [numberLabel setFont:[UIFont systemFontOfSize:15]];
    [numberLabel setTextAlignment:NSTextAlignmentCenter];
    
    //验证码
    UITextField *numberTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, MDXFrom6(35),  MDXFrom6(350), MDXFrom6(35))];
    [numberTextField setBackgroundColor:[UIColor whiteColor]];
    [numberTextField setPlaceholder:@"请输入您的密码"];
    [numberTextField setFont:[UIFont systemFontOfSize:12]];
    [numberTextField setTextColor:[UIColor blackColor]];
    [numberTextField setKeyboardType:UIKeyboardTypeNumberPad];
    [numberTextField setKeyboardAppearance:UIKeyboardAppearanceAlert];
    [numberTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    [numberTextField setLeftView:(UIView *)numberLabel];
    [numberTextField setLeftViewMode:UITextFieldViewModeAlways];
    [numberTextField addTarget:self action:@selector(present8:) forControlEvents:UIControlEventEditingChanged];
    [numberTextField setDelegate:self];
    _numberTextField = numberTextField;
    [_ownView addSubview:numberTextField];
    
    //横线
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, MDXFrom6(35), MDXFrom6(350)-30, 0.5)];
    [lineLabel setBackgroundColor:[UIColor grayColor]];
    [_ownView addSubview:lineLabel];
    //图片
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake((KScreenWidth-MDXFrom6(100))/2, 100, MDXFrom6(100), MDXFrom6(100))];
    
    imageView.image=[UIImage imageNamed:@"1.jpg"];
    
    [self.view addSubview:imageView];
    
    //label
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake((KScreenWidth-MDXFrom6(100))/2, 100+MDXFrom6(100), MDXFrom6(100), MDXFrom6(30))];
    label.text=@"中国石油";
    label.textAlignment=NSTextAlignmentCenter;
    label.font=[UIFont systemFontOfSize:16];
    label.textColor=[UIColor blackColor];
    [self.view addSubview:label];
    
    
    _nextBtn = [[UIButton alloc] initWithFrame:CGRectMake((KScreenWidth-MDXFrom6(350))/2, _ownView.frame.origin.y+_ownView.frame.size.height+MDXFrom6(35), MDXFrom6(350), MDXFrom6(35))];
    [_nextBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_nextBtn.layer setCornerRadius:16];
    [_nextBtn setBackgroundColor:RGB_MD(233, 67, 74)];
    [_nextBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [_nextBtn addTarget:self action:@selector(nextPage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_nextBtn];
    
}

#pragma mark -- 点击view退出键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_userNameTextField resignFirstResponder];
    [_numberTextField resignFirstResponder];
}

#pragma mark -- 输入框响应事件
- (void)present8:(UITextField *)textField{
    if (textField.text.length>12) {
        [textField setText:[textField.text substringToIndex:12]];
    }
}

#pragma mark -- 登陆按钮 登陆对应的客户端
- (void)nextPage:(UIButton *)button
{
     InformationViewController *informationVC=[[InformationViewController alloc]init];
     [self.navigationController pushViewController:informationVC animated:YES];
   // [self presentViewController:tabbar animated:YES completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
