//
//  TreeViewController.h
//  Swirly
//
//  Created by Riley Williams on 11/16/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TreeView.h"

@interface TreeViewController : UIViewController

@property (strong, nonatomic) TreeView *view;
@property NSTimer *timer;

- (IBAction)stepPressed:(id)sender;
- (IBAction)resetPressed:(id)sender;



@end
