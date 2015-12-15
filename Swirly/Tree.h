//
//  Tree.h
//  Swirly
//
//  Created by Riley Williams on 11/16/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TreeNode.h"

@interface Tree : NSObject

@property TreeNode *rootNode;
@property CGPoint origin;
@property float minimumRadius;
@property NSArray *splitProbabilities; //Each element is the probability of a level splitting. Probabilities of branch levels beyond array are assumed to be zero
@property float segmentLength; //maximum distance between TreeNodes
@property float growthRate; //rate of node growth
@property float lastUpdate; //time of last update
@property float maxDepth;

-(void)grow:(float)time;

@end
