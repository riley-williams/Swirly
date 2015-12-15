//
//  SwirlObject.m
//  Swirly
//
//  Created by Riley Williams on 11/12/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import "SwirlObject.h"

@implementation SwirlObject

-(SwirlObject*)init {
	if (self = [super init]) {
		self.children = [[NSMutableSet alloc] init];
	}
	return self;
}

-(SwirlObject*)initWithParent:(SwirlObject *)parent startTime:(float)time {
	if (self = [self init]) {
		self.parent = parent;
		self.theta0 = [parent angleForTime:time];
		self.startTime = time;
	}
	return self;
}

-(void)renderToContext:(CGContextRef)context time:(float)time startPosition:(CGPoint)startPos {
	
}

-(void)setColor:(CGFloat *)components {
	CGColorSpaceRef csRef = CGColorSpaceCreateDeviceRGB();
	CGColorRef color = CGColorCreate(csRef, components);
	self.drawColor = color;
}

//returns the angle of the curve for a specific time
//default quadratic spiral behavior
//override for different behavior
-(float)angleForTime:(float)t {
	return .5*self.k*t*t + self.w0*t + self.theta0;
}

-(CGPoint)calculateForTime:(float)time {
	return CGPointMake(0,0);
}

@end
