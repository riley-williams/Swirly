//
//  Force.h
//  Swirly
//
//  Created by Riley Williams on 11/16/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct {
	float x;
	float y;
	float z;
} Vec3;

@interface Force : NSObject

-(Vec3)getForceAtPoint:(Vec3)point;

@end
