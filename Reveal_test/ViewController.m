//
//  ViewController.m
//  Reveal_test
//
//  Created by ZTL_Sui on 2018/3/12.
//  Copyright © 2018年 ZTL_Sui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/** vie */
@property (nonatomic, strong) UIView *redView;
/** count */
@property (nonatomic, assign) NSInteger clickedCount;
/**  */
@property (nonatomic, strong) UIView *tempView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initSomeProperty];
    [self createUI];
}

- (void)initSomeProperty
{
    _clickedCount = 0;
}

- (void)createUI
{
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.frame = CGRectMake(100, 100, 200, 200);
    [self.view addSubview:redView];
    self.redView = redView;
    
    //
    UIButton *targetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [targetButton setTitle:@"changeColor" forState:UIControlStateNormal];
    targetButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [targetButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    targetButton.backgroundColor = [UIColor blackColor];
    targetButton.frame = CGRectMake(100, 350, 100, 35);
    [targetButton addTarget:self action:@selector(changeBGColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:targetButton];
}
- (UIView *)tempView
{
    if (!_tempView) {
        _tempView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        _tempView.backgroundColor = [UIColor blueColor];
    }
    return _tempView;
}
- (void)changeBGColor:(UIButton *)button
{
    _clickedCount++;
    NSLog(@"start--clicked count -> %ld",_clickedCount);
    if (_clickedCount %2 == 1) {
        [self.redView addSubview:self.tempView];
    }
    if (_clickedCount % 2 == 0) {
        if (self.tempView) {
            [self.tempView removeFromSuperview];
        }
    }
    NSLog(@"end--clicked count -> %ld",_clickedCount);
    
    self.redView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0f];
    
}


@end
