//
//  ViewController.h
//  Censos
//
//  Created by Juan Pestana on 9/9/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"
#import <CoreLocation/CoreLocation.h>





@interface ViewController : UIViewController <CLLocationManagerDelegate>

- (IBAction)sync:(id)sender;




@end

