//
//  SettingsGeneralViewController.h
//  Censos
//
//  Created by Juan Pestana on 9/10/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "ViewController.h"
#import "sqlite3.h"
#import "HomeModel.h"


@interface SettingsGeneralViewController : ViewController <UITableViewDataSource, UITableViewDelegate, HomeModelProtocol>{
// ESTAS DOS VARIABLES SON PARA EL PROCESO DE TRAER LA BASE DE DATOS DE MYSQL
// EN EL ARRAY "DATOS" SE GUARDA EL JSON STRING QUE VIENE DE INTERNET
// EN EL NSMUTABLEDATA "DATA"
NSArray *datos;
NSMutableData *data;
}


@property (weak, nonatomic) IBOutlet UITableView *tableView;

// LABEL DONDE VA EL NOMBRE DEL PROYECTO
// ESTA SE ENVIA A LA BASE DE SQLITE QUE INDICA QUE PROYECTO ES EL QUE SE ESTA TRABAJANDO
@property (weak, nonatomic) IBOutlet UILabel *labelNombreProyecto;
@property (weak, nonatomic) IBOutlet UILabel *labelNumeroColumnas;


// CUANDO SE HACE CLICK EN ESTE BOTON, EL NOMBRE DEL PROYECTO SE INSERTA EN LA BASE DE SQLITE DE DONDE SE VA A SACAR SIEMPRE EL DATO
- (IBAction)seleccionarProyecto:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *boton_uno;
@property (weak, nonatomic) IBOutlet UIButton *boton_dos;
@property (weak, nonatomic) IBOutlet UIButton *boton_tres;
@property (weak, nonatomic) IBOutlet UIButton *boton_cuatro;

@property (weak, nonatomic) IBOutlet UIButton *boton_cinco;
@property (weak, nonatomic) IBOutlet UIButton *boton_seis;
@property (weak, nonatomic) IBOutlet UIButton *boton_siete;
@property (weak, nonatomic) IBOutlet UIButton *boton_ocho;

@property (weak, nonatomic) IBOutlet UIButton *boton_nueve;
@property (weak, nonatomic) IBOutlet UIButton *boton_diez;
@property (weak, nonatomic) IBOutlet UIButton *boton_once;
@property (weak, nonatomic) IBOutlet UIButton *boton_doce;

@property (weak, nonatomic) IBOutlet UIButton *boton_trece;
@property (weak, nonatomic) IBOutlet UIButton *boton_catorce;
@property (weak, nonatomic) IBOutlet UIButton *boton_quince;



@end
