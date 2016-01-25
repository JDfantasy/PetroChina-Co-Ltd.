//
//  JRScrollViewAndPageControl.m
//  9.25循环滚动的scrollVIew
//
//  Created by PetroChina Co Ltd on 15/9/25.
//  Copyright (c) 2015年 PetroChina Co Ltd. All rights reserved.
//

#import "JRScrollViewAndPageControl.h"
#define VIEW_WIDTH self.bounds.size.width
#define VIEW_HEIGHT self.bounds.size.height

// 类的拓展
@interface  JRScrollViewAndPageControl ()<UIScrollViewDelegate>
{
    //当前的页码，默认从 0 开始
    NSInteger _currentPageNum;
    
    UIView *_firstView;//用于循环显示的三个View
    UIView *_middleView;
    UIView *_lastView;
    
    NSTimer *_timer;//计时器
}

@end

@implementation JRScrollViewAndPageControl

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        //添加scrollView
        _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        _scrollView.showsHorizontalScrollIndicator = NO;//水平滚动条
        _scrollView.pagingEnabled = YES; //开启分页
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake(3*VIEW_WIDTH, 0);//滚动范围
        _scrollView.bounces = NO; //弹簧效果
        _scrollView.backgroundColor = [UIColor blackColor];
        [self addSubview:_scrollView];
        
        //添加pageControl
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, VIEW_HEIGHT-37, VIEW_WIDTH, 37)];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.userInteractionEnabled = NO;//或者enabled
//        _pageControl.enabled = NO;//或者上面
        [self addSubview:_pageControl];
        
        //添加手势
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)];
        [tapGes setNumberOfTapsRequired:1];
        [tapGes setNumberOfTouchesRequired:1];
        [_scrollView addGestureRecognizer:tapGes];
    }
    return self;
}

#pragma mark - 点击图片
-(void)tapImageView:(UITapGestureRecognizer *)tap{
//    NSLog(@"-----点击了 %li 张图",_currentPageNum);
    
    //代理 调用
    if ([_delegate respondsToSelector:@selector(didClickPage:andIndex:)]) {
        [_delegate didClickPage:self andIndex:_currentPageNum];
    }
}

#pragma mark - 展示的图片初始化
-(void)setImageViewAry:(NSMutableArray *)imageViewAry{
    
    _imageViewAry = imageViewAry;
    
    _pageControl.numberOfPages = _imageViewAry.count;//设置分页个数
    
    _currentPageNum = 0; //默认页码为 0
    
    //刷新界面
    [self reloadViews];
}

#pragma mark - 刷新界面
-(void)reloadViews{
    
//    NSLog(@"%@",_imageViewAry);
    
    //删掉旧的
    [_firstView removeFromSuperview];
    [_middleView removeFromSuperview];
    [_lastView removeFromSuperview];
    
    //加上新的
    //中间
    _middleView = [_imageViewAry objectAtIndex:_currentPageNum];    
    //前一个
    if (_currentPageNum ==0) {
        _firstView = [_imageViewAry lastObject];
    }else{
        _firstView = [_imageViewAry objectAtIndex:_currentPageNum-1];
    }
    //后一个
    if (_currentPageNum ==_imageViewAry.count-1) {
        _lastView = [_imageViewAry firstObject];
    }else{
        _lastView = [_imageViewAry objectAtIndex:_currentPageNum+1];
    }
    
    //设置位置
    _firstView.frame = CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT);
    _middleView.frame = CGRectMake(VIEW_WIDTH, 0, VIEW_WIDTH, VIEW_HEIGHT);
    _lastView.frame = CGRectMake(2*VIEW_WIDTH, 0, VIEW_WIDTH, VIEW_HEIGHT);
    
    //添加
    [_scrollView addSubview:_firstView];
    [_scrollView addSubview:_middleView];
    [_scrollView addSubview:_lastView];
    
    //显示中间
    _scrollView.contentOffset = CGPointMake(VIEW_WIDTH, 0);
    
    //页码刷新
    _pageControl.currentPage = _currentPageNum;
}

#pragma mark - 实现滚动结束的方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    //得到当前页数
    float xx = scrollView.contentOffset.x;
//    NSLog(@"------%f",xx);
    
    //往前翻
    if (xx < VIEW_WIDTH/2) {
        if (_currentPageNum ==0) {
            _currentPageNum = _imageViewAry.count-1;
        }else{
            _currentPageNum --;
        }
    }
    //往后翻
    if (xx > VIEW_WIDTH*3/2) {
        if (_currentPageNum == _imageViewAry.count-1) {
            _currentPageNum = 0;
        }else{
            _currentPageNum ++;
        }
    }
    //更新界面
    [self reloadViews];
}

#pragma mark - 实现自动滚动
-(void)shouldAutoScrollShow:(BOOL)autoScroll{
    
    if (autoScroll) {
        if (_timer != nil) {
            return;
        }
        //实现自动翻页
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(autoShowNextPage) userInfo:nil repeats:YES];
    }else{
        //不支持自动翻页
        [_timer invalidate];
        _timer = nil;
    }
}

#pragma mark - 展示下一页
-(void)autoShowNextPage{
    //改变页码
    if (_currentPageNum == _imageViewAry.count-1) {
        _currentPageNum = 0;
    }else{
        _currentPageNum++;
    }
    //刷新界面
    [self reloadViews];
}


@end











