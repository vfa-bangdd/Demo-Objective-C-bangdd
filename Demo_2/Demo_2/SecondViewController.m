//
//  SecondViewController.m
//  Demo_2
//
//  Created by vfa on 07/09/2022.
//

#import "SecondViewController.h"
#import "StringReverserActivity.h"
#import "ViewController.h"

@interface SecondViewController () <UITextFieldDelegate>
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *buttonShare;
@property (nonatomic, strong) UIActivityViewController *activityViewController;
@property (nonatomic, strong) UILabel *textNumber;
@end

@implementation SecondViewController

- (void) createTextField{
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(20.0f, 210.0f, 280.0f,30.0f)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"Enter text to share...";
    self.textField.delegate = self;
    [self.view addSubview:self.textField];
}

- (void) createButton{
    self.buttonShare = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonShare.frame =
        CGRectMake(20.0f, 240.0f, 280.0f, 44.0f);
    [self.buttonShare setTitle:@"Share" forState:UIControlStateNormal];
    [self.buttonShare addTarget:self action:@selector(handleShare:)
                   forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonShare];
}

- (void) demo1_9{
    self.textNumber = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width - 20, 100)];
    self.textNumber.numberOfLines = 2;
    [self.textNumber setText:@"1. Presenting and Managing Views with UIViewController"];
    [self.textNumber sizeToFit];
    [self.view addSubview:self.textNumber];
}

- (void) demo1_10{
    self.textNumber = [[UILabel alloc] initWithFrame:CGRectMake(20, 160, self.view.frame.size.width - 20, 100)];
    self.textNumber.numberOfLines = 2;
    [self.textNumber setText:@"2. Presenting Sharing Options with UIActivityViewController"];
    [self.textNumber sizeToFit];
    [self.view addSubview:self.textNumber];
    
    [self createTextField];
    [self createButton];
}

- (void) demo1_11{
    self.textNumber = [[UILabel alloc] initWithFrame:CGRectMake(20, 290, self.view.frame.size.width - 20, 100)];
    self.textNumber.numberOfLines = 2;
    [self.textNumber setText:@"3. Presenting Custom Sharing Options with UIActivityViewController"];
    [self.textNumber sizeToFit];
    [self.view addSubview:self.textNumber];
    
    self.buttonShare = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonShare.frame =
        CGRectMake(20.0f, 340.0f, 280.0f, 44.0f);
    [self.buttonShare setTitle:@"Share custom" forState:UIControlStateNormal];
    [self.buttonShare addTarget:self
                    action:@selector(handleShareCustom:)
                   forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonShare];
}

- (void) eventSetting{
    self.textNumber = [[UILabel alloc] initWithFrame:CGRectMake(20, 390, self.view.frame.size.width - 20, 100)];
    self.textNumber.numberOfLines = 2;
    [self.textNumber setText:@"Click button bellow to go to setting"];
    [self.textNumber sizeToFit];
    [self.view addSubview:self.textNumber];
    
    self.buttonShare = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonShare.frame =
        CGRectMake(20.0f, 420.0f, 280.0f, 44.0f);
    [self.buttonShare setTitle:@"Click" forState:UIControlStateNormal];
    [self.buttonShare addTarget:self
                    action:@selector(settingNavigate)
                   forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonShare];
}

- (void) demo1_12{
    self.textNumber = [[UILabel alloc] initWithFrame:
        CGRectMake(20, 480, self.view.frame.size.width - 20, 100)];
    self.textNumber.numberOfLines = 2;
    [self.textNumber setText:@"4. Implementing Navigation with UINavigationController "];
    [self.textNumber sizeToFit];
    [self.view addSubview:self.textNumber];
    
    self.buttonShare = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonShare.frame =
        CGRectMake(20.0f, 550.0f, 120.0f, 44.0f);
    self.buttonShare.backgroundColor= [UIColor orangeColor];
    [self.buttonShare setTitle:@"Next" forState:UIControlStateNormal];
    [self.buttonShare addTarget:self
                    action:@selector(handleNavigateSecondScreen:)
                   forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.buttonShare];
}

- (void) settingNavigate{
    NSDictionary *dict = [[NSDictionary alloc] init];
    [[UIApplication sharedApplication]
     openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:dict completionHandler:^(BOOL success) {
        
    }];
}

- (void) handleNavigateSecondScreen: (id)sender{
    ViewController *first = [self.storyboard instantiateViewControllerWithIdentifier:@"firstS"];
    [self.navigationController pushViewController:first animated:YES];
}

- (void) handleShareCustom:(BOOL)animated{
    [super viewDidAppear:animated];
    NSArray *itemsToShare = @[
        @"Item 1",
        @"Item 2",
        @"Item 3",
    ];
    UIActivityViewController *activity =
    [[UIActivityViewController alloc]
     initWithActivityItems:itemsToShare
     applicationActivities:@[[StringReverserActivity new]]];
    [self presentViewController:activity
                       animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self demo1_9];
    [self demo1_10];
    [self demo1_11];
    [self demo1_12];
    
    [self eventSetting];
    
    
    // Do any additional setup after loading the view.
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{ [textField resignFirstResponder];
    return YES;
}

- (void) handleShare:(id)paramSender{
    if ([self.textField.text length] == 0){
        NSString *message = @"Please enter a text and then press Share";
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil
                        message:message
                        preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    
    self.activityViewController = [[UIActivityViewController alloc]
                        initWithActivityItems:@[self.textField.text]
                        applicationActivities:nil];
    [self presentViewController:self.activityViewController
                        animated:YES
                        completion:^{
                            /* Nothing for now */
                        }];
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
