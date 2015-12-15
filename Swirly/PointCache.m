//
//  PointCache.m
//  Swirly
//
//  Created by Riley Williams on 11/12/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import "PointCache.h"

typedef struct {
	float x;
	float y;
} PCPoint;

@interface PointCache ()

@property PCPoint *points;
@property int numCachedPoints;
@property int numAllocatedPoints;

@end

@implementation PointCache

-(PointCache*)init {
	if (self = [super init]) {
		self.numAllocatedPoints = 50;
		self.numCachedPoints = 0;
		self.points = malloc(sizeof(PCPoint)*self.numAllocatedPoints);
	}
	return self;
}

#warning Points must be added sequentially
-(void)addPointX:(float)x y:(float)y time:(float)time {
	if ((int)time >= self.numAllocatedPoints) {
		//allocate more points
		self.numAllocatedPoints += 10;
		self.points = reallocf(self.points, self.numAllocatedPoints*sizeof(PCPoint));
	}
	
	self.points[(int)time].x = x;
	self.points[(int)time].y = y;
	self.numCachedPoints++;
}


-(CGPoint)pointForTime:(float)time {
	if (![self isCached:time]) {
		CGPoint new = [self.dataSource calculateForTime:time];
		[self addPointX:new.x y:new.y time:time];
	}
	
	CGPoint p;
	p.x = self.points[(int)time].x;
	p.y = self.points[(int)time].y;
	return p;
}


-(BOOL)isCached:(float)time {
	if ((int)time < self.numCachedPoints)
		return true;
	return false;
}

-(void)dealloc {
	free(self.points);
}

@end
