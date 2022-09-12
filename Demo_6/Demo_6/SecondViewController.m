//
//  SecondViewController.m
//  Demo_6
//
//  Created by vfa on 12/09/2022.
//

#import "SecondViewController.h"

NSString *const kBottomBoundary = @"bottomBoundary";

@interface SecondViewController () <UICollisionBehaviorDelegate>
@property (nonatomic, strong) NSMutableArray *squareViews;
@property (nonatomic, strong) UIDynamicAnimator *animator;

@end

@implementation SecondViewController

- (void) collisionBehavior: (UICollisionBehavior*)paramBehavior beganContactForItem:(id<UIDynamicItem>)paramItem withBoundaryIdentifier:(id<NSCopying>)paramIdentifier
                   atPoint:(CGPoint)paramPoint{
    NSString *identifier = (NSString *)paramIdentifier;
    
    if([identifier isEqualToString:kBottomBoundary]){
        [UIView animateWithDuration:1.0f animations:^{
            UIView *view = (UIView *)paramItem;
                    
            view.backgroundColor = [UIColor redColor];
            view.alpha = 0.0f;
            view.transform = CGAffineTransformMakeScale(2.0f, 2.0f);
        } completion:^(BOOL finished) {
                    
            UIView *view = (UIView *)paramItem;
            [paramBehavior removeItem:paramItem];
            [view removeFromSuperview];
        }];
    }
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    /* Create the views*/
    NSUInteger const NumberOfViews = 3;
    
    self.squareViews = [[NSMutableArray alloc] initWithCapacity:NumberOfViews];
    NSArray *colors = @[UIColor.redColor, UIColor.blueColor, UIColor.yellowColor];
    CGPoint currentCenterPoint = self.view.center;
    CGSize eachViewSize = CGSizeMake(50.0f, 50.0f);
    
    for(NSUInteger counter = 0; counter < NumberOfViews; counter++ ){
        UIView *newView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, eachViewSize.width, eachViewSize.height)];
        
        newView.backgroundColor = colors[counter];
        newView.center = currentCenterPoint;
        
        currentCenterPoint.y += eachViewSize.height + 10.0f;
        
        [self.view addSubview:newView];
        [self.squareViews addObject:newView];
    }
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    /* Create gravity */
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:self.squareViews];
    [self.animator addBehavior:gravity];
    
    /* Create collision detection */
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:self.squareViews];
    
    /* Simple */
    //collision.translatesReferenceBoundsIntoBoundary = YES;
    
    /* Custom boundaries */
    [collision
     addBoundaryWithIdentifier:kBottomBoundary
     fromPoint:CGPointMake(0.0f, self.view.bounds.size.height - 100.0f)
     toPoint:CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height - 100.0f)];
    
    collision.collisionDelegate = self;
    
    [self.animator addBehavior:collision];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
