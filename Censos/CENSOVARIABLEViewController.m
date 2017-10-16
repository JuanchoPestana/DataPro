//
//  CENSOVARIABLEViewController.m
//  Censos
//
//  Created by Juan Pestana on 10/25/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "CENSOVARIABLEViewController.h"

@interface CENSOVARIABLEViewController (){
    
    
    // VARIABLES DE LOCALIZACION
    NSMutableArray *arrayOfLocation;
    CLLocationManager *locationManager;
    CLLocationManager *startlocation;
    

    
    
    // VARIABLES DE SQLITE
    sqlite3 *censos;
    NSString *dbPathString;
    
}

@end


NSString *nombre_proyecto_actual_censo_variable;
NSString *numero_columnas_proyecto_variable;

NSString *latitud_variable;
NSString *longitud_variable;
NSString *fecha_variable;
NSString *censador_variable;
NSString *state_variable;

NSString *columna_latitud_variable;
NSString *columna_longitud_variable;
NSString *columna_fecha_variable;
NSString *columna_censador_variable;
NSString *columna_state_variable;



// STRINGS GLOBALES PARA PONER VALOR DE LAS COLUMNAS DE BOTON

////////////////////////////////////////////////////////////////////////// UNO //////////////////////////////////////////////////////////////////////////

NSString *boton_variable_columna_uno;
NSString *boton_variable_columna_dos;
NSString *boton_variable_columna_tres;
NSString *boton_variable_columna_cuatro;
NSString *boton_variable_columna_cinco;
NSString *boton_variable_columna_seis;
NSString *boton_variable_columna_siete;
NSString *boton_variable_columna_ocho;
NSString *boton_variable_columna_nueve;
NSString *boton_variable_columna_diez;
NSString *boton_variable_columna_once;
NSString *boton_variable_columna_doce;
NSString *boton_variable_columna_trece;
NSString *boton_variable_columna_catorce;
NSString *boton_variable_columna_quince;
NSString *boton_variable_columna_dieciseis;
NSString *boton_variable_columna_diecisiete;
NSString *boton_variable_columna_dieciocho;
NSString *boton_variable_columna_diecinueve;
NSString *boton_variable_columna_veinte;
NSString *boton_variable_columna_veintiuno;
NSString *boton_variable_columna_veintidos;
NSString *boton_variable_columna_veintitres;
NSString *boton_variable_columna_veinticuatro;
NSString *boton_variable_columna_veinticinco;
NSString *boton_variable_columna_veintiseis;
NSString *boton_variable_columna_veintisiete;
NSString *boton_variable_columna_veintiocho;
NSString *boton_variable_columna_veintinueve;
NSString *boton_variable_columna_treinta;
NSString *boton_variable_columna_treintaiuno;
NSString *boton_variable_columna_treintaidos;
NSString *boton_variable_columna_treintaitres;
NSString *boton_variable_columna_treintaicuatro;
NSString *boton_variable_columna_treintaicinco;
NSString *boton_variable_columna_treintaiseis;
NSString *boton_variable_columna_treintaisiete;
NSString *boton_variable_columna_treintaiocho;
NSString *boton_variable_columna_treintainueve;
NSString *boton_variable_columna_cuarenta;
NSString *boton_variable_columna_cuarentaiuno;
NSString *boton_variable_columna_cuarentaidos;
NSString *boton_variable_columna_cuarentaitres;
NSString *boton_variable_columna_cuarentaicuatro;
NSString *boton_variable_columna_cuarentaicinco;
NSString *boton_variable_columna_cuarentaiseis;
NSString *boton_variable_columna_cuarentaisiete;
NSString *boton_variable_columna_cuarentaiocho;
NSString *boton_variable_columna_cuarentainueve;
NSString *boton_variable_columna_cincuenta;

// NOMBRES DE COLUMNAS DE BASES DE DATOS
NSString *boton_variable_nombre_columna_uno;
NSString *boton_variable_nombre_columna_dos;
NSString *boton_variable_nombre_columna_tres;
NSString *boton_variable_nombre_columna_cuatro;
NSString *boton_variable_nombre_columna_cinco;
NSString *boton_variable_nombre_columna_seis;
NSString *boton_variable_nombre_columna_siete;
NSString *boton_variable_nombre_columna_ocho;
NSString *boton_variable_nombre_columna_nueve;
NSString *boton_variable_nombre_columna_diez;
NSString *boton_variable_nombre_columna_once;
NSString *boton_variable_nombre_columna_doce;
NSString *boton_variable_nombre_columna_trece;
NSString *boton_variable_nombre_columna_catorce;
NSString *boton_variable_nombre_columna_quince;
NSString *boton_variable_nombre_columna_dieciseis;
NSString *boton_variable_nombre_columna_diecisiete;
NSString *boton_variable_nombre_columna_dieciocho;
NSString *boton_variable_nombre_columna_diecinueve;
NSString *boton_variable_nombre_columna_veinte;
NSString *boton_variable_nombre_columna_veintiuno;
NSString *boton_variable_nombre_columna_veintidos;
NSString *boton_variable_nombre_columna_veintitres;
NSString *boton_variable_nombre_columna_veinticuatro;
NSString *boton_variable_nombre_columna_veinticinco;
NSString *boton_variable_nombre_columna_veintiseis;
NSString *boton_variable_nombre_columna_veintisiete;
NSString *boton_variable_nombre_columna_veintiocho;
NSString *boton_variable_nombre_columna_veintinueve;
NSString *boton_variable_nombre_columna_treinta;
NSString *boton_variable_nombre_columna_treintaiuno;
NSString *boton_variable_nombre_columna_treintaidos;
NSString *boton_variable_nombre_columna_treintaitres;
NSString *boton_variable_nombre_columna_treintaicuatro;
NSString *boton_variable_nombre_columna_treintaicinco;
NSString *boton_variable_nombre_columna_treintaiseis;
NSString *boton_variable_nombre_columna_treintaisiete;
NSString *boton_variable_nombre_columna_treintaiocho;
NSString *boton_variable_nombre_columna_treintainueve;
NSString *boton_variable_nombre_columna_cuarenta;
NSString *boton_variable_nombre_columna_cuarentaiuno;
NSString *boton_variable_nombre_columna_cuarentaidos;
NSString *boton_variable_nombre_columna_cuarentaitres;
NSString *boton_variable_nombre_columna_cuarentaicuatro;
NSString *boton_variable_nombre_columna_cuarentaicinco;
NSString *boton_variable_nombre_columna_cuarentaiseis;
NSString *boton_variable_nombre_columna_cuarentaisiete;
NSString *boton_variable_nombre_columna_cuarentaiocho;
NSString *boton_variable_nombre_columna_cuarentainueve;
NSString *boton_variable_nombre_columna_cincuenta;




@implementation CENSOVARIABLEViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // HIDE TODO
    // LABELS
    _label_columna_uno.hidden = YES;
    _label_columna_dos.hidden =  YES;
    _label_columna_tres.hidden =  YES;
    _label_columna_cuatro.hidden =  YES;
    _label_columna_cinco.hidden =  YES;
    _label_columna_seis.hidden =  YES;
    _label_columna_siete.hidden =  YES;
    _label_columna_ocho.hidden =  YES;
    _label_columna_nueve.hidden =  YES;
    _label_columna_diez.hidden =  YES;
    _label_columna_once.hidden =  YES;
    _label_columna_doce.hidden =  YES;
    _label_columna_trece.hidden =  YES;
    _label_columna_catorce.hidden = YES;
    _label_columna_quince.hidden = YES;
    _label_columna_dieciseis.hidden = YES;
    _label_columna_diecisiete.hidden = YES;
    _label_columna_dieciocho.hidden = YES;
    _label_columna_diecinueve.hidden = YES;
    _label_columna_veinte.hidden = YES;
    _label_columna_veintiuno.hidden = YES;
    _label_columna_veintidos.hidden = YES;
    _label_columna_veintitres.hidden = YES;
    _label_columna_veinticuatro.hidden = YES;
    _label_columna_veinticinco.hidden = YES;
    _label_columna_veintiseis.hidden = YES;
    _label_columna_veintisiete.hidden = YES;
    _label_columna_veintiocho.hidden = YES;
    _label_columna_veintinueve.hidden = YES;
    _label_columna_treinta.hidden = YES;
    _label_columna_treintaiuno.hidden = YES;
    _label_columna_treintaidos.hidden = YES;
    _label_columna_treintaitres.hidden = YES;
    _label_columna_treintaicuatro.hidden = YES;
    _label_columna_treintaicinco.hidden = YES;
    _label_columna_treintaiseis.hidden = YES;
    _label_columna_treintaisiete.hidden = YES;
    _label_columna_treintaiocho.hidden = YES;
    _label_columna_treintainueve.hidden = YES;
    _label_columna_cuarenta.hidden = YES;
    _label_columna_cuarentaiuno.hidden = YES;
    _label_columna_cuarentaidos.hidden = YES;
    _label_columna_cuarentaitres.hidden = YES;
    _label_columna_cuarentaicuatro.hidden = YES;
    _label_columna_cuarentaicinco.hidden = YES;
    _label_columna_cuarentaiseis.hidden = YES;
    _label_columna_cuarentaisiete.hidden = YES;
    _label_columna_cuarentaiocho.hidden = YES;
    _label_columna_cuarentainueve.hidden = YES;
    _label_columna_cincuenta.hidden = YES;
    
    // TEXTFIELDS
    _textfield_columna_uno.hidden = YES;
    _textfield_columna_dos.hidden =  YES;
    _textfield_columna_tres.hidden =  YES;
    _textfield_columna_cuatro.hidden =  YES;
    _textfield_columna_cinco.hidden =  YES;
    _textfield_columna_seis.hidden =  YES;
    _textfield_columna_siete.hidden =  YES;
    _textfield_columna_ocho.hidden =  YES;
    _textfield_columna_nueve.hidden =  YES;
    _textfield_columna_diez.hidden =  YES;
    _textfield_columna_once.hidden =  YES;
    _textfield_columna_doce.hidden =  YES;
    _textfield_columna_trece.hidden =  YES;
    _textfield_columna_catorce.hidden = YES;
    _textfield_columna_quince.hidden = YES;
    _textfield_columna_dieciseis.hidden = YES;
    _textfield_columna_diecisiete.hidden = YES;
    _textfield_columna_dieciocho.hidden = YES;
    _textfield_columna_diecinueve.hidden = YES;
    _textfield_columna_veinte.hidden = YES;
    _textfield_columna_veintiuno.hidden = YES;
    _textfield_columna_veintidos.hidden = YES;
    _textfield_columna_veintitres.hidden = YES;
    _textfield_columna_veinticuatro.hidden = YES;
    _textfield_columna_veinticinco.hidden = YES;
    _textfield_columna_veintiseis.hidden = YES;
    _textfield_columna_veintisiete.hidden = YES;
    _textfield_columna_veintiocho.hidden = YES;
    _textfield_columna_veintinueve.hidden = YES;
    _textfield_columna_treinta.hidden = YES;
    _textfield_columna_treintaiuno.hidden = YES;
    _textfield_columna_treintaidos.hidden = YES;
    _textfield_columna_treintaitres.hidden = YES;
    _textfield_columna_treintaicuatro.hidden = YES;
    _textfield_columna_treintaicinco.hidden = YES;
    _textfield_columna_treintaiseis.hidden = YES;
    _textfield_columna_treintaisiete.hidden = YES;
    _textfield_columna_treintaiocho.hidden = YES;
    _textfield_columna_treintainueve.hidden = YES;
    _textfield_columna_cuarenta.hidden = YES;
    _textfield_columna_cuarentaiuno.hidden = YES;
    _textfield_columna_cuarentaidos.hidden = YES;
    _textfield_columna_cuarentaitres.hidden = YES;
    _textfield_columna_cuarentaicuatro.hidden = YES;
    _textfield_columna_cuarentaicinco.hidden = YES;
    _textfield_columna_cuarentaiseis.hidden = YES;
    _textfield_columna_cuarentaisiete.hidden = YES;
    _textfield_columna_cuarentaiocho.hidden = YES;
    _textfield_columna_cuarentainueve.hidden = YES;
    _textfield_columna_cincuenta.hidden = YES;
    
    
    
    // SCROLLVIEW
    [self.scrollview setScrollEnabled:YES];
    [self.scrollview setContentSize:(CGSizeMake(768, 1130))];


    
    [self createOrOpenDBCensador];
    [self selfActualizarCENSADOR];
    
    // AQUI SE ABRE LA BASE DONDE ESTA EL NOMBRE DEL PROYECTO ACTUAL
    [self createOrOpenDBNombreProyectoActual];
    [self selfActualizarVARIABLE];
    [self traerBotonVARIABLE];
    [self ponerNombresLabels];
    
    
    
    //  AQUI SE AGARRA EL NUMERO DE COLUMNAS QUE TIENE LA TABLA PARA VER CUANTOS TEXTFIELDS Y LABELS SE MUESTRAN
    // UNO
    NSString *numeroColumnas = numero_columnas_proyecto_variable;
    int numeroColumnasINT = [numeroColumnas intValue];
    
    switch (numeroColumnasINT) {
        case 1:
            [self showUNO];
            break;
        case 2:
            [self showDOS];
            break;
        case 3:
            [self showTRES];
            break;
        case 4:
            [self showCUATRO];
            break;
        case 5:
            [self showCINCO];
            break;
        case 6:
            [self showSEIS];
            break;
        case 7:
            [self showSIETE];
            break;
        case 8:
            [self showOCHO];
            break;
        case 9:
            [self showNUEVE];
            break;
        case 10:
            [self showDIEZ];
            break;
        case 11:
            [self showONCE];
            break;
        case 12:
            [self showDOCE];
            break;
        case 13:
            [self showTRECE];
            break;
        case 14:
            [self showCATORCE];
            break;
        case 15:
            [self showQUINCE];
            break;
        case 16:
            [self showDIECISEIS];
            break;
        case 17:
            [self showDIECISIETE];
            break;
        case 18:
            [self showDIECIOCHO];
            break;
        case 19:
            [self showDIECINUEVE];
            break;
        case 20:
            [self showVEINTE];
            break;
        case 21:
            [self showVEINTIUNO];
            break;
        case 22:
            [self showVEINTIDOS];
            break;
        case 23:
            [self showVEINTITRES];
            break;
        case 24:
            [self showVEINTICUATRO];
            break;
        case 25:
            [self showVEINTICINCO];
            break;
        case 26:
            [self showVEINTISEIS];
            break;
        case 27:
            [self showVEINTISIETE];
            break;
        case 28:
            [self showVEINTIOCHO];
            break;
        case 29:
            [self showVEINTINUEVE];
            break;
        case 30:
            [self showTREINTA];
            break;
        case 31:
            [self showTREINTAIUNO];
            break;
        case 32:
            [self showTREINTAIDOS];
            break;
        case 33:
            [self showTREINTAITRES];
            break;
        case 34:
            [self showTREINTAICUATRO];
            break;
        case 35:
            [self showTREINTAICINCO];
            break;
        case 36:
            [self showTREINTAISEIS];
            break;
        case 37:
            [self showTREINTAISIETE];
            break;
        case 38:
            [self showTREINTAIOCHO];
            break;
        case 39:
            [self showTREINTAINUEVE];
            break;
        case 40:
            [self showCUARENTA];
            break;
        case 41:
            [self showCUARENTAIUNO];
            break;
        case 42:
            [self showCUARENTAIDOS];
            break;
        case 43:
            [self showCUARENTAITRES];
            break;
        case 44:
            [self showCUARENTAICUATRO];
            break;
        case 45:
            [self showCUARENTAICINCO];
            break;
        case 46:
            [self showCUARENTAISEIS];
            break;
        case 47:
            [self showCUARENTAISIETE];
            break;
        case 48:
            [self showCUARENTAIOCHO];
            break;
        case 49:
            [self showCUARENTAINUEVE];
            break;
        case 50:
            [self showCINCUENTA];
            break;
            
        default:
            break;
    }
    


    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [dateFormat stringFromDate:today];
    fecha_variable = dateString;
    
    
    
    //PROCESOS DE LOCALIZACION
    locationManager = [[CLLocationManager alloc]init];
    [locationManager requestAlwaysAuthorization];
    [locationManager startUpdatingLocation];
    
    locationManager.delegate = self;
    
}

// CONFIGURACION DE LOCATION
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    //NSLog(@"didUpdateToLocation: %@", newLocation);
    NSString *currentlatitude = [[NSString alloc]initWithFormat:@"%.10f", newLocation.coordinate.latitude];
    latitud_variable = currentlatitude;
   // NSLog(@"LAT: %@", latitud_variable);
    NSString *currentlongitude = [[NSString alloc]initWithFormat:@"%.10f", newLocation.coordinate.longitude];
    longitud_variable = currentlongitude;
    //NSLog(@"LON: %@", longitud_variable);
}



-(void)createOrOpenDBNombreProyectoActual{
    
    // AQUI SE CREA LA TABLA EN DONDE SE VA A GUARDAR EL PROYECTO ACTUAL
    // ESTA TABLA ES DE SUMA IMPORTANCIA PORQUE AQUI ES DONDE ESTA EL NOMBRE DEL PROYECTO ACTUAL, EL CUAL SE UTILIZA EN DIFERENTES PANTALLAS
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    dbPathString = [docPath stringByAppendingPathComponent:@"nombreProyectoActual.db"];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS NOMBREPROYECTOACTUAL (ID INTEGER PRIMARY KEY AUTOINCREMENT, NOMBREPROYECTO TEXT, NUMEROCOLUMNAS TEXT)";
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA NOMBREPROYECTO ACTUAL CREADA");
        }
    }
}

// ESTO ES PARTE DEL PROCESO DE LLAMAR LA BASE// AQUI SE HACE EL SELECT * PARA PODER TENER EL DATO QUE QUEREMOS (NOMBRE DEL PROYECTO ACTUAL)
-(void)selfActualizarVARIABLE{
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        
        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM NOMBREPROYECTOACTUAL"];
        const char* query_sql = [querySql UTF8String];
        
        
        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
            while (sqlite3_step(statement)==SQLITE_ROW) {
                
                // AQUI SE AGARRA EL NOMBRE DEL PROYECTO ACTUAL DE LA BASE DE DATOS DE SQLITE
                NSString *nombreDeProyecto = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                NSString *numeroColumnas = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                
                
                _label_proyecto_actual.text = nombreDeProyecto;
                
                // ESTA ES UNA VARIABLE GLOBAL QUE CREE ARRIBA DEL CODIGO PARA GUARDAR, PARA TODO ESTE ARCHIVO, EL NOMBRE DEL PROYECTO ACTUAL
                // EL CUAL SACAMOS DE LA FAMOSA BASE DE NOMBREPROYECTOACTUAL
                nombre_proyecto_actual_censo_variable = nombreDeProyecto;
                numero_columnas_proyecto_variable = numeroColumnas;
                
            }
        }
    }
    sqlite3_close(censos);
    
}



//////////////////////////////////////////////////////////// AQUI TERMINA TABLEVIEW ////////////////////////////////////////////////////////////

