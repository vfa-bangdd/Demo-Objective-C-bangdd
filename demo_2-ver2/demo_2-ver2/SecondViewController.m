//
//  SecondViewController.m
//  demo_2-ver2
//
//  Created by vfa on 08/09/2022.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void) alertAddIcon:(id)paramSender{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Add Action ICON"               message:@"You are doing add somethings" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* OKAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {}];
    UIAlertAction* CancelAction = [UIAlertAction actionWithTitle:@"CANCEL" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {}];
    UIAlertAction* SaveAction = [UIAlertAction actionWithTitle:@"SAVE" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action) {}];
    
    [alert addAction:OKAction];
    [alert addAction:CancelAction];
    [alert addAction:SaveAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd  target:self                          action:@selector(alertAddIcon:)];
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
