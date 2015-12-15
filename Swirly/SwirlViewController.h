//
//  ViewController.h
//  Swirly
//
//  Created by Riley Williams on 11/12/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RenderView.h"

@interface SwirlViewController : UIViewController

@property (strong, nonatomic) RenderView *view;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property float maxTime;

- (IBAction)sliderChanged:(UISlider*)sender;
- (IBAction)nextPressed;

@end

