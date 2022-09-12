//
//  ViewController.m
//  Demo_6
//
//  Created by vfa on 09/09/2022.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *squareView;
@property (nonatomic, strong) UIDynamicAnimator *animator;

@end

@implementation ViewController

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    /* Create little square view and it to self.view */
    self.squareView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 200.0f)];
    self.squareView.backgroundColor = UIColor.greenColor;
    self.squareView.center = self.view.center;
    [self.view addSubview:self.squareView];
    
    /* Create the animator and the gravity */
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *graviy = [[UIGravityBehavior alloc] initWithItems:@[self.squareView]];
    [self.animator addBehavior:graviy];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
