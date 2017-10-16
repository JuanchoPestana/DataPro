//
//  MapaCensoViewController.m
//  Censos
//
//  Created by Juan Pestana on 1/20/16.
//  Copyright © 2016 DPSoftware. All rights reserved.
//

#import "MapaCensoViewController.h"

@interface MapaCensoViewController (){
    
    // VARIABLES DE LOCALIZACION
    NSMutableArray *arrayOfLocation;
    CLLocationManager *locationManager;
    CLLocationManager *startlocation;
    
    // VARIABLES DE SQLITE
    sqlite3 *censos;
    NSString *dbPathString;
    
    // ARREGLO DONDE VOY A PONER LA INFO PARA EL TABLEVIEW
    NSMutableArray *arrayOfDato;
    
    
}

@end

NSString *mapa_latitud_mapaCenso;
NSString *mapa_longitud_mapaCenso;

// VARIABLES GLOBALES PARA PONER INFO EN LOS PINS DEL MAPA
NSString *mapa_nombre_uno_mapaCenso;
NSString *mapa_info_uno_mapaCenso;
NSString *mapa_nombre_dos_mapaCenso;
NSString *mapa_info_dos_mapaCenso;
NSString *mapa_id_mapaCenso;

NSString *nombre_proyecto_actual_mapaCenso;
NSString *numero_columnas_mapaCenso;



@implementation MapaCensoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self selfActualizarVARIABLE];



    [self.mapaCensoGrande setUserTrackingMode:MKUserTrackingModeFollow animated:YES];


    [self anotaciones];

}



//////////////////////////////////////////////////// VARIABLE DE NOMBRE DE PROYECTO ACTUAL ////////////////////////////////////////////////////
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
    [self createOrOpenDBNombreProyectoActual];
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        
        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM NOMBREPROYECTOACTUAL"];
        const char* query_sql = [querySql UTF8String];
        
        
        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
            while (sqlite3_step(statement)==SQLITE_ROW) {
                
                // AQUI SE AGARRA EL NOMBRE DEL PROYECTO ACTUAL DE LA BASE DE DATOS DE SQLITE
                NSString *nombreDeProyecto = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                NSString *numeroColumnas = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                
                
                _titulo_label.text = nombreDeProyecto;
                
                nombre_proyecto_actual_mapaCenso =  nombreDeProyecto;
                numero_columnas_mapaCenso = numeroColumnas;
                
                
                
            }
        }
    }
    sqlite3_close(censos);
    
}












// CONFIGURACION DEL MAPA
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    
    MKCoordinateRegion mapRegion;
    mapRegion.center = _mapaCensoGrande.userLocation.coordinate;
    mapRegion.span.latitudeDelta = 0.025;
    mapRegion.span.longitudeDelta = 0.025;
    
    
    [_mapaCensoGrande setRegion:mapRegion animated: YES];
    
    
}


-(void)anotaciones{
    
    
    
    
    // ESTO ES PARA ABRIR LA BASE DE DATOS DONDE ESTA EL PROYECTO ACTUAL
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombre_proyecto_actual_mapaCenso];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        
        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@", nombre_proyecto_actual_mapaCenso];
        const char* query_sql = [querySql UTF8String];
        
        int numero_columnas_int = [numero_columnas_mapaCenso intValue];
        NSLog(@"%@", nombre_proyecto_actual_mapaCenso);
        
        switch (numero_columnas_int) {
            case 1:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE FINAL
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        
                        
                        [self plotMapa];
                        
                        
                    }
                }
                break;
            case 2:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        
                        
                        [self plotMapa];
                        
                    }
                }
                break;
            case 3:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        
                        [self plotMapa];
                        
                    }
                }
                break;
            case 4:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                        
                    }
                }
                break;
            case 5:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                        
                        
                    }
                }
                break;
            case 6:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                        
                        
                    }
                }
                break;
            case 7:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                        
                    }
                }
                break;
            case 8:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                        
                    }
                }
                break;
            case 9:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                        
                    }
                }
                break;
            case 10:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                        
                    }
                }
                break;
            case 11:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                        
                        
                    }
                }
                break;
            case 12:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                        
                    }
                }
                break;
            case 13:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                        
                    }
                }
                break;
            case 14:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                        
                    }
                }
                break;
            case 15:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                        
                    }
                }
                break;
            case 16:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 17:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                        
                    }
                }
                break;
            case 18:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                        
                    }
                }
                break;
            case 19:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 20:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 21:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 22:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 23:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 24:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 25:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 26:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 27:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 28:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 29:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 30:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 32)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 31:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 32)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 33)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 32:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 33)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 34)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 33:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 34)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 35)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 34:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 35)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 36)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 35:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 36)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 37)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 36:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 37)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 38)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 37:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 38)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 39)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 38:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 39)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 40)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 39:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 40)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 41)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 40:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 41)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 42)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 41:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 42)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 43)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 42:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 43)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 44)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 43:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 44)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 45)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 44:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 45)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 46)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 45:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 46)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 47)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 46:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 47)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 48)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 47:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 48)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 49)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                        
                    }
                }
                break;
            case 48:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 49)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 50)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                    }
                }
                break;
            case 49:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 50)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 51)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                        
                    }
                }
                break;
            case 50:
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        // AQUI SE AGARRAN LAS COLUMNAS DE LA BASE BOTON
                        NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 51)];
                        NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 52)];
                        mapa_latitud_mapaCenso = latitud;
                        mapa_longitud_mapaCenso = longitud;
                        // NOMBRES COLUMNAS UNO Y DOS
                        NSString *nombre_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                        NSString *nombre_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                        // INFO COLUMNAS UNO Y DOS
                        NSString *info_columna_uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                        NSString *info_columna_dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                        // METER EN VARIABLES
                        mapa_nombre_uno_mapaCenso = nombre_columna_uno;
                        mapa_nombre_dos_mapaCenso = nombre_columna_dos;
                        mapa_info_uno_mapaCenso = info_columna_uno;
                        mapa_info_dos_mapaCenso = info_columna_dos;
                        
                        NSString *id_mapa = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        mapa_id_mapaCenso = id_mapa;
                        [self plotMapa];
                        
                    }
                }
                break;
                
            default:
                break;
        }
    }
    
}



-(void)plotMapa{
    
    NSString *titulo;
    int numero_columnas = [numero_columnas_mapaCenso intValue];
    
    if (numero_columnas == 1) {
        titulo = [NSString stringWithFormat:@"%@) %@: %@", mapa_id_mapaCenso, mapa_nombre_uno_mapaCenso, mapa_info_uno_mapaCenso];
    }else
    {
        titulo = [NSString stringWithFormat:@"%@) %@: %@ / %@: %@", mapa_id_mapaCenso, mapa_nombre_uno_mapaCenso, mapa_info_uno_mapaCenso, mapa_nombre_dos_mapaCenso, mapa_info_dos_mapaCenso];
    }
    
    
    MKPointAnnotation *myAnnotation = [[MKPointAnnotation alloc] init];
    
    double lat = [mapa_latitud_mapaCenso doubleValue];
    double lon = [mapa_longitud_mapaCenso doubleValue];
    
    CLLocationCoordinate2D pinCoordinate;
    pinCoordinate.latitude = lat;
    pinCoordinate.longitude = lon;
    
    myAnnotation.coordinate = pinCoordinate;
    myAnnotation.title = titulo;
    [self.mapaCensoGrande addAnnotation:myAnnotation];
    
    
}


@end
