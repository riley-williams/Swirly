//
//  SwirlLine.h
//  Swirly
//
//  Created by Riley Williams on 11/12/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwirlObject.h"
#import "PointCache.h"

@interface SwirlLine : SwirlObject

@property float width;
@property PointCache *cache;

-(SwirlLine*)init;

-(void)renderToContext:(CGContextRef)context time:(float)time startPosition:(CGPoint)startPos;

@end
