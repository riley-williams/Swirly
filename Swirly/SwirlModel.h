//
//  SwirlModel.h
//  Swirly
//
//  Created by Riley Williams on 11/12/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwirlObject.h"

@interface SwirlModel : NSObject

@property SwirlObject *rootSwirl;
@property CGPoint startPos;
@property float time; //the current simulation time

-(void)renderModel:(CGContextRef)context;

@end
