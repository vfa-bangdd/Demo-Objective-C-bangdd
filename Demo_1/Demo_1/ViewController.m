//
//  ViewController.m
//  Demo_1
//
//  Created by vfa on 06/09/2022.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong) UISwitch *mainSwitch;
@property (nonatomic, strong) UIPickerView *myPicker;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.switchButton setOn:NO];
    /* Create the switch */
    self.mainSwitch = [[UISwitch alloc] initWithFrame:
                       CGRectMake(180, 420, 0, 0)];
    //self.mainSwitch.center = self.view.center;
    [self.view addSubview:self.mainSwitch];
    
    /* Customize the switch */
    /* Adjust the off-mode tint color */
    self.mainSwitch.tintColor = [UIColor redColor];
    /* Adjust the on-mode tint color */
    self.mainSwitch.onTintColor = [UIColor yellowColor];
    /* Also change the knob's tint color */
    self.mainSwitch.thumbTintColor = [UIColor blueColor];

    /* Customize the pickerView */
    self.myPicker = [[UIPickerView alloc] initWithFrame:
                     CGRectMake(50, 540, 0, 0)];
    self.myPicker.dataSource = self;
    //self.myPicker.center = self.view.center;
    [self.view addSubview:self.myPicker];
    self.myPicker.delegate = self;
    
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    if ([pickerView isEqual:self.myPicker]){
        return 1;
    }
    return 0;
}

- (NSInteger) pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component{
    if ([pickerView isEqual:self.myPicker]){
        return 10;
    }
    return 0;
}

- (NSString*)pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row
    forComponent:(NSInteger)component{
    if ([pickerView isEqual:self.myPicker]){
    /* Row is zero-based and we want the first row (with index 0) to be rendered as Row 1, so we have to +1 every row index */
        return [NSString stringWithFormat:@"Row picker %ld", (long)row + 1];
    }
    return nil;
}

- (IBAction)btnShowAlertBasic:(id)sender {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert 1"
                                                                   message:@"Displaying Alerts with UIAlertView ."
                                                            preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];

    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)btnShowAlert2Action:(id)sender {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert 2"
                                                                   message:@"Displaying Alerts with UIAlertView ."
                                                            preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];

    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {}];

    [alert addAction:defaultAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}
- (IBAction)btnNext:(id)sender {
    SecondViewController *sec = [self.storyboard instantiateViewControllerWithIdentifier: @"sec"];
    [self.navigationController pushViewController:sec animated:YES];
}

- (IBAction)eventSwitch:(id)sender {
    if(self.switchButton.isOn) {
        self.labelText.text = @"Hi! Switch is ON";
    } else {
        self.labelText.text = @"Switch is OFF";
    }
}
@end