-(void)createOrOpenDBCensador{
    
    // AQUI SE CREA LA TABLA EN DONDE SE VA A GUARDAR EL PROYECTO ACTUAL
    // ESTA TABLA ES DE SUMA IMPORTANCIA PORQUE AQUI ES DONDE ESTA EL NOMBRE DEL PROYECTO ACTUAL, EL CUAL SE UTILIZA EN DIFERENTES PANTALLAS
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    dbPathString = [docPath stringByAppendingPathComponent:@"censador.db"];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS CENSADOR (ID INTEGER PRIMARY KEY AUTOINCREMENT, CENSADOR TEXT )";
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA CENSADOR CREADA");
        }
    }
}
// ESTO ES PARTE DEL PROCESO DE LLAMAR LA BASE// AQUI SE HACE EL SELECT * PARA PODER TENER EL DATO QUE QUEREMOS (NOMBRE DEL PROYECTO ACTUAL)
-(void)selfActualizarCENSADOR{
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        
        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM CENSADOR"];
        const char* query_sql = [querySql UTF8String];
        
        
        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
            while (sqlite3_step(statement)==SQLITE_ROW) {
                
                // AQUI SE AGARRA EL NOMBRE DEL PROYECTO ACTUAL DE LA BASE DE DATOS DE SQLITE
                NSString *censador_column = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                
                censador_variable = censador_column;
                
            }
        }
    }
    sqlite3_close(censos);
    
}


