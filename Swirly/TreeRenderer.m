//
//  TreeRenderer.m
//  Swirly
//
//  Created by Riley Williams on 11/16/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import "TreeRenderer.h"

@implementation TreeRenderer

-(TreeRenderer*)init {
	if (self = [super init]) {
		self.queue = [[NSMutableSet alloc] init];
		self.rendered = [[NSMutableSet alloc] init];
	}
	return self;
}

-(void)renderTree:(Tree*)tree toContext:(CGContextRef)ctx {
	[self.queue addObject:tree.rootNode];
	while ([self.queue count] > 0) {
		TreeNode *node = [self.queue anyObject];
		[self.rendered addObject:node];
		[self.queue removeObject:node];
		[self renderBranchFromNode:node toContext:ctx];
	}
}

-(void)renderBranchFromNode:(TreeNode*)branchRoot toContext:(CGContextRef)ctx {
	[branchRoot updatePosition];
	CGPoint startPos;
	if (branchRoot.parent != nil) {
		startPos = branchRoot.parent.lastPosition;
	} else {
		startPos = branchRoot.lastPosition;
	}
	CGContextSetStrokeColorWithColor(ctx, branchRoot.color.CGColor);
	CGContextSetLineWidth(ctx, 1);
	CGContextMoveToPoint(ctx, startPos.x, startPos.y);
	
	float theta = branchRoot.angle;
	float radius = branchRoot.radius;
	
	CGContextAddLineToPoint(ctx, startPos.x + radius*cosf(theta+M_PI/2), startPos.y + radius*sinf(theta+M_PI/2));
	
	if (branchRoot.nextInBranch != nil) {
		[self addNodeToPath:branchRoot.nextInBranch context:ctx];
	}
	
	CGContextAddLineToPoint(ctx, startPos.x + radius*cosf(theta-M_PI/2), startPos.y + radius*sinf(theta-M_PI/2));
	CGContextSetFillColorWithColor(ctx, branchRoot.color.CGColor);
	CGContextFillPath(ctx);
}

-(void)addNodeToPath:(TreeNode*)node context:(CGContextRef)ctx {
	[node updatePosition];
	CGPoint startPos = node.lastPosition;
	float theta = node.angle;
	float radius = node.radius;
	CGContextAddLineToPoint(ctx, startPos.x + radius*cosf(theta+M_PI/2), startPos.y + radius*sinf(theta+M_PI/2));
	if (node.nextInBranch != nil) {
		[self addNodeToPath:node.nextInBranch context:ctx];
	}
	if ([node.children count] > 0) {
		for (TreeNode *n in node.children) {
			if (![self.rendered containsObject:n] && ![self.queue containsObject:n]) {
				[self.queue addObject:n];
			}
		}
	}
	CGContextAddLineToPoint(ctx, startPos.x + radius*cosf(theta-M_PI/2), startPos.y + radius*sinf(theta-M_PI/2));
}

@end
