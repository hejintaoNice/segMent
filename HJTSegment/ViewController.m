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
@interface ViewController (){
    SegmentView *segment;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    segment = [[SegmentView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, 68) imageArray:@[@"Search_repository-gray@2x", @"Search_community-gray@2x", @"Search_say-gray@2x"] selectImageArray:@[@"Search_repository@2x",@"Search_community@2x",@"Search_say@2x"] titleArray:@[@"one",@"two",@"three"] defaultSelectIndex:1 selectBlock:^(NSInteger selectIndex) {
        
    }];
    segment.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:segment];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
