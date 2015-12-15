//
//  TreeNode.h
//  Swirly
//
//  Created by Riley Williams on 11/16/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Force.h"
@class Tree;

@interface TreeNode : NSObject

@property Tree *tree;
@property TreeNode *parent; //next node in direction of the root
@property TreeNode *nextInBranch; //the next node in the branch
@property NSMutableSet<TreeNode*> *children; //the start nodes that split off of the branch
@property NSMutableSet<Force*> *forces; //set of local forces (use for propogation?)
@property UIColor *color;
@property CGPoint lastPosition; //used as a cache
@property float radius; //radius of branch
@property float length; //the distance from the parent
@property float narrowingRate; //the rate at which the branch narrows (linear)
@property float curvature; //the "acceleration" in one direction
@property float angle; //angle relative to parent
@property int depth;
@property BOOL isFinished;
#warning update for 3d space

-(TreeNode*)init;

-(void)grow:(float)delta;

-(void)updatePosition;

@end
