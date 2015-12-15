//
//  TreeNode.m
//  Swirly
//
//  Created by Riley Williams on 11/16/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import "TreeNode.h"
#import "Tree.h"

@interface TreeNode	()

-(TreeNode*)initWithParent:(TreeNode*)parent;

-(TreeNode*)spawnChild;

@end


@implementation TreeNode

-(TreeNode*)init {
	if (self = [super init]) {
		self.children = [[NSMutableSet alloc] init];
		self.forces = [[NSMutableSet alloc] init];
		self.isFinished = NO;
	}
	return self;
}

//returns nil if the branch width is less than the cutoff
-(TreeNode*)initWithParent:(TreeNode *)parent {
	if (self = [self init]) {
		self.radius = parent.radius - parent.narrowingRate;
		if (self.radius < self.tree.minimumRadius) {
			return nil;
		}
		self.parent = parent;
		self.tree = parent.tree;
		self.color = parent.color;
		self.length = 0;
		self.angle = parent.angle + parent.curvature;
		self.curvature = parent.curvature;
		self.narrowingRate = parent.narrowingRate;
		self.depth = parent.depth;
	}
	return self;
}

-(void)grow:(float)delta {
	//if this node is at its maximum length, grow a child or recurse into children
	if (self.length >= self.tree.segmentLength) {
		if (self.nextInBranch == nil && self.depth < self.tree.maxDepth) { //if there is no next segment, spawn one
			self.nextInBranch = [self spawnChild];
			if (arc4random_uniform(10) == 1) { //random chance of splitting
				TreeNode *newBranch = [self spawnChild];
				if (newBranch) {
					newBranch.curvature = newBranch.parent.curvature *-2;
					newBranch.angle += ((float)arc4random_uniform(3)-1.0)/3.0;
					newBranch.depth++;
					[self.children addObject:newBranch];
				}
			}
		}
		if (self.nextInBranch != nil)
			[self.nextInBranch grow:delta];
		for (TreeNode *child in self.children) {
			[child grow:delta];
		}
	} else { //segment is still growing
			 //expand the length no more than the tree's segment length
		self.length += self.tree.growthRate * delta;
		//if (self.length > self.tree.segmentLength) {
		//	self.length = self.tree.segmentLength;
		//}
	}
	
}

//spawns a new child on the current branch.
//returns nil if branch becomes too thin
-(TreeNode*)spawnChild {
	TreeNode *child = [[TreeNode alloc] initWithParent:self];
	if (!child)
		return nil;
	return child;
}

-(void)updatePosition {
	if (self.parent == nil) { //use the tree's origin if the node is the tree root
		self.lastPosition = self.tree.origin;
		return;
	}
	CGPoint parentPos = self.parent.lastPosition;
	float x = parentPos.x + self.length*cosf(self.angle);
	float y = parentPos.y + self.length*sinf(self.angle);
	self.lastPosition = CGPointMake(x, y);
}

@end
