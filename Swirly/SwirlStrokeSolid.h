//
//  SwirlStrokeSolid.h
//  Swirly
//
//  Created by Riley Williams on 11/12/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import "SwirlObject.h"
#import "PointCache.h"

@interface SwirlStrokeSolid : SwirlObject

@property float startWidth;
@property float maxWidth;
@property float endWidth;
@property PointCache *cache;


-(SwirlStrokeSolid*)init;

-(void)renderToContext:(CGContextRef)context time:(float)time startPosition:(CGPoint)startPos;

-(float)strokeWidth:(float)time;

-(CGPoint)calculateForTime:(float)time;

-(void)addBranch:(SwirlObject*)branch atTime:(float)time;

@end
