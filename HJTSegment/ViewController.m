//
//  ViewController.m
//  HJTSegment
//
//  Created by celia on 16/6/6.
//  Copyright (c) 2016年 celia. All rights reserved.
//

#import "ViewController.h"
#import "SegmentView.h"
#define WIDTH self.view.bounds.size.width
#define HEIGHT self.view.bounds.size.height
@interface ViewController ()<UIScrollViewDelegate>{
    SegmentView *segment;
    UIScrollView *_bgScrollView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    segment = [[SegmentView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, 68) imageArray:@[@"Search_repository-gray@2x", @"Search_community-gray@2x", @"Search_say-gray@2x"] selectImageArray:@[@"Search_repository@2x",@"Search_community@2x",@"Search_say@2x"] titleArray:@[@"one",@"two",@"three"] defaultSelectIndex:1 selectBlock:^(NSInteger selectIndex) {
         [_bgScrollView setContentOffset:CGPointMake(selectIndex * WIDTH, 0) animated:YES];
    }];
    segment.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:segment];
    
    _bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 132, WIDTH, HEIGHT)];
    _bgScrollView.bounces = NO;
    _bgScrollView.scrollEnabled = YES;
    _bgScrollView.delegate = self;
    _bgScrollView.pagingEnabled = YES;
    _bgScrollView.showsHorizontalScrollIndicator = NO;
    _bgScrollView.showsVerticalScrollIndicator = NO;
    _bgScrollView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_bgScrollView];
    
    UIView *view0 = [[UIView alloc]initWithFrame:CGRectMake(0, 100, 50, 50)];
    view0.backgroundColor = [UIColor redColor];
    [_bgScrollView addSubview:view0];
    
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(WIDTH+50, 100, 50, 50)];
    view1.backgroundColor = [UIColor greenColor];
    [_bgScrollView addSubview:view1];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{


}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == _bgScrollView) {
        if (scrollView.contentOffset.x == 0) {
            [segment selectedIndex:0];
            
        } else if (scrollView.contentOffset.x == WIDTH ) {
            [segment selectedIndex:1];
            
        }else if (scrollView.contentOffset.x == WIDTH * 2 ) {
            [segment selectedIndex:2];
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
