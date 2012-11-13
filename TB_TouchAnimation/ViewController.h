//
//  ViewController.h
//  TB_TouchAnimation
//
//  Created by Yari Dareglia on 10/9/12.
//  Copyright (c) 2012 Yari Dareglia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GradientCircle.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController

@property GradientCircle* gradientView;

- (void)screenPan:(UIGestureRecognizer*)gesture;

@end