// ESTE METODO ES PARA TRAER LOS NOMBRES DE LAS COLUMNAS, LAS VOY A AGARRAR DE LA BASE DE SQLITE
// DEL PROYECTO ACTUAL
-(void)traerBotonVARIABLE{
    
    
    int numero_columnas_proyecto_int = [numero_columnas_proyecto_variable intValue];
    
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombre_proyecto_actual_censo_variable];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        
        
        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@", nombre_proyecto_actual_censo_variable];
        const char* query_sql = [querySql UTF8String];
        
        
        switch (numero_columnas_proyecto_int) {
            case 1:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        
                    }
                }
                break;
            case 2:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                    }
                }
                break;
            case 3:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                    }
                }
                break;
            case 4:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                    }
                }
                break;
            case 5:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                    }
                }
                break;
            case 6:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                    }
                }
                break;
            case 7:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                    }
                }
                break;
            case 8:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                    }
                }
                break;
            case 9:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                    }
                }
                break;
            case 10:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                    }
                }
                break;
            case 11:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        
                    }
                }
                break;
            case 12:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                    }
                }
                break;
            case 13:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                    }
                }
                break;
            case 14:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                    }
                }
                break;
            case 15:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        
                    }
                }
                break;
            case 16:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                    }
                }
                break;
            case 17:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                    }
                }
                break;
            case 18:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                    }
                }
                break;
            case 19:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                    }
                }
                break;
            case 20:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                    }
                }
                break;
            case 21:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                    }
                }
                break;
            case 22:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                    }
                }
                break;
            case 23:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                    }
                }
                break;
            case 24:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                    }
                }
                break;
            case 25:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                    }
                }
                break;
            case 26:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        NSString *nombre_columna_veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                        boton_variable_nombre_columna_veintiseis = nombre_columna_veintiseis;
                    }
                }
                break;
            case 27:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        NSString *nombre_columna_veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                        NSString *nombre_columna_veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                        boton_variable_nombre_columna_veintiseis = nombre_columna_veintiseis;
                        boton_variable_nombre_columna_veintisiete = nombre_columna_veintisiete;
                    }
                }
                break;
            case 28:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        NSString *nombre_columna_veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                        NSString *nombre_columna_veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                        NSString *nombre_columna_veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                        boton_variable_nombre_columna_veintiseis = nombre_columna_veintiseis;
                        boton_variable_nombre_columna_veintisiete = nombre_columna_veintisiete;
                        boton_variable_nombre_columna_veintiocho = nombre_columna_veintiocho;
                    }
                }
                break;
            case 29:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        NSString *nombre_columna_veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                        NSString *nombre_columna_veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                        NSString *nombre_columna_veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                        NSString *nombre_columna_veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                        boton_variable_nombre_columna_veintiseis = nombre_columna_veintiseis;
                        boton_variable_nombre_columna_veintisiete = nombre_columna_veintisiete;
                        boton_variable_nombre_columna_veintiocho = nombre_columna_veintiocho;
                        boton_variable_nombre_columna_veintinueve = nombre_columna_veintinueve;
                    }
                }
                break;
            case 30:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        NSString *nombre_columna_veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                        NSString *nombre_columna_veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                        NSString *nombre_columna_veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                        NSString *nombre_columna_veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                        NSString *nombre_columna_treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                        boton_variable_nombre_columna_veintiseis = nombre_columna_veintiseis;
                        boton_variable_nombre_columna_veintisiete = nombre_columna_veintisiete;
                        boton_variable_nombre_columna_veintiocho = nombre_columna_veintiocho;
                        boton_variable_nombre_columna_veintinueve = nombre_columna_veintinueve;
                        boton_variable_nombre_columna_treinta = nombre_columna_treinta;
                    }
                }
                break;
            case 31:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        NSString *nombre_columna_veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                        NSString *nombre_columna_veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                        NSString *nombre_columna_veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                        NSString *nombre_columna_veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                        NSString *nombre_columna_treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                        NSString *nombre_columna_treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                        boton_variable_nombre_columna_veintiseis = nombre_columna_veintiseis;
                        boton_variable_nombre_columna_veintisiete = nombre_columna_veintisiete;
                        boton_variable_nombre_columna_veintiocho = nombre_columna_veintiocho;
                        boton_variable_nombre_columna_veintinueve = nombre_columna_veintinueve;
                        boton_variable_nombre_columna_treinta = nombre_columna_treinta;
                        boton_variable_nombre_columna_treintaiuno = nombre_columna_treintaiuno;
                    }
                }
                break;
            case 32:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        NSString *nombre_columna_veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                        NSString *nombre_columna_veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                        NSString *nombre_columna_veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                        NSString *nombre_columna_veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                        NSString *nombre_columna_treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                        NSString *nombre_columna_treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                        NSString *nombre_columna_treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                        boton_variable_nombre_columna_veintiseis = nombre_columna_veintiseis;
                        boton_variable_nombre_columna_veintisiete = nombre_columna_veintisiete;
                        boton_variable_nombre_columna_veintiocho = nombre_columna_veintiocho;
                        boton_variable_nombre_columna_veintinueve = nombre_columna_veintinueve;
                        boton_variable_nombre_columna_treinta = nombre_columna_treinta;
                        boton_variable_nombre_columna_treintaiuno = nombre_columna_treintaiuno;
                        boton_variable_nombre_columna_treintaidos = nombre_columna_treintaidos;
                    }
                }
                break;
            case 33:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        NSString *nombre_columna_veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                        NSString *nombre_columna_veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                        NSString *nombre_columna_veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                        NSString *nombre_columna_veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                        NSString *nombre_columna_treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                        NSString *nombre_columna_treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                        NSString *nombre_columna_treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                        NSString *nombre_columna_treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                        boton_variable_nombre_columna_veintiseis = nombre_columna_veintiseis;
                        boton_variable_nombre_columna_veintisiete = nombre_columna_veintisiete;
                        boton_variable_nombre_columna_veintiocho = nombre_columna_veintiocho;
                        boton_variable_nombre_columna_veintinueve = nombre_columna_veintinueve;
                        boton_variable_nombre_columna_treinta = nombre_columna_treinta;
                        boton_variable_nombre_columna_treintaiuno = nombre_columna_treintaiuno;
                        boton_variable_nombre_columna_treintaidos = nombre_columna_treintaidos;
                        boton_variable_nombre_columna_treintaitres = nombre_columna_treintaitres;
                    }
                }
                break;
            case 34:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        NSString *nombre_columna_veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                        NSString *nombre_columna_veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                        NSString *nombre_columna_veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                        NSString *nombre_columna_veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                        NSString *nombre_columna_treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                        NSString *nombre_columna_treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                        NSString *nombre_columna_treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                        NSString *nombre_columna_treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                        NSString *nombre_columna_treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                        boton_variable_nombre_columna_veintiseis = nombre_columna_veintiseis;
                        boton_variable_nombre_columna_veintisiete = nombre_columna_veintisiete;
                        boton_variable_nombre_columna_veintiocho = nombre_columna_veintiocho;
                        boton_variable_nombre_columna_veintinueve = nombre_columna_veintinueve;
                        boton_variable_nombre_columna_treinta = nombre_columna_treinta;
                        boton_variable_nombre_columna_treintaiuno = nombre_columna_treintaiuno;
                        boton_variable_nombre_columna_treintaidos = nombre_columna_treintaidos;
                        boton_variable_nombre_columna_treintaitres = nombre_columna_treintaitres;
                        boton_variable_nombre_columna_treintaicuatro = nombre_columna_treintaicuatro;
                    }
                }
                break;
            case 35:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        NSString *nombre_columna_veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                        NSString *nombre_columna_veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                        NSString *nombre_columna_veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                        NSString *nombre_columna_veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                        NSString *nombre_columna_treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                        NSString *nombre_columna_treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                        NSString *nombre_columna_treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                        NSString *nombre_columna_treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                        NSString *nombre_columna_treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                        NSString *nombre_columna_treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                        boton_variable_nombre_columna_veintiseis = nombre_columna_veintiseis;
                        boton_variable_nombre_columna_veintisiete = nombre_columna_veintisiete;
                        boton_variable_nombre_columna_veintiocho = nombre_columna_veintiocho;
                        boton_variable_nombre_columna_veintinueve = nombre_columna_veintinueve;
                        boton_variable_nombre_columna_treinta = nombre_columna_treinta;
                        boton_variable_nombre_columna_treintaiuno = nombre_columna_treintaiuno;
                        boton_variable_nombre_columna_treintaidos = nombre_columna_treintaidos;
                        boton_variable_nombre_columna_treintaitres = nombre_columna_treintaitres;
                        boton_variable_nombre_columna_treintaicuatro = nombre_columna_treintaicuatro;
                        boton_variable_nombre_columna_treintaicinco = nombre_columna_treintaicinco;
                    }
                }
                break;
            case 36:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        NSString *nombre_columna_veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                        NSString *nombre_columna_veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                        NSString *nombre_columna_veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                        NSString *nombre_columna_veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                        NSString *nombre_columna_treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                        NSString *nombre_columna_treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                        NSString *nombre_columna_treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                        NSString *nombre_columna_treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                        NSString *nombre_columna_treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                        NSString *nombre_columna_treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                        NSString *nombre_columna_treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                        boton_variable_nombre_columna_veintiseis = nombre_columna_veintiseis;
                        boton_variable_nombre_columna_veintisiete = nombre_columna_veintisiete;
                        boton_variable_nombre_columna_veintiocho = nombre_columna_veintiocho;
                        boton_variable_nombre_columna_veintinueve = nombre_columna_veintinueve;
                        boton_variable_nombre_columna_treinta = nombre_columna_treinta;
                        boton_variable_nombre_columna_treintaiuno = nombre_columna_treintaiuno;
                        boton_variable_nombre_columna_treintaidos = nombre_columna_treintaidos;
                        boton_variable_nombre_columna_treintaitres = nombre_columna_treintaitres;
                        boton_variable_nombre_columna_treintaicuatro = nombre_columna_treintaicuatro;
                        boton_variable_nombre_columna_treintaicinco = nombre_columna_treintaicinco;
                        boton_variable_nombre_columna_treintaiseis = nombre_columna_treintaiseis;
                    }
                }
                break;
            case 37:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        NSString *nombre_columna_veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                        NSString *nombre_columna_veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                        NSString *nombre_columna_veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                        NSString *nombre_columna_veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                        NSString *nombre_columna_treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                        NSString *nombre_columna_treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                        NSString *nombre_columna_treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                        NSString *nombre_columna_treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                        NSString *nombre_columna_treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                        NSString *nombre_columna_treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                        NSString *nombre_columna_treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                        NSString *nombre_columna_treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                        boton_variable_nombre_columna_veintiseis = nombre_columna_veintiseis;
                        boton_variable_nombre_columna_veintisiete = nombre_columna_veintisiete;
                        boton_variable_nombre_columna_veintiocho = nombre_columna_veintiocho;
                        boton_variable_nombre_columna_veintinueve = nombre_columna_veintinueve;
                        boton_variable_nombre_columna_treinta = nombre_columna_treinta;
                        boton_variable_nombre_columna_treintaiuno = nombre_columna_treintaiuno;
                        boton_variable_nombre_columna_treintaidos = nombre_columna_treintaidos;
                        boton_variable_nombre_columna_treintaitres = nombre_columna_treintaitres;
                        boton_variable_nombre_columna_treintaicuatro = nombre_columna_treintaicuatro;
                        boton_variable_nombre_columna_treintaicinco = nombre_columna_treintaicinco;
                        boton_variable_nombre_columna_treintaiseis = nombre_columna_treintaiseis;
                        boton_variable_nombre_columna_treintaisiete = nombre_columna_treintaisiete;
                    }
                }
                break;
            case 38:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        NSString *nombre_columna_veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                        NSString *nombre_columna_veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                        NSString *nombre_columna_veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                        NSString *nombre_columna_veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                        NSString *nombre_columna_treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                        NSString *nombre_columna_treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                        NSString *nombre_columna_treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                        NSString *nombre_columna_treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                        NSString *nombre_columna_treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                        NSString *nombre_columna_treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                        NSString *nombre_columna_treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                        NSString *nombre_columna_treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                        NSString *nombre_columna_treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                        boton_variable_nombre_columna_veintiseis = nombre_columna_veintiseis;
                        boton_variable_nombre_columna_veintisiete = nombre_columna_veintisiete;
                        boton_variable_nombre_columna_veintiocho = nombre_columna_veintiocho;
                        boton_variable_nombre_columna_veintinueve = nombre_columna_veintinueve;
                        boton_variable_nombre_columna_treinta = nombre_columna_treinta;
                        boton_variable_nombre_columna_treintaiuno = nombre_columna_treintaiuno;
                        boton_variable_nombre_columna_treintaidos = nombre_columna_treintaidos;
                        boton_variable_nombre_columna_treintaitres = nombre_columna_treintaitres;
                        boton_variable_nombre_columna_treintaicuatro = nombre_columna_treintaicuatro;
                        boton_variable_nombre_columna_treintaicinco = nombre_columna_treintaicinco;
                        boton_variable_nombre_columna_treintaiseis = nombre_columna_treintaiseis;
                        boton_variable_nombre_columna_treintaisiete = nombre_columna_treintaisiete;
                        boton_variable_nombre_columna_treintaiocho = nombre_columna_treintaiocho;
                    }
                }
                break;
            case 39:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        NSString *nombre_columna_veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                        NSString *nombre_columna_veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                        NSString *nombre_columna_veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                        NSString *nombre_columna_veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                        NSString *nombre_columna_treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                        NSString *nombre_columna_treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                        NSString *nombre_columna_treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                        NSString *nombre_columna_treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                        NSString *nombre_columna_treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                        NSString *nombre_columna_treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                        NSString *nombre_columna_treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                        NSString *nombre_columna_treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                        NSString *nombre_columna_treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                        NSString *nombre_columna_treintainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 39)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                        boton_variable_nombre_columna_veintiseis = nombre_columna_veintiseis;
                        boton_variable_nombre_columna_veintisiete = nombre_columna_veintisiete;
                        boton_variable_nombre_columna_veintiocho = nombre_columna_veintiocho;
                        boton_variable_nombre_columna_veintinueve = nombre_columna_veintinueve;
                        boton_variable_nombre_columna_treinta = nombre_columna_treinta;
                        boton_variable_nombre_columna_treintaiuno = nombre_columna_treintaiuno;
                        boton_variable_nombre_columna_treintaidos = nombre_columna_treintaidos;
                        boton_variable_nombre_columna_treintaitres = nombre_columna_treintaitres;
                        boton_variable_nombre_columna_treintaicuatro = nombre_columna_treintaicuatro;
                        boton_variable_nombre_columna_treintaicinco = nombre_columna_treintaicinco;
                        boton_variable_nombre_columna_treintaiseis = nombre_columna_treintaiseis;
                        boton_variable_nombre_columna_treintaisiete = nombre_columna_treintaisiete;
                        boton_variable_nombre_columna_treintaiocho = nombre_columna_treintaiocho;
                        boton_variable_nombre_columna_treintainueve = nombre_columna_treintainueve;
                    }
                }
                break;
            case 40:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        NSString *nombre_columna_veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                        NSString *nombre_columna_veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                        NSString *nombre_columna_veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                        NSString *nombre_columna_veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                        NSString *nombre_columna_treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                        NSString *nombre_columna_treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                        NSString *nombre_columna_treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                        NSString *nombre_columna_treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                        NSString *nombre_columna_treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                        NSString *nombre_columna_treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                        NSString *nombre_columna_treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                        NSString *nombre_columna_treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                        NSString *nombre_columna_treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                        NSString *nombre_columna_treintainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 39)];
                        NSString *nombre_columna_cuarenta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 40)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                        boton_variable_nombre_columna_veintiseis = nombre_columna_veintiseis;
                        boton_variable_nombre_columna_veintisiete = nombre_columna_veintisiete;
                        boton_variable_nombre_columna_veintiocho = nombre_columna_veintiocho;
                        boton_variable_nombre_columna_veintinueve = nombre_columna_veintinueve;
                        boton_variable_nombre_columna_treinta = nombre_columna_treinta;
                        boton_variable_nombre_columna_treintaiuno = nombre_columna_treintaiuno;
                        boton_variable_nombre_columna_treintaidos = nombre_columna_treintaidos;
                        boton_variable_nombre_columna_treintaitres = nombre_columna_treintaitres;
                        boton_variable_nombre_columna_treintaicuatro = nombre_columna_treintaicuatro;
                        boton_variable_nombre_columna_treintaicinco = nombre_columna_treintaicinco;
                        boton_variable_nombre_columna_treintaiseis = nombre_columna_treintaiseis;
                        boton_variable_nombre_columna_treintaisiete = nombre_columna_treintaisiete;
                        boton_variable_nombre_columna_treintaiocho = nombre_columna_treintaiocho;
                        boton_variable_nombre_columna_treintainueve = nombre_columna_treintainueve;
                        boton_variable_nombre_columna_cuarenta = nombre_columna_cuarenta;
                    }
                }
                break;
            case 41:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        NSString *nombre_columna_veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                        NSString *nombre_columna_veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                        NSString *nombre_columna_veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                        NSString *nombre_columna_veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                        NSString *nombre_columna_treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                        NSString *nombre_columna_treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                        NSString *nombre_columna_treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                        NSString *nombre_columna_treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                        NSString *nombre_columna_treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                        NSString *nombre_columna_treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                        NSString *nombre_columna_treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                        NSString *nombre_columna_treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                        NSString *nombre_columna_treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                        NSString *nombre_columna_treintainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 39)];
                        NSString *nombre_columna_cuarenta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 40)];
                        NSString *nombre_columna_cuarentaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 41)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                        boton_variable_nombre_columna_veintiseis = nombre_columna_veintiseis;
                        boton_variable_nombre_columna_veintisiete = nombre_columna_veintisiete;
                        boton_variable_nombre_columna_veintiocho = nombre_columna_veintiocho;
                        boton_variable_nombre_columna_veintinueve = nombre_columna_veintinueve;
                        boton_variable_nombre_columna_treinta = nombre_columna_treinta;
                        boton_variable_nombre_columna_treintaiuno = nombre_columna_treintaiuno;
                        boton_variable_nombre_columna_treintaidos = nombre_columna_treintaidos;
                        boton_variable_nombre_columna_treintaitres = nombre_columna_treintaitres;
                        boton_variable_nombre_columna_treintaicuatro = nombre_columna_treintaicuatro;
                        boton_variable_nombre_columna_treintaicinco = nombre_columna_treintaicinco;
                        boton_variable_nombre_columna_treintaiseis = nombre_columna_treintaiseis;
                        boton_variable_nombre_columna_treintaisiete = nombre_columna_treintaisiete;
                        boton_variable_nombre_columna_treintaiocho = nombre_columna_treintaiocho;
                        boton_variable_nombre_columna_treintainueve = nombre_columna_treintainueve;
                        boton_variable_nombre_columna_cuarenta = nombre_columna_cuarenta;
                        boton_variable_nombre_columna_cuarentaiuno = nombre_columna_cuarentaiuno;
                    }
                }
                break;
            case 42:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        NSString *nombre_columna_veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                        NSString *nombre_columna_veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                        NSString *nombre_columna_veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                        NSString *nombre_columna_veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                        NSString *nombre_columna_treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                        NSString *nombre_columna_treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                        NSString *nombre_columna_treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                        NSString *nombre_columna_treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                        NSString *nombre_columna_treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                        NSString *nombre_columna_treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                        NSString *nombre_columna_treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                        NSString *nombre_columna_treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                        NSString *nombre_columna_treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                        NSString *nombre_columna_treintainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 39)];
                        NSString *nombre_columna_cuarenta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 40)];
                        NSString *nombre_columna_cuarentaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 41)];
                        NSString *nombre_columna_cuarentaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 42)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                        boton_variable_nombre_columna_veintiseis = nombre_columna_veintiseis;
                        boton_variable_nombre_columna_veintisiete = nombre_columna_veintisiete;
                        boton_variable_nombre_columna_veintiocho = nombre_columna_veintiocho;
                        boton_variable_nombre_columna_veintinueve = nombre_columna_veintinueve;
                        boton_variable_nombre_columna_treinta = nombre_columna_treinta;
                        boton_variable_nombre_columna_treintaiuno = nombre_columna_treintaiuno;
                        boton_variable_nombre_columna_treintaidos = nombre_columna_treintaidos;
                        boton_variable_nombre_columna_treintaitres = nombre_columna_treintaitres;
                        boton_variable_nombre_columna_treintaicuatro = nombre_columna_treintaicuatro;
                        boton_variable_nombre_columna_treintaicinco = nombre_columna_treintaicinco;
                        boton_variable_nombre_columna_treintaiseis = nombre_columna_treintaiseis;
                        boton_variable_nombre_columna_treintaisiete = nombre_columna_treintaisiete;
                        boton_variable_nombre_columna_treintaiocho = nombre_columna_treintaiocho;
                        boton_variable_nombre_columna_treintainueve = nombre_columna_treintainueve;
                        boton_variable_nombre_columna_cuarenta = nombre_columna_cuarenta;
                        boton_variable_nombre_columna_cuarentaiuno = nombre_columna_cuarentaiuno;
                        boton_variable_nombre_columna_cuarentaidos = nombre_columna_cuarentaidos;
                    }
                }
                break;
            case 43:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        NSString *nombre_columna_veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                        NSString *nombre_columna_veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                        NSString *nombre_columna_veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                        NSString *nombre_columna_veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                        NSString *nombre_columna_treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                        NSString *nombre_columna_treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                        NSString *nombre_columna_treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                        NSString *nombre_columna_treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                        NSString *nombre_columna_treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                        NSString *nombre_columna_treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                        NSString *nombre_columna_treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                        NSString *nombre_columna_treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                        NSString *nombre_columna_treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                        NSString *nombre_columna_treintainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 39)];
                        NSString *nombre_columna_cuarenta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 40)];
                        NSString *nombre_columna_cuarentaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 41)];
                        NSString *nombre_columna_cuarentaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 42)];
                        NSString *nombre_columna_cuarentaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 43)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                        boton_variable_nombre_columna_veintiseis = nombre_columna_veintiseis;
                        boton_variable_nombre_columna_veintisiete = nombre_columna_veintisiete;
                        boton_variable_nombre_columna_veintiocho = nombre_columna_veintiocho;
                        boton_variable_nombre_columna_veintinueve = nombre_columna_veintinueve;
                        boton_variable_nombre_columna_treinta = nombre_columna_treinta;
                        boton_variable_nombre_columna_treintaiuno = nombre_columna_treintaiuno;
                        boton_variable_nombre_columna_treintaidos = nombre_columna_treintaidos;
                        boton_variable_nombre_columna_treintaitres = nombre_columna_treintaitres;
                        boton_variable_nombre_columna_treintaicuatro = nombre_columna_treintaicuatro;
                        boton_variable_nombre_columna_treintaicinco = nombre_columna_treintaicinco;
                        boton_variable_nombre_columna_treintaiseis = nombre_columna_treintaiseis;
                        boton_variable_nombre_columna_treintaisiete = nombre_columna_treintaisiete;
                        boton_variable_nombre_columna_treintaiocho = nombre_columna_treintaiocho;
                        boton_variable_nombre_columna_treintainueve = nombre_columna_treintainueve;
                        boton_variable_nombre_columna_cuarenta = nombre_columna_cuarenta;
                        boton_variable_nombre_columna_cuarentaiuno = nombre_columna_cuarentaiuno;
                        boton_variable_nombre_columna_cuarentaidos = nombre_columna_cuarentaidos;
                        boton_variable_nombre_columna_cuarentaitres = nombre_columna_cuarentaitres;
                    }
                }
                break;
            case 44:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        NSString *nombre_columna_veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                        NSString *nombre_columna_veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                        NSString *nombre_columna_veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                        NSString *nombre_columna_veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                        NSString *nombre_columna_treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                        NSString *nombre_columna_treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                        NSString *nombre_columna_treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                        NSString *nombre_columna_treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                        NSString *nombre_columna_treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                        NSString *nombre_columna_treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                        NSString *nombre_columna_treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                        NSString *nombre_columna_treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                        NSString *nombre_columna_treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                        NSString *nombre_columna_treintainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 39)];
                        NSString *nombre_columna_cuarenta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 40)];
                        NSString *nombre_columna_cuarentaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 41)];
                        NSString *nombre_columna_cuarentaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 42)];
                        NSString *nombre_columna_cuarentaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 43)];
                        NSString *nombre_columna_cuarentaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 44)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                        boton_variable_nombre_columna_veintiseis = nombre_columna_veintiseis;
                        boton_variable_nombre_columna_veintisiete = nombre_columna_veintisiete;
                        boton_variable_nombre_columna_veintiocho = nombre_columna_veintiocho;
                        boton_variable_nombre_columna_veintinueve = nombre_columna_veintinueve;
                        boton_variable_nombre_columna_treinta = nombre_columna_treinta;
                        boton_variable_nombre_columna_treintaiuno = nombre_columna_treintaiuno;
                        boton_variable_nombre_columna_treintaidos = nombre_columna_treintaidos;
                        boton_variable_nombre_columna_treintaitres = nombre_columna_treintaitres;
                        boton_variable_nombre_columna_treintaicuatro = nombre_columna_treintaicuatro;
                        boton_variable_nombre_columna_treintaicinco = nombre_columna_treintaicinco;
                        boton_variable_nombre_columna_treintaiseis = nombre_columna_treintaiseis;
                        boton_variable_nombre_columna_treintaisiete = nombre_columna_treintaisiete;
                        boton_variable_nombre_columna_treintaiocho = nombre_columna_treintaiocho;
                        boton_variable_nombre_columna_treintainueve = nombre_columna_treintainueve;
                        boton_variable_nombre_columna_cuarenta = nombre_columna_cuarenta;
                        boton_variable_nombre_columna_cuarentaiuno = nombre_columna_cuarentaiuno;
                        boton_variable_nombre_columna_cuarentaidos = nombre_columna_cuarentaidos;
                        boton_variable_nombre_columna_cuarentaitres = nombre_columna_cuarentaitres;
                        boton_variable_nombre_columna_cuarentaicuatro = nombre_columna_cuarentaicuatro;
                    }
                }
                break;
            case 45:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        NSString *nombre_columna_veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                        NSString *nombre_columna_veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                        NSString *nombre_columna_veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                        NSString *nombre_columna_veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                        NSString *nombre_columna_treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                        NSString *nombre_columna_treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                        NSString *nombre_columna_treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                        NSString *nombre_columna_treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                        NSString *nombre_columna_treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                        NSString *nombre_columna_treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                        NSString *nombre_columna_treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                        NSString *nombre_columna_treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                        NSString *nombre_columna_treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                        NSString *nombre_columna_treintainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 39)];
                        NSString *nombre_columna_cuarenta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 40)];
                        NSString *nombre_columna_cuarentaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 41)];
                        NSString *nombre_columna_cuarentaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 42)];
                        NSString *nombre_columna_cuarentaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 43)];
                        NSString *nombre_columna_cuarentaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 44)];
                        NSString *nombre_columna_cuarentaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 45)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                        boton_variable_nombre_columna_veintiseis = nombre_columna_veintiseis;
                        boton_variable_nombre_columna_veintisiete = nombre_columna_veintisiete;
                        boton_variable_nombre_columna_veintiocho = nombre_columna_veintiocho;
                        boton_variable_nombre_columna_veintinueve = nombre_columna_veintinueve;
                        boton_variable_nombre_columna_treinta = nombre_columna_treinta;
                        boton_variable_nombre_columna_treintaiuno = nombre_columna_treintaiuno;
                        boton_variable_nombre_columna_treintaidos = nombre_columna_treintaidos;
                        boton_variable_nombre_columna_treintaitres = nombre_columna_treintaitres;
                        boton_variable_nombre_columna_treintaicuatro = nombre_columna_treintaicuatro;
                        boton_variable_nombre_columna_treintaicinco = nombre_columna_treintaicinco;
                        boton_variable_nombre_columna_treintaiseis = nombre_columna_treintaiseis;
                        boton_variable_nombre_columna_treintaisiete = nombre_columna_treintaisiete;
                        boton_variable_nombre_columna_treintaiocho = nombre_columna_treintaiocho;
                        boton_variable_nombre_columna_treintainueve = nombre_columna_treintainueve;
                        boton_variable_nombre_columna_cuarenta = nombre_columna_cuarenta;
                        boton_variable_nombre_columna_cuarentaiuno = nombre_columna_cuarentaiuno;
                        boton_variable_nombre_columna_cuarentaidos = nombre_columna_cuarentaidos;
                        boton_variable_nombre_columna_cuarentaitres = nombre_columna_cuarentaitres;
                        boton_variable_nombre_columna_cuarentaicuatro = nombre_columna_cuarentaicuatro;
                        boton_variable_nombre_columna_cuarentaicinco = nombre_columna_cuarentaicinco;
                    }
                }
                break;
            case 46:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        NSString *nombre_columna_veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                        NSString *nombre_columna_veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                        NSString *nombre_columna_veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                        NSString *nombre_columna_veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                        NSString *nombre_columna_treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                        NSString *nombre_columna_treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                        NSString *nombre_columna_treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                        NSString *nombre_columna_treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                        NSString *nombre_columna_treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                        NSString *nombre_columna_treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                        NSString *nombre_columna_treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                        NSString *nombre_columna_treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                        NSString *nombre_columna_treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                        NSString *nombre_columna_treintainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 39)];
                        NSString *nombre_columna_cuarenta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 40)];
                        NSString *nombre_columna_cuarentaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 41)];
                        NSString *nombre_columna_cuarentaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 42)];
                        NSString *nombre_columna_cuarentaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 43)];
                        NSString *nombre_columna_cuarentaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 44)];
                        NSString *nombre_columna_cuarentaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 45)];
                        NSString *nombre_columna_cuarentaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 46)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                        boton_variable_nombre_columna_veintiseis = nombre_columna_veintiseis;
                        boton_variable_nombre_columna_veintisiete = nombre_columna_veintisiete;
                        boton_variable_nombre_columna_veintiocho = nombre_columna_veintiocho;
                        boton_variable_nombre_columna_veintinueve = nombre_columna_veintinueve;
                        boton_variable_nombre_columna_treinta = nombre_columna_treinta;
                        boton_variable_nombre_columna_treintaiuno = nombre_columna_treintaiuno;
                        boton_variable_nombre_columna_treintaidos = nombre_columna_treintaidos;
                        boton_variable_nombre_columna_treintaitres = nombre_columna_treintaitres;
                        boton_variable_nombre_columna_treintaicuatro = nombre_columna_treintaicuatro;
                        boton_variable_nombre_columna_treintaicinco = nombre_columna_treintaicinco;
                        boton_variable_nombre_columna_treintaiseis = nombre_columna_treintaiseis;
                        boton_variable_nombre_columna_treintaisiete = nombre_columna_treintaisiete;
                        boton_variable_nombre_columna_treintaiocho = nombre_columna_treintaiocho;
                        boton_variable_nombre_columna_treintainueve = nombre_columna_treintainueve;
                        boton_variable_nombre_columna_cuarenta = nombre_columna_cuarenta;
                        boton_variable_nombre_columna_cuarentaiuno = nombre_columna_cuarentaiuno;
                        boton_variable_nombre_columna_cuarentaidos = nombre_columna_cuarentaidos;
                        boton_variable_nombre_columna_cuarentaitres = nombre_columna_cuarentaitres;
                        boton_variable_nombre_columna_cuarentaicuatro = nombre_columna_cuarentaicuatro;
                        boton_variable_nombre_columna_cuarentaicinco = nombre_columna_cuarentaicinco;
                        boton_variable_nombre_columna_cuarentaiseis = nombre_columna_cuarentaiseis;
                    }
                }
                break;
            case 47:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        NSString *nombre_columna_veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                        NSString *nombre_columna_veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                        NSString *nombre_columna_veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                        NSString *nombre_columna_veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                        NSString *nombre_columna_treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                        NSString *nombre_columna_treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                        NSString *nombre_columna_treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                        NSString *nombre_columna_treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                        NSString *nombre_columna_treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                        NSString *nombre_columna_treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                        NSString *nombre_columna_treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                        NSString *nombre_columna_treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                        NSString *nombre_columna_treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                        NSString *nombre_columna_treintainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 39)];
                        NSString *nombre_columna_cuarenta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 40)];
                        NSString *nombre_columna_cuarentaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 41)];
                        NSString *nombre_columna_cuarentaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 42)];
                        NSString *nombre_columna_cuarentaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 43)];
                        NSString *nombre_columna_cuarentaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 44)];
                        NSString *nombre_columna_cuarentaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 45)];
                        NSString *nombre_columna_cuarentaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 46)];
                        NSString *nombre_columna_cuarentaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 47)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                        boton_variable_nombre_columna_veintiseis = nombre_columna_veintiseis;
                        boton_variable_nombre_columna_veintisiete = nombre_columna_veintisiete;
                        boton_variable_nombre_columna_veintiocho = nombre_columna_veintiocho;
                        boton_variable_nombre_columna_veintinueve = nombre_columna_veintinueve;
                        boton_variable_nombre_columna_treinta = nombre_columna_treinta;
                        boton_variable_nombre_columna_treintaiuno = nombre_columna_treintaiuno;
                        boton_variable_nombre_columna_treintaidos = nombre_columna_treintaidos;
                        boton_variable_nombre_columna_treintaitres = nombre_columna_treintaitres;
                        boton_variable_nombre_columna_treintaicuatro = nombre_columna_treintaicuatro;
                        boton_variable_nombre_columna_treintaicinco = nombre_columna_treintaicinco;
                        boton_variable_nombre_columna_treintaiseis = nombre_columna_treintaiseis;
                        boton_variable_nombre_columna_treintaisiete = nombre_columna_treintaisiete;
                        boton_variable_nombre_columna_treintaiocho = nombre_columna_treintaiocho;
                        boton_variable_nombre_columna_treintainueve = nombre_columna_treintainueve;
                        boton_variable_nombre_columna_cuarenta = nombre_columna_cuarenta;
                        boton_variable_nombre_columna_cuarentaiuno = nombre_columna_cuarentaiuno;
                        boton_variable_nombre_columna_cuarentaidos = nombre_columna_cuarentaidos;
                        boton_variable_nombre_columna_cuarentaitres = nombre_columna_cuarentaitres;
                        boton_variable_nombre_columna_cuarentaicuatro = nombre_columna_cuarentaicuatro;
                        boton_variable_nombre_columna_cuarentaicinco = nombre_columna_cuarentaicinco;
                        boton_variable_nombre_columna_cuarentaiseis = nombre_columna_cuarentaiseis;
                        boton_variable_nombre_columna_cuarentaisiete = nombre_columna_cuarentaisiete;
                        
                    }
                }
                break;
            case 48:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        NSString *nombre_columna_veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                        NSString *nombre_columna_veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                        NSString *nombre_columna_veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                        NSString *nombre_columna_veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                        NSString *nombre_columna_treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                        NSString *nombre_columna_treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                        NSString *nombre_columna_treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                        NSString *nombre_columna_treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                        NSString *nombre_columna_treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                        NSString *nombre_columna_treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                        NSString *nombre_columna_treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                        NSString *nombre_columna_treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                        NSString *nombre_columna_treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                        NSString *nombre_columna_treintainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 39)];
                        NSString *nombre_columna_cuarenta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 40)];
                        NSString *nombre_columna_cuarentaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 41)];
                        NSString *nombre_columna_cuarentaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 42)];
                        NSString *nombre_columna_cuarentaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 43)];
                        NSString *nombre_columna_cuarentaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 44)];
                        NSString *nombre_columna_cuarentaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 45)];
                        NSString *nombre_columna_cuarentaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 46)];
                        NSString *nombre_columna_cuarentaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 47)];
                        NSString *nombre_columna_cuarentaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 48)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                        boton_variable_nombre_columna_veintiseis = nombre_columna_veintiseis;
                        boton_variable_nombre_columna_veintisiete = nombre_columna_veintisiete;
                        boton_variable_nombre_columna_veintiocho = nombre_columna_veintiocho;
                        boton_variable_nombre_columna_veintinueve = nombre_columna_veintinueve;
                        boton_variable_nombre_columna_treinta = nombre_columna_treinta;
                        boton_variable_nombre_columna_treintaiuno = nombre_columna_treintaiuno;
                        boton_variable_nombre_columna_treintaidos = nombre_columna_treintaidos;
                        boton_variable_nombre_columna_treintaitres = nombre_columna_treintaitres;
                        boton_variable_nombre_columna_treintaicuatro = nombre_columna_treintaicuatro;
                        boton_variable_nombre_columna_treintaicinco = nombre_columna_treintaicinco;
                        boton_variable_nombre_columna_treintaiseis = nombre_columna_treintaiseis;
                        boton_variable_nombre_columna_treintaisiete = nombre_columna_treintaisiete;
                        boton_variable_nombre_columna_treintaiocho = nombre_columna_treintaiocho;
                        boton_variable_nombre_columna_treintainueve = nombre_columna_treintainueve;
                        boton_variable_nombre_columna_cuarenta = nombre_columna_cuarenta;
                        boton_variable_nombre_columna_cuarentaiuno = nombre_columna_cuarentaiuno;
                        boton_variable_nombre_columna_cuarentaidos = nombre_columna_cuarentaidos;
                        boton_variable_nombre_columna_cuarentaitres = nombre_columna_cuarentaitres;
                        boton_variable_nombre_columna_cuarentaicuatro = nombre_columna_cuarentaicuatro;
                        boton_variable_nombre_columna_cuarentaicinco = nombre_columna_cuarentaicinco;
                        boton_variable_nombre_columna_cuarentaiseis = nombre_columna_cuarentaiseis;
                        boton_variable_nombre_columna_cuarentaisiete = nombre_columna_cuarentaisiete;
                        boton_variable_nombre_columna_cuarentaiocho = nombre_columna_cuarentaiocho;
                    }
                }
                break;
            case 49:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        NSString *nombre_columna_veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                        NSString *nombre_columna_veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                        NSString *nombre_columna_veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                        NSString *nombre_columna_veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                        NSString *nombre_columna_treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                        NSString *nombre_columna_treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                        NSString *nombre_columna_treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                        NSString *nombre_columna_treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                        NSString *nombre_columna_treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                        NSString *nombre_columna_treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                        NSString *nombre_columna_treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                        NSString *nombre_columna_treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                        NSString *nombre_columna_treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                        NSString *nombre_columna_treintainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 39)];
                        NSString *nombre_columna_cuarenta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 40)];
                        NSString *nombre_columna_cuarentaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 41)];
                        NSString *nombre_columna_cuarentaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 42)];
                        NSString *nombre_columna_cuarentaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 43)];
                        NSString *nombre_columna_cuarentaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 44)];
                        NSString *nombre_columna_cuarentaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 45)];
                        NSString *nombre_columna_cuarentaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 46)];
                        NSString *nombre_columna_cuarentaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 47)];
                        NSString *nombre_columna_cuarentaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 48)];
                        NSString *nombre_columna_cuarentainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 49)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                        boton_variable_nombre_columna_veintiseis = nombre_columna_veintiseis;
                        boton_variable_nombre_columna_veintisiete = nombre_columna_veintisiete;
                        boton_variable_nombre_columna_veintiocho = nombre_columna_veintiocho;
                        boton_variable_nombre_columna_veintinueve = nombre_columna_veintinueve;
                        boton_variable_nombre_columna_treinta = nombre_columna_treinta;
                        boton_variable_nombre_columna_treintaiuno = nombre_columna_treintaiuno;
                        boton_variable_nombre_columna_treintaidos = nombre_columna_treintaidos;
                        boton_variable_nombre_columna_treintaitres = nombre_columna_treintaitres;
                        boton_variable_nombre_columna_treintaicuatro = nombre_columna_treintaicuatro;
                        boton_variable_nombre_columna_treintaicinco = nombre_columna_treintaicinco;
                        boton_variable_nombre_columna_treintaiseis = nombre_columna_treintaiseis;
                        boton_variable_nombre_columna_treintaisiete = nombre_columna_treintaisiete;
                        boton_variable_nombre_columna_treintaiocho = nombre_columna_treintaiocho;
                        boton_variable_nombre_columna_treintainueve = nombre_columna_treintainueve;
                        boton_variable_nombre_columna_cuarenta = nombre_columna_cuarenta;
                        boton_variable_nombre_columna_cuarentaiuno = nombre_columna_cuarentaiuno;
                        boton_variable_nombre_columna_cuarentaidos = nombre_columna_cuarentaidos;
                        boton_variable_nombre_columna_cuarentaitres = nombre_columna_cuarentaitres;
                        boton_variable_nombre_columna_cuarentaicuatro = nombre_columna_cuarentaicuatro;
                        boton_variable_nombre_columna_cuarentaicinco = nombre_columna_cuarentaicinco;
                        boton_variable_nombre_columna_cuarentaiseis = nombre_columna_cuarentaiseis;
                        boton_variable_nombre_columna_cuarentaisiete = nombre_columna_cuarentaisiete;
                        boton_variable_nombre_columna_cuarentaiocho = nombre_columna_cuarentaiocho;
                        boton_variable_nombre_columna_cuarentainueve = nombre_columna_cuarentainueve;
                    }
                }
                break;
            case 50:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        // NOMBRES DE COLUMNAS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        NSString *nombre_columna_tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                        NSString *nombre_columna_cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                        NSString *nombre_columna_cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                        NSString *nombre_columna_seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                        NSString *nombre_columna_siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                        NSString *nombre_columna_ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                        NSString *nombre_columna_nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                        NSString *nombre_columna_diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                        NSString *nombre_columna_once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                        NSString *nombre_columna_doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                        NSString *nombre_columna_trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                        NSString *nombre_columna_catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                        NSString *nombre_columna_quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                        NSString *nombre_columna_dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                        NSString *nombre_columna_diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                        NSString *nombre_columna_dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                        NSString *nombre_columna_diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                        NSString *nombre_columna_veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                        NSString *nombre_columna_veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                        NSString *nombre_columna_veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                        NSString *nombre_columna_veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                        NSString *nombre_columna_veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                        NSString *nombre_columna_veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                        NSString *nombre_columna_veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                        NSString *nombre_columna_veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                        NSString *nombre_columna_veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                        NSString *nombre_columna_veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                        NSString *nombre_columna_treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                        NSString *nombre_columna_treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                        NSString *nombre_columna_treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                        NSString *nombre_columna_treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                        NSString *nombre_columna_treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                        NSString *nombre_columna_treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                        NSString *nombre_columna_treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                        NSString *nombre_columna_treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                        NSString *nombre_columna_treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                        NSString *nombre_columna_treintainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 39)];
                        NSString *nombre_columna_cuarenta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 40)];
                        NSString *nombre_columna_cuarentaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 41)];
                        NSString *nombre_columna_cuarentaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 42)];
                        NSString *nombre_columna_cuarentaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 43)];
                        NSString *nombre_columna_cuarentaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 44)];
                        NSString *nombre_columna_cuarentaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 45)];
                        NSString *nombre_columna_cuarentaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 46)];
                        NSString *nombre_columna_cuarentaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 47)];
                        NSString *nombre_columna_cuarentaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 48)];
                        NSString *nombre_columna_cuarentainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 49)];
                        NSString *nombre_columna_cincuenta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 50)];
                        boton_variable_nombre_columna_uno = nombre_columna_uno;
                        boton_variable_nombre_columna_dos = nombre_columna_dos;
                        boton_variable_nombre_columna_tres = nombre_columna_tres;
                        boton_variable_nombre_columna_cuatro = nombre_columna_cuatro;
                        boton_variable_nombre_columna_cinco = nombre_columna_cinco;
                        boton_variable_nombre_columna_seis = nombre_columna_seis;
                        boton_variable_nombre_columna_siete = nombre_columna_siete;
                        boton_variable_nombre_columna_ocho = nombre_columna_ocho;
                        boton_variable_nombre_columna_nueve = nombre_columna_nueve;
                        boton_variable_nombre_columna_diez = nombre_columna_diez;
                        boton_variable_nombre_columna_once = nombre_columna_once;
                        boton_variable_nombre_columna_doce = nombre_columna_doce;
                        boton_variable_nombre_columna_trece = nombre_columna_trece;
                        boton_variable_nombre_columna_catorce = nombre_columna_catorce;
                        boton_variable_nombre_columna_quince = nombre_columna_quince;
                        boton_variable_nombre_columna_dieciseis = nombre_columna_dieciseis;
                        boton_variable_nombre_columna_diecisiete = nombre_columna_diecisiete;
                        boton_variable_nombre_columna_dieciocho = nombre_columna_dieciocho;
                        boton_variable_nombre_columna_diecinueve = nombre_columna_diecinueve;
                        boton_variable_nombre_columna_veinte = nombre_columna_veinte;
                        boton_variable_nombre_columna_veintiuno = nombre_columna_veintiuno;
                        boton_variable_nombre_columna_veintidos = nombre_columna_veintidos;
                        boton_variable_nombre_columna_veintitres = nombre_columna_veintitres;
                        boton_variable_nombre_columna_veinticuatro = nombre_columna_veinticuatro;
                        boton_variable_nombre_columna_veinticinco = nombre_columna_veinticinco;
                        boton_variable_nombre_columna_veintiseis = nombre_columna_veintiseis;
                        boton_variable_nombre_columna_veintisiete = nombre_columna_veintisiete;
                        boton_variable_nombre_columna_veintiocho = nombre_columna_veintiocho;
                        boton_variable_nombre_columna_veintinueve = nombre_columna_veintinueve;
                        boton_variable_nombre_columna_treinta = nombre_columna_treinta;
                        boton_variable_nombre_columna_treintaiuno = nombre_columna_treintaiuno;
                        boton_variable_nombre_columna_treintaidos = nombre_columna_treintaidos;
                        boton_variable_nombre_columna_treintaitres = nombre_columna_treintaitres;
                        boton_variable_nombre_columna_treintaicuatro = nombre_columna_treintaicuatro;
                        boton_variable_nombre_columna_treintaicinco = nombre_columna_treintaicinco;
                        boton_variable_nombre_columna_treintaiseis = nombre_columna_treintaiseis;
                        boton_variable_nombre_columna_treintaisiete = nombre_columna_treintaisiete;
                        boton_variable_nombre_columna_treintaiocho = nombre_columna_treintaiocho;
                        boton_variable_nombre_columna_treintainueve = nombre_columna_treintainueve;
                        boton_variable_nombre_columna_cuarenta = nombre_columna_cuarenta;
                        boton_variable_nombre_columna_cuarentaiuno = nombre_columna_cuarentaiuno;
                        boton_variable_nombre_columna_cuarentaidos = nombre_columna_cuarentaidos;
                        boton_variable_nombre_columna_cuarentaitres = nombre_columna_cuarentaitres;
                        boton_variable_nombre_columna_cuarentaicuatro = nombre_columna_cuarentaicuatro;
                        boton_variable_nombre_columna_cuarentaicinco = nombre_columna_cuarentaicinco;
                        boton_variable_nombre_columna_cuarentaiseis = nombre_columna_cuarentaiseis;
                        boton_variable_nombre_columna_cuarentaisiete = nombre_columna_cuarentaisiete;
                        boton_variable_nombre_columna_cuarentaiocho = nombre_columna_cuarentaiocho;
                        boton_variable_nombre_columna_cuarentainueve = nombre_columna_cuarentainueve;
                        boton_variable_nombre_columna_cincuenta = nombre_columna_cincuenta;
                        
                    }
                }
                break;
                
            default:
                break;
        }
    }
}


