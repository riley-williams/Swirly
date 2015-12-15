//
//  RenderView.m
//  Swirly
//
//  Created by Riley Williams on 11/12/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import "RenderView.h"

@implementation RenderView

-(void)setup {
	self.swirl = [[SwirlModel alloc] init];
	self.swirl.startPos = CGPointMake(175, 600);
	
	SwirlStrokeSolid *root = [[SwirlStrokeSolid alloc] init];
	
	CGFloat components[] = {0.0, 0.0, 0.4, 1.0};
	
	[root setColor:components];
	root.startTime = 0;
	root.endTime = 300;
	root.k = 8*(((float)arc4random_uniform(100)/100.0)-.5)/10000;
	root.w0 = (((float)arc4random_uniform(100)/100.0)-.5)/100;
	root.theta0 = -M_PI/2;
	root.startWidth = 15;
	
	for (int i = 0; i < arc4random_uniform(5)+4; i++) {
		SwirlStrokeSolid *branch = [[SwirlStrokeSolid alloc] init];
		
		CGFloat bcomponents[] = {0.0, 0.0, 0.5, 1.0};
		
		[branch setColor:bcomponents];
		float start = arc4random_uniform(200);
		branch.endTime = arc4random_uniform(100)+50;
		branch.k = 1.0/(arc4random_uniform(1250)+250) * (arc4random_uniform(2) == 0? -1 : 1);
		
		[root addBranch:branch atTime:start];
		for (int i = 0; i < arc4random_uniform(4); i++) {
			SwirlStrokeSolid *b2 = [[SwirlStrokeSolid alloc] init];
			
			CGFloat bcomponents[] = {0.0, 0.0, 8.0, 1.0};
			
			[b2 setColor:bcomponents];
			float start = arc4random_uniform(branch.endTime);
			b2.endTime = arc4random_uniform(50)+25;
			b2.k = 1.0/(arc4random_uniform(500)+100) * (arc4random_uniform(2) == 0? -1 : 1);
			
			[branch addBranch:b2 atTime:start];
		}
		
		
	}
	self.swirl.rootSwirl = root;
	
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
	//CIContext *ctx = [CIContext contextWithEAGLContext:[EAGLContext currentContext] options:@{kCIContextWorkingColorSpace: [NSNull null]}];
	if (!self.swirl) {
		[self setup];
	}
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	[self.swirl renderModel:ctx];
	
	
}


@end
