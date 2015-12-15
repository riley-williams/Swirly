//
//  TreeView.m
//  Swirly
//
//  Created by Riley Williams on 11/16/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import "TreeView.h"

@implementation TreeView

-(void)setup {
	self.tree = [[Tree alloc] init];
	self.tree.origin = CGPointMake(175, 600);
	self.tree.minimumRadius = 1;
	self.tree.segmentLength = 10;
	self.tree.growthRate = 5;
	self.tree.lastUpdate = 0;
	self.tree.splitProbabilities = @[@0.3, @0.2, @0.1];
	self.tree.maxDepth = 5;
	
	TreeNode *rootNode = [[TreeNode alloc] init];
	rootNode.tree = self.tree;
	rootNode.color = [UIColor blueColor];
	rootNode.radius = 20;
	rootNode.length = 0;
	rootNode.narrowingRate = .35;
	rootNode.curvature = ((float)arc4random_uniform(50)-25)/800.0;
	rootNode.angle = -M_PI/2 + ((float)arc4random_uniform(101)-50)/800.0;
	
	
	self.tree.rootNode = rootNode;
}


- (void)drawRect:(CGRect)rect {

	if (!self.tree) {
		[self setup];
	}
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	TreeRenderer *renderer = [[TreeRenderer alloc] init];
	[renderer renderTree:self.tree toContext:ctx];
	
	
}

-(void)step {
	[self.tree grow:self.tree.lastUpdate+1];
	[self setNeedsDisplay];
}

@end
