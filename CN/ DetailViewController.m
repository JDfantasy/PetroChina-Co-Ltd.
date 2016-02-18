//
//  DetailViewController.m
//  CN
//
//  Created by PetroChina Co Ltd on 16/1/22.
//  Copyright © 2016年 PetroChina Co Ltd. All rights reserved.
//

#import "DetailViewController.h"
#import "RegistViewController.h"
@interface DetailViewController ()
{
    UITextField *_textField;
}
@property(nonatomic,strong) UIButton *nextBtn;

@end

@implementation DetailViewController

static int i=100;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    //导航栏标题
    [self.navigationItem setTitle:@"个人信息设置"];
    
    //工号
    [self.view addSubview:[self Loadview:@"工   号：" :@"点击输入工号" :CGRectMake(  MDXFrom6((KScreenWidth-MDXFrom6(350))/2) , MDXFrom6(80),  MDXFrom6(350), MDXFrom6(40))]];
    //姓名
    [self.view addSubview:[self Loadview:@"姓   名：" :@"点击输入姓名" :CGRectMake(  MDXFrom6((KScreenWidth-MDXFrom6(350))/2),MDXFrom6(80+50*1+15),  MDXFrom6(350), MDXFrom6(40))]];
    //公司
    [self.view addSubview:[self Loadview:@"公   司：" :@"请输入您的公司名称" :CGRectMake( MDXFrom6((KScreenWidth-MDXFrom6(350))/2) , MDXFrom6(80+50*2+15),  MDXFrom6(350), MDXFrom6(40))]];
    //身份证
    [self.view addSubview:[self Loadview:@"身份证：" :@"请输入身份证号" :CGRectMake(  MDXFrom6((KScreenWidth-MDXFrom6(350))/2) , MDXFrom6(80+50*3+15),  MDXFrom6(350), MDXFrom6(40))]];
    //联系人
    [self.view addSubview:[self Loadview:@"联系人：" :@"请输入您的电话号码" :CGRectMake(  MDXFrom6((KScreenWidth-MDXFrom6(350))/2) , MDXFrom6(80+50*4+15),  MDXFrom6(350), MDXFrom6(40))]];
    //密码
    [self.view addSubview:[self Loadview:@"密   码：" :@"请输入您的登录密码" :CGRectMake(  MDXFrom6((KScreenWidth-MDXFrom6(350))/2) , MDXFrom6(80+50*5+15),  MDXFrom6(350), MDXFrom6(40))]];
    
    //完成
    _nextBtn = [[UIButton alloc] initWithFrame:CGRectMake( MDXFrom6((KScreenWidth-MDXFrom6(350))/2), MDXFrom6(80+50*6-20+70), MDXFrom6(350), MDXFrom6(40))];
    [_nextBtn setTitle:@"完成" forState:UIControlStateNormal];
    [_nextBtn.layer setCornerRadius:MDXFrom6(20)];
    [_nextBtn setBackgroundColor:RGB_MD(233, 67, 74)];
    [_nextBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [_nextBtn addTarget:self action:@selector(finishPage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_nextBtn];
    
    //我已阅读并同意
    UIButton *agreeBtn = [[UIButton alloc] initWithFrame:CGRectMake(MDXFrom6(100), MDXFrom6(80+50*6-20+70+40+170), MDXFrom6(13), MDXFrom6(13))];
    agreeBtn.backgroundColor = [UIColor grayColor];
    [agreeBtn setBackgroundImage:[UIImage imageNamed:@"red.png"] forState:UIControlStateSelected];
    [self.view addSubview:agreeBtn];
    [agreeBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(MDXFrom6(100+20), MDXFrom6(80+50*6-20+70+40+170), MDXFrom6(60), 13)];
    label1.text = @"我已阅读并";
    label1.font = [UIFont systemFontOfSize:11];
    [label1 setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(MDXFrom6(100+20+56), MDXFrom6(80+50*6-20+70+40+170), MDXFrom6(90), 13)];
    label2.text = @"同意 《xxx协议》";
    label2.font = [UIFont systemFontOfSize:11];
    label2.textColor = [UIColor redColor];
    [label2 setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:label2];
    
    
    NSArray *tempArr=[NSArray arrayWithObjects:@"站长",@"维修员",@"运营商", nil];
    //站长 维修员 运营商
    for (NSInteger i=0; i<3; i++)
    {
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(MDXFrom6(35)+((KScreenWidth-MDXFrom6(70)-MDXFrom6(150))/2+MDXFrom6(40))*i+15, MDXFrom6(80+40+7.5), 40, 10)];
        label.font=[UIFont systemFontOfSize:11];
        label.text=[NSString stringWithFormat:@"%@",[tempArr objectAtIndex:i]];
        [self.view addSubview:label];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(MDXFrom6(35)+((KScreenWidth-MDXFrom6(70)-MDXFrom6(150))/2+MDXFrom6(40))*i, MDXFrom6(80+40+7.5), 10, 10)];
        btn.layer.cornerRadius = 3;
        [self.view addSubview:btn];
        btn.backgroundColor = [UIColor grayColor];
        [btn setBackgroundImage:[UIImage imageNamed:@"red.png"] forState:UIControlStateSelected];
        [btn.layer setBorderColor:(__bridge CGColorRef _Nullable)([UIColor redColor])]; // 边框颜色
        [btn.layer setBorderWidth:2];
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i+10;
    }
}

