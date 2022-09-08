//
//  SecondViewController.m
//  Demo_3
//
//  Created by vfa on 08/09/2022.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (nonatomic, strong) UIScrollView *myScrollView;
@property (nonatomic, strong) UIImageView *myImageView, *photo2;

@end

@implementation SecondViewController

- (void) demo1_23 {
    UIImage *objCPhoto = [UIImage imageNamed:@"LogoObjC"];
    self.photo2 = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 350, 200, 0)] initWithImage:objCPhoto];
    [self.photo2 sizeToFit];
    
    
    
    UIImage *macBookPhoto = [UIImage imageNamed:@"MacBook"];
    self.myImageView = [[UIImageView alloc] initWithImage:macBookPhoto];
    self.myScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.myScrollView addSubview:self.myImageView];
    [self.myScrollView addSubview:self.photo2];
    self.myScrollView.contentSize = self.myImageView.bounds.size;
    [self.view addSubview:self.myScrollView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self demo1_23];
    
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
