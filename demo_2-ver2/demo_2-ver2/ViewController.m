//
//  ViewController.m
//  demo_2-ver2
//
//  Created by vfa on 08/09/2022.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) alertAdd:(id)paramSender{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Add Action"               message:@"You are doing add somethings" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* OKAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {}];
    
    [alert addAction:OKAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil            bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil         bundle:nibBundleOrNil];
    if(self != nil) {
        self.title = @"Home";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    UIImage *photo = [UIImage imageNamed:@"LogoTitle"];
    
    [imageView setImage:photo];
    self.navigationItem.titleView = imageView;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                    initWithTitle:@"Add"
                                    style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(alertAdd:)];
    
    // Do any additional setup after loading the view.
}


- (IBAction)eventNavigateSecondScreen:(id)sender {
    SecondViewController *second = [self.storyboard instantiateViewControllerWithIdentifier:@"secondID"];
    second.title = @"Second Screen";
    [self.navigationController pushViewController:second animated:YES];
}

@end