// EN TODOS ESTOS METODOS TENEMOS LOS "SHOW" DE LOS LABELS Y TEXTFIELDS, DEPENDIENDO DE CUANTOS SON, EN LA FUNCION "DIDFINISHLOADINGCONNECTION" SE
// HACE UN SWITCH PARA VER CUANTOS SE MUESTRAN DEPENDIENDO DE CUANTAS COLUMNAS TENGA EL PROYECTO CON EL QUE ESTAMOS TRABAJANDO
-(void)showUNO{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
}

-(void)showDOS{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
}

-(void)showTRES{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
}

-(void)showCUATRO{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
}

-(void)showCINCO{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
}


-(void)showSEIS{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
}

-(void)showSIETE{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
}

-(void)showOCHO{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
}

-(void)showNUEVE{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
}

-(void)showDIEZ{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
}


-(void)showONCE{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
}

-(void)showDOCE{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
}

-(void)showTRECE{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
}

-(void)showCATORCE{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
}

-(void)showQUINCE{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
}

-(void)showDIECISEIS{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
}

-(void)showDIECISIETE{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    
}

-(void)showDIECIOCHO{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
}

-(void)showDIECINUEVE{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
}


-(void)showVEINTE{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
}


-(void)showVEINTIUNO{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
}



-(void)showVEINTIDOS{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
}


-(void)showVEINTITRES{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
}


-(void)showVEINTICUATRO{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
}


-(void)showVEINTICINCO{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
}


-(void)showVEINTISEIS{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
    _label_columna_veintiseis.hidden = NO;
    _textfield_columna_veintiseis.hidden = NO;
}


-(void)showVEINTISIETE{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
    _label_columna_veintiseis.hidden = NO;
    _textfield_columna_veintiseis.hidden = NO;
    _label_columna_veintisiete.hidden = NO;
    _textfield_columna_veintisiete.hidden = NO;
}


-(void)showVEINTIOCHO{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
    _label_columna_veintiseis.hidden = NO;
    _textfield_columna_veintiseis.hidden = NO;
    _label_columna_veintisiete.hidden = NO;
    _textfield_columna_veintisiete.hidden = NO;
    _label_columna_veintiocho.hidden = NO;
    _textfield_columna_veintiocho.hidden = NO;
}



-(void)showVEINTINUEVE{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
    _label_columna_veintiseis.hidden = NO;
    _textfield_columna_veintiseis.hidden = NO;
    _label_columna_veintisiete.hidden = NO;
    _textfield_columna_veintisiete.hidden = NO;
    _label_columna_veintiocho.hidden = NO;
    _textfield_columna_veintiocho.hidden = NO;
    _label_columna_veintinueve.hidden = NO;
    _textfield_columna_veintinueve.hidden = NO;
}


-(void)showTREINTA{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
    _label_columna_veintiseis.hidden = NO;
    _textfield_columna_veintiseis.hidden = NO;
    _label_columna_veintisiete.hidden = NO;
    _textfield_columna_veintisiete.hidden = NO;
    _label_columna_veintiocho.hidden = NO;
    _textfield_columna_veintiocho.hidden = NO;
    _label_columna_veintinueve.hidden = NO;
    _textfield_columna_veintinueve.hidden = NO;
    _label_columna_treinta.hidden = NO;
    _textfield_columna_treinta.hidden = NO;
}


-(void)showTREINTAIUNO{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
    _label_columna_veintiseis.hidden = NO;
    _textfield_columna_veintiseis.hidden = NO;
    _label_columna_veintisiete.hidden = NO;
    _textfield_columna_veintisiete.hidden = NO;
    _label_columna_veintiocho.hidden = NO;
    _textfield_columna_veintiocho.hidden = NO;
    _label_columna_veintinueve.hidden = NO;
    _textfield_columna_veintinueve.hidden = NO;
    _label_columna_treinta.hidden = NO;
    _textfield_columna_treinta.hidden = NO;
    _label_columna_treintaiuno.hidden = NO;
    _textfield_columna_treintaiuno.hidden = NO;
}


-(void)showTREINTAIDOS{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
    _label_columna_veintiseis.hidden = NO;
    _textfield_columna_veintiseis.hidden = NO;
    _label_columna_veintisiete.hidden = NO;
    _textfield_columna_veintisiete.hidden = NO;
    _label_columna_veintiocho.hidden = NO;
    _textfield_columna_veintiocho.hidden = NO;
    _label_columna_veintinueve.hidden = NO;
    _textfield_columna_veintinueve.hidden = NO;
    _label_columna_treinta.hidden = NO;
    _textfield_columna_treinta.hidden = NO;
    _label_columna_treintaiuno.hidden = NO;
    _textfield_columna_treintaiuno.hidden = NO;
    _label_columna_treintaidos.hidden = NO;
    _textfield_columna_treintaidos.hidden = NO;
}


-(void)showTREINTAITRES{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
    _label_columna_veintiseis.hidden = NO;
    _textfield_columna_veintiseis.hidden = NO;
    _label_columna_veintisiete.hidden = NO;
    _textfield_columna_veintisiete.hidden = NO;
    _label_columna_veintiocho.hidden = NO;
    _textfield_columna_veintiocho.hidden = NO;
    _label_columna_veintinueve.hidden = NO;
    _textfield_columna_veintinueve.hidden = NO;
    _label_columna_treinta.hidden = NO;
    _textfield_columna_treinta.hidden = NO;
    _label_columna_treintaiuno.hidden = NO;
    _textfield_columna_treintaiuno.hidden = NO;
    _label_columna_treintaidos.hidden = NO;
    _textfield_columna_treintaidos.hidden = NO;
    _label_columna_treintaitres.hidden = NO;
    _textfield_columna_treintaitres.hidden = NO;
}

-(void)showTREINTAICUATRO{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
    _label_columna_veintiseis.hidden = NO;
    _textfield_columna_veintiseis.hidden = NO;
    _label_columna_veintisiete.hidden = NO;
    _textfield_columna_veintisiete.hidden = NO;
    _label_columna_veintiocho.hidden = NO;
    _textfield_columna_veintiocho.hidden = NO;
    _label_columna_veintinueve.hidden = NO;
    _textfield_columna_veintinueve.hidden = NO;
    _label_columna_treinta.hidden = NO;
    _textfield_columna_treinta.hidden = NO;
    _label_columna_treintaiuno.hidden = NO;
    _textfield_columna_treintaiuno.hidden = NO;
    _label_columna_treintaidos.hidden = NO;
    _textfield_columna_treintaidos.hidden = NO;
    _label_columna_treintaitres.hidden = NO;
    _textfield_columna_treintaitres.hidden = NO;
    _label_columna_treintaicuatro.hidden = NO;
    _textfield_columna_treintaicuatro.hidden = NO;
}


-(void)showTREINTAICINCO{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
    _label_columna_veintiseis.hidden = NO;
    _textfield_columna_veintiseis.hidden = NO;
    _label_columna_veintisiete.hidden = NO;
    _textfield_columna_veintisiete.hidden = NO;
    _label_columna_veintiocho.hidden = NO;
    _textfield_columna_veintiocho.hidden = NO;
    _label_columna_veintinueve.hidden = NO;
    _textfield_columna_veintinueve.hidden = NO;
    _label_columna_treinta.hidden = NO;
    _textfield_columna_treinta.hidden = NO;
    _label_columna_treintaiuno.hidden = NO;
    _textfield_columna_treintaiuno.hidden = NO;
    _label_columna_treintaidos.hidden = NO;
    _textfield_columna_treintaidos.hidden = NO;
    _label_columna_treintaitres.hidden = NO;
    _textfield_columna_treintaitres.hidden = NO;
    _label_columna_treintaicuatro.hidden = NO;
    _textfield_columna_treintaicuatro.hidden = NO;
    _label_columna_treintaicinco.hidden = NO;
    _textfield_columna_treintaicinco.hidden = NO;
}


