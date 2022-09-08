//
//  StringReverserActivity.m
//  Demo_2
//
//  Created by vfa on 07/09/2022.
//

#import "StringReverserActivity.h"
#import "SecondViewController.h"
#import "AppDelegate.h"

@interface StringReverserActivity () <UIAlertViewDelegate>
@property (nonatomic, strong) NSArray *activityItems;
@end

@implementation StringReverserActivity
- (void) alertController:(UIAlertController *)alertController didDismissWithButtonIndex:(NSInteger)buttonIndex{
    [self activityDidFinish:YES];
}

- (NSString *) activityType{
    return [[NSBundle mainBundle].bundleIdentifier
    stringByAppendingFormat:@".%@", NSStringFromClass(
                                            [self class])];
    }

- (NSString *) activityTitle{
    return @"Custom Sharing Reverse String";
}

- (UIImage *) activityImage{
return [UIImage imageNamed:@"Reverse"];
}

- (BOOL) canPerformWithActivityItems:(NSArray *)activityItems{
    for (id object in activityItems){
        if ([object isKindOfClass:[NSString class]]){
            return YES;
        }
    }
    return NO;
}

- (void) prepareWithActivityItems:(NSArray *)activityItems{
    NSMutableArray *stringObjects = [[NSMutableArray alloc] init]; for (id object in activityItems){
        if ([object isKindOfClass:[NSString class]]){ [stringObjects addObject:object];
        } }
    self.activityItems = [stringObjects copy];
}

- (NSString *) reverseOfString:(NSString *)paramString{ NSMutableString *reversed = [[NSMutableString alloc]
        initWithCapacity:paramString.length];
    
    for (NSInteger counter = paramString.length - 1;
           counter >= 0;
           counter--){
        [reversed appendFormat:@"%c", [paramString  characterAtIndex:counter]];
    }
    return [reversed copy];
}

- (void) performActivity{
    NSMutableString *reversedStrings = [[NSMutableString alloc] init];
    for (NSString *string in self.activityItems){
        [reversedStrings appendString:[self reverseOfString:string]]; [reversedStrings appendString:@"\n"];
    }
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil
        message:reversedStrings
        preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK"
    style:UIAlertActionStyleDefault
    handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    SecondViewController *controller = (SecondViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [controller presentViewController:alert animated:NO completion:nil];
}

@end
