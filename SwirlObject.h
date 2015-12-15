//
//  SwirlObject.h
//  Swirly
//
//  Created by Riley Williams on 11/12/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwirlObject : NSObject

@property SwirlObject *parent;
@property NSMutableSet<SwirlObject*> *children;
@property CGColorRef drawColor;
//@property CGPoint startPos; //start position in
@property float startTime; //time in the parent's local time
@property float endTime;
@property float k;
@property float w0;
@property float theta0;
@property float branchProbability;

//-(SwirlObject*)init;
-(SwirlObject*)initWithParent:(SwirlObject*)parent startTime:(float)time;


//draws a partial swirl up to 'time' to the context
-(void)renderToContext:(CGContextRef)context time:(float)time startPosition:(CGPoint)startPos;

//expects a 4 dimensional vector (RGBA)
-(void)setColor:(CGFloat*)components;

-(float)angleForTime:(float)time;

-(CGPoint)calculateForTime:(float)time;

@end
