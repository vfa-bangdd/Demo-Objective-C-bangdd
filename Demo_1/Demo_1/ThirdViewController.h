//
//  ThirdViewController.h
//  Demo_1
//
//  Created by vfa on 07/09/2022.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ThirdViewController : UIViewController
@property (nonatomic, strong) NSString *labelText;
- (void) setParamText:(NSString *)labelText;
@end

NS_ASSUME_NONNULL_END
