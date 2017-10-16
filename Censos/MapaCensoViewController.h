//
//  MapaCensoViewController.h
//  Censos
//
//  Created by Juan Pestana on 1/20/16.
//  Copyright © 2016 DPSoftware. All rights reserved.
//

#import "ViewController.h"
#import "sqlite3.h"
#import <Mapkit/Mapkit.h>
#import <CoreLocation/CoreLocation.h>
#import "Dato.h"

@interface MapaCensoViewController : ViewController

@property (weak, nonatomic) IBOutlet UILabel *titulo_label;

@property (weak, nonatomic) IBOutlet MKMapView *mapaCensoGrande;

@end
