//
//  RenderView.h
//  Swirly
//
//  Created by Riley Williams on 11/12/15.
//  Copyright © 2015 Riley Williams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwirlModel.h"
#import "SwirlLine.h"
#import "SwirlStrokeSolid.h"

@interface RenderView : UIView

@property SwirlModel *swirl;

-(void)setup;

@end
