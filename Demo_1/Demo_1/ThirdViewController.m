//
//  ThirdViewController.m
//  Demo_1
//
//  Created by vfa on 07/09/2022.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
@property (nonatomic, strong) UILabel *textNumber, *text, *textSegment;
@property (nonatomic, strong) UISegmentedControl *mySegmentedControl, *mySegmentedControl1;
@end

@implementation ThirdViewController

- (void) segmentChanged:(UISegmentedControl *)paramSender{
    if ([paramSender isEqual:self.mySegmentedControl1]){
    NSInteger selectedSegmentIndex = [paramSender selectedSegmentIndex];
    NSString  *selectedSegmentText =
    [paramSender titleForSegmentAtIndex:selectedSegmentIndex];
    NSLog(@"Segment %ld with %@ text is selected", (long)selectedSegmentIndex, selectedSegmentText);
        self.textSegment.text = [NSString stringWithFormat:
                @"Segment %ld with %@ text is selected", (long)selectedSegmentIndex, selectedSegmentText];
        [self.textSegment sizeToFit];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textNumber = [[UILabel alloc]initWithFrame:CGRectMake(30, 120, self.view.frame.size.width - 50, 20)];
    [self.textNumber setText:@"8. Grouping Compact Options with UISegmentedControl"];
    self.textNumber.lineBreakMode = UILineBreakModeWordWrap;
    self.textNumber.numberOfLines = 2;
    [self.textNumber sizeToFit];
    [self.view addSubview:self.textNumber];
    
//    NSArray *segments = [[NSArray alloc]
//                         initWithObjects:
//                                 @"iPhone",
//                                 @"iPad",
//                                 @"iPod",
//                                 @"iMac", nil];
//            
//    self.mySegmentedControl = [[UISegmentedControl alloc]                                   initWithItems:segments];
//    self.mySegmentedControl.center = CGPointMake(150 , 150);
//    [self.view addSubview:self.mySegmentedControl];
    
    
    NSArray *segments1 = @[
                            @"iPhone",
                            @"iPad",
                            @"iPod",
                            @"iMac"
                            ];
            
    self.mySegmentedControl1 = [[UISegmentedControl alloc]
                                       initWithItems:segments1];
            
    self.mySegmentedControl1.center = CGPointMake(150 , 220);
    [self.view addSubview:self.mySegmentedControl1];
    [self.mySegmentedControl1 addTarget:self action:@selector(segmentChanged:)
    forControlEvents:UIControlEventValueChanged];
    self.mySegmentedControl.momentary = YES;
    
    //text change
    self.textSegment = [[UILabel alloc]init];
    [self.view addSubview:self.textSegment];
    self.textSegment.center = CGPointMake(50, 250);
    
    // Do any additional setup after loading the view.
}

- (void)setParamText:(NSString *)labelText {
    self.text = [[UILabel alloc] initWithFrame:CGRectMake(150, 170, 0, 0)];
    self.text.text=labelText;
    [self.text sizeToFit];
    [self.view addSubview: self.text];
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
