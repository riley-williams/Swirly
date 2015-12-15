//
//  ViewController.m
//  Swirly
//
//  Created by Riley Williams on 11/12/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import "SwirlViewController.h"

@interface SwirlViewController ()

@end

@implementation SwirlViewController

@dynamic view;

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.view setup];
	self.maxTime = 500;
	self.view.swirl.time = 500;
	self.timeLabel.text = [NSString stringWithFormat:@"%.0f", self.maxTime];
	self.slider.value = .2;
	[self.view setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)sliderChanged:(UISlider*)sender {
	self.view.swirl.time = sender.value * self.maxTime;
	
	float time = self.view.swirl.time;
	self.timeLabel.text = [NSString stringWithFormat:@"%.0f", time];
	
	[self.view setNeedsDisplay];
}

- (IBAction)nextPressed {
	[self.view setup];
	self.view.swirl.time = self.slider.value * self.maxTime;
	[self.view setNeedsDisplay];
}

@end
