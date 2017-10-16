//
//  ViewController.m
//  Censos
//
//  Created by Juan Pestana on 9/9/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "ViewController.h"

#import "Reachibility.h"

@interface ViewController (){
    
    // VARIABLES DE LOCALIZACION
    NSMutableArray *arrayOfLocation;
    CLLocationManager *locationManager;
    CLLocationManager *startlocation;

    // VARIABLES DE SQLITE
    sqlite3 *censos;
    NSString *dbPathString;
    
    // ESTE ID_NUM ES PARA EL METODO DE UPDATE STATE
    NSString *id_num;
    
    // ESTE BOOL ES PARA VER SI HAY DATOS CON STATE "PENDING" O NO
    bool entrar;
    
}

@end

// VARIABLES GLOBALES

//ESTAS VARIABLES SON PARA TRAER LA INFO DE MYSQL Y PODER CREAR LAS TABLAS CON NOMBRES VARIABLES
NSString *nombre_proyecto_actual_censo_batch;
NSString *numero_columnas_proyecto_batch;
NSString *latitud_batch;
NSString *longitud_batch;
NSString *fecha_batch;
NSString *censador_batch;
NSString *columna_state_batch;
NSString *state_batch;

NSString *columna_latitud_batch;
NSString *columna_longitud_batch;
NSString *columna_fecha_batch;
NSString *columna_censador_batch;

NSString *columna_uno_batch;
NSString *columna_dos_batch;
NSString *columna_tres_batch;
NSString *columna_cuatro_batch;
NSString *columna_cinco_batch;
NSString *columna_seis_batch;
NSString *columna_siete_batch;
NSString *columna_ocho_batch;
NSString *columna_nueve_batch;
NSString *columna_diez_batch;
NSString *columna_once_batch;
NSString *columna_doce_batch;
NSString *columna_trece_batch;
NSString *columna_catorce_batch;
NSString *columna_quince_batch;
NSString *columna_dieciseis_batch;
NSString *columna_diecisiete_batch;
NSString *columna_dieciocho_batch;
NSString *columna_diecinueve_batch;
NSString *columna_veinte_batch;
NSString *columna_veintiuno_batch;
NSString *columna_veintidos_batch;
NSString *columna_veintitres_batch;
NSString *columna_veinticuatro_batch;
NSString *columna_veinticinco_batch;
NSString *columna_veintiseis_batch;
NSString *columna_veintisiete_batch;
NSString *columna_veintiocho_batch;
NSString *columna_veintinueve_batch;
NSString *columna_treinta_batch;
NSString *columna_treintaiuno_batch;
NSString *columna_treintaidos_batch;
NSString *columna_treintaitres_batch;
NSString *columna_treintaicuatro_batch;
NSString *columna_treintaicinco_batch;
NSString *columna_treintaiseis_batch;
NSString *columna_treintaisiete_batch;
NSString *columna_treintaiocho_batch;
NSString *columna_treintainueve_batch;
NSString *columna_cuarenta_batch;
NSString *columna_cuarentaiuno_batch;
NSString *columna_cuarentaidos_batch;
NSString *columna_cuarentaitres_batch;
NSString *columna_cuarentaicuatro_batch;
NSString *columna_cuarentaicinco_batch;
NSString *columna_cuarentaiseis_batch;
NSString *columna_cuarentaisiete_batch;
NSString *columna_cuarentaiocho_batch;
NSString *columna_cuarentainueve_batch;
NSString *columna_cincuenta_batch;



// NOMBRES DE COLUMNAS DE BASES DE DATOS
NSString *nombre_columna_uno_batch;
NSString *nombre_columna_dos_batch;
NSString *nombre_columna_tres_batch;
NSString *nombre_columna_cuatro_batch;
NSString *nombre_columna_cinco_batch;
NSString *nombre_columna_seis_batch;
NSString *nombre_columna_siete_batch;
NSString *nombre_columna_ocho_batch;
NSString *nombre_columna_nueve_batch;
NSString *nombre_columna_diez_batch;
NSString *nombre_columna_once_batch;
NSString *nombre_columna_doce_batch;
NSString *nombre_columna_trece_batch;
NSString *nombre_columna_catorce_batch;
NSString *nombre_columna_quince_batch;
NSString *nombre_columna_dieciseis_batch;
NSString *nombre_columna_diecisiete_batch;
NSString *nombre_columna_dieciocho_batch;
NSString *nombre_columna_diecinueve_batch;
NSString *nombre_columna_veinte_batch;
NSString *nombre_columna_veintiuno_batch;
NSString *nombre_columna_veintidos_batch;
NSString *nombre_columna_veintitres_batch;
NSString *nombre_columna_veinticuatro_batch;
NSString *nombre_columna_veinticinco_batch;
NSString *nombre_columna_veintiseis_batch;
NSString *nombre_columna_veintisiete_batch;
NSString *nombre_columna_veintiocho_batch;
NSString *nombre_columna_veintinueve_batch;
NSString *nombre_columna_treinta_batch;
NSString *nombre_columna_treintaiuno_batch;
NSString *nombre_columna_treintaidos_batch;
NSString *nombre_columna_treintaitres_batch;
NSString *nombre_columna_treintaicuatro_batch;
NSString *nombre_columna_treintaicinco_batch;
NSString *nombre_columna_treintaiseis_batch;
NSString *nombre_columna_treintaisiete_batch;
NSString *nombre_columna_treintaiocho_batch;
NSString *nombre_columna_treintainueve_batch;
NSString *nombre_columna_cuarenta_batch;
NSString *nombre_columna_cuarentaiuno_batch;
NSString *nombre_columna_cuarentaidos_batch;
NSString *nombre_columna_cuarentaitres_batch;
NSString *nombre_columna_cuarentaicuatro_batch;
NSString *nombre_columna_cuarentaicinco_batch;
NSString *nombre_columna_cuarentaiseis_batch;
NSString *nombre_columna_cuarentaisiete_batch;
NSString *nombre_columna_cuarentaiocho_batch;
NSString *nombre_columna_cuarentainueve_batch;
NSString *nombre_columna_cincuenta_batch;




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // PEDIR PERMISO PARA LA LOCALIZACION
    locationManager = [[CLLocationManager alloc]init];

    [locationManager startUpdatingLocation];
    [locationManager requestAlwaysAuthorization];

    
   // NSLog(@"Documents Directory: %@", [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject]);
    
    // AQUI SE ABRE LA BASE DONDE ESTA EL NOMBRE DEL PROYECTO ACTUAL
    [self createOrOpenDBNombreProyectoActual];
    [self selfActualizarVARIABLE];
    
    [self createOrOpenDBTITULOS];
    
    
//    latitud_batch = @"25.6411506784";
//    longitud_batch = @"longitud";
//    fecha_batch = @"fecha";
//    censador_batch = @"censador";
    
    
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
                
                
                // ESTA ES UNA VARIABLE GLOBAL QUE CREE ARRIBA DEL CODIGO PARA GUARDAR, PARA TODO ESTE ARCHIVO, EL NOMBRE DEL PROYECTO ACTUAL
                // EL CUAL SACAMOS DE LA FAMOSA BASE DE NOMBREPROYECTOACTUAL
                nombre_proyecto_actual_censo_batch = nombreDeProyecto;
                numero_columnas_proyecto_batch = numeroColumnas;
                
            }
        }
    }
    sqlite3_close(censos);
    
}


-(void)createOrOpenDBTITULOS{
    
    // AQUI SE CREA LA TABLA EN DONDE SE VA A GUARDAR EL PROYECTO ACTUAL
    // ESTA TABLA ES DE SUMA IMPORTANCIA PORQUE AQUI ES DONDE ESTA EL NOMBRE DEL PROYECTO ACTUAL, EL CUAL SE UTILIZA EN DIFERENTES PANTALLAS
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    dbPathString = [docPath stringByAppendingPathComponent:@"titulos.db"];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS TITULOS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NOMBREPROYECTO TEXT, UNO TEXT, DOS TEXT, TRES TEXT, CUATRO TEXT, CINCO TEXT, SEIS TEXT, SIETE TEXT, OCHO TEXT, NUEVE TEXT, DIEZ TEXT, ONCE TEXT, DOCE TEXT, TRECE TEXT, CATORCE TEXT, QUINCE TEXT)";
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA TITULOS CREADA");
        }
    }
}



