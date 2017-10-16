//
//  CENSOViewController.h
//  Censos
//
//  Created by Juan Pestana on 9/23/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "ViewController.h"
#import "sqlite3.h"
#import <Mapkit/Mapkit.h>
#import <CoreLocation/CoreLocation.h>
#import "Dato.h"


@interface CENSOViewController : ViewController<MKMapViewDelegate, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource>{
    
    // ESTAS DOS VARIABLES SON PARA EL PROCESO DE TRAER LA BASE DE DATOS DE MYSQL
    // EN EL ARRAY "DATOS" SE GUARDA EL JSON STRING QUE VIENE DE INTERNET
    // EN EL NSMUTABLEDATA "DATA"
    NSArray *datos;
    NSMutableData *data;
    
}

//MAPA
@property (weak, nonatomic) IBOutlet MKMapView *mapViewCensos;





// EN ESTE LABEL SE PONE EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO
@property (weak, nonatomic) IBOutlet UILabel *label_nombre_proyecto_actual;



// BOTONES DE CENSO
- (IBAction)botonUNO:(id)sender;

- (IBAction)botonDOS:(id)sender;

- (IBAction)botonTRES:(id)sender;

- (IBAction)botonCUATRO:(id)sender;

- (IBAction)botonCINCO:(id)sender;

- (IBAction)botonSEIS:(id)sender;

- (IBAction)botonSIETE:(id)sender;

- (IBAction)botonOCHO:(id)sender;

- (IBAction)botonNUEVE:(id)sender;

- (IBAction)botonDIEZ:(id)sender;

- (IBAction)botonONCE:(id)sender;

- (IBAction)botonDOCE:(id)sender;

- (IBAction)botonTRECE:(id)sender;

- (IBAction)botonCATORCE:(id)sender;

- (IBAction)botonQUINCE:(id)sender;

- (IBAction)botonDIECISEIS:(id)sender;

// INFO BOTONES


- (IBAction)infoUNO:(id)sender;

- (IBAction)infoDOS:(id)sender;

- (IBAction)infoTRES:(id)sender;

- (IBAction)infoCUATRO:(id)sender;

- (IBAction)infoCINCO:(id)sender;

- (IBAction)infoSEIS:(id)sender;

- (IBAction)infoSIETE:(id)sender;

- (IBAction)infoOCHO:(id)sender;

- (IBAction)infoNUEVE:(id)sender;

- (IBAction)infoDIEZ:(id)sender;

- (IBAction)infoONCE:(id)sender;

- (IBAction)infoDOCE:(id)sender;

- (IBAction)infoTRECE:(id)sender;

- (IBAction)infoCATORCE:(id)sender;

- (IBAction)infoQUINCE:(id)sender;



// LABELS DE NOMBRES DE BOTONES

// BOTON UNO
@property (weak, nonatomic) IBOutlet UILabel *label_uno;
@property (weak, nonatomic) IBOutlet UIButton *label_info_uno;
@property (weak, nonatomic) IBOutlet UIButton *boton_uno;
@property (weak, nonatomic) IBOutlet UIImageView *image_boton_uno;


// BOTON DOS
@property (weak, nonatomic) IBOutlet UILabel *label_dos;
@property (weak, nonatomic) IBOutlet UIButton *label_info_dos;
@property (weak, nonatomic) IBOutlet UIButton *boton_dos;
@property (weak, nonatomic) IBOutlet UIImageView *image_boton_dos;

// BOTON TRES
@property (weak, nonatomic) IBOutlet UILabel *label_tres;
@property (weak, nonatomic) IBOutlet UIButton *label_info_tres;
@property (weak, nonatomic) IBOutlet UIButton *boton_tres;
@property (weak, nonatomic) IBOutlet UIImageView *image_boton_tres;

// BOTON CUATRO
@property (weak, nonatomic) IBOutlet UILabel *label_cuatro;
@property (weak, nonatomic) IBOutlet UIButton *label_info_cuatro;
@property (weak, nonatomic) IBOutlet UIButton *boton_cuatro;
@property (weak, nonatomic) IBOutlet UIImageView *image_boton_cuatro;

