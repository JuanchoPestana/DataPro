//
//  BotonTRECEViewController.h
//  Censos
//
//  Created by Juan Pestana on 10/24/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "ViewController.h"
#import "sqlite3.h"


@interface BotonTRECEViewController : ViewController{
    
    // ESTAS DOS VARIABLES SON PARA EL PROCESO DE TRAER LA BASE DE DATOS DE MYSQL
    // EN EL ARRAY "DATOS" SE GUARDA EL JSON STRING QUE VIENE DE INTERNET
    // EN EL NSMUTABLEDATA "DATA"
    NSArray *datos;
    NSMutableData *data;
    
}

// LABEL QUE TIENE EL NOMBRE DEL PROYECTO ACTUAL
@property (weak, nonatomic) IBOutlet UILabel *label_proyecto_actual;

// SCROLLVIEW
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

// LABELS DE NOMBRES DE COLUMNAS
@property (weak, nonatomic) IBOutlet UILabel *label_columna_uno;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_dos;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_tres;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_cuatro;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_cinco;

@property (weak, nonatomic) IBOutlet UILabel *label_columna_seis;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_siete;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_ocho;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_nueve;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_diez;

@property (weak, nonatomic) IBOutlet UILabel *label_columna_once;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_doce;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_trece;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_catorce;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_quince;


@property (weak, nonatomic) IBOutlet UILabel *label_columna_dieciseis;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_diecisiete;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_dieciocho;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_diecinueve;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_veinte;

@property (weak, nonatomic) IBOutlet UILabel *label_columna_veintiuno;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_veintidos;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_veintitres;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_veinticuatro;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_veinticinco;

@property (weak, nonatomic) IBOutlet UILabel *label_columna_veintiseis;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_veintisiete;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_veintiocho;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_veintinueve;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_treinta;

@property (weak, nonatomic) IBOutlet UILabel *label_columna_treintaiuno;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_treintaidos;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_treintaitres;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_treintaicuatro;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_treintaicinco;

@property (weak, nonatomic) IBOutlet UILabel *label_columna_treintaiseis;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_treintaisiete;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_treintaiocho;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_treintainueve;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_cuarenta;

@property (weak, nonatomic) IBOutlet UILabel *label_columna_cuarentaiuno;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_cuarentaidos;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_cuarentaitres;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_cuarentaicuatro;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_cuarentaicinco;

@property (weak, nonatomic) IBOutlet UILabel *label_columna_cuarentaiseis;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_cuarentaisiete;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_cuarentaiocho;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_cuarentainueve;
@property (weak, nonatomic) IBOutlet UILabel *label_columna_cincuenta;


// TEXTFIELDS DE NOMBRES DE COLUMNAS
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_uno;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_dos;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_tres;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_cuatro;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_cinco;

@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_seis;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_siete;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_ocho;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_nueve;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_diez;

@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_once;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_doce;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_trece;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_catorce;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_quince;


@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_dieciseis;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_diecisiete;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_dieciocho;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_diecinueve;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_veinte;

@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_veintiuno;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_veintidos;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_veintitres;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_veinticuatro;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_veinticinco;

@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_veintiseis;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_veintisiete;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_veintiocho;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_veintinueve;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_treinta;

@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_treintaiuno;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_treintaidos;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_treintaitres;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_treintaicuatro;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_treintaicinco;

@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_treintaiseis;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_treintaisiete;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_treintaiocho;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_treintainueve;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_cuarenta;

@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_cuarentaiuno;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_cuarentaidos;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_cuarentaitres;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_cuarentaicuatro;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_cuarentaicinco;

@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_cuarentaiseis;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_cuarentaisiete;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_cuarentaiocho;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_cuarentainueve;
@property (weak, nonatomic) IBOutlet UITextField *textfield_columna_cincuenta;

@property (weak, nonatomic) IBOutlet UITextField *titulo_boton;



- (IBAction)agregar:(id)sender;


@end
