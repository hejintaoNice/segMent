//
//  SegmentView.m
//  
//
//  Created by celia on 16/6/6.
//
//

#import "SegmentView.h"
#import "MacroDefinition.h"
#import "HJTCustomMD.h"
@interface SegmentView ()
@property (weak, nonatomic) IBOutlet UIButton *buttonOne;
@property (weak, nonatomic) IBOutlet UIButton *buttonTwo;
@property (weak, nonatomic) IBOutlet UIButton *buttonThree;
@property (weak, nonatomic) IBOutlet UIImageView *imageOne;
@property (weak, nonatomic) IBOutlet UIImageView *imageTwo;
@property (weak, nonatomic) IBOutlet UIImageView *imageThree;
@property (weak, nonatomic) IBOutlet UILabel *labelOne;
@property (weak, nonatomic) IBOutlet UILabel *labelTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelThree;
@property (weak, nonatomic) IBOutlet UIView *selectedView;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) NSArray *selectImageArray;


@property (nonatomic, strong) NSArray *labelArray;
@property (nonatomic, strong) NSArray *defaultImageArray;

@end
@implementation SegmentView

-(instancetype)initWithFrame:(CGRect)frame imageArray:(NSArray * __nonnull)imageArray selectImageArray:(NSArray * __nonnull)selectImageArray titleArray:(NSArray * __nonnull)titleArray defaultSelectIndex:(NSInteger)selectedIndex selectBlock:(SelectIndexBlock __nonnull)selectBlock{
    self = [[[NSBundle mainBundle] loadNibNamed:@"SegmentView" owner:self options:nil] objectAtIndex:0];
    if (self) {
        self.frame = frame;
        NSAssert([imageArray count] == 3 && [titleArray count] == 3 && [selectImageArray count] == 3, @"Parameters error");
        self.selectBlock = selectBlock;
        self.titleArray = titleArray;
        self.imageArray = imageArray;
        self.selectImageArray = selectImageArray;
        self.selectedIndex = selectedIndex;
        
        [self initViews];
    }
    return  self;
}


- (void)selectedIndex:(NSInteger)selectIndex
{
    NSAssert(selectIndex >= 0 && selectIndex <= 2, @"Parameters error");
    
    [self selectIndex:selectIndex];
}


- (void)initViews
{
    self.labelOne.text = self.titleArray[0];
    self.labelTwo.text = self.titleArray[1];
    self.labelThree.text = self.titleArray[2];
    
    self.imageOne.image = [UIImage imageNamed:self.imageArray[0]];
    self.imageTwo.image = [UIImage imageNamed:self.imageArray[1]];
    self.imageThree.image = [UIImage imageNamed:self.imageArray[2]];
    
    self.defaultImageArray = [NSArray arrayWithObjects:self.imageOne,self.imageTwo,self.imageThree, nil];
    self.labelArray = [NSArray arrayWithObjects:self.labelOne,self.labelTwo,self.labelThree, nil];
    
    self.selectedView.backgroundColor = RGB(135, 244, 224);
    
    self.imageOne.image = [UIImage imageNamed:self.selectImageArray[0]] ;
}

- (void)selectIndex:(NSInteger)selectIndex
{
    for (UILabel *label in self.labelArray) {
        label.textColor = RGB(158, 155, 156);
    }
    
    self.imageOne.image = [UIImage imageNamed:self.imageArray[0]];
    self.imageTwo.image = [UIImage imageNamed:self.imageArray[1]];
    self.imageThree.image = [UIImage imageNamed:self.imageArray[2]];
    
    switch (selectIndex) {
        case 0:
        {
            _labelOne.textColor = RGB(135, 244, 224);
            self.imageOne.image = [UIImage imageNamed:self.selectImageArray[0]];
            
            WS
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                SS
                strongSelf.selectedView.center = CGPointMake(strongSelf.buttonOne.center.x, strongSelf.selectedView.center.y);
            } completion:nil];
            
        }
            break;
            
        case 1:
        {
            _labelTwo.textColor = RGB(135, 244, 224);
            self.imageTwo.image = [UIImage imageNamed:self.selectImageArray[1]];
            
            WS
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                SS
                strongSelf.selectedView.center = CGPointMake(strongSelf.buttonTwo.center.x, strongSelf.selectedView.center.y);
            } completion:nil];
            
        }
            break;
            
        case 2:
        {
            _labelThree.textColor = RGB(135, 244, 224);
            self.imageThree.image = [UIImage imageNamed:self.selectImageArray[2]];
            
            
            WS
            [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                SS
                strongSelf.selectedView.center = CGPointMake(strongSelf.buttonThree.center.x, strongSelf.selectedView.center.y);
            } completion:nil];
            
            
        }
            break;
            
        default:
            break;
    }
}

- (IBAction)select:(UIButton *)sender {
    switch (sender.tag) {
        case 111:
        {
            [self selectIndex:0];
            self.selectBlock(0);
            
        }
            break;
            
        case 222:
        {
            [self selectIndex:1];
            self.selectBlock(1);
        }
            break;
            
        case 333:
        {
            [self selectIndex:2];
            self.selectBlock(2);
        }
            break;
            
        default:
            break;
    }
    
}


@end
