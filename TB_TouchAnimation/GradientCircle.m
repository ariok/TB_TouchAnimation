//
//  GradientCircle.m
//  TB_TouchAnimation
//
//  Created by Yari D'areglia on 10/16/12.
//  Copyright (c) 2012 Yari Dareglia. All rights reserved.
//

#import "GradientCircle.h"
#import <QuartzCore/QuartzCore.h>

@implementation GradientCircle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        self.layer.contents = (__bridge id)([[self generateRadial]CGImage]);
    }
    
    return self;
}


-(UIImage*)generateRadial{
    
    //Define the gradient ----------------------
    CGGradientRef gradient;
    CGColorSpaceRef colorSpace;
    size_t locations_num = 5;
    CGFloat locations[5] = {0.0,0.4,0.5,0.6,1.0};
    CGFloat components[20] = {  1.0, 0.0, 0.0, 0.2,
                                1.0, 0.0, 0.0, 1,
                                1.0, 0.0, 0.0, 0.8,
                                1.0, 0.0, 0.0, 0.4,
                                1.0, 0.0, 0.0, 0.0 
                            }; 
    
    colorSpace = CGColorSpaceCreateDeviceRGB();
    
    gradient = CGGradientCreateWithColorComponents (colorSpace, components,
                                                      locations, locations_num);
    
    
    //Define Gradient Positions ---------------
    
    //We want these exactly at the center of the view  
    CGPoint startPoint, endPoint;
    
    //Start point
    startPoint.x = self.frame.size.width/2;
    startPoint.y = self.frame.size.height/2;
    
    //End point
    endPoint.x = self.frame.size.width/2;
    endPoint.y = self.frame.size.height/2;
    
    //Generate the Image -----------------------
    //Begin an image context 
    UIGraphicsBeginImageContext(self.frame.size);
    CGContextRef imageContext = UIGraphicsGetCurrentContext();
    //Use CG to draw the radial gradient into the image context
    CGContextDrawRadialGradient(imageContext, gradient, startPoint, 0, endPoint, self.frame.size.width/2, 0);
    //Get the image from the context
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return result;
}

//Create the Fadein animation and assign it to the layer
-(void)fadeIn{
    
    CABasicAnimation *fadein = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadein.delegate = self;
    fadein.fromValue = [NSNumber numberWithInt:0];
    fadein.toValue = [NSNumber numberWithInt:1];
    fadein.duration = 0.3;
    
    [self.layer addAnimation:fadein forKey:@"fade"];
}

//Create the Fadeout animation assign it to the layer 
-(void)fadeOut{
    
    CABasicAnimation *fadeout = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeout.delegate = self;
    fadeout.fromValue = [NSNumber numberWithInt:1.0];
    fadeout.toValue = [NSNumber numberWithInt:0];
    fadeout.duration = 0.2;
    fadeout.fillMode = kCAFillModeForwards;
    fadeout.removedOnCompletion = NO;
    
    [self.layer addAnimation:fadeout forKey:@"fade"];
}

@end