#pragma mark - 按钮点击事件
-(void)clickBtn:(UIButton *)sender{
    sender.selected = !sender.selected;
    
}

-(UIView *)Loadview:(NSString *)text :(NSString *)holder :(CGRect)rect
{
    
    UIView *view=[[UIView alloc]init];
    
    [view setFrame:rect];
    
    view.layer.borderWidth=1;
    
    view.layer.borderColor=[[UIColor grayColor]CGColor];
    
    view.layer.cornerRadius=MDXFrom6(20);
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(MDXFrom6(15), MDXFrom6(10), MDXFrom6(60), 20)];
    
    label.font=[UIFont systemFontOfSize:12];
    
    label.text=text;
    
    [view addSubview:label];
    //    UITextField * textfiled=[[UITextField alloc]initWithFrame:CGRectMake(MDXFrom6(65), MDXFrom6(10), MDXFrom6(200), 20)];
    
    _textField=[[UITextField alloc]initWithFrame:CGRectMake(MDXFrom6(65), MDXFrom6(10), MDXFrom6(200), 20)];
    
    _textField.tag=i;
    
    i++;
    
    _textField.placeholder=holder;
    
    [_textField setValue:[UIFont systemFontOfSize:11] forKeyPath:@"_placeholderLabel.font"];
    
    [_textField addTarget:self action:@selector(clickTextfiled:) forControlEvents:UIControlEventTouchUpInside];
    
    _textField.font=[UIFont systemFontOfSize:12.5];
    
    [view addSubview:_textField];
    
    return view;
}

#pragma mark - 判断textfiled是否为空
-(void)clickTextfiled:(UITextField *)sender{
    if (_textField.tag == 103 && [self validateIdentityCard:_textField.text]) {
        
    }
    NSLog(@"身份证号码输入错误");
    
}

#pragma mark - 点击完成按钮
- (void)finishPage:(UIButton *)button{

     for (UIView *tmpview in [self.view subviews]){
     
     for (id secondview in tmpview.subviews) {
     
     if ([secondview isKindOfClass:[UITextField class]]) {
     UITextField *text=(UITextField *)secondview;
     
     if (text.tag==100 && ![text.text isEqualToString:@""]){
     
     RegistViewController *regist=[[RegistViewController alloc]init];
     [self.navigationController pushViewController:regist animated:YES];
     }
     }
     }
     }

    
    if ([_textField.text isEqualToString:@""]) {
        
        //提示框
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"请完善个人信息" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alertVC animated:YES completion:nil];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
        [alertVC addAction:action];
        
        //判断身份证号
        //        if (_textField.tag == 103 && [self validateIdentityCard:_textField.text]) {
        //
        //        }
        //        NSLog(@"输入错误");
        
    }
    
    else{
        RegistViewController *regist=[[RegistViewController alloc]init];
        [self.navigationController pushViewController:regist animated:YES];
    }
    
