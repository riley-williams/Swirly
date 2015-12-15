//
//  Tree.m
//  Swirly
//
//  Created by Riley Williams on 11/16/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import "Tree.h"

@implementation Tree

-(Tree*)initWithRootNode:(TreeNode*)root splitPs:(NSArray*)probs {
	if (self = [super init]) {
		self.rootNode = root;
		self.splitProbabilities = probs;
	}
	return self;
}

-(void)grow:(float)time {
	float delta = time - self.lastUpdate;
	self.lastUpdate = time;
	[self.rootNode grow:delta];
}

@end
