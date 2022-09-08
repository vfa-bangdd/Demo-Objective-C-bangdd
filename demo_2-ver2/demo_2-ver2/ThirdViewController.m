//
//  ThirdViewController.m
//  demo_2-ver2
//
//  Created by vfa on 08/09/2022.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil            bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil         bundle:nibBundleOrNil];
    if(self != nil) {
        self.title = @"User";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
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
