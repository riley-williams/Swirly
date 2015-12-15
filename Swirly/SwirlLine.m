//
//  SwirlLine.m
//  Swirly
//
//  Created by Riley Williams on 11/12/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import "SwirlLine.h"

@implementation SwirlLine

-(SwirlLine*)init {
	if (self = [super init]) {
		self.width = 3;
		self.cache = [[PointCache alloc] init];
	}
	return self;
}

-(void)renderToContext:(CGContextRef)context time:(float)time startPosition:(CGPoint)startPos {
	if (time < 0)
		return;
	
	//render swirl
	CGContextSetStrokeColorWithColor(context, self.drawColor);
	CGContextSetLineWidth(context, self.width);
	CGContextMoveToPoint(context, startPos.x, startPos.y);
	
	float x = startPos.x;
	float y = startPos.y;
	for (int t = 0; t < time && t < self.endTime; t++) {
		[self.cache addPointX:x y:y time:t]; //cache point
		
		float theta = [self angleForTime:t];
		float r = 4; //length of curve segment
		
		x += r*cosf(theta);
		y += r*sinf(theta);
		

		CGContextAddLineToPoint(context, x, y);
	}
	
	CGContextStrokePath(context);
	
	for (SwirlObject *swo in self.children) {
		float localTime = time - swo.startTime; //transform to local time
		[swo renderToContext:context time:localTime startPosition:[self.cache pointForTime:swo.startTime]];
	}
	
}

@end
