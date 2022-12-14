//
//  ThirdViewController.m
//  Demo_6
//
//  Created by vfa on 12/09/2022.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
@property (nonatomic, strong) UIView *squareView;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIPushBehavior *pushBehavior;

@end

@implementation ThirdViewController

- (void) createSmallSquareView {
    self.squareView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 80.0f, 80.0f)];
    
    self.squareView.backgroundColor = UIColor.greenColor;
    self.squareView.center = self.view.center;
    
    [self.view addSubview:self.squareView];
}

- (void) createGestureRecognize{
    UITapGestureRecognizer *tabGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handelTap:)];
    
    [self.view  addGestureRecognizer:tabGestureRecognizer];
}

- (void) createAnimatorAndBehaviors{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    /* Create collision detection */
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.squareView]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    self.pushBehavior = [[UIPushBehavior alloc]
        initWithItems:@[self.squareView]
        mode:UIPushBehaviorModeContinuous];
    
    [self.animator addBehavior:collision];
    [self.animator addBehavior:self.pushBehavior];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createGestureRecognize];
    [self createSmallSquareView];
    [self createAnimatorAndBehaviors];
}

- (void) handelTap: (UITapGestureRecognizer *) paramTap{
    
    /* Get the angle between the center of  the square view and the tap point */
    CGPoint tapPoint = [paramTap locationInView:self.view];
    CGPoint squareViewCenterPoint = self.squareView.center;
    
    /* Caculate the angle between the center point of the square view and the tap point to find out the angle of the push
     
        Formula for detecting the angle between two points is:
     
        arc tangent 2((p1.x - p2.x), (p1.y-p2.y))
     */
    CGFloat deltaX = tapPoint.x - squareViewCenterPoint.x;
    CGFloat deltaY = tapPoint.y - squareViewCenterPoint.y;
    CGFloat angle = atan2(deltaX, deltaY);
    
    [self.pushBehavior setAngle:angle];
    
    /* Use the distance between the tap point and the center of our suare view to calculate the magnitude of the push
        
        Distance formula is:
        square root of ((p1.x - p2.x)^2 + (p1.y - p2.y)^2)
     */
    CGFloat distanceBetweenPoints = sqrt(pow(tapPoint.x - squareViewCenterPoint.x, 2.0f) + pow(tapPoint.y - squareViewCenterPoint.y, 2.0f));
    [self.pushBehavior setMagnitude:distanceBetweenPoints / 200.0f];
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
