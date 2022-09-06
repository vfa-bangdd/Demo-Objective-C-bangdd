//
//  ViewController.h
//  Demo_1
//
//  Created by vfa on 06/09/2022.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelText;

@property (weak, nonatomic) IBOutlet UISwitch *switchButton;

- (IBAction)eventSwitch:(id)sender;

- (IBAction)btnNext:(id)sender;

@end

