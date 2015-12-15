//
//  PhysicsObject.h
//  Swirly
//
//  Created by Riley Williams on 11/16/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Force.h"


@protocol PhysicsObject <NSObject>

@property Vec3 position;
@property Vec3 velocity;
@property NSMutableSet<Force> forces;

@end
