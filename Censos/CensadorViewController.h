//
//  CensadorViewController.h
//  Censos
//
//  Created by Juan Pestana on 11/15/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "ViewController.h"
#import "sqlite3.h"


@interface CensadorViewController : ViewController<UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *censadorText;

- (IBAction)seleccionar:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *botonSeleccionar;
- (IBAction)escribio:(id)sender;

@end
