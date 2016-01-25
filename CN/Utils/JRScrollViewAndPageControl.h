//
//  JRScrollViewAndPageControl.h
//  9.25循环滚动的scrollVIew
//
//  Created by PetroChina Co Ltd on 15/9/25.
//  Copyright (c) 2015年 PetroChina Co Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JRScrollViewAndPageControl;

//协议
@protocol JRScrollControlProtocol<NSObject>

@optional
-(void)didClickPage:(JRScrollViewAndPageControl *)scrol andIndex:(NSInteger)index;

@end

@interface JRScrollViewAndPageControl : UIView

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSMutableArray *imageViewAry;

@property (nonatomic, weak) id <JRScrollControlProtocol> delegate;//

//自动滚动的方法
-(void)shouldAutoScrollShow:(BOOL)autoScroll;

@end