-(void)showTREINTAISEIS{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
    _label_columna_veintiseis.hidden = NO;
    _textfield_columna_veintiseis.hidden = NO;
    _label_columna_veintisiete.hidden = NO;
    _textfield_columna_veintisiete.hidden = NO;
    _label_columna_veintiocho.hidden = NO;
    _textfield_columna_veintiocho.hidden = NO;
    _label_columna_veintinueve.hidden = NO;
    _textfield_columna_veintinueve.hidden = NO;
    _label_columna_treinta.hidden = NO;
    _textfield_columna_treinta.hidden = NO;
    _label_columna_treintaiuno.hidden = NO;
    _textfield_columna_treintaiuno.hidden = NO;
    _label_columna_treintaidos.hidden = NO;
    _textfield_columna_treintaidos.hidden = NO;
    _label_columna_treintaitres.hidden = NO;
    _textfield_columna_treintaitres.hidden = NO;
    _label_columna_treintaicuatro.hidden = NO;
    _textfield_columna_treintaicuatro.hidden = NO;
    _label_columna_treintaicinco.hidden = NO;
    _textfield_columna_treintaicinco.hidden = NO;
    _label_columna_treintaiseis.hidden = NO;
    _textfield_columna_treintaiseis.hidden = NO;
}


-(void)showTREINTAISIETE{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
    _label_columna_veintiseis.hidden = NO;
    _textfield_columna_veintiseis.hidden = NO;
    _label_columna_veintisiete.hidden = NO;
    _textfield_columna_veintisiete.hidden = NO;
    _label_columna_veintiocho.hidden = NO;
    _textfield_columna_veintiocho.hidden = NO;
    _label_columna_veintinueve.hidden = NO;
    _textfield_columna_veintinueve.hidden = NO;
    _label_columna_treinta.hidden = NO;
    _textfield_columna_treinta.hidden = NO;
    _label_columna_treintaiuno.hidden = NO;
    _textfield_columna_treintaiuno.hidden = NO;
    _label_columna_treintaidos.hidden = NO;
    _textfield_columna_treintaidos.hidden = NO;
    _label_columna_treintaitres.hidden = NO;
    _textfield_columna_treintaitres.hidden = NO;
    _label_columna_treintaicuatro.hidden = NO;
    _textfield_columna_treintaicuatro.hidden = NO;
    _label_columna_treintaicinco.hidden = NO;
    _textfield_columna_treintaicinco.hidden = NO;
    _label_columna_treintaiseis.hidden = NO;
    _textfield_columna_treintaiseis.hidden = NO;
    _label_columna_treintaisiete.hidden = NO;
    _textfield_columna_treintaisiete.hidden = NO;
}


-(void)showTREINTAIOCHO{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
    _label_columna_veintiseis.hidden = NO;
    _textfield_columna_veintiseis.hidden = NO;
    _label_columna_veintisiete.hidden = NO;
    _textfield_columna_veintisiete.hidden = NO;
    _label_columna_veintiocho.hidden = NO;
    _textfield_columna_veintiocho.hidden = NO;
    _label_columna_veintinueve.hidden = NO;
    _textfield_columna_veintinueve.hidden = NO;
    _label_columna_treinta.hidden = NO;
    _textfield_columna_treinta.hidden = NO;
    _label_columna_treintaiuno.hidden = NO;
    _textfield_columna_treintaiuno.hidden = NO;
    _label_columna_treintaidos.hidden = NO;
    _textfield_columna_treintaidos.hidden = NO;
    _label_columna_treintaitres.hidden = NO;
    _textfield_columna_treintaitres.hidden = NO;
    _label_columna_treintaicuatro.hidden = NO;
    _textfield_columna_treintaicuatro.hidden = NO;
    _label_columna_treintaicinco.hidden = NO;
    _textfield_columna_treintaicinco.hidden = NO;
    _label_columna_treintaiseis.hidden = NO;
    _textfield_columna_treintaiseis.hidden = NO;
    _label_columna_treintaisiete.hidden = NO;
    _textfield_columna_treintaisiete.hidden = NO;
    _label_columna_treintaiocho.hidden = NO;
    _textfield_columna_treintaiocho.hidden = NO;
}



-(void)showTREINTAINUEVE{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
    _label_columna_veintiseis.hidden = NO;
    _textfield_columna_veintiseis.hidden = NO;
    _label_columna_veintisiete.hidden = NO;
    _textfield_columna_veintisiete.hidden = NO;
    _label_columna_veintiocho.hidden = NO;
    _textfield_columna_veintiocho.hidden = NO;
    _label_columna_veintinueve.hidden = NO;
    _textfield_columna_veintinueve.hidden = NO;
    _label_columna_treinta.hidden = NO;
    _textfield_columna_treinta.hidden = NO;
    _label_columna_treintaiuno.hidden = NO;
    _textfield_columna_treintaiuno.hidden = NO;
    _label_columna_treintaidos.hidden = NO;
    _textfield_columna_treintaidos.hidden = NO;
    _label_columna_treintaitres.hidden = NO;
    _textfield_columna_treintaitres.hidden = NO;
    _label_columna_treintaicuatro.hidden = NO;
    _textfield_columna_treintaicuatro.hidden = NO;
    _label_columna_treintaicinco.hidden = NO;
    _textfield_columna_treintaicinco.hidden = NO;
    _label_columna_treintaiseis.hidden = NO;
    _textfield_columna_treintaiseis.hidden = NO;
    _label_columna_treintaisiete.hidden = NO;
    _textfield_columna_treintaisiete.hidden = NO;
    _label_columna_treintaiocho.hidden = NO;
    _textfield_columna_treintaiocho.hidden = NO;
    _label_columna_treintainueve.hidden = NO;
    _textfield_columna_treintainueve.hidden = NO;
}


-(void)showCUARENTA{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
    _label_columna_veintiseis.hidden = NO;
    _textfield_columna_veintiseis.hidden = NO;
    _label_columna_veintisiete.hidden = NO;
    _textfield_columna_veintisiete.hidden = NO;
    _label_columna_veintiocho.hidden = NO;
    _textfield_columna_veintiocho.hidden = NO;
    _label_columna_veintinueve.hidden = NO;
    _textfield_columna_veintinueve.hidden = NO;
    _label_columna_treinta.hidden = NO;
    _textfield_columna_treinta.hidden = NO;
    _label_columna_treintaiuno.hidden = NO;
    _textfield_columna_treintaiuno.hidden = NO;
    _label_columna_treintaidos.hidden = NO;
    _textfield_columna_treintaidos.hidden = NO;
    _label_columna_treintaitres.hidden = NO;
    _textfield_columna_treintaitres.hidden = NO;
    _label_columna_treintaicuatro.hidden = NO;
    _textfield_columna_treintaicuatro.hidden = NO;
    _label_columna_treintaicinco.hidden = NO;
    _textfield_columna_treintaicinco.hidden = NO;
    _label_columna_treintaiseis.hidden = NO;
    _textfield_columna_treintaiseis.hidden = NO;
    _label_columna_treintaisiete.hidden = NO;
    _textfield_columna_treintaisiete.hidden = NO;
    _label_columna_treintaiocho.hidden = NO;
    _textfield_columna_treintaiocho.hidden = NO;
    _label_columna_treintainueve.hidden = NO;
    _textfield_columna_treintainueve.hidden = NO;
    _label_columna_cuarenta.hidden = NO;
    _textfield_columna_cuarenta.hidden = NO;
}

-(void)showCUARENTAIUNO{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
    _label_columna_veintiseis.hidden = NO;
    _textfield_columna_veintiseis.hidden = NO;
    _label_columna_veintisiete.hidden = NO;
    _textfield_columna_veintisiete.hidden = NO;
    _label_columna_veintiocho.hidden = NO;
    _textfield_columna_veintiocho.hidden = NO;
    _label_columna_veintinueve.hidden = NO;
    _textfield_columna_veintinueve.hidden = NO;
    _label_columna_treinta.hidden = NO;
    _textfield_columna_treinta.hidden = NO;
    _label_columna_treintaiuno.hidden = NO;
    _textfield_columna_treintaiuno.hidden = NO;
    _label_columna_treintaidos.hidden = NO;
    _textfield_columna_treintaidos.hidden = NO;
    _label_columna_treintaitres.hidden = NO;
    _textfield_columna_treintaitres.hidden = NO;
    _label_columna_treintaicuatro.hidden = NO;
    _textfield_columna_treintaicuatro.hidden = NO;
    _label_columna_treintaicinco.hidden = NO;
    _textfield_columna_treintaicinco.hidden = NO;
    _label_columna_treintaiseis.hidden = NO;
    _textfield_columna_treintaiseis.hidden = NO;
    _label_columna_treintaisiete.hidden = NO;
    _textfield_columna_treintaisiete.hidden = NO;
    _label_columna_treintaiocho.hidden = NO;
    _textfield_columna_treintaiocho.hidden = NO;
    _label_columna_treintainueve.hidden = NO;
    _textfield_columna_treintainueve.hidden = NO;
    _label_columna_cuarenta.hidden = NO;
    _textfield_columna_cuarenta.hidden = NO;
    _label_columna_cuarentaiuno.hidden = NO;
    _textfield_columna_cuarentaiuno.hidden = NO;
}


-(void)showCUARENTAIDOS{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
    _label_columna_veintiseis.hidden = NO;
    _textfield_columna_veintiseis.hidden = NO;
    _label_columna_veintisiete.hidden = NO;
    _textfield_columna_veintisiete.hidden = NO;
    _label_columna_veintiocho.hidden = NO;
    _textfield_columna_veintiocho.hidden = NO;
    _label_columna_veintinueve.hidden = NO;
    _textfield_columna_veintinueve.hidden = NO;
    _label_columna_treinta.hidden = NO;
    _textfield_columna_treinta.hidden = NO;
    _label_columna_treintaiuno.hidden = NO;
    _textfield_columna_treintaiuno.hidden = NO;
    _label_columna_treintaidos.hidden = NO;
    _textfield_columna_treintaidos.hidden = NO;
    _label_columna_treintaitres.hidden = NO;
    _textfield_columna_treintaitres.hidden = NO;
    _label_columna_treintaicuatro.hidden = NO;
    _textfield_columna_treintaicuatro.hidden = NO;
    _label_columna_treintaicinco.hidden = NO;
    _textfield_columna_treintaicinco.hidden = NO;
    _label_columna_treintaiseis.hidden = NO;
    _textfield_columna_treintaiseis.hidden = NO;
    _label_columna_treintaisiete.hidden = NO;
    _textfield_columna_treintaisiete.hidden = NO;
    _label_columna_treintaiocho.hidden = NO;
    _textfield_columna_treintaiocho.hidden = NO;
    _label_columna_treintainueve.hidden = NO;
    _textfield_columna_treintainueve.hidden = NO;
    _label_columna_cuarenta.hidden = NO;
    _textfield_columna_cuarenta.hidden = NO;
    _label_columna_cuarentaiuno.hidden = NO;
    _textfield_columna_cuarentaiuno.hidden = NO;
    _label_columna_cuarentaidos.hidden = NO;
    _textfield_columna_cuarentaidos.hidden = NO;
}


-(void)showCUARENTAITRES{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
    _label_columna_veintiseis.hidden = NO;
    _textfield_columna_veintiseis.hidden = NO;
    _label_columna_veintisiete.hidden = NO;
    _textfield_columna_veintisiete.hidden = NO;
    _label_columna_veintiocho.hidden = NO;
    _textfield_columna_veintiocho.hidden = NO;
    _label_columna_veintinueve.hidden = NO;
    _textfield_columna_veintinueve.hidden = NO;
    _label_columna_treinta.hidden = NO;
    _textfield_columna_treinta.hidden = NO;
    _label_columna_treintaiuno.hidden = NO;
    _textfield_columna_treintaiuno.hidden = NO;
    _label_columna_treintaidos.hidden = NO;
    _textfield_columna_treintaidos.hidden = NO;
    _label_columna_treintaitres.hidden = NO;
    _textfield_columna_treintaitres.hidden = NO;
    _label_columna_treintaicuatro.hidden = NO;
    _textfield_columna_treintaicuatro.hidden = NO;
    _label_columna_treintaicinco.hidden = NO;
    _textfield_columna_treintaicinco.hidden = NO;
    _label_columna_treintaiseis.hidden = NO;
    _textfield_columna_treintaiseis.hidden = NO;
    _label_columna_treintaisiete.hidden = NO;
    _textfield_columna_treintaisiete.hidden = NO;
    _label_columna_treintaiocho.hidden = NO;
    _textfield_columna_treintaiocho.hidden = NO;
    _label_columna_treintainueve.hidden = NO;
    _textfield_columna_treintainueve.hidden = NO;
    _label_columna_cuarenta.hidden = NO;
    _textfield_columna_cuarenta.hidden = NO;
    _label_columna_cuarentaiuno.hidden = NO;
    _textfield_columna_cuarentaiuno.hidden = NO;
    _label_columna_cuarentaidos.hidden = NO;
    _textfield_columna_cuarentaidos.hidden = NO;
    _label_columna_cuarentaitres.hidden = NO;
    _textfield_columna_cuarentaitres.hidden = NO;
}


-(void)showCUARENTAICUATRO{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
    _label_columna_veintiseis.hidden = NO;
    _textfield_columna_veintiseis.hidden = NO;
    _label_columna_veintisiete.hidden = NO;
    _textfield_columna_veintisiete.hidden = NO;
    _label_columna_veintiocho.hidden = NO;
    _textfield_columna_veintiocho.hidden = NO;
    _label_columna_veintinueve.hidden = NO;
    _textfield_columna_veintinueve.hidden = NO;
    _label_columna_treinta.hidden = NO;
    _textfield_columna_treinta.hidden = NO;
    _label_columna_treintaiuno.hidden = NO;
    _textfield_columna_treintaiuno.hidden = NO;
    _label_columna_treintaidos.hidden = NO;
    _textfield_columna_treintaidos.hidden = NO;
    _label_columna_treintaitres.hidden = NO;
    _textfield_columna_treintaitres.hidden = NO;
    _label_columna_treintaicuatro.hidden = NO;
    _textfield_columna_treintaicuatro.hidden = NO;
    _label_columna_treintaicinco.hidden = NO;
    _textfield_columna_treintaicinco.hidden = NO;
    _label_columna_treintaiseis.hidden = NO;
    _textfield_columna_treintaiseis.hidden = NO;
    _label_columna_treintaisiete.hidden = NO;
    _textfield_columna_treintaisiete.hidden = NO;
    _label_columna_treintaiocho.hidden = NO;
    _textfield_columna_treintaiocho.hidden = NO;
    _label_columna_treintainueve.hidden = NO;
    _textfield_columna_treintainueve.hidden = NO;
    _label_columna_cuarenta.hidden = NO;
    _textfield_columna_cuarenta.hidden = NO;
    _label_columna_cuarentaiuno.hidden = NO;
    _textfield_columna_cuarentaiuno.hidden = NO;
    _label_columna_cuarentaidos.hidden = NO;
    _textfield_columna_cuarentaidos.hidden = NO;
    _label_columna_cuarentaitres.hidden = NO;
    _textfield_columna_cuarentaitres.hidden = NO;
    _label_columna_cuarentaicuatro.hidden = NO;
    _textfield_columna_cuarentaicuatro.hidden = NO;
}


-(void)showCUARENTAICINCO{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
    _label_columna_veintiseis.hidden = NO;
    _textfield_columna_veintiseis.hidden = NO;
    _label_columna_veintisiete.hidden = NO;
    _textfield_columna_veintisiete.hidden = NO;
    _label_columna_veintiocho.hidden = NO;
    _textfield_columna_veintiocho.hidden = NO;
    _label_columna_veintinueve.hidden = NO;
    _textfield_columna_veintinueve.hidden = NO;
    _label_columna_treinta.hidden = NO;
    _textfield_columna_treinta.hidden = NO;
    _label_columna_treintaiuno.hidden = NO;
    _textfield_columna_treintaiuno.hidden = NO;
    _label_columna_treintaidos.hidden = NO;
    _textfield_columna_treintaidos.hidden = NO;
    _label_columna_treintaitres.hidden = NO;
    _textfield_columna_treintaitres.hidden = NO;
    _label_columna_treintaicuatro.hidden = NO;
    _textfield_columna_treintaicuatro.hidden = NO;
    _label_columna_treintaicinco.hidden = NO;
    _textfield_columna_treintaicinco.hidden = NO;
    _label_columna_treintaiseis.hidden = NO;
    _textfield_columna_treintaiseis.hidden = NO;
    _label_columna_treintaisiete.hidden = NO;
    _textfield_columna_treintaisiete.hidden = NO;
    _label_columna_treintaiocho.hidden = NO;
    _textfield_columna_treintaiocho.hidden = NO;
    _label_columna_treintainueve.hidden = NO;
    _textfield_columna_treintainueve.hidden = NO;
    _label_columna_cuarenta.hidden = NO;
    _textfield_columna_cuarenta.hidden = NO;
    _label_columna_cuarentaiuno.hidden = NO;
    _textfield_columna_cuarentaiuno.hidden = NO;
    _label_columna_cuarentaidos.hidden = NO;
    _textfield_columna_cuarentaidos.hidden = NO;
    _label_columna_cuarentaitres.hidden = NO;
    _textfield_columna_cuarentaitres.hidden = NO;
    _label_columna_cuarentaicuatro.hidden = NO;
    _textfield_columna_cuarentaicuatro.hidden = NO;
    _label_columna_cuarentaicinco.hidden = NO;
    _textfield_columna_cuarentaicinco.hidden = NO;
}



-(void)showCUARENTAISEIS{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
    _label_columna_veintiseis.hidden = NO;
    _textfield_columna_veintiseis.hidden = NO;
    _label_columna_veintisiete.hidden = NO;
    _textfield_columna_veintisiete.hidden = NO;
    _label_columna_veintiocho.hidden = NO;
    _textfield_columna_veintiocho.hidden = NO;
    _label_columna_veintinueve.hidden = NO;
    _textfield_columna_veintinueve.hidden = NO;
    _label_columna_treinta.hidden = NO;
    _textfield_columna_treinta.hidden = NO;
    _label_columna_treintaiuno.hidden = NO;
    _textfield_columna_treintaiuno.hidden = NO;
    _label_columna_treintaidos.hidden = NO;
    _textfield_columna_treintaidos.hidden = NO;
    _label_columna_treintaitres.hidden = NO;
    _textfield_columna_treintaitres.hidden = NO;
    _label_columna_treintaicuatro.hidden = NO;
    _textfield_columna_treintaicuatro.hidden = NO;
    _label_columna_treintaicinco.hidden = NO;
    _textfield_columna_treintaicinco.hidden = NO;
    _label_columna_treintaiseis.hidden = NO;
    _textfield_columna_treintaiseis.hidden = NO;
    _label_columna_treintaisiete.hidden = NO;
    _textfield_columna_treintaisiete.hidden = NO;
    _label_columna_treintaiocho.hidden = NO;
    _textfield_columna_treintaiocho.hidden = NO;
    _label_columna_treintainueve.hidden = NO;
    _textfield_columna_treintainueve.hidden = NO;
    _label_columna_cuarenta.hidden = NO;
    _textfield_columna_cuarenta.hidden = NO;
    _label_columna_cuarentaiuno.hidden = NO;
    _textfield_columna_cuarentaiuno.hidden = NO;
    _label_columna_cuarentaidos.hidden = NO;
    _textfield_columna_cuarentaidos.hidden = NO;
    _label_columna_cuarentaitres.hidden = NO;
    _textfield_columna_cuarentaitres.hidden = NO;
    _label_columna_cuarentaicuatro.hidden = NO;
    _textfield_columna_cuarentaicuatro.hidden = NO;
    _label_columna_cuarentaicinco.hidden = NO;
    _textfield_columna_cuarentaicinco.hidden = NO;
    _label_columna_cuarentaiseis.hidden = NO;
    _textfield_columna_cuarentaiseis.hidden = NO;
}


