//
//  SecondViewController.m
//  Demo_1
//
//  Created by vfa on 06/09/2022.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()
@property (nonatomic, strong) UIDatePicker *myDate1, *myDate2, *myDate3;
@property (nonatomic, strong) UISlider *slider, *slider1;
@property (nonatomic, strong) UIButton *btnNext;
@property (nonatomic, strong) ThirdViewController *third;
@end

@implementation SecondViewController

- (void) datePickerDateChanged:(UIDatePicker *)paramDatePicker{
if ([paramDatePicker isEqual:self.myDate1]){
    NSLog(@"Selected date = %@", paramDatePicker.date);
} }

- (void)viewDidLoad {
    [super viewDidLoad];
    //myDate1
    self.myDate1 = [[UIDatePicker alloc] initWithFrame:
                    CGRectMake(150, 150, 0, 0)];
    [self.view addSubview:self.myDate1];
    [self.myDate1 addTarget:self action:@selector(datePickerDateChanged:)
                forControlEvents:UIControlEventValueChanged];
    
    //myDate2
    self.myDate2 = [[UIDatePicker alloc] initWithFrame:
                         CGRectMake(120, 240, 0, 0)];
    self.myDate2.datePickerMode = UIDatePickerModeDate;
    [self.view addSubview:self.myDate2];
            
    NSTimeInterval oneYearTime = 365 * 24 * 60 * 60;
    NSDate *todayDate = [NSDate date];
    NSDate *oneYearFromToday = [
        todayDate dateByAddingTimeInterval:oneYearTime];
    NSDate *twoYearsFromToday = [
        todayDate dateByAddingTimeInterval:2 * oneYearTime];
            
    self.myDate2.minimumDate = oneYearFromToday;
    self.myDate2.maximumDate = twoYearsFromToday;
    
    
    //myDate3
    self.myDate3 = [[UIDatePicker alloc] initWithFrame:
                    CGRectMake(50, 300, 0, 0)];
    //self.myDate2.center = self.view.center;
    self.myDate3.datePickerMode = UIDatePickerModeCountDownTimer;
    [self.view addSubview:self.myDate3];
    NSTimeInterval twoMinutes = 2 * 60;
    [self.myDate3 setCountDownDuration:twoMinutes];

    self.slider = [[UISlider alloc] initWithFrame:CGRectMake(70.0f, 600.0f, 200.0f, 23.0f)];
    //self.slider.center = self.view.center;
    self.slider.minimumValue = 0.0f;
    self.slider.maximumValue = 100.0f;
    self.slider.value = self.slider.maximumValue / 2.0;
    [self.view addSubview:self.slider];
    
    /* Create  the slider */
    self.slider1 = [[UISlider alloc] initWithFrame:CGRectMake(80.0f, 720.0f,118.0f,23.0f)];
    self.slider1.value = 0.5;
    self.slider1.minimumValue = 0.0f;
    self.slider1.maximumValue = 1.0f;
    [self.view addSubview:self.slider1];
    /* Set the tint color of the minimum value */
    self.slider1.minimumTrackTintColor = [UIColor redColor];
    /* Set the tint color of the thumb */
    self.slider1.maximumTrackTintColor = [UIColor greenColor];
    /* Set the tint color of the maximum value */
    self.slider1.thumbTintColor = [UIColor blackColor];
    
    self.btnNext = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btnNext.frame = CGRectMake(0, 0, 120, 50);
    self.btnNext.layer.cornerRadius = 10.0;
    self.btnNext.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height - 50);
    self.btnNext.backgroundColor = [UIColor orangeColor];
    [self.btnNext setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [self.btnNext setTitle:@"Next" forState:UIControlStateNormal];
    [self.view addSubview:self.btnNext];
    [self.btnNext addTarget:self action:@selector(navigateThirdScreen) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

- (void) navigateThirdScreen {
    self.third = [[ThirdViewController alloc] init];
    self.third.title = @"Third View Controller";
    self.third.view.backgroundColor = [UIColor whiteColor];
    NSDateFormatter *formatDate = [[NSDateFormatter alloc]init];
    [formatDate setDateFormat:@"HH:mm"];
    [self.third setParamText: [formatDate stringFromDate:self.myDate3.date]];
//    [self.navigationController addChildViewController:self.third];
    [self.navigationController pushViewController:self.third animated:YES];
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