// BOTON CINCO
@property (weak, nonatomic) IBOutlet UILabel *label_cinco;
@property (weak, nonatomic) IBOutlet UIButton *label_info_cinco;
@property (weak, nonatomic) IBOutlet UIButton *boton_cinco;
@property (weak, nonatomic) IBOutlet UIImageView *image_boton_cinco;

// BOTON SEIS
@property (weak, nonatomic) IBOutlet UILabel *label_seis;
@property (weak, nonatomic) IBOutlet UIButton *label_info_seis;
@property (weak, nonatomic) IBOutlet UIButton *boton_seis;
@property (weak, nonatomic) IBOutlet UIImageView *image_boton_seis;

// BOTON SIETE
@property (weak, nonatomic) IBOutlet UILabel *label_siete;
@property (weak, nonatomic) IBOutlet UIButton *label_info_siete;
@property (weak, nonatomic) IBOutlet UIButton *boton_siete;
@property (weak, nonatomic) IBOutlet UIImageView *image_boton_siete;

// BOTON OCHO
@property (weak, nonatomic) IBOutlet UILabel *label_ocho;
@property (weak, nonatomic) IBOutlet UIButton *label_info_ocho;
@property (weak, nonatomic) IBOutlet UIButton *boton_ocho;
@property (weak, nonatomic) IBOutlet UIImageView *image_boton_ocho;

// BOTON NUEVE
@property (weak, nonatomic) IBOutlet UILabel *label_nueve;
@property (weak, nonatomic) IBOutlet UIButton *label_info_nueve;
@property (weak, nonatomic) IBOutlet UIButton *boton_nueve;
@property (weak, nonatomic) IBOutlet UIImageView *image_boton_nueve;

// BOTON DIEZ
@property (weak, nonatomic) IBOutlet UILabel *label_diez;
@property (weak, nonatomic) IBOutlet UIButton *label_info_diez;
@property (weak, nonatomic) IBOutlet UIButton *boton_diez;
@property (weak, nonatomic) IBOutlet UIImageView *image_boton_diez;

// BOTON ONCE
@property (weak, nonatomic) IBOutlet UILabel *label_once;
@property (weak, nonatomic) IBOutlet UIButton *label_info_once;
@property (weak, nonatomic) IBOutlet UIButton *boton_once;
@property (weak, nonatomic) IBOutlet UIImageView *image_boton_once;

// BOTON DOCE
@property (weak, nonatomic) IBOutlet UILabel *label_doce;
@property (weak, nonatomic) IBOutlet UIButton *label_info_doce;
@property (weak, nonatomic) IBOutlet UIButton *boton_doce;
@property (weak, nonatomic) IBOutlet UIImageView *image_boton_doce;

// BOTON TRECE
@property (weak, nonatomic) IBOutlet UILabel *label_trece;
@property (weak, nonatomic) IBOutlet UIButton *label_info_trece;
@property (weak, nonatomic) IBOutlet UIButton *boton_trece;
@property (weak, nonatomic) IBOutlet UIImageView *image_boton_trece;

// BOTON CATORCE
@property (weak, nonatomic) IBOutlet UILabel *label_catorce;
@property (weak, nonatomic) IBOutlet UIButton *label_info_catorce;
@property (weak, nonatomic) IBOutlet UIButton *boton_catorce;
@property (weak, nonatomic) IBOutlet UIImageView *image_boton_catorce;

// BOTON QUINCE
@property (weak, nonatomic) IBOutlet UILabel *label_quince;
@property (weak, nonatomic) IBOutlet UIButton *label_info_quince;
@property (weak, nonatomic) IBOutlet UIButton *boton_quince;
@property (weak, nonatomic) IBOutlet UIImageView *image_boton_quince;



@property (weak, nonatomic) IBOutlet UITableView *tableViewCenso;

- (IBAction)plotPuntos:(id)sender;



@end
