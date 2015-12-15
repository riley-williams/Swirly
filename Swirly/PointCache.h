//
//  PointCache.h
//  Swirly
//
//  Created by Riley Williams on 11/12/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwirlObject.h"

@interface PointCache : NSObject

@property SwirlObject *dataSource;

-(PointCache*)init;

-(void)addPointX:(float)x y:(float)y time:(float)time;

-(CGPoint)pointForTime:(float)time;

-(BOOL)isCached:(float)time;

@end
