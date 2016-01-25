//
//  HomePageViewController.m
//  CN
//
//  Created by PetroChina Co Ltd on 16/1/22.
//  Copyright © 2016年 PetroChina Co Ltd. All rights reserved.
//

#import "HomePageViewController.h"
#import "JRScrollViewAndPageControl.h"  //公告 循环滚动
#import <RESideMenu.h>  //左 侧边栏
#import "HomeThreeViewController.h"


@interface HomePageViewController ()<JRScrollControlProtocol,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    JRScrollViewAndPageControl *_jrScrollView;
    NSArray *_allNameAry;
    NSArray *_allPicAry;
    
}
@end

@implementation HomePageViewController

-(void)viewWillAppear:(BOOL)animated
{
    //隐藏系统的返回按钮
    [self.navigationItem setHidesBackButton:YES];}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //导航栏上面添加按钮
    [self setNavigationBtn];
    
    
    //公告  添加封装好的scrollView
    _jrScrollView = [[JRScrollViewAndPageControl alloc] initWithFrame:CGRectMake(0, KSUM, KScreenWidth, MDXFrom6(150))];
    _jrScrollView.delegate = self;
    [self.view addSubview:_jrScrollView];
    
    //要展示的内容
    NSMutableArray *showAry = [NSMutableArray array];
    for (int i=6; i<8; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"star%i.png",i]]];
        [showAry addObject:imgView];
    }
    
    //传值，设置要显示的内容
    _jrScrollView.imageViewAry = showAry;
    
    //开启自动翻页
    [_jrScrollView shouldAutoScrollShow:YES];
    
    
    // 主要内容 collectionView
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, MDXFrom6(150)+64, KScreenWidth, KScreenHeight-64-MDXFrom6(150)-50) collectionViewLayout:flowLayout];
    
    collectionView.backgroundColor = RGBA_MD(150, 150, 150, 0.5);
    
    [self.view addSubview:collectionView];
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"myCell"];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    _allNameAry = @[@"审批管理",@"维修单",@"我要报修",@"维修员消息",@"关于我们",@"意见反馈",@"快速查找"];
    _allPicAry = @[@"pic1.png",@"pic2.png",@"pic3.png",@"pic4.png",@"pic5.png",@"pic6.png",@"pic7.png"];
}

#pragma mark - 滚动视图协议中的方法
-(void)didClickPage:(JRScrollViewAndPageControl *)scrol andIndex:(NSInteger)index{
    //停止自动翻页
    [_jrScrollView shouldAutoScrollShow:NO];
}

#pragma mark - 实现自动翻页
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    //实现自动翻页
    [_jrScrollView shouldAutoScrollShow:YES];
}

#pragma mark - 停止自动翻页
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    //停止自动翻页
    [_jrScrollView shouldAutoScrollShow:NO];
}


#pragma mark - 左侧按钮
-(void)setNavigationBtn{
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"DashboardTabBarItemProfile@2x 2"] style:UIBarButtonItemStylePlain target:self action:@selector(presentLeftMenuViewController)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"DashboardTabBarItemProfile@2x 2"] style:UIBarButtonItemStylePlain target:self action:@selector(clickRightBtn)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
}

#pragma mark - 点击左侧按钮
-(void)presentLeftMenuViewController{
    [self.sideMenuViewController presentLeftMenuViewController];
    //    NSLog(@"点击按钮");
}

#pragma mark - 点击右侧按钮
-(void)clickRightBtn{
    
    //    NSLog(@"点击按钮");
}

#pragma mark - collectionView的 DataSource 和 Delegate方法

// 有多少组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

// 返回指定区(section)包含的数据源条目数(number of items)，该方法必须实现
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _allNameAry.count; //可以自动换行
}

// 返回某个indexPath对应的cell，该方法必须实现
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((((KScreenWidth-2)/3)-MDXFrom6(80))/2, MDXFrom6(80), MDXFrom6(80), MDXFrom6(30))];
    //    label.backgroundColor = [UIColor redColor];
    label.textColor = [UIColor grayColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((((KScreenWidth-2)/3)-MDXFrom6(60))/2, MDXFrom6(20), MDXFrom6(60), MDXFrom6(60))];
    //    imageView.backgroundColor = [UIColor redColor];
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
    label.text = [_allNameAry objectAtIndex:indexPath.row];
    label.textAlignment = 1;
    [cell addSubview:label];
    
    imageView.image = [UIImage imageNamed:[_allPicAry objectAtIndex:indexPath.row]];
    
    [cell addSubview:imageView];
    return cell;
}

//每个cell的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((KScreenWidth-2)/3.0, (KScreenHeight-64-MDXFrom6(150)-50-2)/3.0);
}

// 设定指定区内Cell的最小间距 每个section中左右 cell 之间的距离
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}

// 上下cell之间的距离
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}

//  点击cell方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ((long)indexPath.row == 2) {
        HomeThreeViewController *homeThreeVC = [[HomeThreeViewController alloc] init];
        [self.navigationController pushViewController:homeThreeVC animated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end






