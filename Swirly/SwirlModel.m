//
//  SwirlModel.m
//  Swirly
//
//  Created by Riley Williams on 11/12/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import "SwirlModel.h"

@implementation SwirlModel

-(void)renderModel:(CGContextRef)context {
	[self.rootSwirl renderToContext:context time:self.time startPosition:self.startPos];
}


@end
