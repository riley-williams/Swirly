//
//  SwirlStrokeSolid.m
//  Swirly
//
//  Created by Riley Williams on 11/12/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import "SwirlStrokeSolid.h"

@implementation SwirlStrokeSolid

-(SwirlStrokeSolid*)init {
	if (self = [super init]) {
		self.startWidth = 8;
		self.endWidth	= 0;
		self.maxWidth	= 8;
		self.cache = [[PointCache alloc] init];
		self.cache.dataSource = self;
	}
	return self;
}

-(void)renderToContext:(CGContextRef)context time:(float)time startPosition:(CGPoint)startPos {
	if (time < 0)
		return;
	
	//render swirl
	CGContextSetStrokeColorWithColor(context, self.drawColor);
	CGContextSetLineWidth(context, 1);
	CGContextMoveToPoint(context, startPos.x, startPos.y);
	
	int localEndTime = time < self.endTime? time : self.endTime;
	
	for (int t = 0; t < localEndTime; t++) {
		CGPoint localPos = [self.cache pointForTime:t];
		CGPoint globalPos = [self convert:localPos toGlobal:startPos];
		float theta = [self angleForTime:t];
		float w = [self strokeWidth:t];
		CGContextAddLineToPoint(context, globalPos.x+w*cosf(theta+M_PI/2), globalPos.y+w*sinf(theta+M_PI/2));
	}
	
	
	for (int t = localEndTime-1; t > 0; t--) {
		float theta = [self angleForTime:t];
		float w = [self strokeWidth:t];
		CGPoint p = [self convert:[self.cache pointForTime:t] toGlobal:startPos];
		CGContextAddLineToPoint(context, p.x+w*cosf(theta-M_PI/2), p.y+w*sinf(theta-M_PI/2));
	}
	CGContextSetFillColorWithColor(context, self.drawColor);
	CGContextFillPath(context);
	
	for (SwirlObject *swo in self.children) {
		float localTime = time - swo.startTime; //transform to local time
		CGPoint a = [self.cache pointForTime:swo.startTime];
		CGPoint initial = [self convert:[self.cache pointForTime:swo.startTime] toGlobal:startPos];
		//CGPoint pos = CGPointMake(a.x + initial.x, a.y + initial.y);
		[swo renderToContext:context time:localTime startPosition:initial];
	}
}

-(CGPoint)convert:(CGPoint)local toGlobal:(CGPoint)global {
	return CGPointMake(local.x+global.x, local.y+global.y);
}

-(float)strokeWidth:(float)time {
	return self.startWidth*(1-time/self.endTime);
}

//calculates the
-(CGPoint)calculateForTime:(float)time {
	if ((int)time <= 0) {
		return CGPointMake(0, 0);
	}
	
	CGPoint p0 = [self.cache pointForTime:time-1];
	float theta = [self angleForTime:time-1];
	float r = 4; //length of curve segment
	
	float x = p0.x + r*cosf(theta);
	float y = p0.y + r*sinf(theta);
	return CGPointMake(x, y);
}

-(void)addBranch:(SwirlStrokeSolid*)branch atTime:(float)time {
	[self.children addObject:branch];
	branch.parent = self;
	branch.startTime = time;
	branch.theta0 = [self angleForTime:time];
	branch.w0 = branch.theta0 - [self angleForTime:time-1];
	branch.startWidth = [self strokeWidth:time];
}


@end
