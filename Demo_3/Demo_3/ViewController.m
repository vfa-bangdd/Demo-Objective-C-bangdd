//
//  ViewController.m
//  Demo_3
//
//  Created by vfa on 08/09/2022.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIImageView *myImageView;
@property(nonatomic, strong) UIScrollView *myScrollview;

@end

@implementation ViewController

- (void) openWeb: (id)paramSender{
    
}

- (void) demo1_22 {
    UIImage *imageObjC = [UIImage imageNamed:@"LogoObjC"];
    self.myImageView = [[UIImageView alloc]
                        initWithFrame:self.view.bounds ];
    self.myImageView.image = imageObjC;
    self.myImageView.center = self.view.center;
    [self.view addSubview:self.myImageView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd  target:self                          action:@selector(openWeb:)];
    // Do any additional setup after loading the view.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self demo1_22];
    
}


@end
