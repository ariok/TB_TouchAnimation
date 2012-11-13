//
//  GradientCircle.h
//  TB_TouchAnimation
//
//  Created by Yari D'areglia on 10/16/12.
//  Copyright (c) 2012 Yari Dareglia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GradientCircle : UIView

@property (nonatomic,strong)CIFilter *filter;

- (void)fadeOut;
- (void)fadeIn;

@end