//******************************************************
    
    NSString * username=userText.text;
    NSString * password=passText.text;
    username=[GJDUtil trim:username];
    password=[GJDUtil trim:password];
    if(username.length==0)
    {
        userText.text=@"";
        [userText becomeFirstResponder];
        [GJDUtil alertWithMessage:@"账号不能为空！" andWithVC:self];
        return;
    }
    if(password.length==0)
    {
        passText.text=@"";
        [passText becomeFirstResponder];
        [GJDUtil alertWithMessage:@"密码不能为空！" andWithVC:self];
        return;
    }
    //注册http://101.201.210.95:8080/cnpcmms/api/register?username=&name=%E9%AB%99%E7%BB%A7%E5%BE%B7&company=%E5%AE%87%E4%BF%A1%E6%99%BA%E8%87%BB&identification=232332199204080915&password=568917189&phone=18519194438&mobile=18245562716&type=site
    //   http://101.201.210.95:8080/cnpcmms/api/register?username=51776&name=%E9%AB%99%E7%BB%A7%E5%BE%B7&company=%E6%99%BA%E6%9E%97%E5%8D%9A%E5%B9%B3&identification=232332199204080911&password=%@&phone=18245562715&mobile=%@&type=site
    
    
    NSURL * url=[NSURL URLWithString:@"http://101.201.210.95:8080/cnpcmms/api/register"];
    //动态请求
    NSMutableURLRequest * request=[NSMutableURLRequest requestWithURL:url];
    //设置请求方式为post
    [request setHTTPMethod:@"post"];
    NSString * parameter=[NSString stringWithFormat:@"username=19921021&name=%@&identification=232332199204080911&password=%@&phone=182455627155&mobile=%@&type=site",@"%E9%AB%99%E7%BB%A7%E5%BE%B7&company=%E6%99%BA%E6%9E%97%E5%8D%9A%E5%B9%B3",password,username];
    //设置请求参数
    [request setHTTPBody:[parameter dataUsingEncoding:NSUTF8StringEncoding]];
    //会话
    NSURLSession * session=[NSURLSession sharedSession];
    //任务
    NSURLSessionDataTask * task=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        if(error==nil && data)
        {
            NSString * str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            if([str containsString:@"用户名已被注册"])
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [GJDUtil alertWithMessage:@"对不起，用户已经存在了!" andWithVC:self];
                });
            }
            else if([str containsString:@"恭喜您，账号注册成功！"])
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [GJDUtil alertWithMessage:@"恭喜你，注册成功了!" andWithVC:self];
                });
            }
            else
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [GJDUtil alertWithMessage:@"对不起，注册失败了!" andWithVC:self];
                });
            }
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                [GJDUtil alertWithMessage:@"请求失败!" andWithVC:self];
            });
        }
    }];
    [SVProgressHUD showWithStatus:@"正在注册，请稍候..." maskType:SVProgressHUDMaskTypeBlack];
    
    //启动任务
    [task resume];
    NSLog(@"main");
}

#pragma mark - 正则匹配用户分身证号
-(BOOL)validateIdentityCard:(NSString *)identityCard{
    
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    for (UIView *tmpview in [self.view subviews])
    {
        for (id secondview in tmpview.subviews) {
            if ([secondview isKindOfClass:[UITextField class]]) {
                UITextField *text=(UITextField *)secondview;
                if (text.tag==100) {
                    [text resignFirstResponder];
                }
                else if (text.tag==101)
                {
                    [text resignFirstResponder];
                }
                else if (text.tag==102)
                {
                    [text resignFirstResponder];
                }
                else if (text.tag==103)
                {
                    [text resignFirstResponder];
                }
                else if (text.tag==104)
                {
                    [text resignFirstResponder];
                }
                else if (text.tag==105)
                {
                    [text resignFirstResponder];
                }
            }
        }
    }
}

#pragma mark -- 完成按钮
-(void)registerTap:(UIButton * )sender{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
