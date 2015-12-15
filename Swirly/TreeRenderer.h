//
//  TreeRenderer.h
//  Swirly
//
//  Created by Riley Williams on 11/16/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tree.h"

@interface TreeRenderer : NSObject

@property NSMutableSet<TreeNode*> *queue;
@property NSMutableSet<TreeNode*> *rendered;

-(void)renderTree:(Tree*)tree toContext:(CGContextRef)ctx;

@end
