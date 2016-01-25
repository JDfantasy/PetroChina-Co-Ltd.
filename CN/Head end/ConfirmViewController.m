//
//  ConfirmViewController.m
//  CN
//
//  Created by JD－高 on 16/1/24.
//  Copyright © 2016年 PetroChina. All rights reserved.
//

#import "ConfirmViewController.h"
#import "ZhanzhangViewController.h"

@interface ConfirmViewController (){
   // FMDatabase * db;
}
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentLabel;


@end

@implementation ConfirmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationItem setTitle:@"信息确认"];
    //添加导航栏左右按钮
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnThing:)];
    self.navigationItem.rightBarButtonItem = rightBtn;    
}

-(void)viewWillAppear:(BOOL)animated
{
    //显示
    self.titleLabel.text=self.news.title;
    self.authorLabel.text=self.news.author;
    self.contentLabel.text=self.news.content;
    NSLog(@"%@",self.news.idid);
//    FMResultSet * rs=[db executeQuery:@"select * from t_store where idid=?",self.news.idid ];
//    if([rs next])
//    {
//        self.navigationItem.rightBarButtonItem.title=@"取消";
//    }
//    [rs close];
}

#pragma mark -- 右侧确定按钮点击事件
- (void)rightBtnThing:(UIButton *)btn{
     ZhanzhangViewController *tabBarVC = [[ZhanzhangViewController alloc] init];
    [self presentViewController:tabBarVC animated:YES completion:^{
    }];
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
