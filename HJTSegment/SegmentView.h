//
//  SegmentView.h
//  
//
//  Created by celia on 16/6/6.
//
//

#import <UIKit/UIKit.h>
typedef void(^SelectIndexBlock)(NSInteger selectIndex);
@interface SegmentView : UIView

NS_ASSUME_NONNULL_BEGIN
//默认背景颜色
@property (nonatomic, strong) UIColor *bgColor;
//默认图片颜色
@property (nonatomic, strong) UIColor *imageColor;
//默认字体颜色
@property (nonatomic, strong) UIColor *titleColor;
//选中背景颜色
@property (nonatomic, strong) UIColor *selectBgColor;
//选中图片颜色
@property (nonatomic, strong) UIColor *selectImageColor;
//选中字体颜色
@property (nonatomic, strong) UIColor *selectTitleColor;
//滚动条颜色
@property (nonatomic, strong) UIColor *scrollViewColor;

@property (nonatomic, copy) SelectIndexBlock selectBlock;

@property (nonatomic, assign) NSInteger selectedIndex;

- (instancetype)initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray selectImageArray:(NSArray *)selectImageArray titleArray:(NSArray *)titleArray defaultSelectIndex:(NSInteger)selectedIndex selectBlock:(SelectIndexBlock)selectBlock;

- (void)selectedIndex:(NSInteger)selectIndex;

@end
NS_ASSUME_NONNULL_END