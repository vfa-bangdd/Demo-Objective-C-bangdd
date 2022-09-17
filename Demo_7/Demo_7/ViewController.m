//
//  ViewController.m
//  Demo_7
//
//  Created by vfa on 12/09/2022.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /* 1) Create my button */
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.translatesAutoresizingMaskIntoConstraints = NO;
    [self.button setTitle:@"Created Button" forState:UIControlStateNormal];
    [self.view addSubview:self.button];
    
    UIView *superview = self.button.superview;
    
    /* 2) Create the constraint to put the button horizontial in the center */
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint
                                             constraintWithItem:self.button
                                             attribute:NSLayoutAttributeCenterX
                                             relatedBy:NSLayoutRelationEqual
                                             toItem:superview
                                             attribute:NSLayoutAttributeCenterX
                                             multiplier:1.0f
                                             constant:0.0f];
    
    
    /* 3) Create the constraint to put the button vertically in the center */
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint
                                             constraintWithItem:self.button
                                             attribute:NSLayoutAttributeCenterY
                                             relatedBy:NSLayoutRelationEqual
                                             toItem:superview
                                             attribute:NSLayoutAttributeCenterY
                                             multiplier:1.0f
                                             constant:0.0f];
    
    /* Add the constraints to the superview of the button */
    [superview addConstraints:@[centerXConstraint, centerYConstraint]];
}


@end
