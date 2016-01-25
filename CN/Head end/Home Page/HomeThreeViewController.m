//
//  HomeThreeViewController.m
//  CN
//
//  Created by PetroChina Co Ltd on 16/1/21.
//  Copyright © 2016年 PetroChina Co Ltd. All rights reserved.
//

#import "HomeThreeViewController.h"
#import "detailViewController.h"

@interface HomeThreeViewController ()<UITextFieldDelegate>
{
    CGFloat buttonWidth;
    
    CGFloat buttonHeight;
    
    // -- 距离左边和右边的距离
    CGFloat xSpace;
    
    CGFloat buttonSpaceX;
    
    CGFloat buttonSapceY;
}

@property (nonatomic ,strong)UITextField *searchTextFiled;
@property (nonatomic , assign) CGFloat lastButtonY;
@property (nonatomic , strong) NSMutableArray *buttonArr;
@property (nonatomic , strong)NSMutableArray *deleteButton;
@property (nonatomic , strong)UILabel *label;
@property (nonatomic ,strong)UIView *tmpview;

@end

@implementation HomeThreeViewController
static int buttontag=100;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self initButtonArr];
    
    [self.navigationItem setTitle:@"报销项目"];
    UIBarButtonItem *rightbarbutton=[[UIBarButtonItem alloc]initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(rightbarbutton)];
    [rightbarbutton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem=rightbarbutton;
    //
    [self setUpSearchTextFiled];
    [self createItem];
    self.tmpview=[[UIView alloc]initWithFrame:CGRectMake(0, self.lastButtonY+MDXFrom6(12), KScreenWidth, MDXFrom6(182))];
    //[view setBackgroundColor:[UIColor yellowColor]];
    UILabel *line1=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth,MDXFrom6(1))];
    line1.backgroundColor=[UIColor lightGrayColor];
    [self.tmpview addSubview:line1];
    //循环创建按钮
    for (NSInteger i =0; i<3; i++) {
        for (NSInteger j =0; j<5; j++) {
            buttontag++;
            UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
            
            btn.titleLabel.textAlignment=NSTextAlignmentCenter;
            [btn setTitleColor:RGB_MD(51, 51, 51) forState:UIControlStateNormal];
            btn.frame=CGRectMake(MDXFrom6(buttonSpaceX+j*(buttonWidth+xSpace)), MDXFrom6(buttonSapceY+(buttonHeight+buttonSapceY)*i), buttonWidth, buttonHeight) ;
            [btn setTitle:self.buttonArr[i][j] forState:UIControlStateNormal];
            [btn.titleLabel setFont:[UIFont systemFontOfSize:12]];
            [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            btn.tag=buttontag;
            [self.tmpview addSubview:btn];
        }
    }
    UILabel *line2=[[UILabel alloc]initWithFrame:CGRectMake(0, MDXFrom6(181), KScreenWidth, MDXFrom6(1))];
    [line2 setBackgroundColor:[UIColor lightGrayColor]];
    [self.tmpview addSubview:line2];
    [self.view addSubview:self.tmpview];
    
    
}
//创建按钮数组
-(void)initButtonArr
{
    buttonWidth=MDXFrom6(60);
    buttonHeight=MDXFrom6(40);
    buttonSpaceX=MDXFrom6(15);
    buttonSapceY=MDXFrom6(15);
    xSpace=(KScreenWidth-2*buttonSpaceX-5*buttonWidth)/4;
    NSArray *arr1=@[@"水电",@"监控",@"网络",@"加油站",@"油罐"];
    NSArray *arr2=@[@"照明",@"罩棚",@"服装",@"洗车房",@"电脑"];
    NSArray *arr3=@[@"门窗",@"办公",@"加油枪",@"墙体建筑",@"其他"];
    self.deleteButton=[NSMutableArray array];
    
    self.buttonArr=[NSMutableArray array];
    [self.buttonArr addObject:arr1];
    [self.buttonArr addObject: arr2];
    [self.buttonArr addObject:arr3];
}
#pragma mark --- 创建搜索框

