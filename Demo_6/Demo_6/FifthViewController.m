//
//  FifthViewController.m
//  Demo_6
//
//  Created by vfa on 12/09/2022.
//

#import "FifthViewController.h"

@interface FifthViewController ()
@property (nonatomic, strong) UIView *squareView;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UISnapBehavior *snapBehavior;

@end

@implementation FifthViewController

- (void) createGestureRecognizer{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tap];
}

- (void) createSmallSquareView{
    self.squareView = [[UIView alloc] initWithFrame:
                    CGRectMake(0.0f, 0.0f, 80.0f, 80.0f)];
    self.squareView.backgroundColor = [UIColor greenColor];
    self.squareView.center = self.view.center;
    [self.view addSubview:self.squareView];
}

- (void) createAnimatorAndBehaviors{
    self.animator = [[UIDynamicAnimator alloc]
                         initWithReferenceView:self.view];
        
    /* Create collision detection */
    UICollisionBehavior *collision = [[UICollisionBehavior alloc]
                                    initWithItems:@[self.squareView]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:collision];
        
    /* For now, snap the square view to its current center */
    self.snapBehavior = [[UISnapBehavior alloc]
                        initWithItem:self.squareView
                         snapToPoint:self.squareView.center];
    self.snapBehavior.damping = 0.5f;
    
    /* Medium oscillation */
    [self.animator addBehavior:self.snapBehavior];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createGestureRecognizer];
    [self createSmallSquareView];
    [self createAnimatorAndBehaviors];
}

- (void) handleTap:(UITapGestureRecognizer *)paramTap{
    /* Get the angle between the center of the square view
         and the tap point
     */
    CGPoint tapPoint = [paramTap locationInView:self.view];
    if (self.snapBehavior != nil){
        [self.animator removeBehavior:self.snapBehavior];
    }
    self.snapBehavior = [[UISnapBehavior alloc] initWithItem:self.squareView
                                                snapToPoint:tapPoint];
    self.snapBehavior.damping = 0.5f;
    
    /* Medium oscillation */
    [self.animator addBehavior:self.snapBehavior];
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
