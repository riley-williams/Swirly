//
//  TreeView.h
//  Swirly
//
//  Created by Riley Williams on 11/16/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tree.h"
#import "TreeRenderer.h"

@interface TreeView : UIView

@property Tree *tree;

-(void)setup;
-(void)step;

@end