- (void)setUpSearchTextFiled
{
    self.searchTextFiled  = [[UITextField alloc]initWithFrame:CGRectMake(MDXFrom6(15),0, MDXFrom6(350)-MDXFrom6(15), MDXFrom6(35))];
    
    [self.searchTextFiled setBorderStyle:UITextBorderStyleNone];
    [self.searchTextFiled setFont:[UIFont systemFontOfSize:15]];
    
    [self.searchTextFiled setClearButtonMode:UITextFieldViewModeWhileEditing];
    
    [self.searchTextFiled setDelegate:self];
    
    //设置搜索框ImageView
    UIImageView *textImageView = [[UIImageView alloc]initWithFrame:CGRectMake((KScreenWidth-MDXFrom6(350))/2, MDXFrom6(90), MDXFrom6(350), MDXFrom6(35))];
    
    [textImageView setImage:[UIImage imageNamed:@"ss_srk"]];
    
    [textImageView addSubview:self.searchTextFiled];
    
    [textImageView setUserInteractionEnabled:YES];
    [self.view addSubview:textImageView];
    //创建文本框右视图
    UIView *searchView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, MDXFrom6(35))];
    
    UIImageView *searchImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, MDXFrom6(10), 15, 15)];
    
    [searchImageView setImage:[UIImage imageNamed:@"ss_fdj"]];
    
    [searchView addSubview:searchImageView];
    
    [self.searchTextFiled setRightView:searchView];
    
    [self.searchTextFiled setRightViewMode:UITextFieldViewModeAlways];
    
}
-(void)createItem
{
    self.label=[[UILabel alloc]initWithFrame:CGRectMake(MDXFrom6((KScreenWidth-MDXFrom6(350))/2)+MDXFrom6(8), MDXFrom6(90)+MDXFrom6(35)+MDXFrom6(12), 200, 40)];
#
    if (self.deleteButton.count==0) {
        self.lastButtonY=self.label.frame.origin.y+MDXFrom6(40);
        
    }
    else
    {
        self.lastButtonY=self.label.frame.origin.y+MDXFrom6(40)+MDXFrom6(40);
    }
    self.label.text=@"报修项目";
    self.label.textColor=[UIColor darkGrayColor];
    [self.view addSubview:self.label];
    
}
-(UIView *)loadButtonView
{
    self.tmpview=[[UIView alloc]initWithFrame:CGRectMake(0, self.lastButtonY+MDXFrom6(12), KScreenWidth, MDXFrom6(182))];
    //[view setBackgroundColor:[UIColor yellowColor]];
    UILabel *line1=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth,MDXFrom6(1))];
    line1.backgroundColor=[UIColor lightGrayColor];
    [self.tmpview addSubview:line1];
    //循环创建按钮
    for (NSInteger i =0; i<3; i++) {
        for (NSInteger j =0; j<5; j++) {
            buttontag++;
            UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
            
            btn.titleLabel.textAlignment=NSTextAlignmentCenter;
            [btn setTitleColor:RGB_MD(51, 51, 51) forState:UIControlStateNormal];
            btn.frame=CGRectMake(MDXFrom6(buttonSpaceX+j*(buttonWidth+xSpace)), MDXFrom6(buttonSapceY+(buttonHeight+buttonSapceY)*i), buttonWidth, buttonHeight) ;
            [btn setTitle:self.buttonArr[i][j] forState:UIControlStateNormal];
            [btn.titleLabel setFont:[UIFont systemFontOfSize:12]];
            [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            btn.tag=buttontag;
            [self.tmpview addSubview:btn];
        }
    }
    UILabel *line2=[[UILabel alloc]initWithFrame:CGRectMake(0, MDXFrom6(181), KScreenWidth, MDXFrom6(1))];
    [line2 setBackgroundColor:[UIColor lightGrayColor]];
    [self.tmpview addSubview:line2];
    return self.tmpview;
}
//导航右按钮点击事件
-(void)rightbarbutton
{
    detailViewController *detail=[[detailViewController alloc]init];
    detail.deleteButton=[NSArray arrayWithArray:self.deleteButton];
    detail.buttonArr=[NSArray arrayWithArray:self.buttonArr];
    [self.navigationController pushViewController:detail animated:YES];
}
//报修项目栏目
-(void)buttonClick:(id)sender
{
    int i =0;
    UIButton *btn=(UIButton *)sender;
    btn.backgroundColor=[UIColor lightGrayColor];
    for ( i=0; i<self.deleteButton.count; i++)
    {
        UIButton *tmpButton=(UIButton *)self.deleteButton[i];
        if (tmpButton.tag==btn.tag) {
            break;
        }
        
    }
    if (i==self.deleteButton.count)
    {
        [self.deleteButton addObject:btn];
    }
    if (self.deleteButton.count!=0)
    {
        
        self.lastButtonY=self.label.frame.origin.y+MDXFrom6(40)+MDXFrom6(40);
        self.tmpview.frame=CGRectMake(0, self.lastButtonY+MDXFrom6(12), KScreenWidth, MDXFrom6(182));
        
        
    }
    NSInteger k,h,m;
    for (NSInteger i=0; i<self.deleteButton.count; i++)
    {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setFrame:CGRectMake(10+MDXFrom6(80)*i, self.lastButtonY-MDXFrom6(40), buttonWidth, MDXFrom6(30))];
        
        
        [btn addTarget:self action:@selector(ButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        [btn setBackgroundColor:[UIColor lightGrayColor]];
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
        
        [btn setTitle:str forState:UIControlStateNormal];
        [self.view addSubview:btn];
    }
    
}
-(void)ButtonClick
{
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.searchTextFiled resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
