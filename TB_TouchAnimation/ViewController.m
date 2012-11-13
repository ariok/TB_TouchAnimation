//
//  ViewController.m
//  TB_TouchAnimation
//
//  Created by Yari Dareglia on 10/9/12.
//  Copyright (c) 2012 Yari Dareglia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Generate the gradient view --------------------
    self.gradientView = [[GradientCircle alloc]initWithFrame:CGRectMake(50, 50, 200, 200)];
    [self.view addSubview:self.gradientView];
    
    //Initialize Gesture recognizer ----------------
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(screenPan:)];
    [self.view addGestureRecognizer:panGestureRecognizer];
}

//Manage Touches Begin
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
        
    UITouch *touch = [touches anyObject];
    CGPoint drawPoint = [touch locationInView:self.view];
    
    //Change gradientView center and launch fadeIn animation
    self.gradientView.center = drawPoint;
    [self.gradientView fadeIn];
}

//Manage Touches End
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.gradientView fadeOut];
}

//Manage the Pan Gesture
- (void)screenPan:(UIGestureRecognizer *)gesture{
    
    CGPoint point = [gesture locationInView:self.view];
    
    //Move the center of the gradient view if gesture state is equel to Began or Changed
    if (gesture.state == UIGestureRecognizerStateBegan || gesture.state == UIGestureRecognizerStateChanged) {
        self.gradientView.center = point;
    }
    
    //Launch fadeOut animation if gesture state is equal to end
    if (gesture.state == UIGestureRecognizerStateEnded) {
        [self.gradientView fadeOut];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
