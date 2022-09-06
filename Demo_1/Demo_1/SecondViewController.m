//
//  SecondViewController.m
//  Demo_1
//
//  Created by vfa on 06/09/2022.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (nonatomic, strong) UIDatePicker *myDatePicker;
@end

@implementation SecondViewController

- (void) datePickerDateChanged:(UIDatePicker *)paramDatePicker{

    if ([paramDatePicker isEqual:self.myDatePicker]){
        NSLog(@"Selected date = %@", paramDatePicker.date);
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* Customize the dateiPcker */
    self.myDatePicker = [[UIDatePicker alloc] init];
    self.myDatePicker.center = self.view.center;
    [self.view addSubview:self.myDatePicker];
    
    [self.myDatePicker addTarget:self
                              action:@selector(datePickerDateChanged:)
                    forControlEvents:UIControlEventValueChanged];
    
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
