//
//  ViewController.m
//  Demo_5
//
//  Created by vfa on 08/09/2022.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate>
@property (nonatomic, strong) UIProgressView *myProgressView;
@property (nonatomic, strong) UILabel *myLabel;
@property (nonatomic, strong) UIButton *btnPhoto, *btnAudio;
@property (nonatomic, strong) UIBarButtonItem *barButtonAdd;
@end

@implementation ViewController

- (BOOL) isInPopover{
    Class popoverClass = NSClassFromString(@"UIPopoverController");
    
    if(popoverClass != nil && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad && self.myPopover != nil) {
        return YES;
    } else {
        return NO;
    }
}

- (void) gotoAppleWebsite:(id)paramSender{
    if ([self isInPopover]){
    /* Go to website and then dismiss popover */ [self.myPopover dismissPopoverAnimated:YES];
    }else{
    /* Handle case for iPhone */
    }
}

- (void) gotoAppleStoreWebsite:(id)paramSender{
    if ([self isInPopover]){
    /* Go to website and then dismiss popover */ [self.myPopover dismissPopoverAnimated:YES];
    }else{
    /* Handle case for iPhone */
    }
}

- (NSAttributedString *) attributedText{
    NSString *string = @"11/09 Anniversary";
    NSMutableAttributedString *result = [[NSMutableAttributedString alloc] initWithString:string];
    
    // attributed for first part
    NSDictionary *attributesForFirstWord = @{
        NSFontAttributeName: [UIFont boldSystemFontOfSize:40.0f],
        NSForegroundColorAttributeName: [UIColor systemPinkColor],
        NSBackgroundColorAttributeName: [UIColor yellowColor],
    };
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor darkGrayColor];
    shadow.shadowOffset = CGSizeMake(4.0f, 4.0f);
    
    // attributed for second part
    NSDictionary *attributesForSecondWord = @{
        NSFontAttributeName: [UIFont boldSystemFontOfSize:20.0f],
        NSForegroundColorAttributeName: [UIColor whiteColor],
        NSBackgroundColorAttributeName: [UIColor systemPinkColor],
    };
    
    /* Find the string "iOS" in the whole string and sets its attribute */
    [result setAttributes:attributesForFirstWord
                        range:[string rangeOfString:@"11/09"]];
            
    /* Do the same thing for the string "SDK" */
    [result setAttributes:attributesForSecondWord
                        range:[string rangeOfString:@"Anniversary"]];
    
    return [[NSAttributedString alloc]
                        initWithAttributedString:result];
}

- (void) eventPopover: (id) paramSender{
//    self.preferredContentSize = CGSizeMake(200.0f, 125.0f);
//    CGRect buttonRect = CGRectMake(20.0f, 20.0f, 160.0f, 37.0f);
//
//    self.btnPhoto = [UIButton buttonWithType:UIButtonTypeSystem];
//    [self.btnPhoto setTitle:@"Photo"
//                        forState:UIControlStateNormal];
//
//    [self.btnPhoto addTarget:self
//                        action:@selector(gotoAppleWebsite:)
//                        forControlEvents:UIControlEventTouchUpInside];
//
//    self.btnPhoto.frame = buttonRect;
//    [self.view addSubview:self.btnPhoto];
//    buttonRect.origin.y += 50.0f;
//
//    self.btnAudio = [UIButton buttonWithType:UIButtonTypeSystem];
//    [self.btnAudio setTitle:@"Audio"
//                        forState:UIControlStateNormal];
//    [self.btnAudio addTarget:self action:@selector(gotoAppleStoreWebsite:)
//                        forControlEvents:UIControlEventTouchUpInside];
//            self.btnAudio.frame = buttonRect;
//    [self.view addSubview:self.btnAudio];
    
    [self.myPopover
     presentPopoverFromBarButtonItem:self.barButtonAdd
     permittedArrowDirections:UIPopoverArrowDirectionAny
     animated:YES];
}

- (NSString *) photoButtonTitle{
    return @"Photo";
}

- (NSString *) audioButtonTitle{
    return @"Audio";
}

- (void) alertView:(UIAlertView *)alertView
    didDismissWithButtonIndex:(NSInteger)buttonIndex{
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:[self photoButtonTitle]]){ /* Adding a photo ... */
    }
    else if ([buttonTitle isEqualToString:[self audioButtonTitle]]){
        /* Adding an audio... */
    }
}

- (void) performAddWithAlertView:(id)paramSender{
    
    UIAlertController* alert = [UIAlertController
                            alertControllerWithTitle:nil
                            message:@"Add Properties"
                            preferredStyle:UIAlertControllerStyleAlert];
                                                                                    
                                                              
    UIAlertAction* cancelAction = [UIAlertAction
                            actionWithTitle:@"Cancel"
                            style:UIAlertActionStyleDefault
                            handler:^(UIAlertAction * action) {}];
    UIAlertAction* photoAction = [UIAlertAction
                            actionWithTitle:@"Photo"
                            style:UIAlertActionStyleDefault
                            handler:^(UIAlertAction * action) {}];
    UIAlertAction* audioAction = [UIAlertAction
                            actionWithTitle:@"Audio"
                            style:UIAlertActionStyleDefault
                            handler:^(UIAlertAction * action) {}];
                                                              

    [alert addAction:cancelAction];
    [alert addAction:photoAction];
    [alert addAction:audioAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"First Controller";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
        initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
        target:self
        action:@selector(performAddWithAlertView:)];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.myProgressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleBar];
    self.myProgressView.center = CGPointMake(100, 230);
    self.myProgressView.progress = 20.0f/50.0f;
    [self.view addSubview:self.myProgressView];
    
    self.myLabel = [[UILabel alloc] init];
    self.myLabel.backgroundColor = [UIColor clearColor];
    self.myLabel.attributedText = [self attributedText];
    [self.myLabel sizeToFit];
    self.myLabel.center = CGPointMake(150, 410);
    [self.view addSubview:self.myLabel];
    
    //Popover
    
}


@end