-(void)showCUARENTAISIETE{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
    _label_columna_veintiseis.hidden = NO;
    _textfield_columna_veintiseis.hidden = NO;
    _label_columna_veintisiete.hidden = NO;
    _textfield_columna_veintisiete.hidden = NO;
    _label_columna_veintiocho.hidden = NO;
    _textfield_columna_veintiocho.hidden = NO;
    _label_columna_veintinueve.hidden = NO;
    _textfield_columna_veintinueve.hidden = NO;
    _label_columna_treinta.hidden = NO;
    _textfield_columna_treinta.hidden = NO;
    _label_columna_treintaiuno.hidden = NO;
    _textfield_columna_treintaiuno.hidden = NO;
    _label_columna_treintaidos.hidden = NO;
    _textfield_columna_treintaidos.hidden = NO;
    _label_columna_treintaitres.hidden = NO;
    _textfield_columna_treintaitres.hidden = NO;
    _label_columna_treintaicuatro.hidden = NO;
    _textfield_columna_treintaicuatro.hidden = NO;
    _label_columna_treintaicinco.hidden = NO;
    _textfield_columna_treintaicinco.hidden = NO;
    _label_columna_treintaiseis.hidden = NO;
    _textfield_columna_treintaiseis.hidden = NO;
    _label_columna_treintaisiete.hidden = NO;
    _textfield_columna_treintaisiete.hidden = NO;
    _label_columna_treintaiocho.hidden = NO;
    _textfield_columna_treintaiocho.hidden = NO;
    _label_columna_treintainueve.hidden = NO;
    _textfield_columna_treintainueve.hidden = NO;
    _label_columna_cuarenta.hidden = NO;
    _textfield_columna_cuarenta.hidden = NO;
    _label_columna_cuarentaiuno.hidden = NO;
    _textfield_columna_cuarentaiuno.hidden = NO;
    _label_columna_cuarentaidos.hidden = NO;
    _textfield_columna_cuarentaidos.hidden = NO;
    _label_columna_cuarentaitres.hidden = NO;
    _textfield_columna_cuarentaitres.hidden = NO;
    _label_columna_cuarentaicuatro.hidden = NO;
    _textfield_columna_cuarentaicuatro.hidden = NO;
    _label_columna_cuarentaicinco.hidden = NO;
    _textfield_columna_cuarentaicinco.hidden = NO;
    _label_columna_cuarentaiseis.hidden = NO;
    _textfield_columna_cuarentaiseis.hidden = NO;
    _label_columna_cuarentaisiete.hidden = NO;
    _textfield_columna_cuarentaisiete.hidden = NO;
}


-(void)showCUARENTAIOCHO{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
    _label_columna_veintiseis.hidden = NO;
    _textfield_columna_veintiseis.hidden = NO;
    _label_columna_veintisiete.hidden = NO;
    _textfield_columna_veintisiete.hidden = NO;
    _label_columna_veintiocho.hidden = NO;
    _textfield_columna_veintiocho.hidden = NO;
    _label_columna_veintinueve.hidden = NO;
    _textfield_columna_veintinueve.hidden = NO;
    _label_columna_treinta.hidden = NO;
    _textfield_columna_treinta.hidden = NO;
    _label_columna_treintaiuno.hidden = NO;
    _textfield_columna_treintaiuno.hidden = NO;
    _label_columna_treintaidos.hidden = NO;
    _textfield_columna_treintaidos.hidden = NO;
    _label_columna_treintaitres.hidden = NO;
    _textfield_columna_treintaitres.hidden = NO;
    _label_columna_treintaicuatro.hidden = NO;
    _textfield_columna_treintaicuatro.hidden = NO;
    _label_columna_treintaicinco.hidden = NO;
    _textfield_columna_treintaicinco.hidden = NO;
    _label_columna_treintaiseis.hidden = NO;
    _textfield_columna_treintaiseis.hidden = NO;
    _label_columna_treintaisiete.hidden = NO;
    _textfield_columna_treintaisiete.hidden = NO;
    _label_columna_treintaiocho.hidden = NO;
    _textfield_columna_treintaiocho.hidden = NO;
    _label_columna_treintainueve.hidden = NO;
    _textfield_columna_treintainueve.hidden = NO;
    _label_columna_cuarenta.hidden = NO;
    _textfield_columna_cuarenta.hidden = NO;
    _label_columna_cuarentaiuno.hidden = NO;
    _textfield_columna_cuarentaiuno.hidden = NO;
    _label_columna_cuarentaidos.hidden = NO;
    _textfield_columna_cuarentaidos.hidden = NO;
    _label_columna_cuarentaitres.hidden = NO;
    _textfield_columna_cuarentaitres.hidden = NO;
    _label_columna_cuarentaicuatro.hidden = NO;
    _textfield_columna_cuarentaicuatro.hidden = NO;
    _label_columna_cuarentaicinco.hidden = NO;
    _textfield_columna_cuarentaicinco.hidden = NO;
    _label_columna_cuarentaiseis.hidden = NO;
    _textfield_columna_cuarentaiseis.hidden = NO;
    _label_columna_cuarentaisiete.hidden = NO;
    _textfield_columna_cuarentaisiete.hidden = NO;
    _label_columna_cuarentaiocho.hidden = NO;
    _textfield_columna_cuarentaiocho.hidden = NO;
}


-(void)showCUARENTAINUEVE{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
    _label_columna_veintiseis.hidden = NO;
    _textfield_columna_veintiseis.hidden = NO;
    _label_columna_veintisiete.hidden = NO;
    _textfield_columna_veintisiete.hidden = NO;
    _label_columna_veintiocho.hidden = NO;
    _textfield_columna_veintiocho.hidden = NO;
    _label_columna_veintinueve.hidden = NO;
    _textfield_columna_veintinueve.hidden = NO;
    _label_columna_treinta.hidden = NO;
    _textfield_columna_treinta.hidden = NO;
    _label_columna_treintaiuno.hidden = NO;
    _textfield_columna_treintaiuno.hidden = NO;
    _label_columna_treintaidos.hidden = NO;
    _textfield_columna_treintaidos.hidden = NO;
    _label_columna_treintaitres.hidden = NO;
    _textfield_columna_treintaitres.hidden = NO;
    _label_columna_treintaicuatro.hidden = NO;
    _textfield_columna_treintaicuatro.hidden = NO;
    _label_columna_treintaicinco.hidden = NO;
    _textfield_columna_treintaicinco.hidden = NO;
    _label_columna_treintaiseis.hidden = NO;
    _textfield_columna_treintaiseis.hidden = NO;
    _label_columna_treintaisiete.hidden = NO;
    _textfield_columna_treintaisiete.hidden = NO;
    _label_columna_treintaiocho.hidden = NO;
    _textfield_columna_treintaiocho.hidden = NO;
    _label_columna_treintainueve.hidden = NO;
    _textfield_columna_treintainueve.hidden = NO;
    _label_columna_cuarenta.hidden = NO;
    _textfield_columna_cuarenta.hidden = NO;
    _label_columna_cuarentaiuno.hidden = NO;
    _textfield_columna_cuarentaiuno.hidden = NO;
    _label_columna_cuarentaidos.hidden = NO;
    _textfield_columna_cuarentaidos.hidden = NO;
    _label_columna_cuarentaitres.hidden = NO;
    _textfield_columna_cuarentaitres.hidden = NO;
    _label_columna_cuarentaicuatro.hidden = NO;
    _textfield_columna_cuarentaicuatro.hidden = NO;
    _label_columna_cuarentaicinco.hidden = NO;
    _textfield_columna_cuarentaicinco.hidden = NO;
    _label_columna_cuarentaiseis.hidden = NO;
    _textfield_columna_cuarentaiseis.hidden = NO;
    _label_columna_cuarentaisiete.hidden = NO;
    _textfield_columna_cuarentaisiete.hidden = NO;
    _label_columna_cuarentaiocho.hidden = NO;
    _textfield_columna_cuarentaiocho.hidden = NO;
    _label_columna_cuarentainueve.hidden = NO;
    _textfield_columna_cuarentainueve.hidden = NO;
}


-(void)showCINCUENTA{
    _label_columna_uno.hidden = NO;
    _textfield_columna_uno.hidden = NO;
    _label_columna_dos.hidden = NO;
    _textfield_columna_dos.hidden = NO;
    _label_columna_tres.hidden = NO;
    _textfield_columna_tres.hidden = NO;
    _label_columna_cuatro.hidden = NO;
    _textfield_columna_cuatro.hidden = NO;
    _label_columna_cinco.hidden = NO;
    _textfield_columna_cinco.hidden = NO;
    _label_columna_seis.hidden = NO;
    _textfield_columna_seis.hidden = NO;
    _label_columna_siete.hidden = NO;
    _textfield_columna_siete.hidden = NO;
    _label_columna_ocho.hidden = NO;
    _textfield_columna_ocho.hidden = NO;
    _label_columna_nueve.hidden = NO;
    _textfield_columna_nueve.hidden = NO;
    _label_columna_diez.hidden = NO;
    _textfield_columna_diez.hidden = NO;
    _label_columna_once.hidden = NO;
    _textfield_columna_once.hidden = NO;
    _label_columna_doce.hidden = NO;
    _textfield_columna_doce.hidden = NO;
    _label_columna_trece.hidden = NO;
    _textfield_columna_trece.hidden = NO;
    _label_columna_catorce.hidden = NO;
    _textfield_columna_catorce.hidden = NO;
    _label_columna_quince.hidden = NO;
    _textfield_columna_quince.hidden = NO;
    _label_columna_dieciseis.hidden = NO;
    _textfield_columna_dieciseis.hidden = NO;
    _label_columna_diecisiete.hidden = NO;
    _textfield_columna_diecisiete.hidden = NO;
    _label_columna_dieciocho.hidden = NO;
    _textfield_columna_dieciocho.hidden = NO;
    _label_columna_diecinueve.hidden = NO;
    _textfield_columna_diecinueve.hidden = NO;
    _label_columna_veinte.hidden = NO;
    _textfield_columna_veinte.hidden = NO;
    _label_columna_veintiuno.hidden = NO;
    _textfield_columna_veintiuno.hidden = NO;
    _label_columna_veintidos.hidden = NO;
    _textfield_columna_veintidos.hidden = NO;
    _label_columna_veintitres.hidden = NO;
    _textfield_columna_veintitres.hidden = NO;
    _label_columna_veinticuatro.hidden = NO;
    _textfield_columna_veinticuatro.hidden = NO;
    _label_columna_veinticinco.hidden = NO;
    _textfield_columna_veinticinco.hidden = NO;
    _label_columna_veintiseis.hidden = NO;
    _textfield_columna_veintiseis.hidden = NO;
    _label_columna_veintisiete.hidden = NO;
    _textfield_columna_veintisiete.hidden = NO;
    _label_columna_veintiocho.hidden = NO;
    _textfield_columna_veintiocho.hidden = NO;
    _label_columna_veintinueve.hidden = NO;
    _textfield_columna_veintinueve.hidden = NO;
    _label_columna_treinta.hidden = NO;
    _textfield_columna_treinta.hidden = NO;
    _label_columna_treintaiuno.hidden = NO;
    _textfield_columna_treintaiuno.hidden = NO;
    _label_columna_treintaidos.hidden = NO;
    _textfield_columna_treintaidos.hidden = NO;
    _label_columna_treintaitres.hidden = NO;
    _textfield_columna_treintaitres.hidden = NO;
    _label_columna_treintaicuatro.hidden = NO;
    _textfield_columna_treintaicuatro.hidden = NO;
    _label_columna_treintaicinco.hidden = NO;
    _textfield_columna_treintaicinco.hidden = NO;
    _label_columna_treintaiseis.hidden = NO;
    _textfield_columna_treintaiseis.hidden = NO;
    _label_columna_treintaisiete.hidden = NO;
    _textfield_columna_treintaisiete.hidden = NO;
    _label_columna_treintaiocho.hidden = NO;
    _textfield_columna_treintaiocho.hidden = NO;
    _label_columna_treintainueve.hidden = NO;
    _textfield_columna_treintainueve.hidden = NO;
    _label_columna_cuarenta.hidden = NO;
    _textfield_columna_cuarenta.hidden = NO;
    _label_columna_cuarentaiuno.hidden = NO;
    _textfield_columna_cuarentaiuno.hidden = NO;
    _label_columna_cuarentaidos.hidden = NO;
    _textfield_columna_cuarentaidos.hidden = NO;
    _label_columna_cuarentaitres.hidden = NO;
    _textfield_columna_cuarentaitres.hidden = NO;
    _label_columna_cuarentaicuatro.hidden = NO;
    _textfield_columna_cuarentaicuatro.hidden = NO;
    _label_columna_cuarentaicinco.hidden = NO;
    _textfield_columna_cuarentaicinco.hidden = NO;
    _label_columna_cuarentaiseis.hidden = NO;
    _textfield_columna_cuarentaiseis.hidden = NO;
    _label_columna_cuarentaisiete.hidden = NO;
    _textfield_columna_cuarentaisiete.hidden = NO;
    _label_columna_cuarentaiocho.hidden = NO;
    _textfield_columna_cuarentaiocho.hidden = NO;
    _label_columna_cuarentainueve.hidden = NO;
    _textfield_columna_cuarentainueve.hidden = NO;
    _label_columna_cincuenta.hidden = NO;
    _textfield_columna_cincuenta.hidden = NO;
}


// CON ESTA FUNCION SE PONE EN LOS LABELS, LOS NOMBRES DE LAS COLUMNAS CORRESPONDIENTES
// LA FORMA COMO FUNCIONA, ES QUE EN EL ARRAY "DATOS" SE TIENE EN FORMATO JSON TODA LA TABLA DEL NOMBRE DEL PROYECTO ACTUAL
// ENTONCES CON EL "OBJECTOFORKEY" SE AGARRA EL DATO ESPECIFICO QUE QUEREMOS
// POR EJEMPLO, EN EL CASO DEL LABEL PARA LA COLUMNA UNO, UTILIZAMOS EL OBJECTFORKEY DE LA COLUMNA UNO DE LA TABLA MYSQL
-(void)ponerNombresLabels{
    
    _label_columna_uno.text = boton_variable_nombre_columna_uno;
    _label_columna_dos.text = boton_variable_nombre_columna_dos;
    _label_columna_tres.text = boton_variable_nombre_columna_tres;
    _label_columna_cuatro.text = boton_variable_nombre_columna_cuatro;
    _label_columna_cinco.text = boton_variable_nombre_columna_cinco;
    _label_columna_seis.text = boton_variable_nombre_columna_seis;
    _label_columna_siete.text = boton_variable_nombre_columna_siete;
    _label_columna_ocho.text = boton_variable_nombre_columna_ocho;
    _label_columna_nueve.text = boton_variable_nombre_columna_nueve;
    _label_columna_diez.text = boton_variable_nombre_columna_diez;
    _label_columna_once.text = boton_variable_nombre_columna_once;
    _label_columna_doce.text = boton_variable_nombre_columna_doce;
    _label_columna_trece.text = boton_variable_nombre_columna_trece;
    _label_columna_catorce.text = boton_variable_nombre_columna_catorce;
    _label_columna_quince.text = boton_variable_nombre_columna_quince;
    _label_columna_dieciseis.text = boton_variable_nombre_columna_dieciseis;
    _label_columna_diecisiete.text = boton_variable_nombre_columna_diecisiete;
    _label_columna_dieciocho.text = boton_variable_nombre_columna_dieciocho;
    _label_columna_diecinueve.text = boton_variable_nombre_columna_diecinueve;
    _label_columna_veinte.text = boton_variable_nombre_columna_veinte;
    _label_columna_veintiuno.text = boton_variable_nombre_columna_veintiuno;
    _label_columna_veintidos.text = boton_variable_nombre_columna_veintidos;
    _label_columna_veintitres.text = boton_variable_nombre_columna_veintitres;
    _label_columna_veinticuatro.text = boton_variable_nombre_columna_veinticuatro;
    _label_columna_veinticinco.text = boton_variable_nombre_columna_veinticinco;
    _label_columna_veintiseis.text = boton_variable_nombre_columna_veintiseis;
    _label_columna_veintisiete.text = boton_variable_nombre_columna_veintisiete;
    _label_columna_veintiocho.text = boton_variable_nombre_columna_veintiocho;
    _label_columna_veintinueve.text = boton_variable_nombre_columna_veintinueve;
    _label_columna_treinta.text = boton_variable_nombre_columna_treinta;
    _label_columna_treintaiuno.text = boton_variable_nombre_columna_treintaiuno;
    _label_columna_treintaidos.text = boton_variable_nombre_columna_treintaidos;
    _label_columna_treintaitres.text = boton_variable_nombre_columna_treintaitres;
    _label_columna_treintaicuatro.text = boton_variable_nombre_columna_treintaicuatro;
    _label_columna_treintaicinco.text = boton_variable_nombre_columna_treintaicinco;
    _label_columna_treintaiseis.text = boton_variable_nombre_columna_treintaiseis;
    _label_columna_treintaisiete.text = boton_variable_nombre_columna_treintaisiete;
    _label_columna_treintaiocho.text = boton_variable_nombre_columna_treintaiocho;
    _label_columna_treintainueve.text = boton_variable_nombre_columna_treintainueve;
    _label_columna_cuarenta.text = boton_variable_nombre_columna_cuarenta;
    _label_columna_cuarentaiuno.text = boton_variable_nombre_columna_cuarentaiuno;
    _label_columna_cuarentaidos.text = boton_variable_nombre_columna_cuarentaidos;
    _label_columna_cuarentaitres.text = boton_variable_nombre_columna_cuarentaitres;
    _label_columna_cuarentaicuatro.text = boton_variable_nombre_columna_cuarentaicuatro;
    _label_columna_cuarentaicinco.text = boton_variable_nombre_columna_cuarentaicinco;
    _label_columna_cuarentaiseis.text = boton_variable_nombre_columna_cuarentaiseis;
    _label_columna_cuarentaisiete.text = boton_variable_nombre_columna_cuarentaisiete;
    _label_columna_cuarentaiocho.text = boton_variable_nombre_columna_cuarentaiocho;
    _label_columna_cuarentainueve.text = boton_variable_nombre_columna_cuarentainueve;
    _label_columna_cincuenta.text = boton_variable_nombre_columna_cincuenta;
    
    
    
}