- (IBAction)sync:(id)sender {
    
    
    // ESTE ES EL METODO PARA VERIFICAR SI HAY INTERNET
    // LO QUE HICE FUE DESCARGAR LA CLASE "REACHABILITY" DE APPLE, Y LLAMAR ESTE METODO, ESO ES TODO
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        NSLog(@"There IS NO internet connection");
        
        UIAlertView *alertInternet = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"No hay conexion a internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];

        [alertInternet show];
        
    } else {
        NSLog(@"There IS internet connection");
        // SI HAY INTERNET, HACE TODO EL METODO, SI NO NO Y MUESTRA UN ALERTVIEW
        
        
        do{
            
            ////////////////////////////////////////////////////// AQUI SE CREA EL STRING CONCATENADO QUE SE ENVIA A MYSQL ////////////////////////////////////////////////
            
            // ESTE ES EL STRING CONCATENADO QUE SE MANDA AL ARCHIVO PHP
            NSMutableString* result = [NSMutableString stringWithCapacity:50000];
            
            //////////////////////////////////////////////  AQUI ABRIMOS LA BASE DE DATOS DEL PROYECTO EN EL QUE ESTAMOS TRABAJANDO ////////////////////////////////////////////////////////////////////
            int numero_columnas_proyecto_batch_int = [numero_columnas_proyecto_batch intValue];
            
            
            // ESTO ES PARA ABRIR LA BASE DE DATOS DONDE ESTA EL PROYECTO ACTUAL
            NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *docPath = [path objectAtIndex:0];
            
            NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombre_proyecto_actual_censo_batch];
            
            dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
            
            sqlite3_stmt *statement;
            
            // AQUI EMPIEZA EL SWITCH DEPENDIENDO EL NUMERO DE COLUMNAS
            // EN ESTE SWITCH VAMOS A AGARRAR LOS NOMBRES DE LAS COLUMNAS Y LOS DATOS PARA METERLOS AL STRING QUE VA A IR AL BATCH
            
            switch (numero_columnas_proyecto_batch_int) {
                case 1:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                
                                
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 2:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                

                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 3:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                
                               
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 4:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                
                                
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 5:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                
                               

                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 6:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                
                                
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 7:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                
                                
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic, siete, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 8:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                
                                
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 9:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 10:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);

                    break;
                    
                case 11:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                             
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 12:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                
                            
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 13:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                
                               
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 14:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                
                               
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 15:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                           
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 16:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                
                           
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 17:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                
                        
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 18:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                
                              
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 19:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                
                                
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 20:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                
                               
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 21:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                
                                
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 22:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                
                            
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 23:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];

                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 24:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                

                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 25:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                
                               
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 26:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                                
                            
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                NSString *nombre_columna_veintiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                nombre_columna_veintiseis_batch = nombre_columna_veintiseis_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&veintiseis%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, veintiseis, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 27:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                                
                            
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                NSString *nombre_columna_veintiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                                NSString *nombre_columna_veintisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                nombre_columna_veintiseis_batch = nombre_columna_veintiseis_batch_this;
                                nombre_columna_veintisiete_batch = nombre_columna_veintisiete_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&veintiseis%d=%@&veintisiete%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, veintiseis, ic, veintisiete, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 28:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 32)];
                                
                                
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                NSString *nombre_columna_veintiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                                NSString *nombre_columna_veintisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                                NSString *nombre_columna_veintiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                nombre_columna_veintiseis_batch = nombre_columna_veintiseis_batch_this;
                                nombre_columna_veintisiete_batch = nombre_columna_veintisiete_batch_this;
                                nombre_columna_veintiocho_batch = nombre_columna_veintiocho_batch_this;
                                
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&veintiseis%d=%@&veintisiete%d=%@&veintiocho%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, veintiseis, ic, veintisiete, ic, veintiocho, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 29:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 32)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 33)];
                                
                                
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                NSString *nombre_columna_veintiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                                NSString *nombre_columna_veintisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                                NSString *nombre_columna_veintiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                                NSString *nombre_columna_veintinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                nombre_columna_veintiseis_batch = nombre_columna_veintiseis_batch_this;
                                nombre_columna_veintisiete_batch = nombre_columna_veintisiete_batch_this;
                                nombre_columna_veintiocho_batch = nombre_columna_veintiocho_batch_this;
                                nombre_columna_veintinueve_batch = nombre_columna_veintinueve_batch_this;
                                
                                
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&veintiseis%d=%@&veintisiete%d=%@&veintiocho%d=%@&veintinueve%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, veintiseis, ic, veintisiete, ic, veintiocho, ic, veintinueve, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 30:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                NSString *treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 32)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 33)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 34)];
                                
                            
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                NSString *nombre_columna_veintiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                                NSString *nombre_columna_veintisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                                NSString *nombre_columna_veintiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                                NSString *nombre_columna_veintinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                                NSString *nombre_columna_treinta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                nombre_columna_veintiseis_batch = nombre_columna_veintiseis_batch_this;
                                nombre_columna_veintisiete_batch = nombre_columna_veintisiete_batch_this;
                                nombre_columna_veintiocho_batch = nombre_columna_veintiocho_batch_this;
                                nombre_columna_veintinueve_batch = nombre_columna_veintinueve_batch_this;
                                nombre_columna_treinta_batch = nombre_columna_treinta_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&veintiseis%d=%@&veintisiete%d=%@&veintiocho%d=%@&veintinueve%d=%@&treinta%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, veintiseis, ic, veintisiete, ic, veintiocho, ic, veintinueve, ic, treinta, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 31:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                NSString *treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                                NSString *treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 32)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 33)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 34)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 35)];
                                
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                NSString *nombre_columna_veintiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                                NSString *nombre_columna_veintisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                                NSString *nombre_columna_veintiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                                NSString *nombre_columna_veintinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                                NSString *nombre_columna_treinta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                                NSString *nombre_columna_treintaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                nombre_columna_veintiseis_batch = nombre_columna_veintiseis_batch_this;
                                nombre_columna_veintisiete_batch = nombre_columna_veintisiete_batch_this;
                                nombre_columna_veintiocho_batch = nombre_columna_veintiocho_batch_this;
                                nombre_columna_veintinueve_batch = nombre_columna_veintinueve_batch_this;
                                nombre_columna_treinta_batch = nombre_columna_treinta_batch_this;
                                nombre_columna_treintaiuno_batch = nombre_columna_treintaiuno_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&veintiseis%d=%@&veintisiete%d=%@&veintiocho%d=%@&veintinueve%d=%@&treinta%d=%@&treintaiuno%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, veintiseis, ic, veintisiete, ic, veintiocho, ic, veintinueve, ic, treinta, ic, treintaiuno, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 32:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                NSString *treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                                NSString *treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                                NSString *treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 32)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 33)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 34)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 35)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 36)];
                                
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                NSString *nombre_columna_veintiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                                NSString *nombre_columna_veintisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                                NSString *nombre_columna_veintiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                                NSString *nombre_columna_veintinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                                NSString *nombre_columna_treinta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                                NSString *nombre_columna_treintaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                                NSString *nombre_columna_treintaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                nombre_columna_veintiseis_batch = nombre_columna_veintiseis_batch_this;
                                nombre_columna_veintisiete_batch = nombre_columna_veintisiete_batch_this;
                                nombre_columna_veintiocho_batch = nombre_columna_veintiocho_batch_this;
                                nombre_columna_veintinueve_batch = nombre_columna_veintinueve_batch_this;
                                nombre_columna_treinta_batch = nombre_columna_treinta_batch_this;
                                nombre_columna_treintaiuno_batch = nombre_columna_treintaiuno_batch_this;
                                nombre_columna_treintaidos_batch = nombre_columna_treintaidos_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&veintiseis%d=%@&veintisiete%d=%@&veintiocho%d=%@&veintinueve%d=%@&treinta%d=%@&treintaiuno%d=%@&treintaidos%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, veintiseis, ic, veintisiete, ic, veintiocho, ic, veintinueve, ic, treinta, ic, treintaiuno, ic, treintaidos, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 33:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                NSString *treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                                NSString *treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                                NSString *treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 32)];
                                NSString *treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 33)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 34)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 35)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 36)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 37)];
                                
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                NSString *nombre_columna_veintiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                                NSString *nombre_columna_veintisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                                NSString *nombre_columna_veintiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                                NSString *nombre_columna_veintinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                                NSString *nombre_columna_treinta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                                NSString *nombre_columna_treintaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                                NSString *nombre_columna_treintaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                                NSString *nombre_columna_treintaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                nombre_columna_veintiseis_batch = nombre_columna_veintiseis_batch_this;
                                nombre_columna_veintisiete_batch = nombre_columna_veintisiete_batch_this;
                                nombre_columna_veintiocho_batch = nombre_columna_veintiocho_batch_this;
                                nombre_columna_veintinueve_batch = nombre_columna_veintinueve_batch_this;
                                nombre_columna_treinta_batch = nombre_columna_treinta_batch_this;
                                nombre_columna_treintaiuno_batch = nombre_columna_treintaiuno_batch_this;
                                nombre_columna_treintaidos_batch = nombre_columna_treintaidos_batch_this;
                                nombre_columna_treintaitres_batch = nombre_columna_treintaitres_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&veintiseis%d=%@&veintisiete%d=%@&veintiocho%d=%@&veintinueve%d=%@&treinta%d=%@&treintaiuno%d=%@&treintaidos%d=%@&treintaitres%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, veintiseis, ic, veintisiete, ic, veintiocho, ic, veintinueve, ic, treinta, ic, treintaiuno, ic, treintaidos, ic, treintaitres, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 34:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                NSString *treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                                NSString *treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                                NSString *treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 32)];
                                NSString *treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 33)];
                                NSString *treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 34)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 35)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 36)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 37)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 38)];
                                
                    
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                NSString *nombre_columna_veintiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                                NSString *nombre_columna_veintisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                                NSString *nombre_columna_veintiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                                NSString *nombre_columna_veintinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                                NSString *nombre_columna_treinta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                                NSString *nombre_columna_treintaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                                NSString *nombre_columna_treintaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                                NSString *nombre_columna_treintaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                                NSString *nombre_columna_treintaicuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                nombre_columna_veintiseis_batch = nombre_columna_veintiseis_batch_this;
                                nombre_columna_veintisiete_batch = nombre_columna_veintisiete_batch_this;
                                nombre_columna_veintiocho_batch = nombre_columna_veintiocho_batch_this;
                                nombre_columna_veintinueve_batch = nombre_columna_veintinueve_batch_this;
                                nombre_columna_treinta_batch = nombre_columna_treinta_batch_this;
                                nombre_columna_treintaiuno_batch = nombre_columna_treintaiuno_batch_this;
                                nombre_columna_treintaidos_batch = nombre_columna_treintaidos_batch_this;
                                nombre_columna_treintaitres_batch = nombre_columna_treintaitres_batch_this;
                                nombre_columna_treintaicuatro_batch = nombre_columna_treintaicuatro_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&veintiseis%d=%@&veintisiete%d=%@&veintiocho%d=%@&veintinueve%d=%@&treinta%d=%@&treintaiuno%d=%@&treintaidos%d=%@&treintaitres%d=%@&treintaicuatro%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, veintiseis, ic, veintisiete, ic, veintiocho, ic, veintinueve, ic, treinta, ic, treintaiuno, ic, treintaidos, ic, treintaitres, ic, treintaicuatro, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 35:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                NSString *treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                                NSString *treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                                NSString *treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 32)];
                                NSString *treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 33)];
                                NSString *treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 34)];
                                NSString *treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 35)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 36)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 37)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 38)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 39)];
                                
                            
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                NSString *nombre_columna_veintiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                                NSString *nombre_columna_veintisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                                NSString *nombre_columna_veintiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                                NSString *nombre_columna_veintinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                                NSString *nombre_columna_treinta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                                NSString *nombre_columna_treintaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                                NSString *nombre_columna_treintaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                                NSString *nombre_columna_treintaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                                NSString *nombre_columna_treintaicuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                                NSString *nombre_columna_treintaicinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                nombre_columna_veintiseis_batch = nombre_columna_veintiseis_batch_this;
                                nombre_columna_veintisiete_batch = nombre_columna_veintisiete_batch_this;
                                nombre_columna_veintiocho_batch = nombre_columna_veintiocho_batch_this;
                                nombre_columna_veintinueve_batch = nombre_columna_veintinueve_batch_this;
                                nombre_columna_treinta_batch = nombre_columna_treinta_batch_this;
                                nombre_columna_treintaiuno_batch = nombre_columna_treintaiuno_batch_this;
                                nombre_columna_treintaidos_batch = nombre_columna_treintaidos_batch_this;
                                nombre_columna_treintaitres_batch = nombre_columna_treintaitres_batch_this;
                                nombre_columna_treintaicuatro_batch = nombre_columna_treintaicuatro_batch_this;
                                nombre_columna_treintaicinco_batch = nombre_columna_treintaicinco_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&veintiseis%d=%@&veintisiete%d=%@&veintiocho%d=%@&veintinueve%d=%@&treinta%d=%@&treintaiuno%d=%@&treintaidos%d=%@&treintaitres%d=%@&treintaicuatro%d=%@&treintaicinco%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, veintiseis, ic, veintisiete, ic, veintiocho, ic, veintinueve, ic, treinta, ic, treintaiuno, ic, treintaidos, ic, treintaitres, ic, treintaicuatro, ic, treintaicinco, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 36:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                NSString *treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                                NSString *treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                                NSString *treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 32)];
                                NSString *treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 33)];
                                NSString *treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 34)];
                                NSString *treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 35)];
                                NSString *treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 36)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 37)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 38)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 39)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 40)];
                                
                                
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                NSString *nombre_columna_veintiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                                NSString *nombre_columna_veintisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                                NSString *nombre_columna_veintiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                                NSString *nombre_columna_veintinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                                NSString *nombre_columna_treinta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                                NSString *nombre_columna_treintaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                                NSString *nombre_columna_treintaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                                NSString *nombre_columna_treintaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                                NSString *nombre_columna_treintaicuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                                NSString *nombre_columna_treintaicinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                                NSString *nombre_columna_treintaiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                nombre_columna_veintiseis_batch = nombre_columna_veintiseis_batch_this;
                                nombre_columna_veintisiete_batch = nombre_columna_veintisiete_batch_this;
                                nombre_columna_veintiocho_batch = nombre_columna_veintiocho_batch_this;
                                nombre_columna_veintinueve_batch = nombre_columna_veintinueve_batch_this;
                                nombre_columna_treinta_batch = nombre_columna_treinta_batch_this;
                                nombre_columna_treintaiuno_batch = nombre_columna_treintaiuno_batch_this;
                                nombre_columna_treintaidos_batch = nombre_columna_treintaidos_batch_this;
                                nombre_columna_treintaitres_batch = nombre_columna_treintaitres_batch_this;
                                nombre_columna_treintaicuatro_batch = nombre_columna_treintaicuatro_batch_this;
                                nombre_columna_treintaicinco_batch = nombre_columna_treintaicinco_batch_this;
                                nombre_columna_treintaiseis_batch = nombre_columna_treintaiseis_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&veintiseis%d=%@&veintisiete%d=%@&veintiocho%d=%@&veintinueve%d=%@&treinta%d=%@&treintaiuno%d=%@&treintaidos%d=%@&treintaitres%d=%@&treintaicuatro%d=%@&treintaicinco%d=%@&treintaiseis%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, veintiseis, ic, veintisiete, ic, veintiocho, ic, veintinueve, ic, treinta, ic, treintaiuno, ic, treintaidos, ic, treintaitres, ic, treintaicuatro, ic, treintaicinco, ic, treintaiseis, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 37:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                NSString *treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                                NSString *treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                                NSString *treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 32)];
                                NSString *treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 33)];
                                NSString *treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 34)];
                                NSString *treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 35)];
                                NSString *treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 36)];
                                NSString *treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 37)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 38)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 39)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 40)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 41)];
                                
                                
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                NSString *nombre_columna_veintiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                                NSString *nombre_columna_veintisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                                NSString *nombre_columna_veintiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                                NSString *nombre_columna_veintinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                                NSString *nombre_columna_treinta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                                NSString *nombre_columna_treintaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                                NSString *nombre_columna_treintaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                                NSString *nombre_columna_treintaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                                NSString *nombre_columna_treintaicuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                                NSString *nombre_columna_treintaicinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                                NSString *nombre_columna_treintaiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                                NSString *nombre_columna_treintaisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                nombre_columna_veintiseis_batch = nombre_columna_veintiseis_batch_this;
                                nombre_columna_veintisiete_batch = nombre_columna_veintisiete_batch_this;
                                nombre_columna_veintiocho_batch = nombre_columna_veintiocho_batch_this;
                                nombre_columna_veintinueve_batch = nombre_columna_veintinueve_batch_this;
                                nombre_columna_treinta_batch = nombre_columna_treinta_batch_this;
                                nombre_columna_treintaiuno_batch = nombre_columna_treintaiuno_batch_this;
                                nombre_columna_treintaidos_batch = nombre_columna_treintaidos_batch_this;
                                nombre_columna_treintaitres_batch = nombre_columna_treintaitres_batch_this;
                                nombre_columna_treintaicuatro_batch = nombre_columna_treintaicuatro_batch_this;
                                nombre_columna_treintaicinco_batch = nombre_columna_treintaicinco_batch_this;
                                nombre_columna_treintaiseis_batch = nombre_columna_treintaiseis_batch_this;
                                nombre_columna_treintaisiete_batch = nombre_columna_treintaisiete_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&veintiseis%d=%@&veintisiete%d=%@&veintiocho%d=%@&veintinueve%d=%@&treinta%d=%@&treintaiuno%d=%@&treintaidos%d=%@&treintaitres%d=%@&treintaicuatro%d=%@&treintaicinco%d=%@&treintaiseis%d=%@&treintaisiete%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, veintiseis, ic, veintisiete, ic, veintiocho, ic, veintinueve, ic, treinta, ic, treintaiuno, ic, treintaidos, ic, treintaitres, ic, treintaicuatro, ic, treintaicinco, ic, treintaiseis, ic, treintaisiete, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 38:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                NSString *treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                                NSString *treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                                NSString *treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 32)];
                                NSString *treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 33)];
                                NSString *treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 34)];
                                NSString *treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 35)];
                                NSString *treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 36)];
                                NSString *treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 37)];
                                NSString *treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 38)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 39)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 40)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 41)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 42)];
                                
                                
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                NSString *nombre_columna_veintiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                                NSString *nombre_columna_veintisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                                NSString *nombre_columna_veintiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                                NSString *nombre_columna_veintinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                                NSString *nombre_columna_treinta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                                NSString *nombre_columna_treintaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                                NSString *nombre_columna_treintaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                                NSString *nombre_columna_treintaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                                NSString *nombre_columna_treintaicuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                                NSString *nombre_columna_treintaicinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                                NSString *nombre_columna_treintaiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                                NSString *nombre_columna_treintaisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                                NSString *nombre_columna_treintaiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                nombre_columna_veintiseis_batch = nombre_columna_veintiseis_batch_this;
                                nombre_columna_veintisiete_batch = nombre_columna_veintisiete_batch_this;
                                nombre_columna_veintiocho_batch = nombre_columna_veintiocho_batch_this;
                                nombre_columna_veintinueve_batch = nombre_columna_veintinueve_batch_this;
                                nombre_columna_treinta_batch = nombre_columna_treinta_batch_this;
                                nombre_columna_treintaiuno_batch = nombre_columna_treintaiuno_batch_this;
                                nombre_columna_treintaidos_batch = nombre_columna_treintaidos_batch_this;
                                nombre_columna_treintaitres_batch = nombre_columna_treintaitres_batch_this;
                                nombre_columna_treintaicuatro_batch = nombre_columna_treintaicuatro_batch_this;
                                nombre_columna_treintaicinco_batch = nombre_columna_treintaicinco_batch_this;
                                nombre_columna_treintaiseis_batch = nombre_columna_treintaiseis_batch_this;
                                nombre_columna_treintaisiete_batch = nombre_columna_treintaisiete_batch_this;
                                nombre_columna_treintaiocho_batch = nombre_columna_treintaiocho_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&veintiseis%d=%@&veintisiete%d=%@&veintiocho%d=%@&veintinueve%d=%@&treinta%d=%@&treintaiuno%d=%@&treintaidos%d=%@&treintaitres%d=%@&treintaicuatro%d=%@&treintaicinco%d=%@&treintaiseis%d=%@&treintaisiete%d=%@&treintaiocho%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, veintiseis, ic, veintisiete, ic, veintiocho, ic, veintinueve, ic, treinta, ic, treintaiuno, ic, treintaidos, ic, treintaitres, ic, treintaicuatro, ic, treintaicinco, ic, treintaiseis, ic, treintaisiete, ic, treintaiocho, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 39:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                NSString *treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                                NSString *treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                                NSString *treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 32)];
                                NSString *treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 33)];
                                NSString *treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 34)];
                                NSString *treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 35)];
                                NSString *treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 36)];
                                NSString *treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 37)];
                                NSString *treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 38)];
                                NSString *treintainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 39)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 40)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 41)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 42)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 43)];
                                
                               
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                NSString *nombre_columna_veintiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                                NSString *nombre_columna_veintisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                                NSString *nombre_columna_veintiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                                NSString *nombre_columna_veintinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                                NSString *nombre_columna_treinta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                                NSString *nombre_columna_treintaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                                NSString *nombre_columna_treintaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                                NSString *nombre_columna_treintaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                                NSString *nombre_columna_treintaicuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                                NSString *nombre_columna_treintaicinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                                NSString *nombre_columna_treintaiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                                NSString *nombre_columna_treintaisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                                NSString *nombre_columna_treintaiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                                NSString *nombre_columna_treintainueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 39)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                nombre_columna_veintiseis_batch = nombre_columna_veintiseis_batch_this;
                                nombre_columna_veintisiete_batch = nombre_columna_veintisiete_batch_this;
                                nombre_columna_veintiocho_batch = nombre_columna_veintiocho_batch_this;
                                nombre_columna_veintinueve_batch = nombre_columna_veintinueve_batch_this;
                                nombre_columna_treinta_batch = nombre_columna_treinta_batch_this;
                                nombre_columna_treintaiuno_batch = nombre_columna_treintaiuno_batch_this;
                                nombre_columna_treintaidos_batch = nombre_columna_treintaidos_batch_this;
                                nombre_columna_treintaitres_batch = nombre_columna_treintaitres_batch_this;
                                nombre_columna_treintaicuatro_batch = nombre_columna_treintaicuatro_batch_this;
                                nombre_columna_treintaicinco_batch = nombre_columna_treintaicinco_batch_this;
                                nombre_columna_treintaiseis_batch = nombre_columna_treintaiseis_batch_this;
                                nombre_columna_treintaisiete_batch = nombre_columna_treintaisiete_batch_this;
                                nombre_columna_treintaiocho_batch = nombre_columna_treintaiocho_batch_this;
                                nombre_columna_treintainueve_batch = nombre_columna_treintainueve_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&veintiseis%d=%@&veintisiete%d=%@&veintiocho%d=%@&veintinueve%d=%@&treinta%d=%@&treintaiuno%d=%@&treintaidos%d=%@&treintaitres%d=%@&treintaicuatro%d=%@&treintaicinco%d=%@&treintaiseis%d=%@&treintaisiete%d=%@&treintaiocho%d=%@&treintainueve%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, veintiseis, ic, veintisiete, ic, veintiocho, ic, veintinueve, ic, treinta, ic, treintaiuno, ic, treintaidos, ic, treintaitres, ic, treintaicuatro, ic, treintaicinco, ic, treintaiseis, ic, treintaisiete, ic, treintaiocho, ic, treintainueve, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 40:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                NSString *treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                                NSString *treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                                NSString *treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 32)];
                                NSString *treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 33)];
                                NSString *treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 34)];
                                NSString *treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 35)];
                                NSString *treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 36)];
                                NSString *treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 37)];
                                NSString *treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 38)];
                                NSString *treintainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 39)];
                                NSString *cuarenta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 40)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 41)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 42)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 43)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 44)];
                                
                                
                                
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                NSString *nombre_columna_veintiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                                NSString *nombre_columna_veintisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                                NSString *nombre_columna_veintiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                                NSString *nombre_columna_veintinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                                NSString *nombre_columna_treinta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                                NSString *nombre_columna_treintaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                                NSString *nombre_columna_treintaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                                NSString *nombre_columna_treintaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                                NSString *nombre_columna_treintaicuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                                NSString *nombre_columna_treintaicinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                                NSString *nombre_columna_treintaiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                                NSString *nombre_columna_treintaisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                                NSString *nombre_columna_treintaiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                                NSString *nombre_columna_treintainueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 39)];
                                NSString *nombre_columna_cuarenta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 40)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                nombre_columna_veintiseis_batch = nombre_columna_veintiseis_batch_this;
                                nombre_columna_veintisiete_batch = nombre_columna_veintisiete_batch_this;
                                nombre_columna_veintiocho_batch = nombre_columna_veintiocho_batch_this;
                                nombre_columna_veintinueve_batch = nombre_columna_veintinueve_batch_this;
                                nombre_columna_treinta_batch = nombre_columna_treinta_batch_this;
                                nombre_columna_treintaiuno_batch = nombre_columna_treintaiuno_batch_this;
                                nombre_columna_treintaidos_batch = nombre_columna_treintaidos_batch_this;
                                nombre_columna_treintaitres_batch = nombre_columna_treintaitres_batch_this;
                                nombre_columna_treintaicuatro_batch = nombre_columna_treintaicuatro_batch_this;
                                nombre_columna_treintaicinco_batch = nombre_columna_treintaicinco_batch_this;
                                nombre_columna_treintaiseis_batch = nombre_columna_treintaiseis_batch_this;
                                nombre_columna_treintaisiete_batch = nombre_columna_treintaisiete_batch_this;
                                nombre_columna_treintaiocho_batch = nombre_columna_treintaiocho_batch_this;
                                nombre_columna_treintainueve_batch = nombre_columna_treintainueve_batch_this;
                                nombre_columna_cuarenta_batch = nombre_columna_cuarenta_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&veintiseis%d=%@&veintisiete%d=%@&veintiocho%d=%@&veintinueve%d=%@&treinta%d=%@&treintaiuno%d=%@&treintaidos%d=%@&treintaitres%d=%@&treintaicuatro%d=%@&treintaicinco%d=%@&treintaiseis%d=%@&treintaisiete%d=%@&treintaiocho%d=%@&treintainueve%d=%@&cuarenta%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, veintiseis, ic, veintisiete, ic, veintiocho, ic, veintinueve, ic, treinta, ic, treintaiuno, ic, treintaidos, ic, treintaitres, ic, treintaicuatro, ic, treintaicinco, ic, treintaiseis, ic, treintaisiete, ic, treintaiocho, ic, treintainueve, ic, cuarenta, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 41:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                NSString *treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                                NSString *treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                                NSString *treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 32)];
                                NSString *treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 33)];
                                NSString *treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 34)];
                                NSString *treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 35)];
                                NSString *treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 36)];
                                NSString *treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 37)];
                                NSString *treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 38)];
                                NSString *treintainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 39)];
                                NSString *cuarenta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 40)];
                                NSString *cuarentaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 41)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 42)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 43)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 44)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 45)];
                                
                               
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                NSString *nombre_columna_veintiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                                NSString *nombre_columna_veintisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                                NSString *nombre_columna_veintiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                                NSString *nombre_columna_veintinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                                NSString *nombre_columna_treinta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                                NSString *nombre_columna_treintaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                                NSString *nombre_columna_treintaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                                NSString *nombre_columna_treintaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                                NSString *nombre_columna_treintaicuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                                NSString *nombre_columna_treintaicinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                                NSString *nombre_columna_treintaiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                                NSString *nombre_columna_treintaisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                                NSString *nombre_columna_treintaiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                                NSString *nombre_columna_treintainueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 39)];
                                NSString *nombre_columna_cuarenta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 40)];
                                NSString *nombre_columna_cuarentaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 41)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                nombre_columna_veintiseis_batch = nombre_columna_veintiseis_batch_this;
                                nombre_columna_veintisiete_batch = nombre_columna_veintisiete_batch_this;
                                nombre_columna_veintiocho_batch = nombre_columna_veintiocho_batch_this;
                                nombre_columna_veintinueve_batch = nombre_columna_veintinueve_batch_this;
                                nombre_columna_treinta_batch = nombre_columna_treinta_batch_this;
                                nombre_columna_treintaiuno_batch = nombre_columna_treintaiuno_batch_this;
                                nombre_columna_treintaidos_batch = nombre_columna_treintaidos_batch_this;
                                nombre_columna_treintaitres_batch = nombre_columna_treintaitres_batch_this;
                                nombre_columna_treintaicuatro_batch = nombre_columna_treintaicuatro_batch_this;
                                nombre_columna_treintaicinco_batch = nombre_columna_treintaicinco_batch_this;
                                nombre_columna_treintaiseis_batch = nombre_columna_treintaiseis_batch_this;
                                nombre_columna_treintaisiete_batch = nombre_columna_treintaisiete_batch_this;
                                nombre_columna_treintaiocho_batch = nombre_columna_treintaiocho_batch_this;
                                nombre_columna_treintainueve_batch = nombre_columna_treintainueve_batch_this;
                                nombre_columna_cuarenta_batch = nombre_columna_cuarenta_batch_this;
                                nombre_columna_cuarentaiuno_batch = nombre_columna_cuarentaiuno_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&veintiseis%d=%@&veintisiete%d=%@&veintiocho%d=%@&veintinueve%d=%@&treinta%d=%@&treintaiuno%d=%@&treintaidos%d=%@&treintaitres%d=%@&treintaicuatro%d=%@&treintaicinco%d=%@&treintaiseis%d=%@&treintaisiete%d=%@&treintaiocho%d=%@&treintainueve%d=%@&cuarenta%d=%@&cuarentaiuno%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, veintiseis, ic, veintisiete, ic, veintiocho, ic, veintinueve, ic, treinta, ic, treintaiuno, ic, treintaidos, ic, treintaitres, ic, treintaicuatro, ic, treintaicinco, ic, treintaiseis, ic, treintaisiete, ic, treintaiocho, ic, treintainueve, ic, cuarenta, ic, cuarentaiuno, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 42:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                NSString *treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                                NSString *treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                                NSString *treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 32)];
                                NSString *treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 33)];
                                NSString *treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 34)];
                                NSString *treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 35)];
                                NSString *treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 36)];
                                NSString *treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 37)];
                                NSString *treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 38)];
                                NSString *treintainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 39)];
                                NSString *cuarenta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 40)];
                                NSString *cuarentaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 41)];
                                NSString *cuarentaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 42)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 43)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 44)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 45)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 46)];
                                
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                NSString *nombre_columna_veintiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                                NSString *nombre_columna_veintisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                                NSString *nombre_columna_veintiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                                NSString *nombre_columna_veintinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                                NSString *nombre_columna_treinta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                                NSString *nombre_columna_treintaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                                NSString *nombre_columna_treintaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                                NSString *nombre_columna_treintaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                                NSString *nombre_columna_treintaicuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                                NSString *nombre_columna_treintaicinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                                NSString *nombre_columna_treintaiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                                NSString *nombre_columna_treintaisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                                NSString *nombre_columna_treintaiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                                NSString *nombre_columna_treintainueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 39)];
                                NSString *nombre_columna_cuarenta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 40)];
                                NSString *nombre_columna_cuarentaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 41)];
                                NSString *nombre_columna_cuarentaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 42)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                nombre_columna_veintiseis_batch = nombre_columna_veintiseis_batch_this;
                                nombre_columna_veintisiete_batch = nombre_columna_veintisiete_batch_this;
                                nombre_columna_veintiocho_batch = nombre_columna_veintiocho_batch_this;
                                nombre_columna_veintinueve_batch = nombre_columna_veintinueve_batch_this;
                                nombre_columna_treinta_batch = nombre_columna_treinta_batch_this;
                                nombre_columna_treintaiuno_batch = nombre_columna_treintaiuno_batch_this;
                                nombre_columna_treintaidos_batch = nombre_columna_treintaidos_batch_this;
                                nombre_columna_treintaitres_batch = nombre_columna_treintaitres_batch_this;
                                nombre_columna_treintaicuatro_batch = nombre_columna_treintaicuatro_batch_this;
                                nombre_columna_treintaicinco_batch = nombre_columna_treintaicinco_batch_this;
                                nombre_columna_treintaiseis_batch = nombre_columna_treintaiseis_batch_this;
                                nombre_columna_treintaisiete_batch = nombre_columna_treintaisiete_batch_this;
                                nombre_columna_treintaiocho_batch = nombre_columna_treintaiocho_batch_this;
                                nombre_columna_treintainueve_batch = nombre_columna_treintainueve_batch_this;
                                nombre_columna_cuarenta_batch = nombre_columna_cuarenta_batch_this;
                                nombre_columna_cuarentaiuno_batch = nombre_columna_cuarentaiuno_batch_this;
                                nombre_columna_cuarentaidos_batch = nombre_columna_cuarentaidos_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&veintiseis%d=%@&veintisiete%d=%@&veintiocho%d=%@&veintinueve%d=%@&treinta%d=%@&treintaiuno%d=%@&treintaidos%d=%@&treintaitres%d=%@&treintaicuatro%d=%@&treintaicinco%d=%@&treintaiseis%d=%@&treintaisiete%d=%@&treintaiocho%d=%@&treintainueve%d=%@&cuarenta%d=%@&cuarentaiuno%d=%@&cuarentaidos%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, veintiseis, ic, veintisiete, ic, veintiocho, ic, veintinueve, ic, treinta, ic, treintaiuno, ic, treintaidos, ic, treintaitres, ic, treintaicuatro, ic, treintaicinco, ic, treintaiseis, ic, treintaisiete, ic, treintaiocho, ic, treintainueve, ic, cuarenta, ic, cuarentaiuno, ic, cuarentaidos, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 43:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                NSString *treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                                NSString *treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                                NSString *treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 32)];
                                NSString *treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 33)];
                                NSString *treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 34)];
                                NSString *treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 35)];
                                NSString *treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 36)];
                                NSString *treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 37)];
                                NSString *treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 38)];
                                NSString *treintainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 39)];
                                NSString *cuarenta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 40)];
                                NSString *cuarentaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 41)];
                                NSString *cuarentaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 42)];
                                NSString *cuarentaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 43)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 44)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 45)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 46)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 47)];
                                
                               
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                NSString *nombre_columna_veintiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                                NSString *nombre_columna_veintisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                                NSString *nombre_columna_veintiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                                NSString *nombre_columna_veintinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                                NSString *nombre_columna_treinta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                                NSString *nombre_columna_treintaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                                NSString *nombre_columna_treintaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                                NSString *nombre_columna_treintaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                                NSString *nombre_columna_treintaicuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                                NSString *nombre_columna_treintaicinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                                NSString *nombre_columna_treintaiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                                NSString *nombre_columna_treintaisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                                NSString *nombre_columna_treintaiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                                NSString *nombre_columna_treintainueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 39)];
                                NSString *nombre_columna_cuarenta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 40)];
                                NSString *nombre_columna_cuarentaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 41)];
                                NSString *nombre_columna_cuarentaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 42)];
                                NSString *nombre_columna_cuarentaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 43)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                nombre_columna_veintiseis_batch = nombre_columna_veintiseis_batch_this;
                                nombre_columna_veintisiete_batch = nombre_columna_veintisiete_batch_this;
                                nombre_columna_veintiocho_batch = nombre_columna_veintiocho_batch_this;
                                nombre_columna_veintinueve_batch = nombre_columna_veintinueve_batch_this;
                                nombre_columna_treinta_batch = nombre_columna_treinta_batch_this;
                                nombre_columna_treintaiuno_batch = nombre_columna_treintaiuno_batch_this;
                                nombre_columna_treintaidos_batch = nombre_columna_treintaidos_batch_this;
                                nombre_columna_treintaitres_batch = nombre_columna_treintaitres_batch_this;
                                nombre_columna_treintaicuatro_batch = nombre_columna_treintaicuatro_batch_this;
                                nombre_columna_treintaicinco_batch = nombre_columna_treintaicinco_batch_this;
                                nombre_columna_treintaiseis_batch = nombre_columna_treintaiseis_batch_this;
                                nombre_columna_treintaisiete_batch = nombre_columna_treintaisiete_batch_this;
                                nombre_columna_treintaiocho_batch = nombre_columna_treintaiocho_batch_this;
                                nombre_columna_treintainueve_batch = nombre_columna_treintainueve_batch_this;
                                nombre_columna_cuarenta_batch = nombre_columna_cuarenta_batch_this;
                                nombre_columna_cuarentaiuno_batch = nombre_columna_cuarentaiuno_batch_this;
                                nombre_columna_cuarentaidos_batch = nombre_columna_cuarentaidos_batch_this;
                                nombre_columna_cuarentaitres_batch = nombre_columna_cuarentaitres_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&veintiseis%d=%@&veintisiete%d=%@&veintiocho%d=%@&veintinueve%d=%@&treinta%d=%@&treintaiuno%d=%@&treintaidos%d=%@&treintaitres%d=%@&treintaicuatro%d=%@&treintaicinco%d=%@&treintaiseis%d=%@&treintaisiete%d=%@&treintaiocho%d=%@&treintainueve%d=%@&cuarenta%d=%@&cuarentaiuno%d=%@&cuarentaidos%d=%@&cuarentaitres%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, veintiseis, ic, veintisiete, ic, veintiocho, ic, veintinueve, ic, treinta, ic, treintaiuno, ic, treintaidos, ic, treintaitres, ic, treintaicuatro, ic, treintaicinco, ic, treintaiseis, ic, treintaisiete, ic, treintaiocho, ic, treintainueve, ic, cuarenta, ic, cuarentaiuno, ic, cuarentaidos, ic, cuarentaitres, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 44:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                NSString *treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                                NSString *treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                                NSString *treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 32)];
                                NSString *treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 33)];
                                NSString *treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 34)];
                                NSString *treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 35)];
                                NSString *treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 36)];
                                NSString *treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 37)];
                                NSString *treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 38)];
                                NSString *treintainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 39)];
                                NSString *cuarenta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 40)];
                                NSString *cuarentaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 41)];
                                NSString *cuarentaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 42)];
                                NSString *cuarentaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 43)];
                                NSString *cuarentaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 44)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 45)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 46)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 47)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 48)];
                                
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                NSString *nombre_columna_veintiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                                NSString *nombre_columna_veintisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                                NSString *nombre_columna_veintiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                                NSString *nombre_columna_veintinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                                NSString *nombre_columna_treinta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                                NSString *nombre_columna_treintaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                                NSString *nombre_columna_treintaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                                NSString *nombre_columna_treintaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                                NSString *nombre_columna_treintaicuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                                NSString *nombre_columna_treintaicinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                                NSString *nombre_columna_treintaiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                                NSString *nombre_columna_treintaisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                                NSString *nombre_columna_treintaiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                                NSString *nombre_columna_treintainueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 39)];
                                NSString *nombre_columna_cuarenta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 40)];
                                NSString *nombre_columna_cuarentaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 41)];
                                NSString *nombre_columna_cuarentaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 42)];
                                NSString *nombre_columna_cuarentaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 43)];
                                NSString *nombre_columna_cuarentaicuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 44)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                nombre_columna_veintiseis_batch = nombre_columna_veintiseis_batch_this;
                                nombre_columna_veintisiete_batch = nombre_columna_veintisiete_batch_this;
                                nombre_columna_veintiocho_batch = nombre_columna_veintiocho_batch_this;
                                nombre_columna_veintinueve_batch = nombre_columna_veintinueve_batch_this;
                                nombre_columna_treinta_batch = nombre_columna_treinta_batch_this;
                                nombre_columna_treintaiuno_batch = nombre_columna_treintaiuno_batch_this;
                                nombre_columna_treintaidos_batch = nombre_columna_treintaidos_batch_this;
                                nombre_columna_treintaitres_batch = nombre_columna_treintaitres_batch_this;
                                nombre_columna_treintaicuatro_batch = nombre_columna_treintaicuatro_batch_this;
                                nombre_columna_treintaicinco_batch = nombre_columna_treintaicinco_batch_this;
                                nombre_columna_treintaiseis_batch = nombre_columna_treintaiseis_batch_this;
                                nombre_columna_treintaisiete_batch = nombre_columna_treintaisiete_batch_this;
                                nombre_columna_treintaiocho_batch = nombre_columna_treintaiocho_batch_this;
                                nombre_columna_treintainueve_batch = nombre_columna_treintainueve_batch_this;
                                nombre_columna_cuarenta_batch = nombre_columna_cuarenta_batch_this;
                                nombre_columna_cuarentaiuno_batch = nombre_columna_cuarentaiuno_batch_this;
                                nombre_columna_cuarentaidos_batch = nombre_columna_cuarentaidos_batch_this;
                                nombre_columna_cuarentaitres_batch = nombre_columna_cuarentaitres_batch_this;
                                nombre_columna_cuarentaicuatro_batch = nombre_columna_cuarentaicuatro_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&veintiseis%d=%@&veintisiete%d=%@&veintiocho%d=%@&veintinueve%d=%@&treinta%d=%@&treintaiuno%d=%@&treintaidos%d=%@&treintaitres%d=%@&treintaicuatro%d=%@&treintaicinco%d=%@&treintaiseis%d=%@&treintaisiete%d=%@&treintaiocho%d=%@&treintainueve%d=%@&cuarenta%d=%@&cuarentaiuno%d=%@&cuarentaidos%d=%@&cuarentaitres%d=%@&cuarentaicuatro%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, veintiseis, ic, veintisiete, ic, veintiocho, ic, veintinueve, ic, treinta, ic, treintaiuno, ic, treintaidos, ic, treintaitres, ic, treintaicuatro, ic, treintaicinco, ic, treintaiseis, ic, treintaisiete, ic, treintaiocho, ic, treintainueve, ic, cuarenta, ic, cuarentaiuno, ic, cuarentaidos, ic, cuarentaitres, ic, cuarentaicuatro, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 45:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                NSString *treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                                NSString *treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                                NSString *treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 32)];
                                NSString *treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 33)];
                                NSString *treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 34)];
                                NSString *treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 35)];
                                NSString *treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 36)];
                                NSString *treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 37)];
                                NSString *treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 38)];
                                NSString *treintainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 39)];
                                NSString *cuarenta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 40)];
                                NSString *cuarentaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 41)];
                                NSString *cuarentaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 42)];
                                NSString *cuarentaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 43)];
                                NSString *cuarentaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 44)];
                                NSString *cuarentaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 45)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 46)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 47)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 48)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 49)];
                                
                                
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                NSString *nombre_columna_veintiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                                NSString *nombre_columna_veintisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                                NSString *nombre_columna_veintiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                                NSString *nombre_columna_veintinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                                NSString *nombre_columna_treinta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                                NSString *nombre_columna_treintaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                                NSString *nombre_columna_treintaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                                NSString *nombre_columna_treintaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                                NSString *nombre_columna_treintaicuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                                NSString *nombre_columna_treintaicinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                                NSString *nombre_columna_treintaiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                                NSString *nombre_columna_treintaisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                                NSString *nombre_columna_treintaiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                                NSString *nombre_columna_treintainueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 39)];
                                NSString *nombre_columna_cuarenta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 40)];
                                NSString *nombre_columna_cuarentaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 41)];
                                NSString *nombre_columna_cuarentaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 42)];
                                NSString *nombre_columna_cuarentaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 43)];
                                NSString *nombre_columna_cuarentaicuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 44)];
                                NSString *nombre_columna_cuarentaicinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 45)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                nombre_columna_veintiseis_batch = nombre_columna_veintiseis_batch_this;
                                nombre_columna_veintisiete_batch = nombre_columna_veintisiete_batch_this;
                                nombre_columna_veintiocho_batch = nombre_columna_veintiocho_batch_this;
                                nombre_columna_veintinueve_batch = nombre_columna_veintinueve_batch_this;
                                nombre_columna_treinta_batch = nombre_columna_treinta_batch_this;
                                nombre_columna_treintaiuno_batch = nombre_columna_treintaiuno_batch_this;
                                nombre_columna_treintaidos_batch = nombre_columna_treintaidos_batch_this;
                                nombre_columna_treintaitres_batch = nombre_columna_treintaitres_batch_this;
                                nombre_columna_treintaicuatro_batch = nombre_columna_treintaicuatro_batch_this;
                                nombre_columna_treintaicinco_batch = nombre_columna_treintaicinco_batch_this;
                                nombre_columna_treintaiseis_batch = nombre_columna_treintaiseis_batch_this;
                                nombre_columna_treintaisiete_batch = nombre_columna_treintaisiete_batch_this;
                                nombre_columna_treintaiocho_batch = nombre_columna_treintaiocho_batch_this;
                                nombre_columna_treintainueve_batch = nombre_columna_treintainueve_batch_this;
                                nombre_columna_cuarenta_batch = nombre_columna_cuarenta_batch_this;
                                nombre_columna_cuarentaiuno_batch = nombre_columna_cuarentaiuno_batch_this;
                                nombre_columna_cuarentaidos_batch = nombre_columna_cuarentaidos_batch_this;
                                nombre_columna_cuarentaitres_batch = nombre_columna_cuarentaitres_batch_this;
                                nombre_columna_cuarentaicuatro_batch = nombre_columna_cuarentaicuatro_batch_this;
                                nombre_columna_cuarentaicinco_batch = nombre_columna_cuarentaicinco_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&veintiseis%d=%@&veintisiete%d=%@&veintiocho%d=%@&veintinueve%d=%@&treinta%d=%@&treintaiuno%d=%@&treintaidos%d=%@&treintaitres%d=%@&treintaicuatro%d=%@&treintaicinco%d=%@&treintaiseis%d=%@&treintaisiete%d=%@&treintaiocho%d=%@&treintainueve%d=%@&cuarenta%d=%@&cuarentaiuno%d=%@&cuarentaidos%d=%@&cuarentaitres%d=%@&cuarentaicuatro%d=%@&cuarentaicinco%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, veintiseis, ic, veintisiete, ic, veintiocho, ic, veintinueve, ic, treinta, ic, treintaiuno, ic, treintaidos, ic, treintaitres, ic, treintaicuatro, ic, treintaicinco, ic, treintaiseis, ic, treintaisiete, ic, treintaiocho, ic, treintainueve, ic, cuarenta, ic, cuarentaiuno, ic, cuarentaidos, ic, cuarentaitres, ic, cuarentaicuatro, ic, cuarentaicinco, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 46:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                NSString *treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                                NSString *treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                                NSString *treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 32)];
                                NSString *treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 33)];
                                NSString *treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 34)];
                                NSString *treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 35)];
                                NSString *treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 36)];
                                NSString *treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 37)];
                                NSString *treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 38)];
                                NSString *treintainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 39)];
                                NSString *cuarenta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 40)];
                                NSString *cuarentaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 41)];
                                NSString *cuarentaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 42)];
                                NSString *cuarentaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 43)];
                                NSString *cuarentaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 44)];
                                NSString *cuarentaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 45)];
                                NSString *cuarentaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 46)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 47)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 48)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 49)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 50)];
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                NSString *nombre_columna_veintiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                                NSString *nombre_columna_veintisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                                NSString *nombre_columna_veintiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                                NSString *nombre_columna_veintinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                                NSString *nombre_columna_treinta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                                NSString *nombre_columna_treintaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                                NSString *nombre_columna_treintaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                                NSString *nombre_columna_treintaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                                NSString *nombre_columna_treintaicuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                                NSString *nombre_columna_treintaicinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                                NSString *nombre_columna_treintaiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                                NSString *nombre_columna_treintaisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                                NSString *nombre_columna_treintaiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                                NSString *nombre_columna_treintainueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 39)];
                                NSString *nombre_columna_cuarenta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 40)];
                                NSString *nombre_columna_cuarentaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 41)];
                                NSString *nombre_columna_cuarentaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 42)];
                                NSString *nombre_columna_cuarentaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 43)];
                                NSString *nombre_columna_cuarentaicuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 44)];
                                NSString *nombre_columna_cuarentaicinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 45)];
                                NSString *nombre_columna_cuarentaiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 46)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                nombre_columna_veintiseis_batch = nombre_columna_veintiseis_batch_this;
                                nombre_columna_veintisiete_batch = nombre_columna_veintisiete_batch_this;
                                nombre_columna_veintiocho_batch = nombre_columna_veintiocho_batch_this;
                                nombre_columna_veintinueve_batch = nombre_columna_veintinueve_batch_this;
                                nombre_columna_treinta_batch = nombre_columna_treinta_batch_this;
                                nombre_columna_treintaiuno_batch = nombre_columna_treintaiuno_batch_this;
                                nombre_columna_treintaidos_batch = nombre_columna_treintaidos_batch_this;
                                nombre_columna_treintaitres_batch = nombre_columna_treintaitres_batch_this;
                                nombre_columna_treintaicuatro_batch = nombre_columna_treintaicuatro_batch_this;
                                nombre_columna_treintaicinco_batch = nombre_columna_treintaicinco_batch_this;
                                nombre_columna_treintaiseis_batch = nombre_columna_treintaiseis_batch_this;
                                nombre_columna_treintaisiete_batch = nombre_columna_treintaisiete_batch_this;
                                nombre_columna_treintaiocho_batch = nombre_columna_treintaiocho_batch_this;
                                nombre_columna_treintainueve_batch = nombre_columna_treintainueve_batch_this;
                                nombre_columna_cuarenta_batch = nombre_columna_cuarenta_batch_this;
                                nombre_columna_cuarentaiuno_batch = nombre_columna_cuarentaiuno_batch_this;
                                nombre_columna_cuarentaidos_batch = nombre_columna_cuarentaidos_batch_this;
                                nombre_columna_cuarentaitres_batch = nombre_columna_cuarentaitres_batch_this;
                                nombre_columna_cuarentaicuatro_batch = nombre_columna_cuarentaicuatro_batch_this;
                                nombre_columna_cuarentaicinco_batch = nombre_columna_cuarentaicinco_batch_this;
                                nombre_columna_cuarentaiseis_batch = nombre_columna_cuarentaiseis_batch_this;
                                
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&veintiseis%d=%@&veintisiete%d=%@&veintiocho%d=%@&veintinueve%d=%@&treinta%d=%@&treintaiuno%d=%@&treintaidos%d=%@&treintaitres%d=%@&treintaicuatro%d=%@&treintaicinco%d=%@&treintaiseis%d=%@&treintaisiete%d=%@&treintaiocho%d=%@&treintainueve%d=%@&cuarenta%d=%@&cuarentaiuno%d=%@&cuarentaidos%d=%@&cuarentaitres%d=%@&cuarentaicuatro%d=%@&cuarentaicinco%d=%@&cuarentaiseis%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, veintiseis, ic, veintisiete, ic, veintiocho, ic, veintinueve, ic, treinta, ic, treintaiuno, ic, treintaidos, ic, treintaitres, ic, treintaicuatro, ic, treintaicinco, ic, treintaiseis, ic, treintaisiete, ic, treintaiocho, ic, treintainueve, ic, cuarenta, ic, cuarentaiuno, ic, cuarentaidos, ic, cuarentaitres, ic, cuarentaicuatro, ic, cuarentaicinco, ic, cuarentaiseis, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 47:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                NSString *treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                                NSString *treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                                NSString *treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 32)];
                                NSString *treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 33)];
                                NSString *treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 34)];
                                NSString *treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 35)];
                                NSString *treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 36)];
                                NSString *treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 37)];
                                NSString *treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 38)];
                                NSString *treintainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 39)];
                                NSString *cuarenta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 40)];
                                NSString *cuarentaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 41)];
                                NSString *cuarentaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 42)];
                                NSString *cuarentaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 43)];
                                NSString *cuarentaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 44)];
                                NSString *cuarentaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 45)];
                                NSString *cuarentaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 46)];
                                NSString *cuarentaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 47)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 48)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 49)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 50)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 51)];
                                
                               
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                NSString *nombre_columna_veintiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                                NSString *nombre_columna_veintisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                                NSString *nombre_columna_veintiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                                NSString *nombre_columna_veintinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                                NSString *nombre_columna_treinta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                                NSString *nombre_columna_treintaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                                NSString *nombre_columna_treintaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                                NSString *nombre_columna_treintaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                                NSString *nombre_columna_treintaicuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                                NSString *nombre_columna_treintaicinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                                NSString *nombre_columna_treintaiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                                NSString *nombre_columna_treintaisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                                NSString *nombre_columna_treintaiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                                NSString *nombre_columna_treintainueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 39)];
                                NSString *nombre_columna_cuarenta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 40)];
                                NSString *nombre_columna_cuarentaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 41)];
                                NSString *nombre_columna_cuarentaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 42)];
                                NSString *nombre_columna_cuarentaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 43)];
                                NSString *nombre_columna_cuarentaicuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 44)];
                                NSString *nombre_columna_cuarentaicinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 45)];
                                NSString *nombre_columna_cuarentaiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 46)];
                                NSString *nombre_columna_cuarentaisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 47)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                nombre_columna_veintiseis_batch = nombre_columna_veintiseis_batch_this;
                                nombre_columna_veintisiete_batch = nombre_columna_veintisiete_batch_this;
                                nombre_columna_veintiocho_batch = nombre_columna_veintiocho_batch_this;
                                nombre_columna_veintinueve_batch = nombre_columna_veintinueve_batch_this;
                                nombre_columna_treinta_batch = nombre_columna_treinta_batch_this;
                                nombre_columna_treintaiuno_batch = nombre_columna_treintaiuno_batch_this;
                                nombre_columna_treintaidos_batch = nombre_columna_treintaidos_batch_this;
                                nombre_columna_treintaitres_batch = nombre_columna_treintaitres_batch_this;
                                nombre_columna_treintaicuatro_batch = nombre_columna_treintaicuatro_batch_this;
                                nombre_columna_treintaicinco_batch = nombre_columna_treintaicinco_batch_this;
                                nombre_columna_treintaiseis_batch = nombre_columna_treintaiseis_batch_this;
                                nombre_columna_treintaisiete_batch = nombre_columna_treintaisiete_batch_this;
                                nombre_columna_treintaiocho_batch = nombre_columna_treintaiocho_batch_this;
                                nombre_columna_treintainueve_batch = nombre_columna_treintainueve_batch_this;
                                nombre_columna_cuarenta_batch = nombre_columna_cuarenta_batch_this;
                                nombre_columna_cuarentaiuno_batch = nombre_columna_cuarentaiuno_batch_this;
                                nombre_columna_cuarentaidos_batch = nombre_columna_cuarentaidos_batch_this;
                                nombre_columna_cuarentaitres_batch = nombre_columna_cuarentaitres_batch_this;
                                nombre_columna_cuarentaicuatro_batch = nombre_columna_cuarentaicuatro_batch_this;
                                nombre_columna_cuarentaicinco_batch = nombre_columna_cuarentaicinco_batch_this;
                                nombre_columna_cuarentaiseis_batch = nombre_columna_cuarentaiseis_batch_this;
                                nombre_columna_cuarentaisiete_batch = nombre_columna_cuarentaisiete_batch_this;
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&veintiseis%d=%@&veintisiete%d=%@&veintiocho%d=%@&veintinueve%d=%@&treinta%d=%@&treintaiuno%d=%@&treintaidos%d=%@&treintaitres%d=%@&treintaicuatro%d=%@&treintaicinco%d=%@&treintaiseis%d=%@&treintaisiete%d=%@&treintaiocho%d=%@&treintainueve%d=%@&cuarenta%d=%@&cuarentaiuno%d=%@&cuarentaidos%d=%@&cuarentaitres%d=%@&cuarentaicuatro%d=%@&cuarentaicinco%d=%@&cuarentaiseis%d=%@&cuarentaisiete%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, veintiseis, ic, veintisiete, ic, veintiocho, ic, veintinueve, ic, treinta, ic, treintaiuno, ic, treintaidos, ic, treintaitres, ic, treintaicuatro, ic, treintaicinco, ic, treintaiseis, ic, treintaisiete, ic, treintaiocho, ic, treintainueve, ic, cuarenta, ic, cuarentaiuno, ic, cuarentaidos, ic, cuarentaitres, ic, cuarentaicuatro, ic, cuarentaicinco, ic, cuarentaiseis, ic, cuarentaisiete, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 48:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                NSString *treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                                NSString *treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                                NSString *treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 32)];
                                NSString *treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 33)];
                                NSString *treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 34)];
                                NSString *treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 35)];
                                NSString *treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 36)];
                                NSString *treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 37)];
                                NSString *treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 38)];
                                NSString *treintainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 39)];
                                NSString *cuarenta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 40)];
                                NSString *cuarentaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 41)];
                                NSString *cuarentaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 42)];
                                NSString *cuarentaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 43)];
                                NSString *cuarentaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 44)];
                                NSString *cuarentaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 45)];
                                NSString *cuarentaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 46)];
                                NSString *cuarentaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 47)];
                                NSString *cuarentaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 48)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 49)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 50)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 51)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 52)];
                                
                                
                                
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                NSString *nombre_columna_veintiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                                NSString *nombre_columna_veintisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                                NSString *nombre_columna_veintiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                                NSString *nombre_columna_veintinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                                NSString *nombre_columna_treinta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                                NSString *nombre_columna_treintaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                                NSString *nombre_columna_treintaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                                NSString *nombre_columna_treintaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                                NSString *nombre_columna_treintaicuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                                NSString *nombre_columna_treintaicinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                                NSString *nombre_columna_treintaiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                                NSString *nombre_columna_treintaisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                                NSString *nombre_columna_treintaiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                                NSString *nombre_columna_treintainueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 39)];
                                NSString *nombre_columna_cuarenta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 40)];
                                NSString *nombre_columna_cuarentaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 41)];
                                NSString *nombre_columna_cuarentaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 42)];
                                NSString *nombre_columna_cuarentaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 43)];
                                NSString *nombre_columna_cuarentaicuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 44)];
                                NSString *nombre_columna_cuarentaicinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 45)];
                                NSString *nombre_columna_cuarentaiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 46)];
                                NSString *nombre_columna_cuarentaisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 47)];
                                NSString *nombre_columna_cuarentaiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 48)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                nombre_columna_veintiseis_batch = nombre_columna_veintiseis_batch_this;
                                nombre_columna_veintisiete_batch = nombre_columna_veintisiete_batch_this;
                                nombre_columna_veintiocho_batch = nombre_columna_veintiocho_batch_this;
                                nombre_columna_veintinueve_batch = nombre_columna_veintinueve_batch_this;
                                nombre_columna_treinta_batch = nombre_columna_treinta_batch_this;
                                nombre_columna_treintaiuno_batch = nombre_columna_treintaiuno_batch_this;
                                nombre_columna_treintaidos_batch = nombre_columna_treintaidos_batch_this;
                                nombre_columna_treintaitres_batch = nombre_columna_treintaitres_batch_this;
                                nombre_columna_treintaicuatro_batch = nombre_columna_treintaicuatro_batch_this;
                                nombre_columna_treintaicinco_batch = nombre_columna_treintaicinco_batch_this;
                                nombre_columna_treintaiseis_batch = nombre_columna_treintaiseis_batch_this;
                                nombre_columna_treintaisiete_batch = nombre_columna_treintaisiete_batch_this;
                                nombre_columna_treintaiocho_batch = nombre_columna_treintaiocho_batch_this;
                                nombre_columna_treintainueve_batch = nombre_columna_treintainueve_batch_this;
                                nombre_columna_cuarenta_batch = nombre_columna_cuarenta_batch_this;
                                nombre_columna_cuarentaiuno_batch = nombre_columna_cuarentaiuno_batch_this;
                                nombre_columna_cuarentaidos_batch = nombre_columna_cuarentaidos_batch_this;
                                nombre_columna_cuarentaitres_batch = nombre_columna_cuarentaitres_batch_this;
                                nombre_columna_cuarentaicuatro_batch = nombre_columna_cuarentaicuatro_batch_this;
                                nombre_columna_cuarentaicinco_batch = nombre_columna_cuarentaicinco_batch_this;
                                nombre_columna_cuarentaiseis_batch = nombre_columna_cuarentaiseis_batch_this;
                                nombre_columna_cuarentaisiete_batch = nombre_columna_cuarentaisiete_batch_this;
                                nombre_columna_cuarentaiocho_batch = nombre_columna_cuarentaiocho_batch_this;
                                
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&veintiseis%d=%@&veintisiete%d=%@&veintiocho%d=%@&veintinueve%d=%@&treinta%d=%@&treintaiuno%d=%@&treintaidos%d=%@&treintaitres%d=%@&treintaicuatro%d=%@&treintaicinco%d=%@&treintaiseis%d=%@&treintaisiete%d=%@&treintaiocho%d=%@&treintainueve%d=%@&cuarenta%d=%@&cuarentaiuno%d=%@&cuarentaidos%d=%@&cuarentaitres%d=%@&cuarentaicuatro%d=%@&cuarentaicinco%d=%@&cuarentaiseis%d=%@&cuarentaisiete%d=%@&cuarentaiocho%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, veintiseis, ic, veintisiete, ic, veintiocho, ic, veintinueve, ic, treinta, ic, treintaiuno, ic, treintaidos, ic, treintaitres, ic, treintaicuatro, ic, treintaicinco, ic, treintaiseis, ic, treintaisiete, ic, treintaiocho, ic, treintainueve, ic, cuarenta, ic, cuarentaiuno, ic, cuarentaidos, ic, cuarentaitres, ic, cuarentaicuatro, ic, cuarentaicinco, ic, cuarentaiseis, ic, cuarentaisiete, ic, cuarentaiocho, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 49:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                NSString *treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                                NSString *treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                                NSString *treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 32)];
                                NSString *treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 33)];
                                NSString *treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 34)];
                                NSString *treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 35)];
                                NSString *treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 36)];
                                NSString *treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 37)];
                                NSString *treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 38)];
                                NSString *treintainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 39)];
                                NSString *cuarenta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 40)];
                                NSString *cuarentaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 41)];
                                NSString *cuarentaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 42)];
                                NSString *cuarentaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 43)];
                                NSString *cuarentaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 44)];
                                NSString *cuarentaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 45)];
                                NSString *cuarentaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 46)];
                                NSString *cuarentaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 47)];
                                NSString *cuarentaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 48)];
                                NSString *cuarentainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 49)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 50)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 51)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 52)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 53)];
                                
                                
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                NSString *nombre_columna_veintiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                                NSString *nombre_columna_veintisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                                NSString *nombre_columna_veintiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                                NSString *nombre_columna_veintinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                                NSString *nombre_columna_treinta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                                NSString *nombre_columna_treintaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                                NSString *nombre_columna_treintaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                                NSString *nombre_columna_treintaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                                NSString *nombre_columna_treintaicuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                                NSString *nombre_columna_treintaicinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                                NSString *nombre_columna_treintaiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                                NSString *nombre_columna_treintaisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                                NSString *nombre_columna_treintaiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                                NSString *nombre_columna_treintainueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 39)];
                                NSString *nombre_columna_cuarenta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 40)];
                                NSString *nombre_columna_cuarentaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 41)];
                                NSString *nombre_columna_cuarentaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 42)];
                                NSString *nombre_columna_cuarentaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 43)];
                                NSString *nombre_columna_cuarentaicuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 44)];
                                NSString *nombre_columna_cuarentaicinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 45)];
                                NSString *nombre_columna_cuarentaiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 46)];
                                NSString *nombre_columna_cuarentaisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 47)];
                                NSString *nombre_columna_cuarentaiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 48)];
                                NSString *nombre_columna_cuarentainueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 49)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                nombre_columna_veintiseis_batch = nombre_columna_veintiseis_batch_this;
                                nombre_columna_veintisiete_batch = nombre_columna_veintisiete_batch_this;
                                nombre_columna_veintiocho_batch = nombre_columna_veintiocho_batch_this;
                                nombre_columna_veintinueve_batch = nombre_columna_veintinueve_batch_this;
                                nombre_columna_treinta_batch = nombre_columna_treinta_batch_this;
                                nombre_columna_treintaiuno_batch = nombre_columna_treintaiuno_batch_this;
                                nombre_columna_treintaidos_batch = nombre_columna_treintaidos_batch_this;
                                nombre_columna_treintaitres_batch = nombre_columna_treintaitres_batch_this;
                                nombre_columna_treintaicuatro_batch = nombre_columna_treintaicuatro_batch_this;
                                nombre_columna_treintaicinco_batch = nombre_columna_treintaicinco_batch_this;
                                nombre_columna_treintaiseis_batch = nombre_columna_treintaiseis_batch_this;
                                nombre_columna_treintaisiete_batch = nombre_columna_treintaisiete_batch_this;
                                nombre_columna_treintaiocho_batch = nombre_columna_treintaiocho_batch_this;
                                nombre_columna_treintainueve_batch = nombre_columna_treintainueve_batch_this;
                                nombre_columna_cuarenta_batch = nombre_columna_cuarenta_batch_this;
                                nombre_columna_cuarentaiuno_batch = nombre_columna_cuarentaiuno_batch_this;
                                nombre_columna_cuarentaidos_batch = nombre_columna_cuarentaidos_batch_this;
                                nombre_columna_cuarentaitres_batch = nombre_columna_cuarentaitres_batch_this;
                                nombre_columna_cuarentaicuatro_batch = nombre_columna_cuarentaicuatro_batch_this;
                                nombre_columna_cuarentaicinco_batch = nombre_columna_cuarentaicinco_batch_this;
                                nombre_columna_cuarentaiseis_batch = nombre_columna_cuarentaiseis_batch_this;
                                nombre_columna_cuarentaisiete_batch = nombre_columna_cuarentaisiete_batch_this;
                                nombre_columna_cuarentaiocho_batch = nombre_columna_cuarentaiocho_batch_this;
                                nombre_columna_cuarentainueve_batch = nombre_columna_cuarentainueve_batch_this;
                                
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&veintiseis%d=%@&veintisiete%d=%@&veintiocho%d=%@&veintinueve%d=%@&treinta%d=%@&treintaiuno%d=%@&treintaidos%d=%@&treintaitres%d=%@&treintaicuatro%d=%@&treintaicinco%d=%@&treintaiseis%d=%@&treintaisiete%d=%@&treintaiocho%d=%@&treintainueve%d=%@&cuarenta%d=%@&cuarentaiuno%d=%@&cuarentaidos%d=%@&cuarentaitres%d=%@&cuarentaicuatro%d=%@&cuarentaicinco%d=%@&cuarentaiseis%d=%@&cuarentaisiete%d=%@&cuarentaiocho%d=%@&cuarentainueve%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, veintiseis, ic, veintisiete, ic, veintiocho, ic, veintinueve, ic, treinta, ic, treintaiuno, ic, treintaidos, ic, treintaitres, ic, treintaicuatro, ic, treintaicinco, ic, treintaiseis, ic, treintaisiete, ic, treintaiocho, ic, treintainueve, ic, cuarenta, ic, cuarentaiuno, ic, cuarentaidos, ic, cuarentaitres, ic, cuarentaicuatro, ic, cuarentaicinco, ic, cuarentaiseis, ic, cuarentaisiete, ic, cuarentaiocho, ic, cuarentainueve, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                case 50:
                    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                        
                        NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                        const char* query_sql = [querySql UTF8String];
                        
                        if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                            int ic = 1;
                            
                            while (sqlite3_step(statement)==SQLITE_ROW) {
                                
                                NSString *uno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                                NSString *dos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                                NSString *tres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 3)];
                                NSString *cuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 4)];
                                NSString *cinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 5)];
                                NSString *seis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                                NSString *siete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 7)];
                                NSString *ocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 8)];
                                NSString *nueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 9)];
                                NSString *diez = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 10)];
                                NSString *once = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 11)];
                                NSString *doce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 12)];
                                NSString *trece = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 13)];
                                NSString *catorce = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 14)];
                                NSString *quince = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 15)];
                                NSString *dieciseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 16)];
                                NSString *diecisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 17)];
                                NSString *dieciocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 18)];
                                NSString *diecinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 19)];
                                NSString *veinte = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 20)];
                                NSString *veintiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 21)];
                                NSString *veintidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 22)];
                                NSString *veintitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 23)];
                                NSString *veinticuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 24)];
                                NSString *veinticinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 25)];
                                NSString *veintiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 26)];
                                NSString *veintisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 27)];
                                NSString *veintiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 28)];
                                NSString *veintinueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 29)];
                                NSString *treinta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 30)];
                                NSString *treintaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 31)];
                                NSString *treintaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 32)];
                                NSString *treintaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 33)];
                                NSString *treintaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 34)];
                                NSString *treintaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 35)];
                                NSString *treintaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 36)];
                                NSString *treintaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 37)];
                                NSString *treintaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 38)];
                                NSString *treintainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 39)];
                                NSString *cuarenta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 40)];
                                NSString *cuarentaiuno = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 41)];
                                NSString *cuarentaidos = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 42)];
                                NSString *cuarentaitres = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 43)];
                                NSString *cuarentaicuatro = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 44)];
                                NSString *cuarentaicinco = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 45)];
                                NSString *cuarentaiseis = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 46)];
                                NSString *cuarentaisiete = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 47)];
                                NSString *cuarentaiocho = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 48)];
                                NSString *cuarentainueve = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 49)];
                                NSString *cincuenta = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 50)];
                                NSString *latitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 51)];
                                NSString *longitud = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 52)];
                                NSString *fecha = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 53)];
                                NSString *censador = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 54)];
                                
                                
                                
                                // NOMBRES DE COLUMNAS
                                NSString *nombre_columna_uno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 1)];
                                NSString *nombre_columna_dos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 2)];
                                NSString *nombre_columna_tres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 3)];
                                NSString *nombre_columna_cuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 4)];
                                NSString *nombre_columna_cinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 5)];
                                NSString *nombre_columna_seis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 6)];
                                NSString *nombre_columna_siete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 7)];
                                NSString *nombre_columna_ocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 8)];
                                NSString *nombre_columna_nueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 9)];
                                NSString *nombre_columna_diez_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 10)];
                                NSString *nombre_columna_once_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 11)];
                                NSString *nombre_columna_doce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 12)];
                                NSString *nombre_columna_trece_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 13)];
                                NSString *nombre_columna_catorce_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 14)];
                                NSString *nombre_columna_quince_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 15)];
                                NSString *nombre_columna_dieciseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 16)];
                                NSString *nombre_columna_diecisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 17)];
                                NSString *nombre_columna_dieciocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 18)];
                                NSString *nombre_columna_diecinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 19)];
                                NSString *nombre_columna_veinte_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 20)];
                                NSString *nombre_columna_veintiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 21)];
                                NSString *nombre_columna_veintidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 22)];
                                NSString *nombre_columna_veintitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 23)];
                                NSString *nombre_columna_veinticuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 24)];
                                NSString *nombre_columna_veinticinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 25)];
                                NSString *nombre_columna_veintiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 26)];
                                NSString *nombre_columna_veintisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 27)];
                                NSString *nombre_columna_veintiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 28)];
                                NSString *nombre_columna_veintinueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 29)];
                                NSString *nombre_columna_treinta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 30)];
                                NSString *nombre_columna_treintaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 31)];
                                NSString *nombre_columna_treintaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 32)];
                                NSString *nombre_columna_treintaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 33)];
                                NSString *nombre_columna_treintaicuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 34)];
                                NSString *nombre_columna_treintaicinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 35)];
                                NSString *nombre_columna_treintaiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 36)];
                                NSString *nombre_columna_treintaisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 37)];
                                NSString *nombre_columna_treintaiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 38)];
                                NSString *nombre_columna_treintainueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 39)];
                                NSString *nombre_columna_cuarenta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 40)];
                                NSString *nombre_columna_cuarentaiuno_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 41)];
                                NSString *nombre_columna_cuarentaidos_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 42)];
                                NSString *nombre_columna_cuarentaitres_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 43)];
                                NSString *nombre_columna_cuarentaicuatro_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 44)];
                                NSString *nombre_columna_cuarentaicinco_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 45)];
                                NSString *nombre_columna_cuarentaiseis_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 46)];
                                NSString *nombre_columna_cuarentaisiete_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 47)];
                                NSString *nombre_columna_cuarentaiocho_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 48)];
                                NSString *nombre_columna_cuarentainueve_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 49)];
                                NSString *nombre_columna_cincuenta_batch_this = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_name(statement, 50)];
                                nombre_columna_uno_batch = nombre_columna_uno_batch_this;
                                nombre_columna_dos_batch = nombre_columna_dos_batch_this;
                                nombre_columna_tres_batch = nombre_columna_tres_batch_this;
                                nombre_columna_cuatro_batch = nombre_columna_cuatro_batch_this;
                                nombre_columna_cinco_batch = nombre_columna_cinco_batch_this;
                                nombre_columna_seis_batch = nombre_columna_seis_batch_this;
                                nombre_columna_siete_batch = nombre_columna_siete_batch_this;
                                nombre_columna_ocho_batch = nombre_columna_ocho_batch_this;
                                nombre_columna_nueve_batch = nombre_columna_nueve_batch_this;
                                nombre_columna_diez_batch = nombre_columna_diez_batch_this;
                                nombre_columna_once_batch = nombre_columna_once_batch_this;
                                nombre_columna_doce_batch = nombre_columna_doce_batch_this;
                                nombre_columna_trece_batch = nombre_columna_trece_batch_this;
                                nombre_columna_catorce_batch = nombre_columna_catorce_batch_this;
                                nombre_columna_quince_batch = nombre_columna_quince_batch_this;
                                nombre_columna_dieciseis_batch = nombre_columna_dieciseis_batch_this;
                                nombre_columna_diecisiete_batch = nombre_columna_diecisiete_batch_this;
                                nombre_columna_dieciocho_batch = nombre_columna_dieciocho_batch_this;
                                nombre_columna_diecinueve_batch = nombre_columna_diecinueve_batch_this;
                                nombre_columna_veinte_batch = nombre_columna_veinte_batch_this;
                                nombre_columna_veintiuno_batch = nombre_columna_veintiuno_batch_this;
                                nombre_columna_veintidos_batch = nombre_columna_veintidos_batch_this;
                                nombre_columna_veintitres_batch = nombre_columna_veintitres_batch_this;
                                nombre_columna_veinticuatro_batch = nombre_columna_veinticuatro_batch_this;
                                nombre_columna_veinticinco_batch = nombre_columna_veinticinco_batch_this;
                                nombre_columna_veintiseis_batch = nombre_columna_veintiseis_batch_this;
                                nombre_columna_veintisiete_batch = nombre_columna_veintisiete_batch_this;
                                nombre_columna_veintiocho_batch = nombre_columna_veintiocho_batch_this;
                                nombre_columna_veintinueve_batch = nombre_columna_veintinueve_batch_this;
                                nombre_columna_treinta_batch = nombre_columna_treinta_batch_this;
                                nombre_columna_treintaiuno_batch = nombre_columna_treintaiuno_batch_this;
                                nombre_columna_treintaidos_batch = nombre_columna_treintaidos_batch_this;
                                nombre_columna_treintaitres_batch = nombre_columna_treintaitres_batch_this;
                                nombre_columna_treintaicuatro_batch = nombre_columna_treintaicuatro_batch_this;
                                nombre_columna_treintaicinco_batch = nombre_columna_treintaicinco_batch_this;
                                nombre_columna_treintaiseis_batch = nombre_columna_treintaiseis_batch_this;
                                nombre_columna_treintaisiete_batch = nombre_columna_treintaisiete_batch_this;
                                nombre_columna_treintaiocho_batch = nombre_columna_treintaiocho_batch_this;
                                nombre_columna_treintainueve_batch = nombre_columna_treintainueve_batch_this;
                                nombre_columna_cuarenta_batch = nombre_columna_cuarenta_batch_this;
                                nombre_columna_cuarentaiuno_batch = nombre_columna_cuarentaiuno_batch_this;
                                nombre_columna_cuarentaidos_batch = nombre_columna_cuarentaidos_batch_this;
                                nombre_columna_cuarentaitres_batch = nombre_columna_cuarentaitres_batch_this;
                                nombre_columna_cuarentaicuatro_batch = nombre_columna_cuarentaicuatro_batch_this;
                                nombre_columna_cuarentaicinco_batch = nombre_columna_cuarentaicinco_batch_this;
                                nombre_columna_cuarentaiseis_batch = nombre_columna_cuarentaiseis_batch_this;
                                nombre_columna_cuarentaisiete_batch = nombre_columna_cuarentaisiete_batch_this;
                                nombre_columna_cuarentaiocho_batch = nombre_columna_cuarentaiocho_batch_this;
                                nombre_columna_cuarentainueve_batch = nombre_columna_cuarentainueve_batch_this;
                                nombre_columna_cincuenta_batch = nombre_columna_cincuenta_batch_this;
                                
                                
                                [result appendFormat:@"uno%d=%@&dos%d=%@&tres%d=%@&cuatro%d=%@&cinco%d=%@&seis%d=%@&siete%d=%@&ocho%d=%@&nueve%d=%@&diez%d=%@&once%d=%@&doce%d=%@&trece%d=%@&catorce%d=%@&quince%d=%@&dieciseis%d=%@&diecisiete%d=%@&dieciocho%d=%@&diecinueve%d=%@&veinte%d=%@&veintiuno%d=%@&veintidos%d=%@&veintitres%d=%@&veinticuatro%d=%@&veinticinco%d=%@&veintiseis%d=%@&veintisiete%d=%@&veintiocho%d=%@&veintinueve%d=%@&treinta%d=%@&treintaiuno%d=%@&treintaidos%d=%@&treintaitres%d=%@&treintaicuatro%d=%@&treintaicinco%d=%@&treintaiseis%d=%@&treintaisiete%d=%@&treintaiocho%d=%@&treintainueve%d=%@&cuarenta%d=%@&cuarentaiuno%d=%@&cuarentaidos%d=%@&cuarentaitres%d=%@&cuarentaicuatro%d=%@&cuarentaicinco%d=%@&cuarentaiseis%d=%@&cuarentaisiete%d=%@&cuarentaiocho%d=%@&cuarentainueve%d=%@&cincuenta%d=%@&latitud%d=%@&longitud%d=%@&fecha%d=%@&censador%d=%@&",ic, uno, ic, dos, ic, tres, ic, cuatro, ic, cinco, ic, seis, ic,siete, ic, ocho, ic, nueve, ic, diez, ic, once, ic, doce, ic, trece, ic, catorce, ic, quince, ic, dieciseis, ic, diecisiete, ic, dieciocho, ic, diecinueve, ic, veinte, ic, veintiuno, ic, veintidos, ic, veintitres, ic, veinticuatro, ic, veinticinco, ic, veintiseis, ic, veintisiete, ic, veintiocho, ic, veintinueve, ic, treinta, ic, treintaiuno, ic, treintaidos, ic, treintaitres, ic, treintaicuatro, ic, treintaicinco, ic, treintaiseis, ic, treintaisiete, ic, treintaiocho, ic, treintainueve, ic, cuarenta, ic, cuarentaiuno, ic, cuarentaidos, ic, cuarentaitres, ic, cuarentaicuatro, ic, cuarentaicinco, ic, cuarentaiseis, ic, cuarentaisiete, ic, cuarentaiocho, ic, cuarentainueve, ic, cincuenta, ic, latitud, ic, longitud, ic, fecha, ic, censador];
                                
                                ic++;
                            }
                        }
                    }
                    sqlite3_close(censos);
                    break;
                    
                    
            }// END SWITCH
            
            
            
            
            
            ////////////////////////////////////////// BUSCAR EL RENGLON MAS ALTO QUE SE ENVIA PARA CAMBIAR EL STATE A ON A TODOS LOS MENORES QUE ESE ////////////////////////////////////////////////
            
            
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                
                NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\" LIMIT 15", nombre_proyecto_actual_censo_batch];
                const char* query_sql = [querySql UTF8String];
                
                
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        NSString *id_number = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                        
                        id_num = id_number;
                        
                    }
                }
            }
            sqlite3_close(censos);
            
            
            ////////////////////////////////////////////////////// CAMBIAR BOOL A ON SI HAY DATOS ///////////////////////////////////////////////////////////////////////////////////////////
            
            entrar = false;
            
            if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                
                NSString *querySql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE STATE = \"PENDING\"", nombre_proyecto_actual_censo_batch];
                const char* query_sql = [querySql UTF8String];
                
                if (sqlite3_prepare(censos, query_sql, -1, &statement, NULL)==SQLITE_OK) {
                    while (sqlite3_step(statement)==SQLITE_ROW) {
                        
                        entrar = true;
                    }
                }
                sqlite3_close(censos);
            }
            
            ////////////////////////////////////////////////////// UPDATE EL STATE DEL SQLITE //////////////////////////////////////////////////////////////////////////////////////////////
            
            if (entrar == true) {
                
            ////////////////////////////////////////////////////////// EMPIEZA ENVIAR DATOS A MYSQL ////////////////////////////////////////////////////////////////////////////////////////
                
                
                
                NSString *semiNewString = [result substringToIndex:[result length]-1];
                
                NSString *newString = [NSString stringWithFormat:@"columnaUno=%@&columnaDos=%@&columnaTres=%@&columnaCuatro=%@&columnaCinco=%@&columnaSeis=%@&columnaSiete=%@&columnaOcho=%@&columnaNueve=%@&columnaDiez=%@&columnaOnce=%@&columnaDoce=%@&columnaTrece=%@&columnaCatorce=%@&columnaQuince=%@&columnaDieciseis=%@&columnaDiecisiete=%@&columnaDieciocho=%@&columnaDiecinueve=%@&columnaVeinte=%@&columnaVeintiuno=%@&columnaVeintidos=%@&columnaVeintitres=%@&columnaVeinticuatro=%@&columnaVeinticinco=%@&columnaVeintiseis=%@&columnaVeintisiete=%@&columnaVeintiocho=%@&columnaVeintinueve=%@&columnaTreinta=%@&columnaTreintaiuno=%@&columnaTreintaidos=%@&columnaTreintaitres=%@&columnaTreintaicuatro=%@&columnaTreintaicinco=%@&columnaTreintaiseis=%@&columnaTreintaisiete=%@&columnaTreintaiocho=%@&columnaTreintainueve=%@&columnaCuarenta=%@&columnaCuarentaiuno=%@&columnaCuarentaidos=%@&columnaCuarentaitres=%@&columnaCuarentaicuatro=%@&columnaCuarentaicinco=%@&columnaCuarentaiseis=%@&columnaCuarentaisiete=%@&columnaCuarentaiocho=%@&columnaCuarentainueve=%@&columnaCincuenta=%@&%@", nombre_columna_uno_batch, nombre_columna_dos_batch, nombre_columna_tres_batch, nombre_columna_cuatro_batch, nombre_columna_cinco_batch, nombre_columna_seis_batch, nombre_columna_siete_batch, nombre_columna_ocho_batch, nombre_columna_nueve_batch, nombre_columna_diez_batch, nombre_columna_once_batch, nombre_columna_doce_batch, nombre_columna_trece_batch, nombre_columna_catorce_batch, nombre_columna_quince_batch, nombre_columna_dieciseis_batch, nombre_columna_diecisiete_batch, nombre_columna_dieciocho_batch, nombre_columna_diecinueve_batch, nombre_columna_veinte_batch, nombre_columna_veintiuno_batch, nombre_columna_veintidos_batch, nombre_columna_veintitres_batch, nombre_columna_veinticuatro_batch, nombre_columna_veinticinco_batch, nombre_columna_veintiseis_batch, nombre_columna_veintisiete_batch, nombre_columna_veintiocho_batch, nombre_columna_veintinueve_batch, nombre_columna_treinta_batch, nombre_columna_treintaiuno_batch, nombre_columna_treintaidos_batch, nombre_columna_treintaitres_batch, nombre_columna_treintaicuatro_batch, nombre_columna_treintaicinco_batch, nombre_columna_treintaiseis_batch, nombre_columna_treintaisiete_batch, nombre_columna_treintaiocho_batch, nombre_columna_treintainueve_batch, nombre_columna_cuarenta_batch, nombre_columna_cuarentaiuno_batch, nombre_columna_cuarentaidos_batch, nombre_columna_cuarentaitres_batch, nombre_columna_cuarentaicuatro_batch, nombre_columna_cuarentaicinco_batch, nombre_columna_cuarentaiseis_batch, nombre_columna_cuarentaisiete_batch, nombre_columna_cuarentaiocho_batch, nombre_columna_cuarentainueve_batch, nombre_columna_cincuenta_batch, semiNewString];
                
//                NSString *strURL = [NSString stringWithFormat:@"http://www.zubexdb.com/batchFinal.php?numeroColumnas=%d&nombreProyecto=%@&%@", numero_columnas_proyecto_batch_int, nombre_proyecto_actual_censo_batch, newString];
//                
//                NSLog(@"STRING ==== %@", strURL);
//                
//                NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
//                
//                NSString *strResult = [[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];
//                
//                NSLog(@"PHP%@", strResult);
                
                
//                NSString *latitud_final = [NSString stringWithFormat:@"%@", latitud_batch];
//                NSString *longitud_final = [NSString stringWithFormat:@"%@", longitud_batch];
               

                
                
                NSString *strURL = [NSString stringWithFormat:@"http://oe.dataprodb.com/ios/batchCensosQuince.php?numeroColumnas=%d&nombreProyecto=%@&%@", numero_columnas_proyecto_batch_int, nombre_proyecto_actual_censo_batch, newString];
                
                NSLog(@"STRING ==== %@", strURL);
                
                NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
                
                NSString *strResult = [[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];
                
                NSLog(@"PHP%@", strResult);
                
                
                ////////////////////////////////////////////////////// TERMINA ENVIAR DATOS A MYSQL //////////////////////////////////////////////////////////////////////////////////////
             
                // CON ESTE IF SE VERIFICA SI EFECTIVAMENTE SE ENVIARON LOS DATOS A MYSQL
                // SI SI SE EVIARON, ENTONCES SI SE HACE EL UPDATE
                // ESTO ES CON EL FIN DE EVITAR QUE SE UPDATEE LA BASE DE SQLITE SIN QUE REALMENTE SE HAYAN ENVIADO LOS DATOS
                if ([strResult isEqualToString:@" 	success"]) {
                    NSLog(@"XXXXXXX ENTRO SUCCES");
                    
                int id_int = [id_num intValue];
                
                
                char *error;
                NSString *sent = @"SENT";
                if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
                    
                    NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@ SET STATE = \"%@\" WHERE ID <= %d", nombre_proyecto_actual_censo_batch, sent, id_int];
                    
                    const char *insert_stmt = [insertStmt UTF8String];
                    
                    if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
                        
                        NSLog(@"BASE %@ STATE UPDATEADO", nombre_proyecto_actual_censo_batch);
                        
                    }
                    sqlite3_close(censos);
                }
                    
                }// END IF (SE ENVIARON DATOS)
                
                
                
                // DELETE CAMPOS VACIOS DE MYSQL
                
                NSString *strURLDEL = [NSString stringWithFormat:@"http://oe.dataprodb.com/ios/delete.php?nombreProyecto=%@&columnaUno=%@", nombre_proyecto_actual_censo_batch, nombre_columna_uno_batch];
                
                NSData *dataURLDEL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURLDEL]];
                
                NSString *strResultDEL = [[NSString alloc] initWithData:dataURLDEL encoding:NSUTF8StringEncoding];
                
                NSLog(@"STATUS DELETED: %@", strResultDEL);
                
                
            }else
            {
                NSLog(@"NO HAY DATOS PARA ENVIAR");
                UIAlertView *alertFinDatos = [[UIAlertView alloc]initWithTitle:@"DATA PRO" message:@"Todos los datos han sido enviados" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                
                [alertFinDatos show];
              
            }
            
        }while (entrar == true);
        
    }// END IF INTERNET CONNECTION
    
}



@end
