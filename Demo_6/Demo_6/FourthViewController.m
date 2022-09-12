//
//  FourthViewController.m
//  Demo_6
//
//  Created by vfa on 12/09/2022.
//

#import "FourthViewController.h"

@interface FourthViewController ()
@property (nonatomic, strong) UIView *squareView;
@property (nonatomic, strong) UIView *squareViewAnchorView;
@property (nonatomic, strong) UIView *anchorView;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIAttachmentBehavior *attachmentBehavior;

@end

@implementation FourthViewController

- (void) createSmallSquareView{
    self.squareView =
        [[UIView alloc] initWithFrame:
         CGRectMake(0.0f, 0.0f, 80.0f, 80.0f)];
    self.squareView.backgroundColor = [UIColor greenColor];
    self.squareView.center = self.view.center;
    self.squareViewAnchorView = [[UIView alloc] initWithFrame:
                                CGRectMake(60.0f, 0.0f, 20.0f, 20.0f)];
    self.squareViewAnchorView.backgroundColor = [UIColor brownColor];
    [self.squareView addSubview:self.squareViewAnchorView];
    [self.view addSubview:self.squareView];
}

- (void) createAnchorView{
    self.anchorView = [[UIView alloc] initWithFrame:
                    CGRectMake(120.0f, 120.0f, 20.0f, 20.0f)];
    self.anchorView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.anchorView];
}

- (void) createGestureRecognizer{
    UIPanGestureRecognizer *panGestureRecognizer =
        [[UIPanGestureRecognizer alloc] initWithTarget:self
                            action:@selector(handlePan:)];
    [self.view addGestureRecognizer:panGestureRecognizer];
}

- (void) createAnimatorAndBehaviors{
    self.animator = [[UIDynamicAnimator alloc]
                     initWithReferenceView:self.view];
    
    /* Create collision detection */
    UICollisionBehavior *collision = [[UICollisionBehavior alloc]
                                      initWithItems:@[self.squareView]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    self.attachmentBehavior = [[UIAttachmentBehavior alloc]
                               initWithItem:self.squareView
                               attachedToAnchor:self.anchorView.center];
    
    [self.animator addBehavior:collision];
    [self.animator addBehavior:self.attachmentBehavior];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self createGestureRecognizer];
    [self createSmallSquareView];
    [self createAnchorView];
    [self createAnimatorAndBehaviors];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) handlePan:(UIPanGestureRecognizer *)paramPan{
    CGPoint tapPoint = [paramPan locationInView:self.view];
    [self.attachmentBehavior setAnchorPoint:tapPoint];
    self.anchorView.center = tapPoint;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