- (IBAction)agregar:(id)sender {
    
    
    columna_latitud_variable = @"LATITUD";
    columna_longitud_variable = @"LONGITUD";
    columna_fecha_variable = @"FECHA";
    columna_censador_variable = @"CENSADOR";
    columna_state_variable = @"STATE";
    
    
    
    
//    latitud_variable = @"latitud";
//    longitud_variable = @"longitud";
//    fecha_variable = @"fecha";
//    censador_variable = @"censador";
    state_variable = @"PENDING";
    
    
    
    NSString *boton_variable_columna_uno = self.textfield_columna_uno.text;
    NSString *boton_variable_columna_dos = self.textfield_columna_dos.text;
    NSString *boton_variable_columna_tres = self.textfield_columna_tres.text;
    NSString *boton_variable_columna_cuatro = self.textfield_columna_cuatro.text;
    NSString *boton_variable_columna_cinco = self.textfield_columna_cinco.text;
    NSString *boton_variable_columna_seis = self.textfield_columna_seis.text;
    NSString *boton_variable_columna_siete = self.textfield_columna_siete.text;
    NSString *boton_variable_columna_ocho = self.textfield_columna_ocho.text;
    NSString *boton_variable_columna_nueve = self.textfield_columna_nueve.text;
    NSString *boton_variable_columna_diez = self.textfield_columna_diez.text;
    NSString *boton_variable_columna_once = self.textfield_columna_once.text;
    NSString *boton_variable_columna_doce = self.textfield_columna_doce.text;
    NSString *boton_variable_columna_trece = self.textfield_columna_trece.text;
    NSString *boton_variable_columna_catorce = self.textfield_columna_catorce.text;
    NSString *boton_variable_columna_quince = self.textfield_columna_quince.text;
    NSString *boton_variable_columna_dieciseis = self.textfield_columna_dieciseis.text;
    NSString *boton_variable_columna_diecisiete = self.textfield_columna_diecisiete.text;
    NSString *boton_variable_columna_dieciocho = self.textfield_columna_dieciocho.text;
    NSString *boton_variable_columna_diecinueve = self.textfield_columna_diecinueve.text;
    NSString *boton_variable_columna_veinte = self.textfield_columna_veinte.text;
    NSString *boton_variable_columna_veintiuno = self.textfield_columna_veintiuno.text;
    NSString *boton_variable_columna_veintidos = self.textfield_columna_veintidos.text;
    NSString *boton_variable_columna_veintitres = self.textfield_columna_veintitres.text;
    NSString *boton_variable_columna_veinticuatro = self.textfield_columna_veinticuatro.text;
    NSString *boton_variable_columna_veinticinco = self.textfield_columna_veinticinco.text;
    NSString *boton_variable_columna_veintiseis = self.textfield_columna_veintiseis.text;
    NSString *boton_variable_columna_veintisiete = self.textfield_columna_veintisiete.text;
    NSString *boton_variable_columna_veintiocho = self.textfield_columna_veintiocho.text;
    NSString *boton_variable_columna_veintinueve = self.textfield_columna_veintinueve.text;
    NSString *boton_variable_columna_treinta = self.textfield_columna_treinta.text;
    NSString *boton_variable_columna_treintaiuno = self.textfield_columna_treintaiuno.text;
    NSString *boton_variable_columna_treintaidos = self.textfield_columna_treintaidos.text;
    NSString *boton_variable_columna_treintaitres = self.textfield_columna_treintaitres.text;
    NSString *boton_variable_columna_treintaicuatro = self.textfield_columna_treintaicuatro.text;
    NSString *boton_variable_columna_treintaicinco = self.textfield_columna_treintaicinco.text;
    NSString *boton_variable_columna_treintaiseis = self.textfield_columna_treintaiseis.text;
    NSString *boton_variable_columna_treintaisiete = self.textfield_columna_treintaisiete.text;
    NSString *boton_variable_columna_treintaiocho = self.textfield_columna_treintaiocho.text;
    NSString *boton_variable_columna_treintainueve = self.textfield_columna_treintainueve.text;
    NSString *boton_variable_columna_cuarenta = self.textfield_columna_cuarenta.text;
    NSString *boton_variable_columna_cuarentaiuno = self.textfield_columna_cuarentaiuno.text;
    NSString *boton_variable_columna_cuarentaidos = self.textfield_columna_cuarentaidos.text;
    NSString *boton_variable_columna_cuarentaitres = self.textfield_columna_cuarentaitres.text;
    NSString *boton_variable_columna_cuarentaicuatro = self.textfield_columna_cuarentaicuatro.text;
    NSString *boton_variable_columna_cuarentaicinco = self.textfield_columna_cuarentaicinco.text;
    NSString *boton_variable_columna_cuarentaiseis = self.textfield_columna_cuarentaiseis.text;
    NSString *boton_variable_columna_cuarentaisiete = self.textfield_columna_cuarentaisiete.text;
    NSString *boton_variable_columna_cuarentaiocho = self.textfield_columna_cuarentaiocho.text;
    NSString *boton_variable_columna_cuarentainueve = self.textfield_columna_cuarentainueve.text;
    NSString *boton_variable_columna_cincuenta = self.textfield_columna_cincuenta.text;
    
    
    // TRAER INFORMACION DE BOTON UNO DE LAS CINCUENTA POSIBLES COLUMNAS
    [self traerBotonVARIABLE];
    
    int numero_columnas_int = [numero_columnas_proyecto_variable intValue];
    
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombre_proyecto_actual_censo_variable];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    
    
    
    
    switch (numero_columnas_int) {
        case 1:
            // UNO
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@) values ('%@', '%@', '%@', '%@', '%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, latitud_variable, longitud_variable, fecha_variable, censador_variable,state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];\
                }
                sqlite3_close(censos);
            }
            break;
        case 2:
            // DOS
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO DOS");
                NSLog(@"D %@", latitud_variable);
                
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@', '%@', '%@', '%@', '%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 3:
            // TRES
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@', '%@', '%@', '%@', '%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 4:
            // CUATRO
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 5:
            // CINCO
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco,columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 6:
            // SEIS
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 7:
            // SIETE
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 8:
            // OCHO
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 9:
            // NUEVE
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 10:
            // DIEZ
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 11:
            // ONCE
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 12:
            // DOCE
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 13:
            // TRECE
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 14:
            // CATORCE
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 15:
            // QUINCE
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 16:
            // DIECISEIS
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 17:
            // DIECISIETE
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 18:
            // DIECIOCHO
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 19:
            // DIECINUEVE
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 20:
            // VEINTE
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 21:
            // VEINTIUNO
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 22:
            // VEINTIDOS
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 23:
            // VEINTITRES
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 24:
            // VEINTICUATRO
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 25:
            // VEINTICINCO
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 26:
            // VEINTISEIS
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, boton_variable_nombre_columna_veintiseis, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, boton_variable_columna_veintiseis, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 27:
            // VEINTISIETE
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, boton_variable_nombre_columna_veintiseis, boton_variable_nombre_columna_veintisiete, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, boton_variable_columna_veintiseis, boton_variable_columna_veintisiete, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 28:
            // VEINTIOCHO
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, boton_variable_nombre_columna_veintiseis, boton_variable_nombre_columna_veintisiete, boton_variable_nombre_columna_veintiocho, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, boton_variable_columna_veintiseis, boton_variable_columna_veintisiete, boton_variable_columna_veintiocho, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 29:
            // VEINTINUEVE
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, boton_variable_nombre_columna_veintiseis, boton_variable_nombre_columna_veintisiete, boton_variable_nombre_columna_veintiocho, boton_variable_nombre_columna_veintinueve, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, boton_variable_columna_veintiseis, boton_variable_columna_veintisiete, boton_variable_columna_veintiocho, boton_variable_columna_veintinueve, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                }
                sqlite3_close(censos);
            }
            break;
        case 30:
            // TREINTA
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, boton_variable_nombre_columna_veintiseis, boton_variable_nombre_columna_veintisiete, boton_variable_nombre_columna_veintiocho, boton_variable_nombre_columna_veintinueve, boton_variable_nombre_columna_treinta, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, boton_variable_columna_veintiseis, boton_variable_columna_veintisiete, boton_variable_columna_veintiocho, boton_variable_columna_veintinueve, boton_variable_columna_treinta, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 31:
            // TREINTAIUNO
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, boton_variable_nombre_columna_veintiseis, boton_variable_nombre_columna_veintisiete, boton_variable_nombre_columna_veintiocho, boton_variable_nombre_columna_veintinueve, boton_variable_nombre_columna_treinta, boton_variable_nombre_columna_treintaiuno, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, boton_variable_columna_veintiseis, boton_variable_columna_veintisiete, boton_variable_columna_veintiocho, boton_variable_columna_veintinueve, boton_variable_columna_treinta, boton_variable_columna_treintaiuno, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 32:
            // TREINTAIDOS
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, boton_variable_nombre_columna_veintiseis, boton_variable_nombre_columna_veintisiete, boton_variable_nombre_columna_veintiocho, boton_variable_nombre_columna_veintinueve, boton_variable_nombre_columna_treinta, boton_variable_nombre_columna_treintaiuno, boton_variable_nombre_columna_treintaidos, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, boton_variable_columna_veintiseis, boton_variable_columna_veintisiete, boton_variable_columna_veintiocho, boton_variable_columna_veintinueve, boton_variable_columna_treinta, boton_variable_columna_treintaiuno, boton_variable_columna_treintaidos, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 33:
            // TREINTAITRES
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, boton_variable_nombre_columna_veintiseis, boton_variable_nombre_columna_veintisiete, boton_variable_nombre_columna_veintiocho, boton_variable_nombre_columna_veintinueve, boton_variable_nombre_columna_treinta, boton_variable_nombre_columna_treintaiuno, boton_variable_nombre_columna_treintaidos, boton_variable_nombre_columna_treintaitres, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, boton_variable_columna_veintiseis, boton_variable_columna_veintisiete, boton_variable_columna_veintiocho, boton_variable_columna_veintinueve, boton_variable_columna_treinta, boton_variable_columna_treintaiuno, boton_variable_columna_treintaidos, boton_variable_columna_treintaitres, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 34:
            // TREINTAICUATRO
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, boton_variable_nombre_columna_veintiseis, boton_variable_nombre_columna_veintisiete, boton_variable_nombre_columna_veintiocho, boton_variable_nombre_columna_veintinueve, boton_variable_nombre_columna_treinta, boton_variable_nombre_columna_treintaiuno, boton_variable_nombre_columna_treintaidos, boton_variable_nombre_columna_treintaitres, boton_variable_nombre_columna_treintaicuatro, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, boton_variable_columna_veintiseis, boton_variable_columna_veintisiete, boton_variable_columna_veintiocho, boton_variable_columna_veintinueve, boton_variable_columna_treinta, boton_variable_columna_treintaiuno, boton_variable_columna_treintaidos, boton_variable_columna_treintaitres, boton_variable_columna_treintaicuatro, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 35:
            // TREINTAICINCO
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, boton_variable_nombre_columna_veintiseis, boton_variable_nombre_columna_veintisiete, boton_variable_nombre_columna_veintiocho, boton_variable_nombre_columna_veintinueve, boton_variable_nombre_columna_treinta, boton_variable_nombre_columna_treintaiuno, boton_variable_nombre_columna_treintaidos, boton_variable_nombre_columna_treintaitres, boton_variable_nombre_columna_treintaicuatro, boton_variable_nombre_columna_treintaicinco, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, boton_variable_columna_veintiseis, boton_variable_columna_veintisiete, boton_variable_columna_veintiocho, boton_variable_columna_veintinueve, boton_variable_columna_treinta, boton_variable_columna_treintaiuno, boton_variable_columna_treintaidos, boton_variable_columna_treintaitres, boton_variable_columna_treintaicuatro, boton_variable_columna_treintaicinco, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 36:
            // TREINTAISEIS
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, boton_variable_nombre_columna_veintiseis, boton_variable_nombre_columna_veintisiete, boton_variable_nombre_columna_veintiocho, boton_variable_nombre_columna_veintinueve, boton_variable_nombre_columna_treinta, boton_variable_nombre_columna_treintaiuno, boton_variable_nombre_columna_treintaidos, boton_variable_nombre_columna_treintaitres, boton_variable_nombre_columna_treintaicuatro, boton_variable_nombre_columna_treintaicinco, boton_variable_nombre_columna_treintaiseis, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, boton_variable_columna_veintiseis, boton_variable_columna_veintisiete, boton_variable_columna_veintiocho, boton_variable_columna_veintinueve, boton_variable_columna_treinta, boton_variable_columna_treintaiuno, boton_variable_columna_treintaidos, boton_variable_columna_treintaitres, boton_variable_columna_treintaicuatro, boton_variable_columna_treintaicinco, boton_variable_columna_treintaiseis, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 37:
            // TREINTAISIETE
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, boton_variable_nombre_columna_veintiseis, boton_variable_nombre_columna_veintisiete, boton_variable_nombre_columna_veintiocho, boton_variable_nombre_columna_veintinueve, boton_variable_nombre_columna_treinta, boton_variable_nombre_columna_treintaiuno, boton_variable_nombre_columna_treintaidos, boton_variable_nombre_columna_treintaitres, boton_variable_nombre_columna_treintaicuatro, boton_variable_nombre_columna_treintaicinco, boton_variable_nombre_columna_treintaiseis, boton_variable_nombre_columna_treintaisiete, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, boton_variable_columna_veintiseis, boton_variable_columna_veintisiete, boton_variable_columna_veintiocho, boton_variable_columna_veintinueve, boton_variable_columna_treinta, boton_variable_columna_treintaiuno, boton_variable_columna_treintaidos, boton_variable_columna_treintaitres, boton_variable_columna_treintaicuatro, boton_variable_columna_treintaicinco, boton_variable_columna_treintaiseis, boton_variable_columna_treintaisiete, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 38:
            // TREINTAIOCHO
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, boton_variable_nombre_columna_veintiseis, boton_variable_nombre_columna_veintisiete, boton_variable_nombre_columna_veintiocho, boton_variable_nombre_columna_veintinueve, boton_variable_nombre_columna_treinta, boton_variable_nombre_columna_treintaiuno, boton_variable_nombre_columna_treintaidos, boton_variable_nombre_columna_treintaitres, boton_variable_nombre_columna_treintaicuatro, boton_variable_nombre_columna_treintaicinco, boton_variable_nombre_columna_treintaiseis, boton_variable_nombre_columna_treintaisiete, boton_variable_nombre_columna_treintaiocho, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, boton_variable_columna_veintiseis, boton_variable_columna_veintisiete, boton_variable_columna_veintiocho, boton_variable_columna_veintinueve, boton_variable_columna_treinta, boton_variable_columna_treintaiuno, boton_variable_columna_treintaidos, boton_variable_columna_treintaitres, boton_variable_columna_treintaicuatro, boton_variable_columna_treintaicinco, boton_variable_columna_treintaiseis, boton_variable_columna_treintaisiete, boton_variable_columna_treintaiocho, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 39:
            // TREINTAINUEVE
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, boton_variable_nombre_columna_veintiseis, boton_variable_nombre_columna_veintisiete, boton_variable_nombre_columna_veintiocho, boton_variable_nombre_columna_veintinueve, boton_variable_nombre_columna_treinta, boton_variable_nombre_columna_treintaiuno, boton_variable_nombre_columna_treintaidos, boton_variable_nombre_columna_treintaitres, boton_variable_nombre_columna_treintaicuatro, boton_variable_nombre_columna_treintaicinco, boton_variable_nombre_columna_treintaiseis, boton_variable_nombre_columna_treintaisiete, boton_variable_nombre_columna_treintaiocho, boton_variable_nombre_columna_treintainueve, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, boton_variable_columna_veintiseis, boton_variable_columna_veintisiete, boton_variable_columna_veintiocho, boton_variable_columna_veintinueve, boton_variable_columna_treinta, boton_variable_columna_treintaiuno, boton_variable_columna_treintaidos, boton_variable_columna_treintaitres, boton_variable_columna_treintaicuatro, boton_variable_columna_treintaicinco, boton_variable_columna_treintaiseis, boton_variable_columna_treintaisiete, boton_variable_columna_treintaiocho, boton_variable_columna_treintainueve, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 40:
            // CUARENTA
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, boton_variable_nombre_columna_veintiseis, boton_variable_nombre_columna_veintisiete, boton_variable_nombre_columna_veintiocho, boton_variable_nombre_columna_veintinueve, boton_variable_nombre_columna_treinta, boton_variable_nombre_columna_treintaiuno, boton_variable_nombre_columna_treintaidos, boton_variable_nombre_columna_treintaitres, boton_variable_nombre_columna_treintaicuatro, boton_variable_nombre_columna_treintaicinco, boton_variable_nombre_columna_treintaiseis, boton_variable_nombre_columna_treintaisiete, boton_variable_nombre_columna_treintaiocho, boton_variable_nombre_columna_treintainueve, boton_variable_nombre_columna_cuarenta, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, boton_variable_columna_veintiseis, boton_variable_columna_veintisiete, boton_variable_columna_veintiocho, boton_variable_columna_veintinueve, boton_variable_columna_treinta, boton_variable_columna_treintaiuno, boton_variable_columna_treintaidos, boton_variable_columna_treintaitres, boton_variable_columna_treintaicuatro, boton_variable_columna_treintaicinco, boton_variable_columna_treintaiseis, boton_variable_columna_treintaisiete, boton_variable_columna_treintaiocho, boton_variable_columna_treintainueve, boton_variable_columna_cuarenta, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 41:
            // CUARENTAIUNO
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, boton_variable_nombre_columna_veintiseis, boton_variable_nombre_columna_veintisiete, boton_variable_nombre_columna_veintiocho, boton_variable_nombre_columna_veintinueve, boton_variable_nombre_columna_treinta, boton_variable_nombre_columna_treintaiuno, boton_variable_nombre_columna_treintaidos, boton_variable_nombre_columna_treintaitres, boton_variable_nombre_columna_treintaicuatro, boton_variable_nombre_columna_treintaicinco, boton_variable_nombre_columna_treintaiseis, boton_variable_nombre_columna_treintaisiete, boton_variable_nombre_columna_treintaiocho, boton_variable_nombre_columna_treintainueve, boton_variable_nombre_columna_cuarenta, boton_variable_nombre_columna_cuarentaiuno, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, boton_variable_columna_veintiseis, boton_variable_columna_veintisiete, boton_variable_columna_veintiocho, boton_variable_columna_veintinueve, boton_variable_columna_treinta, boton_variable_columna_treintaiuno, boton_variable_columna_treintaidos, boton_variable_columna_treintaitres, boton_variable_columna_treintaicuatro, boton_variable_columna_treintaicinco, boton_variable_columna_treintaiseis, boton_variable_columna_treintaisiete, boton_variable_columna_treintaiocho, boton_variable_columna_treintainueve, boton_variable_columna_cuarenta, boton_variable_columna_cuarentaiuno, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 42:
            // CUARENTAIDOS
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, boton_variable_nombre_columna_veintiseis, boton_variable_nombre_columna_veintisiete, boton_variable_nombre_columna_veintiocho, boton_variable_nombre_columna_veintinueve, boton_variable_nombre_columna_treinta, boton_variable_nombre_columna_treintaiuno, boton_variable_nombre_columna_treintaidos, boton_variable_nombre_columna_treintaitres, boton_variable_nombre_columna_treintaicuatro, boton_variable_nombre_columna_treintaicinco, boton_variable_nombre_columna_treintaiseis, boton_variable_nombre_columna_treintaisiete, boton_variable_nombre_columna_treintaiocho, boton_variable_nombre_columna_treintainueve, boton_variable_nombre_columna_cuarenta, boton_variable_nombre_columna_cuarentaiuno, boton_variable_nombre_columna_cuarentaidos, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, boton_variable_columna_veintiseis, boton_variable_columna_veintisiete, boton_variable_columna_veintiocho, boton_variable_columna_veintinueve, boton_variable_columna_treinta, boton_variable_columna_treintaiuno, boton_variable_columna_treintaidos, boton_variable_columna_treintaitres, boton_variable_columna_treintaicuatro, boton_variable_columna_treintaicinco, boton_variable_columna_treintaiseis, boton_variable_columna_treintaisiete, boton_variable_columna_treintaiocho, boton_variable_columna_treintainueve, boton_variable_columna_cuarenta, boton_variable_columna_cuarentaiuno, boton_variable_columna_cuarentaidos, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 43:
            // CUARENTAITRES
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, boton_variable_nombre_columna_veintiseis, boton_variable_nombre_columna_veintisiete, boton_variable_nombre_columna_veintiocho, boton_variable_nombre_columna_veintinueve, boton_variable_nombre_columna_treinta, boton_variable_nombre_columna_treintaiuno, boton_variable_nombre_columna_treintaidos, boton_variable_nombre_columna_treintaitres, boton_variable_nombre_columna_treintaicuatro, boton_variable_nombre_columna_treintaicinco, boton_variable_nombre_columna_treintaiseis, boton_variable_nombre_columna_treintaisiete, boton_variable_nombre_columna_treintaiocho, boton_variable_nombre_columna_treintainueve, boton_variable_nombre_columna_cuarenta, boton_variable_nombre_columna_cuarentaiuno, boton_variable_nombre_columna_cuarentaidos, boton_variable_nombre_columna_cuarentaitres, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, boton_variable_columna_veintiseis, boton_variable_columna_veintisiete, boton_variable_columna_veintiocho, boton_variable_columna_veintinueve, boton_variable_columna_treinta, boton_variable_columna_treintaiuno, boton_variable_columna_treintaidos, boton_variable_columna_treintaitres, boton_variable_columna_treintaicuatro, boton_variable_columna_treintaicinco, boton_variable_columna_treintaiseis, boton_variable_columna_treintaisiete, boton_variable_columna_treintaiocho, boton_variable_columna_treintainueve, boton_variable_columna_cuarenta, boton_variable_columna_cuarentaiuno, boton_variable_columna_cuarentaidos, boton_variable_columna_cuarentaitres, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 44:
            // CUARENTAICUATRO
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, boton_variable_nombre_columna_veintiseis, boton_variable_nombre_columna_veintisiete, boton_variable_nombre_columna_veintiocho, boton_variable_nombre_columna_veintinueve, boton_variable_nombre_columna_treinta, boton_variable_nombre_columna_treintaiuno, boton_variable_nombre_columna_treintaidos, boton_variable_nombre_columna_treintaitres, boton_variable_nombre_columna_treintaicuatro, boton_variable_nombre_columna_treintaicinco, boton_variable_nombre_columna_treintaiseis, boton_variable_nombre_columna_treintaisiete, boton_variable_nombre_columna_treintaiocho, boton_variable_nombre_columna_treintainueve, boton_variable_nombre_columna_cuarenta, boton_variable_nombre_columna_cuarentaiuno, boton_variable_nombre_columna_cuarentaidos, boton_variable_nombre_columna_cuarentaitres, boton_variable_nombre_columna_cuarentaicuatro, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, boton_variable_columna_veintiseis, boton_variable_columna_veintisiete, boton_variable_columna_veintiocho, boton_variable_columna_veintinueve, boton_variable_columna_treinta, boton_variable_columna_treintaiuno, boton_variable_columna_treintaidos, boton_variable_columna_treintaitres, boton_variable_columna_treintaicuatro, boton_variable_columna_treintaicinco, boton_variable_columna_treintaiseis, boton_variable_columna_treintaisiete, boton_variable_columna_treintaiocho, boton_variable_columna_treintainueve, boton_variable_columna_cuarenta, boton_variable_columna_cuarentaiuno, boton_variable_columna_cuarentaidos, boton_variable_columna_cuarentaitres, boton_variable_columna_cuarentaicuatro, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 45:
            // CUARENTAICINCO
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, boton_variable_nombre_columna_veintiseis, boton_variable_nombre_columna_veintisiete, boton_variable_nombre_columna_veintiocho, boton_variable_nombre_columna_veintinueve, boton_variable_nombre_columna_treinta, boton_variable_nombre_columna_treintaiuno, boton_variable_nombre_columna_treintaidos, boton_variable_nombre_columna_treintaitres, boton_variable_nombre_columna_treintaicuatro, boton_variable_nombre_columna_treintaicinco, boton_variable_nombre_columna_treintaiseis, boton_variable_nombre_columna_treintaisiete, boton_variable_nombre_columna_treintaiocho, boton_variable_nombre_columna_treintainueve, boton_variable_nombre_columna_cuarenta, boton_variable_nombre_columna_cuarentaiuno, boton_variable_nombre_columna_cuarentaidos, boton_variable_nombre_columna_cuarentaitres, boton_variable_nombre_columna_cuarentaicuatro, boton_variable_nombre_columna_cuarentaicinco, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, boton_variable_columna_veintiseis, boton_variable_columna_veintisiete, boton_variable_columna_veintiocho, boton_variable_columna_veintinueve, boton_variable_columna_treinta, boton_variable_columna_treintaiuno, boton_variable_columna_treintaidos, boton_variable_columna_treintaitres, boton_variable_columna_treintaicuatro, boton_variable_columna_treintaicinco, boton_variable_columna_treintaiseis, boton_variable_columna_treintaisiete, boton_variable_columna_treintaiocho, boton_variable_columna_treintainueve, boton_variable_columna_cuarenta, boton_variable_columna_cuarentaiuno, boton_variable_columna_cuarentaidos, boton_variable_columna_cuarentaitres, boton_variable_columna_cuarentaicuatro, boton_variable_columna_cuarentaicinco, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 46:
            // CUARENTAISEIS
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, boton_variable_nombre_columna_veintiseis, boton_variable_nombre_columna_veintisiete, boton_variable_nombre_columna_veintiocho, boton_variable_nombre_columna_veintinueve, boton_variable_nombre_columna_treinta, boton_variable_nombre_columna_treintaiuno, boton_variable_nombre_columna_treintaidos, boton_variable_nombre_columna_treintaitres, boton_variable_nombre_columna_treintaicuatro, boton_variable_nombre_columna_treintaicinco, boton_variable_nombre_columna_treintaiseis, boton_variable_nombre_columna_treintaisiete, boton_variable_nombre_columna_treintaiocho, boton_variable_nombre_columna_treintainueve, boton_variable_nombre_columna_cuarenta, boton_variable_nombre_columna_cuarentaiuno, boton_variable_nombre_columna_cuarentaidos, boton_variable_nombre_columna_cuarentaitres, boton_variable_nombre_columna_cuarentaicuatro, boton_variable_nombre_columna_cuarentaicinco, boton_variable_nombre_columna_cuarentaiseis, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, boton_variable_columna_veintiseis, boton_variable_columna_veintisiete, boton_variable_columna_veintiocho, boton_variable_columna_veintinueve, boton_variable_columna_treinta, boton_variable_columna_treintaiuno, boton_variable_columna_treintaidos, boton_variable_columna_treintaitres, boton_variable_columna_treintaicuatro, boton_variable_columna_treintaicinco, boton_variable_columna_treintaiseis, boton_variable_columna_treintaisiete, boton_variable_columna_treintaiocho, boton_variable_columna_treintainueve, boton_variable_columna_cuarenta, boton_variable_columna_cuarentaiuno, boton_variable_columna_cuarentaidos, boton_variable_columna_cuarentaitres, boton_variable_columna_cuarentaicuatro, boton_variable_columna_cuarentaicinco, boton_variable_columna_cuarentaiseis, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 47:
            // CUARENTAISIETE
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, boton_variable_nombre_columna_veintiseis, boton_variable_nombre_columna_veintisiete, boton_variable_nombre_columna_veintiocho, boton_variable_nombre_columna_veintinueve, boton_variable_nombre_columna_treinta, boton_variable_nombre_columna_treintaiuno, boton_variable_nombre_columna_treintaidos, boton_variable_nombre_columna_treintaitres, boton_variable_nombre_columna_treintaicuatro, boton_variable_nombre_columna_treintaicinco, boton_variable_nombre_columna_treintaiseis, boton_variable_nombre_columna_treintaisiete, boton_variable_nombre_columna_treintaiocho, boton_variable_nombre_columna_treintainueve, boton_variable_nombre_columna_cuarenta, boton_variable_nombre_columna_cuarentaiuno, boton_variable_nombre_columna_cuarentaidos, boton_variable_nombre_columna_cuarentaitres, boton_variable_nombre_columna_cuarentaicuatro, boton_variable_nombre_columna_cuarentaicinco, boton_variable_nombre_columna_cuarentaiseis, boton_variable_nombre_columna_cuarentaisiete, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, boton_variable_columna_veintiseis, boton_variable_columna_veintisiete, boton_variable_columna_veintiocho, boton_variable_columna_veintinueve, boton_variable_columna_treinta, boton_variable_columna_treintaiuno, boton_variable_columna_treintaidos, boton_variable_columna_treintaitres, boton_variable_columna_treintaicuatro, boton_variable_columna_treintaicinco, boton_variable_columna_treintaiseis, boton_variable_columna_treintaisiete, boton_variable_columna_treintaiocho, boton_variable_columna_treintainueve, boton_variable_columna_cuarenta, boton_variable_columna_cuarentaiuno, boton_variable_columna_cuarentaidos, boton_variable_columna_cuarentaitres, boton_variable_columna_cuarentaicuatro, boton_variable_columna_cuarentaicinco, boton_variable_columna_cuarentaiseis, boton_variable_columna_cuarentaisiete, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 48:
            // CUARENTAIOCHO
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, boton_variable_nombre_columna_veintiseis, boton_variable_nombre_columna_veintisiete, boton_variable_nombre_columna_veintiocho, boton_variable_nombre_columna_veintinueve, boton_variable_nombre_columna_treinta, boton_variable_nombre_columna_treintaiuno, boton_variable_nombre_columna_treintaidos, boton_variable_nombre_columna_treintaitres, boton_variable_nombre_columna_treintaicuatro, boton_variable_nombre_columna_treintaicinco, boton_variable_nombre_columna_treintaiseis, boton_variable_nombre_columna_treintaisiete, boton_variable_nombre_columna_treintaiocho, boton_variable_nombre_columna_treintainueve, boton_variable_nombre_columna_cuarenta, boton_variable_nombre_columna_cuarentaiuno, boton_variable_nombre_columna_cuarentaidos, boton_variable_nombre_columna_cuarentaitres, boton_variable_nombre_columna_cuarentaicuatro, boton_variable_nombre_columna_cuarentaicinco, boton_variable_nombre_columna_cuarentaiseis, boton_variable_nombre_columna_cuarentaisiete, boton_variable_nombre_columna_cuarentaiocho, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, boton_variable_columna_veintiseis, boton_variable_columna_veintisiete, boton_variable_columna_veintiocho, boton_variable_columna_veintinueve, boton_variable_columna_treinta, boton_variable_columna_treintaiuno, boton_variable_columna_treintaidos, boton_variable_columna_treintaitres, boton_variable_columna_treintaicuatro, boton_variable_columna_treintaicinco, boton_variable_columna_treintaiseis, boton_variable_columna_treintaisiete, boton_variable_columna_treintaiocho, boton_variable_columna_treintainueve, boton_variable_columna_cuarenta, boton_variable_columna_cuarentaiuno, boton_variable_columna_cuarentaidos, boton_variable_columna_cuarentaitres, boton_variable_columna_cuarentaicuatro, boton_variable_columna_cuarentaicinco, boton_variable_columna_cuarentaiseis, boton_variable_columna_cuarentaisiete, boton_variable_columna_cuarentaiocho, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 49:
            // CUARENTAINUEVE
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, boton_variable_nombre_columna_veintiseis, boton_variable_nombre_columna_veintisiete, boton_variable_nombre_columna_veintiocho, boton_variable_nombre_columna_veintinueve, boton_variable_nombre_columna_treinta, boton_variable_nombre_columna_treintaiuno, boton_variable_nombre_columna_treintaidos, boton_variable_nombre_columna_treintaitres, boton_variable_nombre_columna_treintaicuatro, boton_variable_nombre_columna_treintaicinco, boton_variable_nombre_columna_treintaiseis, boton_variable_nombre_columna_treintaisiete, boton_variable_nombre_columna_treintaiocho, boton_variable_nombre_columna_treintainueve, boton_variable_nombre_columna_cuarenta, boton_variable_nombre_columna_cuarentaiuno, boton_variable_nombre_columna_cuarentaidos, boton_variable_nombre_columna_cuarentaitres, boton_variable_nombre_columna_cuarentaicuatro, boton_variable_nombre_columna_cuarentaicinco, boton_variable_nombre_columna_cuarentaiseis, boton_variable_nombre_columna_cuarentaisiete, boton_variable_nombre_columna_cuarentaiocho, boton_variable_nombre_columna_cuarentainueve, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, boton_variable_columna_veintiseis, boton_variable_columna_veintisiete, boton_variable_columna_veintiocho, boton_variable_columna_veintinueve, boton_variable_columna_treinta, boton_variable_columna_treintaiuno, boton_variable_columna_treintaidos, boton_variable_columna_treintaitres, boton_variable_columna_treintaicuatro, boton_variable_columna_treintaicinco, boton_variable_columna_treintaiseis, boton_variable_columna_treintaisiete, boton_variable_columna_treintaiocho, boton_variable_columna_treintainueve, boton_variable_columna_cuarenta, boton_variable_columna_cuarentaiuno, boton_variable_columna_cuarentaidos, boton_variable_columna_cuarentaitres, boton_variable_columna_cuarentaicuatro, boton_variable_columna_cuarentaicinco, boton_variable_columna_cuarentaiseis, boton_variable_columna_cuarentaisiete, boton_variable_columna_cuarentaiocho, boton_variable_columna_cuarentainueve, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
        case 50:
            // CINCUENTA
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                NSLog(@"ENTRO");
                NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombre_proyecto_actual_censo_variable, boton_variable_nombre_columna_uno, boton_variable_nombre_columna_dos, boton_variable_nombre_columna_tres, boton_variable_nombre_columna_cuatro, boton_variable_nombre_columna_cinco, boton_variable_nombre_columna_seis, boton_variable_nombre_columna_siete, boton_variable_nombre_columna_ocho, boton_variable_nombre_columna_nueve, boton_variable_nombre_columna_diez, boton_variable_nombre_columna_once, boton_variable_nombre_columna_doce, boton_variable_nombre_columna_trece, boton_variable_nombre_columna_catorce, boton_variable_nombre_columna_quince, boton_variable_nombre_columna_dieciseis, boton_variable_nombre_columna_diecisiete, boton_variable_nombre_columna_dieciocho, boton_variable_nombre_columna_diecinueve, boton_variable_nombre_columna_veinte, boton_variable_nombre_columna_veintiuno, boton_variable_nombre_columna_veintidos, boton_variable_nombre_columna_veintitres, boton_variable_nombre_columna_veinticuatro, boton_variable_nombre_columna_veinticinco, boton_variable_nombre_columna_veintiseis, boton_variable_nombre_columna_veintisiete, boton_variable_nombre_columna_veintiocho, boton_variable_nombre_columna_veintinueve, boton_variable_nombre_columna_treinta, boton_variable_nombre_columna_treintaiuno, boton_variable_nombre_columna_treintaidos, boton_variable_nombre_columna_treintaitres, boton_variable_nombre_columna_treintaicuatro, boton_variable_nombre_columna_treintaicinco, boton_variable_nombre_columna_treintaiseis, boton_variable_nombre_columna_treintaisiete, boton_variable_nombre_columna_treintaiocho, boton_variable_nombre_columna_treintainueve, boton_variable_nombre_columna_cuarenta, boton_variable_nombre_columna_cuarentaiuno, boton_variable_nombre_columna_cuarentaidos, boton_variable_nombre_columna_cuarentaitres, boton_variable_nombre_columna_cuarentaicuatro, boton_variable_nombre_columna_cuarentaicinco, boton_variable_nombre_columna_cuarentaiseis, boton_variable_nombre_columna_cuarentaisiete, boton_variable_nombre_columna_cuarentaiocho, boton_variable_nombre_columna_cuarentainueve, boton_variable_nombre_columna_cincuenta, columna_latitud_variable, columna_longitud_variable, columna_fecha_variable, columna_censador_variable, columna_state_variable, boton_variable_columna_uno, boton_variable_columna_dos, boton_variable_columna_tres, boton_variable_columna_cuatro, boton_variable_columna_cinco, boton_variable_columna_seis, boton_variable_columna_siete, boton_variable_columna_ocho, boton_variable_columna_nueve, boton_variable_columna_diez, boton_variable_columna_once, boton_variable_columna_doce, boton_variable_columna_trece, boton_variable_columna_catorce, boton_variable_columna_quince, boton_variable_columna_dieciseis, boton_variable_columna_diecisiete, boton_variable_columna_dieciocho, boton_variable_columna_diecinueve, boton_variable_columna_veinte, boton_variable_columna_veintiuno, boton_variable_columna_veintidos, boton_variable_columna_veintitres, boton_variable_columna_veinticuatro, boton_variable_columna_veinticinco, boton_variable_columna_veintiseis, boton_variable_columna_veintisiete, boton_variable_columna_veintiocho, boton_variable_columna_veintinueve, boton_variable_columna_treinta, boton_variable_columna_treintaiuno, boton_variable_columna_treintaidos, boton_variable_columna_treintaitres, boton_variable_columna_treintaicuatro, boton_variable_columna_treintaicinco, boton_variable_columna_treintaiseis, boton_variable_columna_treintaisiete, boton_variable_columna_treintaiocho, boton_variable_columna_treintainueve, boton_variable_columna_cuarenta, boton_variable_columna_cuarentaiuno, boton_variable_columna_cuarentaidos, boton_variable_columna_cuarentaitres, boton_variable_columna_cuarentaicuatro, boton_variable_columna_cuarentaicinco, boton_variable_columna_cuarentaiseis, boton_variable_columna_cuarentaisiete, boton_variable_columna_cuarentaiocho, boton_variable_columna_cuarentainueve, boton_variable_columna_cincuenta, latitud_variable, longitud_variable, fecha_variable, censador_variable, state_variable];
                
                const char *insert_stmt = [insertStmt UTF8String];
                
                if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                    
                    NSLog(@"BOTON AGREGADO VARIABLE");
                    
                    UIAlertView *alertVariable = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Dato agregado correctamente" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    
                    [alertVariable show];
                }
                sqlite3_close(censos);
            }
            break;
            
        default:
            break;
    }
    
    

    
    
    
    
    
}
@end
