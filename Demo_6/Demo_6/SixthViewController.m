//
//  SixthViewController.m
//  Demo_6
//
//  Created by vfa on 12/09/2022.
//

#import "SixthViewController.h"

@interface SixthViewController ()
@property (nonatomic, strong) UIDynamicAnimator *animator;
@end

@implementation SixthViewController

- (UIView *) newViewWithCenter:(CGPoint)paramCenter backgroundColor:
            (UIColor *)paramBackgroundColor{
    UIView *newView =
    [[UIView alloc] initWithFrame:
                    CGRectMake(0.0f, 0.0f, 50.0f, 50.0f)];
    newView.backgroundColor = paramBackgroundColor;
    newView.center = paramCenter;
    return newView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *topView = [self newViewWithCenter:CGPointMake(100.0f, 0.0f)
                                backgroundColor:[UIColor greenColor]];
    UIView *bottomView = [self newViewWithCenter:CGPointMake(100.0f, 50.0f)
                                backgroundColor:[UIColor redColor]];
        
    [self.view addSubview:topView];
    [self.view addSubview:bottomView];
    
    self.animator = [[UIDynamicAnimator alloc]
                    initWithReferenceView:self.view];
        
    /* Create gravity */
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc]
                                initWithItems:@[topView, bottomView]];
    [self.animator addBehavior:gravity];
    
    /* Create collision detection */
    UICollisionBehavior *collision = [[UICollisionBehavior alloc]
                                    initWithItems:@[topView, bottomView]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:collision];
    
    /* Now specify the elasticity of the items */
    UIDynamicItemBehavior *moreElasticItem = [[UIDynamicItemBehavior alloc]
                                            initWithItems:@[bottomView]];
    moreElasticItem.elasticity = 1.0f;
    UIDynamicItemBehavior *lessElasticItem = [[UIDynamicItemBehavior alloc]
                                              initWithItems:@[topView]];
    [self.animator addBehavior:moreElasticItem];
    lessElasticItem.elasticity = 0.5f;
    [self.animator addBehavior:lessElasticItem];
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
