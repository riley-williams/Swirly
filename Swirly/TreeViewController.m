//
//  TreeViewController.m
//  Swirly
//
//  Created by Riley Williams on 11/16/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import "TreeViewController.h"

@implementation TreeViewController

@dynamic view;

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.view setup];
	[self.view setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


- (IBAction)stepPressed:(id)sender {
	[self.view step];
	[self.view setNeedsDisplay];
}

- (IBAction)resetPressed:(id)sender {
	[self.view setup];
	[self.view setNeedsDisplay];
	if (self.timer) {
		[self.timer invalidate];
	}
	self.timer = [NSTimer timerWithTimeInterval:1/60.0 target:self.view selector:@selector(step) userInfo:nil repeats:YES];
	[[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

@end
