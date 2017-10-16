//
//  BotonNUEVEViewController.m
//  Censos
//
//  Created by Juan Pestana on 10/22/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "BotonNUEVEViewController.h"
#import "Proyecto.h"


@interface BotonNUEVEViewController (){
    
    
    // VARIABLES DE SQLITE
    sqlite3 *censos;
    NSString *dbPathString;
    
}

@end



// ESTA VARIABLE AGARRA EL NOMBRE DEL PROYECTO ACTUAL DE LA BASE SQLITE Y CON ESTE MANDO A LLAMAR EL PHP DONDE ESTAN LOS NOMBRES DE LAS COLUMNAS
NSString *nombreProyectoActual_boton_nueve;

// VARIABLES GLOBALES

//ESTAS VARIABLES SON PARA TRAER LA INFO DE MYSQL Y PODER CREAR LAS TABLAS CON NOMBRES VARIABLES
NSString *nombre_proyecto_nueve;
NSString *numero_columnas_nueve;
NSString *columna_uno_nueve;
NSString *columna_dos_nueve;
NSString *columna_tres_nueve;
NSString *columna_cuatro_nueve;
NSString *columna_cinco_nueve;
NSString *columna_seis_nueve;
NSString *columna_siete_nueve;
NSString *columna_ocho_nueve;
NSString *columna_nueve_nueve;
NSString *columna_diez_nueve;
NSString *columna_once_nueve;
NSString *columna_doce_nueve;
NSString *columna_trece_nueve;
NSString *columna_catorce_nueve;
NSString *columna_quince_nueve;
NSString *columna_dieciseis_nueve;
NSString *columna_diecisiete_nueve;
NSString *columna_dieciocho_nueve;
NSString *columna_diecinueve_nueve;
NSString *columna_veinte_nueve;
NSString *columna_veintiuno_nueve;
NSString *columna_veintidos_nueve;
NSString *columna_veintitres_nueve;
NSString *columna_veinticuatro_nueve;
NSString *columna_veinticinco_nueve;
NSString *columna_veintiseis_nueve;
NSString *columna_veintisiete_nueve;
NSString *columna_veintiocho_nueve;
NSString *columna_veintinueve_nueve;
NSString *columna_treinta_nueve;
NSString *columna_treintaiuno_nueve;
NSString *columna_treintaidos_nueve;
NSString *columna_treintaitres_nueve;
NSString *columna_treintaicuatro_nueve;
NSString *columna_treintaicinco_nueve;
NSString *columna_treintaiseis_nueve;
NSString *columna_treintaisiete_nueve;
NSString *columna_treintaiocho_nueve;
NSString *columna_treintainueve_nueve;
NSString *columna_cuarenta_nueve;
NSString *columna_cuarentaiuno_nueve;
NSString *columna_cuarentaidos_nueve;
NSString *columna_cuarentaitres_nueve;
NSString *columna_cuarentaicuatro_nueve;
NSString *columna_cuarentaicinco_nueve;
NSString *columna_cuarentaiseis_nueve;
NSString *columna_cuarentaisiete_nueve;
NSString *columna_cuarentaiocho_nueve;
NSString *columna_cuarentainueve_nueve;
NSString *columna_cincuenta_nueve;




@implementation BotonNUEVEViewController

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
    
    [self createOrOpenDBNombreProyectoActual];
    [self selfActualizarVARIABLE];
    
    
    
    
    // AQUI SE HACE EL LLAMADO AL ARCHIVO PHP PARA TRAER LOS DATOS DE INTERNET
    // ESTE METODO ESTA RELACIONADO CON LOS VOIDS DE ABAJO QUE TIENE "CONNECTION" EN EL TITULO
    NSString *strURL = [NSString stringWithFormat:@"http://oe.dataprodb.com/ios/columnasBotones.php?nombreProyecto=%@", nombreProyectoActual_boton_nueve];
    
    NSURL *url = [NSURL URLWithString:strURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [[NSURLConnection alloc]initWithRequest:request delegate:self];
    
    

}


//////////////////// AQUI EMPIEZAN LOS VOIDS DE LA CONEXION A INTERNET PARA TRAER LOS DATOS DE LA BASE DE DATOS EN FORMATO JSON ///////////

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    data = [[NSMutableData alloc]init];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)theData{
    
    [data appendData:theData];
}

// ESTE ES EL ULTIMO PASO DEL PROCESO DE TRAER LOS DATOS EN FORMATO JSON DE LA BASE DE MYSQL
// AQUI ADENTRO SE PONE LO QUE QUERAMOS HACE UNA VEZ QUE SE HAYAN BAJADO LOS DATOS
// UNA ACLARACION IMPORTANTE ES QUE SI PONES METODOS EN EL VIEWDIDLOAD QUE NECESITEN ESTOS DATOS DE JSON, NO VA A FUNCIONAR,
// PORQUE LOS DATOS, EN EL VIEWDIDLOAD, TODAVIA NO SE HAN DESCARGADO
// LOS DATOS SE DESCARGAN DESPUES DE QUE SE CUMPLE ESTE PROCESO DE CONNECTIONDIDFINISHLOADING
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    datos = [NSJSONSerialization JSONObjectWithData:data options:nil error:nil];
    
    // CON ESTO SE PONE EN LAS VARIABLES GLOBALES LA INFORMACION DE LA BASE DE MYSQL
    nombre_proyecto_nueve = [[datos objectAtIndex:0] objectForKey:@"nombreProyecto"];
    numero_columnas_nueve = [[datos objectAtIndex:0] objectForKey:@"numeroColumnas"];
    columna_uno_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaUno"];
    columna_dos_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaDos"];
    columna_tres_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaTres"];
    columna_cuatro_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaCuatro"];
    columna_cinco_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaCinco"];
    columna_seis_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaSeis"];
    columna_siete_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaSiete"];
    columna_ocho_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaOcho"];
    columna_nueve_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaNueve"];
    columna_diez_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaDiez"];
    columna_once_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaOnce"];
    columna_doce_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaDoce"];
    columna_trece_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaTrece"];
    columna_catorce_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaCatorce"];
    columna_quince_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaQuince"];
    columna_dieciseis_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaDieciseis"];
    columna_diecisiete_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaDiecisiete"];
    columna_dieciocho_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaDieciocho"];
    columna_diecinueve_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaDiecinueve"];
    columna_veinte_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaVeinte"];
    columna_veintiuno_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaVeintiuno"];
    columna_veintidos_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaVeintidos"];
    columna_veintitres_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaVeintitres"];
    columna_veinticuatro_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaVeinticuatro"];
    columna_veinticinco_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaVeinticinco"];
    columna_veintiseis_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaVeintiseis"];
    columna_veintisiete_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaVeintisiete"];
    columna_veintiocho_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaVeintiocho"];
    columna_veintinueve_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaVeintinueve"];
    columna_treinta_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaTreinta"];
    columna_treintaiuno_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaTreintaiuno"];
    columna_treintaidos_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaTreintaidos"];
    columna_treintaitres_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaTreintaitres"];
    columna_treintaicuatro_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaTreintaicuatro"];
    columna_treintaicinco_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaTreintaicinco"];
    columna_treintaiseis_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaTreintaiseis"];
    columna_treintaisiete_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaTreintaisiete"];
    columna_treintaiocho_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaTreintaiocho"];
    columna_treintainueve_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaTreintainueve"];
    columna_cuarenta_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaCuarenta"];
    columna_cuarentaiuno_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentaiuno"];
    columna_cuarentaidos_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentaidos"];
    columna_cuarentaitres_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentaitres"];
    columna_cuarentaicuatro_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentaicuatro"];
    columna_cuarentaicinco_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentaicinco"];
    columna_cuarentaiseis_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentaiseis"];
    columna_cuarentaisiete_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentaisiete"];
    columna_cuarentaiocho_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentaiocho"];
    columna_cuarentainueve_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentainueve"];
    columna_cincuenta_nueve =[[datos objectAtIndex:0] objectForKey:@"columnaCincuenta"];
    
    [self ponerNombresLabels];
    
    
    
    //  AQUI SE AGARRA EL NUMERO DE COLUMNAS QUE TIENE LA TABLA PARA VER CUANTOS TEXTFIELDS Y LABELS SE MUESTRAN
    // UNO
    NSString *numeroColumnas = [[datos objectAtIndex:0] objectForKey:@"numeroColumnas"];
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
    
    
}


// AQUI ESTAMOS LLAMANDO A LA FAMOSA BASE IMPROTANTE QUE TIENE EL NOMBRE DEL PROYECTO ACTUAL EN EL QUE ESTAMOS TRABAJANDO
-(void)createOrOpenDBNombreProyectoActual{
    
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
            
            NSLog(@"TABLA NOMBREPROYECTOACTUAL CREADA");
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
                NSString *variable = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                
                _label_proyecto_actual.text = variable;
                
                // ESTA ES UNA VARIABLE GLOBAL QUE CREE ARRIBA DEL CODIGO PARA GUARDAR, PARA TODO ESTE ARCHIVO, EL NOMBRE DEL PROYECTO ACTUAL
                // EL CUAL SACAMOS DE LA FAMOSA BASE DE NOMBREPROYECTOACTUAL
                nombreProyectoActual_boton_nueve = variable;
                
            }
        }
    }
}

//  AQUI VIENE LA PARTE EN DONDE SE PONE LA INFORMACION QUE EL USUARIO PONGA EN LOS TEXTFIELDS EN LA BASE DE DATOS DE
// SQLITE DE DONDE DESPUES SE VA A SACAR PARA METER EN LA BASE PRINCIPAL DE CADA PROYECTO PARA MANDAR A LA NUBE
// VAMOS A HACER UNA FUNCION PARA CADA UNA DE LAS CINCUENTA OPCIONES PARA UTILIZAR LA QUE CORRESPONDA DEPENDIENDO DE/
// CUANTAS COLUMNAS TENGA EL PROYECTO EN EL QUE SE ESTA TRABAJANDO
//


// UNO
-(void)insertarDBBotonesUNO{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@) values ('%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
}



// DOS
-(void)insertarDBBotonesDOS{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@) values ('%@', '%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
}



// TRES
-(void)insertarDBBotonesTRES{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@) values ('%@', '%@', '%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}


// CUATRO
-(void)insertarDBBotonesCUATRO{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@) values ('%@', '%@', '%@', '%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}



// CINCO
-(void)insertarDBBotonesCINCO{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@) values ('%@', '%@', '%@', '%@', '%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}


// SEIS
-(void)insertarDBBotonesSEIS{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@) values ('%@', '%@', '%@', '%@', '%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}



// SIETE
-(void)insertarDBBotonesSIETE{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@) values ('%@', '%@', '%@', '%@', '%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}


// OCHO
-(void)insertarDBBotonesOCHO{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@) values ('%@', '%@', '%@', '%@', '%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}


// NUEVE
-(void)insertarDBBotonesNUEVE{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}

// DIEZ
-(void)insertarDBBotonesDIEZ{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}



// ONCE
-(void)insertarDBBotonesONCE{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}

// DOCE
-(void)insertarDBBotonesDOCE{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}


// TRECE
-(void)insertarDBBotonesTRECE{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}


// CATORCE
-(void)insertarDBBotonesCATORCE{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}



// QUINCE
-(void)insertarDBBotonesQUINCE{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}


// DIECISEIS
-(void)insertarDBBotonesDIECISEIS{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}


// DIECISIETE
-(void)insertarDBBotonesDIECISIETE{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}

// DIECIOCHO
-(void)insertarDBBotonesDIECIOCHO{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}

// DIECINUEVE
-(void)insertarDBBotonesDIECINUEVE{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}

// VEINTE
-(void)insertarDBBotonesVEINTE{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}


// VEINTIUNO
-(void)insertarDBBotonesVEINTIUNO{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}



// VEINTIDOS
-(void)insertarDBBotonesVEINTIDOS{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}


// VEINTITRES
-(void)insertarDBBotonesVEINTITRES{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}



// VEINTICUATRO
-(void)insertarDBBotonesVEINTICUATRO{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}


// VEINTICINCO
-(void)insertarDBBotonesVEINTICINCO{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}


// VEINTISEIS
-(void)insertarDBBotonesVEINTISEIS{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, columna_veintiseis_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text, columna_veintiseis_nueve, self.textfield_columna_veintiseis.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}


// VEINTISIETE
-(void)insertarDBBotonesVEINTISIETE{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, columna_veintiseis_nueve, columna_veintisiete_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text, columna_veintiseis_nueve, self.textfield_columna_veintiseis.text, columna_veintisiete_nueve, self.textfield_columna_veintisiete.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}



// VEINTIOCHO
-(void)insertarDBBotonesVEINTIOCHO{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@','%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, columna_veintiseis_nueve, columna_veintisiete_nueve, columna_veintiocho_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text, columna_veintiseis_nueve, self.textfield_columna_veintiseis.text, columna_veintisiete_nueve, self.textfield_columna_veintisiete.text, columna_veintiocho_nueve, self.textfield_columna_veintiocho.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}



// VEINTINUEVE
-(void)insertarDBBotonesVEINTINUEVE{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, columna_veintiseis_nueve, columna_veintisiete_nueve, columna_veintiocho_nueve, columna_veintinueve_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text, columna_veintiseis_nueve, self.textfield_columna_veintiseis.text, columna_veintisiete_nueve, self.textfield_columna_veintisiete.text, columna_veintiocho_nueve, self.textfield_columna_veintiocho.text, columna_veintinueve_nueve, self.textfield_columna_veintinueve.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}

// TREINTA
-(void)insertarDBBotonesTREINTA{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, columna_veintiseis_nueve, columna_veintisiete_nueve, columna_veintiocho_nueve, columna_veintinueve_nueve, columna_treinta_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text, columna_veintiseis_nueve, self.textfield_columna_veintiseis.text, columna_veintisiete_nueve, self.textfield_columna_veintisiete.text, columna_veintiocho_nueve, self.textfield_columna_veintiocho.text, columna_veintinueve_nueve, self.textfield_columna_veintinueve.text, columna_treinta_nueve, self.textfield_columna_treinta.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}



// TREINTAIUNO
-(void)insertarDBBotonesTREINTAIUNO{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, columna_veintiseis_nueve, columna_veintisiete_nueve, columna_veintiocho_nueve, columna_veintinueve_nueve, columna_treinta_nueve, columna_treintaiuno_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text, columna_veintiseis_nueve, self.textfield_columna_veintiseis.text, columna_veintisiete_nueve, self.textfield_columna_veintisiete.text, columna_veintiocho_nueve, self.textfield_columna_veintiocho.text, columna_veintinueve_nueve, self.textfield_columna_veintinueve.text, columna_treinta_nueve, self.textfield_columna_treinta.text, columna_treintaiuno_nueve, self.textfield_columna_treintaiuno.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}




// TREINTAIDOS
-(void)insertarDBBotonesTREINTAIDOS{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, columna_veintiseis_nueve, columna_veintisiete_nueve, columna_veintiocho_nueve, columna_veintinueve_nueve, columna_treinta_nueve, columna_treintaiuno_nueve, columna_treintaidos_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text, columna_veintiseis_nueve, self.textfield_columna_veintiseis.text, columna_veintisiete_nueve, self.textfield_columna_veintisiete.text, columna_veintiocho_nueve, self.textfield_columna_veintiocho.text, columna_veintinueve_nueve, self.textfield_columna_veintinueve.text, columna_treinta_nueve, self.textfield_columna_treinta.text, columna_treintaiuno_nueve, self.textfield_columna_treintaiuno.text, columna_treintaidos_nueve, self.textfield_columna_treintaidos.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}



// TREINTAITRES
-(void)insertarDBBotonesTREINTAITRES{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, columna_veintiseis_nueve, columna_veintisiete_nueve, columna_veintiocho_nueve, columna_veintinueve_nueve, columna_treinta_nueve, columna_treintaiuno_nueve, columna_treintaidos_nueve, columna_treintaitres_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text, columna_veintiseis_nueve, self.textfield_columna_veintiseis.text, columna_veintisiete_nueve, self.textfield_columna_veintisiete.text, columna_veintiocho_nueve, self.textfield_columna_veintiocho.text, columna_veintinueve_nueve, self.textfield_columna_veintinueve.text, columna_treinta_nueve, self.textfield_columna_treinta.text, columna_treintaiuno_nueve, self.textfield_columna_treintaiuno.text, columna_treintaidos_nueve, self.textfield_columna_treintaidos.text, columna_treintaitres_nueve, self.textfield_columna_treintaitres.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}


// TREINTAICUATRO
-(void)insertarDBBotonesTREINTAICUATRO{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, columna_veintiseis_nueve, columna_veintisiete_nueve, columna_veintiocho_nueve, columna_veintinueve_nueve, columna_treinta_nueve, columna_treintaiuno_nueve, columna_treintaidos_nueve, columna_treintaitres_nueve, columna_treintaicuatro_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text, columna_veintiseis_nueve, self.textfield_columna_veintiseis.text, columna_veintisiete_nueve, self.textfield_columna_veintisiete.text, columna_veintiocho_nueve, self.textfield_columna_veintiocho.text, columna_veintinueve_nueve, self.textfield_columna_veintinueve.text, columna_treinta_nueve, self.textfield_columna_treinta.text, columna_treintaiuno_nueve, self.textfield_columna_treintaiuno.text, columna_treintaidos_nueve, self.textfield_columna_treintaidos.text, columna_treintaitres_nueve, self.textfield_columna_treintaitres.text, columna_treintaicuatro_nueve, self.textfield_columna_treintaicuatro.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}


// TREINTAICINCO
-(void)insertarDBBotonesTREINTAICINCO{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, columna_veintiseis_nueve, columna_veintisiete_nueve, columna_veintiocho_nueve, columna_veintinueve_nueve, columna_treinta_nueve, columna_treintaiuno_nueve, columna_treintaidos_nueve, columna_treintaitres_nueve, columna_treintaicuatro_nueve, columna_treintaicinco_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text, columna_veintiseis_nueve, self.textfield_columna_veintiseis.text, columna_veintisiete_nueve, self.textfield_columna_veintisiete.text, columna_veintiocho_nueve, self.textfield_columna_veintiocho.text, columna_veintinueve_nueve, self.textfield_columna_veintinueve.text, columna_treinta_nueve, self.textfield_columna_treinta.text, columna_treintaiuno_nueve, self.textfield_columna_treintaiuno.text, columna_treintaidos_nueve, self.textfield_columna_treintaidos.text, columna_treintaitres_nueve, self.textfield_columna_treintaitres.text, columna_treintaicuatro_nueve, self.textfield_columna_treintaicuatro.text, columna_treintaicinco_nueve, self.textfield_columna_treintaicinco.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}


// TREINTAISEIS
-(void)insertarDBBotonesTREINTAISEIS{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@', '%@', '%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, columna_veintiseis_nueve, columna_veintisiete_nueve, columna_veintiocho_nueve, columna_veintinueve_nueve, columna_treinta_nueve, columna_treintaiuno_nueve, columna_treintaidos_nueve, columna_treintaitres_nueve, columna_treintaicuatro_nueve, columna_treintaicinco_nueve, columna_treintaiseis_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text, columna_veintiseis_nueve, self.textfield_columna_veintiseis.text, columna_veintisiete_nueve, self.textfield_columna_veintisiete.text, columna_veintiocho_nueve, self.textfield_columna_veintiocho.text, columna_veintinueve_nueve, self.textfield_columna_veintinueve.text, columna_treinta_nueve, self.textfield_columna_treinta.text, columna_treintaiuno_nueve, self.textfield_columna_treintaiuno.text, columna_treintaidos_nueve, self.textfield_columna_treintaidos.text, columna_treintaitres_nueve, self.textfield_columna_treintaitres.text, columna_treintaicuatro_nueve, self.textfield_columna_treintaicuatro.text, columna_treintaicinco_nueve, self.textfield_columna_treintaicinco.text, columna_treintaiseis_nueve, self.textfield_columna_treintaiseis.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}


// TREINTAISIETE
-(void)insertarDBBotonesTREINTAISIETE{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@', '%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, columna_veintiseis_nueve, columna_veintisiete_nueve, columna_veintiocho_nueve, columna_veintinueve_nueve, columna_treinta_nueve, columna_treintaiuno_nueve, columna_treintaidos_nueve, columna_treintaitres_nueve, columna_treintaicuatro_nueve, columna_treintaicinco_nueve, columna_treintaiseis_nueve, columna_treintaisiete_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text, columna_veintiseis_nueve, self.textfield_columna_veintiseis.text, columna_veintisiete_nueve, self.textfield_columna_veintisiete.text, columna_veintiocho_nueve, self.textfield_columna_veintiocho.text, columna_veintinueve_nueve, self.textfield_columna_veintinueve.text, columna_treinta_nueve, self.textfield_columna_treinta.text, columna_treintaiuno_nueve, self.textfield_columna_treintaiuno.text, columna_treintaidos_nueve, self.textfield_columna_treintaidos.text, columna_treintaitres_nueve, self.textfield_columna_treintaitres.text, columna_treintaicuatro_nueve, self.textfield_columna_treintaicuatro.text, columna_treintaicinco_nueve, self.textfield_columna_treintaicinco.text, columna_treintaiseis_nueve, self.textfield_columna_treintaiseis.text, columna_treintaisiete_nueve, self.textfield_columna_treintaisiete.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}

// TREINTAIOCHO
-(void)insertarDBBotonesTREINTAIOCHO{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, columna_veintiseis_nueve, columna_veintisiete_nueve, columna_veintiocho_nueve, columna_veintinueve_nueve, columna_treinta_nueve, columna_treintaiuno_nueve, columna_treintaidos_nueve, columna_treintaitres_nueve, columna_treintaicuatro_nueve, columna_treintaicinco_nueve, columna_treintaiseis_nueve, columna_treintaisiete_nueve, columna_treintaiocho_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text, columna_veintiseis_nueve, self.textfield_columna_veintiseis.text, columna_veintisiete_nueve, self.textfield_columna_veintisiete.text, columna_veintiocho_nueve, self.textfield_columna_veintiocho.text, columna_veintinueve_nueve, self.textfield_columna_veintinueve.text, columna_treinta_nueve, self.textfield_columna_treinta.text, columna_treintaiuno_nueve, self.textfield_columna_treintaiuno.text, columna_treintaidos_nueve, self.textfield_columna_treintaidos.text, columna_treintaitres_nueve, self.textfield_columna_treintaitres.text, columna_treintaicuatro_nueve, self.textfield_columna_treintaicuatro.text, columna_treintaicinco_nueve, self.textfield_columna_treintaicinco.text, columna_treintaiseis_nueve, self.textfield_columna_treintaiseis.text, columna_treintaisiete_nueve, self.textfield_columna_treintaisiete.text, columna_treintaiocho_nueve, self.textfield_columna_treintaiocho.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}

// TREINTAINUEVE
-(void)insertarDBBotonesTREINTAINUEVE{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, columna_veintiseis_nueve, columna_veintisiete_nueve, columna_veintiocho_nueve, columna_veintinueve_nueve, columna_treinta_nueve, columna_treintaiuno_nueve, columna_treintaidos_nueve, columna_treintaitres_nueve, columna_treintaicuatro_nueve, columna_treintaicinco_nueve, columna_treintaiseis_nueve, columna_treintaisiete_nueve, columna_treintaiocho_nueve, columna_treintainueve_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text, columna_veintiseis_nueve, self.textfield_columna_veintiseis.text, columna_veintisiete_nueve, self.textfield_columna_veintisiete.text, columna_veintiocho_nueve, self.textfield_columna_veintiocho.text, columna_veintinueve_nueve, self.textfield_columna_veintinueve.text, columna_treinta_nueve, self.textfield_columna_treinta.text, columna_treintaiuno_nueve, self.textfield_columna_treintaiuno.text, columna_treintaidos_nueve, self.textfield_columna_treintaidos.text, columna_treintaitres_nueve, self.textfield_columna_treintaitres.text, columna_treintaicuatro_nueve, self.textfield_columna_treintaicuatro.text, columna_treintaicinco_nueve, self.textfield_columna_treintaicinco.text, columna_treintaiseis_nueve, self.textfield_columna_treintaiseis.text, columna_treintaisiete_nueve, self.textfield_columna_treintaisiete.text, columna_treintaiocho_nueve, self.textfield_columna_treintaiocho.text, columna_treintainueve_nueve, self.textfield_columna_treintainueve.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}


// CUARENTA
-(void)insertarDBBotonesCUARENTA{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, columna_veintiseis_nueve, columna_veintisiete_nueve, columna_veintiocho_nueve, columna_veintinueve_nueve, columna_treinta_nueve, columna_treintaiuno_nueve, columna_treintaidos_nueve, columna_treintaitres_nueve, columna_treintaicuatro_nueve, columna_treintaicinco_nueve, columna_treintaiseis_nueve, columna_treintaisiete_nueve, columna_treintaiocho_nueve, columna_treintainueve_nueve, columna_cuarenta_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text, columna_veintiseis_nueve, self.textfield_columna_veintiseis.text, columna_veintisiete_nueve, self.textfield_columna_veintisiete.text, columna_veintiocho_nueve, self.textfield_columna_veintiocho.text, columna_veintinueve_nueve, self.textfield_columna_veintinueve.text, columna_treinta_nueve, self.textfield_columna_treinta.text, columna_treintaiuno_nueve, self.textfield_columna_treintaiuno.text, columna_treintaidos_nueve, self.textfield_columna_treintaidos.text, columna_treintaitres_nueve, self.textfield_columna_treintaitres.text, columna_treintaicuatro_nueve, self.textfield_columna_treintaicuatro.text, columna_treintaicinco_nueve, self.textfield_columna_treintaicinco.text, columna_treintaiseis_nueve, self.textfield_columna_treintaiseis.text, columna_treintaisiete_nueve, self.textfield_columna_treintaisiete.text, columna_treintaiocho_nueve, self.textfield_columna_treintaiocho.text, columna_treintainueve_nueve, self.textfield_columna_treintainueve.text, columna_cuarenta_nueve, self.textfield_columna_cuarenta.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}

// CUARENTAIUNO
-(void)insertarDBBotonesCUARENTAIUNO{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, columna_veintiseis_nueve, columna_veintisiete_nueve, columna_veintiocho_nueve, columna_veintinueve_nueve, columna_treinta_nueve, columna_treintaiuno_nueve, columna_treintaidos_nueve, columna_treintaitres_nueve, columna_treintaicuatro_nueve, columna_treintaicinco_nueve, columna_treintaiseis_nueve, columna_treintaisiete_nueve, columna_treintaiocho_nueve, columna_treintainueve_nueve, columna_cuarenta_nueve, columna_cuarentaiuno_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text, columna_veintiseis_nueve, self.textfield_columna_veintiseis.text, columna_veintisiete_nueve, self.textfield_columna_veintisiete.text, columna_veintiocho_nueve, self.textfield_columna_veintiocho.text, columna_veintinueve_nueve, self.textfield_columna_veintinueve.text, columna_treinta_nueve, self.textfield_columna_treinta.text, columna_treintaiuno_nueve, self.textfield_columna_treintaiuno.text, columna_treintaidos_nueve, self.textfield_columna_treintaidos.text, columna_treintaitres_nueve, self.textfield_columna_treintaitres.text, columna_treintaicuatro_nueve, self.textfield_columna_treintaicuatro.text, columna_treintaicinco_nueve, self.textfield_columna_treintaicinco.text, columna_treintaiseis_nueve, self.textfield_columna_treintaiseis.text, columna_treintaisiete_nueve, self.textfield_columna_treintaisiete.text, columna_treintaiocho_nueve, self.textfield_columna_treintaiocho.text, columna_treintainueve_nueve, self.textfield_columna_treintainueve.text, columna_cuarenta_nueve, self.textfield_columna_cuarenta.text, columna_cuarentaiuno_nueve, self.textfield_columna_cuarentaiuno.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}

// CUARENTAIDOS
-(void)insertarDBBotonesCUARENTAIDOS{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@', '%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, columna_veintiseis_nueve, columna_veintisiete_nueve, columna_veintiocho_nueve, columna_veintinueve_nueve, columna_treinta_nueve, columna_treintaiuno_nueve, columna_treintaidos_nueve, columna_treintaitres_nueve, columna_treintaicuatro_nueve, columna_treintaicinco_nueve, columna_treintaiseis_nueve, columna_treintaisiete_nueve, columna_treintaiocho_nueve, columna_treintainueve_nueve, columna_cuarenta_nueve, columna_cuarentaiuno_nueve, columna_cuarentaidos_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text, columna_veintiseis_nueve, self.textfield_columna_veintiseis.text, columna_veintisiete_nueve, self.textfield_columna_veintisiete.text, columna_veintiocho_nueve, self.textfield_columna_veintiocho.text, columna_veintinueve_nueve, self.textfield_columna_veintinueve.text, columna_treinta_nueve, self.textfield_columna_treinta.text, columna_treintaiuno_nueve, self.textfield_columna_treintaiuno.text, columna_treintaidos_nueve, self.textfield_columna_treintaidos.text, columna_treintaitres_nueve, self.textfield_columna_treintaitres.text, columna_treintaicuatro_nueve, self.textfield_columna_treintaicuatro.text, columna_treintaicinco_nueve, self.textfield_columna_treintaicinco.text, columna_treintaiseis_nueve, self.textfield_columna_treintaiseis.text, columna_treintaisiete_nueve, self.textfield_columna_treintaisiete.text, columna_treintaiocho_nueve, self.textfield_columna_treintaiocho.text, columna_treintainueve_nueve, self.textfield_columna_treintainueve.text, columna_cuarenta_nueve, self.textfield_columna_cuarenta.text, columna_cuarentaiuno_nueve, self.textfield_columna_cuarentaiuno.text, columna_cuarentaidos_nueve, self.textfield_columna_cuarentaidos.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}



// CUARENTAITRES
-(void)insertarDBBotonesCUARENTAITRES{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@', '%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, columna_veintiseis_nueve, columna_veintisiete_nueve, columna_veintiocho_nueve, columna_veintinueve_nueve, columna_treinta_nueve, columna_treintaiuno_nueve, columna_treintaidos_nueve, columna_treintaitres_nueve, columna_treintaicuatro_nueve, columna_treintaicinco_nueve, columna_treintaiseis_nueve, columna_treintaisiete_nueve, columna_treintaiocho_nueve, columna_treintainueve_nueve, columna_cuarenta_nueve, columna_cuarentaiuno_nueve, columna_cuarentaidos_nueve, columna_cuarentaitres_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text, columna_veintiseis_nueve, self.textfield_columna_veintiseis.text, columna_veintisiete_nueve, self.textfield_columna_veintisiete.text, columna_veintiocho_nueve, self.textfield_columna_veintiocho.text, columna_veintinueve_nueve, self.textfield_columna_veintinueve.text, columna_treinta_nueve, self.textfield_columna_treinta.text, columna_treintaiuno_nueve, self.textfield_columna_treintaiuno.text, columna_treintaidos_nueve, self.textfield_columna_treintaidos.text, columna_treintaitres_nueve, self.textfield_columna_treintaitres.text, columna_treintaicuatro_nueve, self.textfield_columna_treintaicuatro.text, columna_treintaicinco_nueve, self.textfield_columna_treintaicinco.text, columna_treintaiseis_nueve, self.textfield_columna_treintaiseis.text, columna_treintaisiete_nueve, self.textfield_columna_treintaisiete.text, columna_treintaiocho_nueve, self.textfield_columna_treintaiocho.text, columna_treintainueve_nueve, self.textfield_columna_treintainueve.text, columna_cuarenta_nueve, self.textfield_columna_cuarenta.text, columna_cuarentaiuno_nueve, self.textfield_columna_cuarentaiuno.text, columna_cuarentaidos_nueve, self.textfield_columna_cuarentaidos.text, columna_cuarentaitres_nueve, self.textfield_columna_cuarentaitres.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}


// CUARENTAICUATRO
-(void)insertarDBBotonesCUARENTAICUATRO{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@', '%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, columna_veintiseis_nueve, columna_veintisiete_nueve, columna_veintiocho_nueve, columna_veintinueve_nueve, columna_treinta_nueve, columna_treintaiuno_nueve, columna_treintaidos_nueve, columna_treintaitres_nueve, columna_treintaicuatro_nueve, columna_treintaicinco_nueve, columna_treintaiseis_nueve, columna_treintaisiete_nueve, columna_treintaiocho_nueve, columna_treintainueve_nueve, columna_cuarenta_nueve, columna_cuarentaiuno_nueve, columna_cuarentaidos_nueve, columna_cuarentaitres_nueve, columna_cuarentaicuatro_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text, columna_veintiseis_nueve, self.textfield_columna_veintiseis.text, columna_veintisiete_nueve, self.textfield_columna_veintisiete.text, columna_veintiocho_nueve, self.textfield_columna_veintiocho.text, columna_veintinueve_nueve, self.textfield_columna_veintinueve.text, columna_treinta_nueve, self.textfield_columna_treinta.text, columna_treintaiuno_nueve, self.textfield_columna_treintaiuno.text, columna_treintaidos_nueve, self.textfield_columna_treintaidos.text, columna_treintaitres_nueve, self.textfield_columna_treintaitres.text, columna_treintaicuatro_nueve, self.textfield_columna_treintaicuatro.text, columna_treintaicinco_nueve, self.textfield_columna_treintaicinco.text, columna_treintaiseis_nueve, self.textfield_columna_treintaiseis.text, columna_treintaisiete_nueve, self.textfield_columna_treintaisiete.text, columna_treintaiocho_nueve, self.textfield_columna_treintaiocho.text, columna_treintainueve_nueve, self.textfield_columna_treintainueve.text, columna_cuarenta_nueve, self.textfield_columna_cuarenta.text, columna_cuarentaiuno_nueve, self.textfield_columna_cuarentaiuno.text, columna_cuarentaidos_nueve, self.textfield_columna_cuarentaidos.text, columna_cuarentaitres_nueve, self.textfield_columna_cuarentaitres.text, columna_cuarentaicuatro_nueve, self.textfield_columna_cuarentaicuatro.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}



// CUARENTAICINCO
-(void)insertarDBBotonesCUARENTAICINCO{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@', '%@','%@','%@', '%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, columna_veintiseis_nueve, columna_veintisiete_nueve, columna_veintiocho_nueve, columna_veintinueve_nueve, columna_treinta_nueve, columna_treintaiuno_nueve, columna_treintaidos_nueve, columna_treintaitres_nueve, columna_treintaicuatro_nueve, columna_treintaicinco_nueve, columna_treintaiseis_nueve, columna_treintaisiete_nueve, columna_treintaiocho_nueve, columna_treintainueve_nueve, columna_cuarenta_nueve, columna_cuarentaiuno_nueve, columna_cuarentaidos_nueve, columna_cuarentaitres_nueve, columna_cuarentaicuatro_nueve, columna_cuarentaicinco_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text, columna_veintiseis_nueve, self.textfield_columna_veintiseis.text, columna_veintisiete_nueve, self.textfield_columna_veintisiete.text, columna_veintiocho_nueve, self.textfield_columna_veintiocho.text, columna_veintinueve_nueve, self.textfield_columna_veintinueve.text, columna_treinta_nueve, self.textfield_columna_treinta.text, columna_treintaiuno_nueve, self.textfield_columna_treintaiuno.text, columna_treintaidos_nueve, self.textfield_columna_treintaidos.text, columna_treintaitres_nueve, self.textfield_columna_treintaitres.text, columna_treintaicuatro_nueve, self.textfield_columna_treintaicuatro.text, columna_treintaicinco_nueve, self.textfield_columna_treintaicinco.text, columna_treintaiseis_nueve, self.textfield_columna_treintaiseis.text, columna_treintaisiete_nueve, self.textfield_columna_treintaisiete.text, columna_treintaiocho_nueve, self.textfield_columna_treintaiocho.text, columna_treintainueve_nueve, self.textfield_columna_treintainueve.text, columna_cuarenta_nueve, self.textfield_columna_cuarenta.text, columna_cuarentaiuno_nueve, self.textfield_columna_cuarentaiuno.text, columna_cuarentaidos_nueve, self.textfield_columna_cuarentaidos.text, columna_cuarentaitres_nueve, self.textfield_columna_cuarentaitres.text, columna_cuarentaicuatro_nueve, self.textfield_columna_cuarentaicuatro.text, columna_cuarentaicinco_nueve, self.textfield_columna_cuarentaicinco.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}



// CUARENTAISEIS
-(void)insertarDBBotonesCUARENTAISEIS{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@', '%@','%@','%@', '%@', '%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, columna_veintiseis_nueve, columna_veintisiete_nueve, columna_veintiocho_nueve, columna_veintinueve_nueve, columna_treinta_nueve, columna_treintaiuno_nueve, columna_treintaidos_nueve, columna_treintaitres_nueve, columna_treintaicuatro_nueve, columna_treintaicinco_nueve, columna_treintaiseis_nueve, columna_treintaisiete_nueve, columna_treintaiocho_nueve, columna_treintainueve_nueve, columna_cuarenta_nueve, columna_cuarentaiuno_nueve, columna_cuarentaidos_nueve, columna_cuarentaitres_nueve, columna_cuarentaicuatro_nueve, columna_cuarentaicinco_nueve, columna_cuarentaiseis_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text, columna_veintiseis_nueve, self.textfield_columna_veintiseis.text, columna_veintisiete_nueve, self.textfield_columna_veintisiete.text, columna_veintiocho_nueve, self.textfield_columna_veintiocho.text, columna_veintinueve_nueve, self.textfield_columna_veintinueve.text, columna_treinta_nueve, self.textfield_columna_treinta.text, columna_treintaiuno_nueve, self.textfield_columna_treintaiuno.text, columna_treintaidos_nueve, self.textfield_columna_treintaidos.text, columna_treintaitres_nueve, self.textfield_columna_treintaitres.text, columna_treintaicuatro_nueve, self.textfield_columna_treintaicuatro.text, columna_treintaicinco_nueve, self.textfield_columna_treintaicinco.text, columna_treintaiseis_nueve, self.textfield_columna_treintaiseis.text, columna_treintaisiete_nueve, self.textfield_columna_treintaisiete.text, columna_treintaiocho_nueve, self.textfield_columna_treintaiocho.text, columna_treintainueve_nueve, self.textfield_columna_treintainueve.text, columna_cuarenta_nueve, self.textfield_columna_cuarenta.text, columna_cuarentaiuno_nueve, self.textfield_columna_cuarentaiuno.text, columna_cuarentaidos_nueve, self.textfield_columna_cuarentaidos.text, columna_cuarentaitres_nueve, self.textfield_columna_cuarentaitres.text, columna_cuarentaicuatro_nueve, self.textfield_columna_cuarentaicuatro.text, columna_cuarentaicinco_nueve, self.textfield_columna_cuarentaicinco.text, columna_cuarentaiseis_nueve, self.textfield_columna_cuarentaiseis.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}


// CUARENTAISIETE
-(void)insertarDBBotonesCUARENTAISIETE{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@', '%@','%@','%@', '%@', '%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, columna_veintiseis_nueve, columna_veintisiete_nueve, columna_veintiocho_nueve, columna_veintinueve_nueve, columna_treinta_nueve, columna_treintaiuno_nueve, columna_treintaidos_nueve, columna_treintaitres_nueve, columna_treintaicuatro_nueve, columna_treintaicinco_nueve, columna_treintaiseis_nueve, columna_treintaisiete_nueve, columna_treintaiocho_nueve, columna_treintainueve_nueve, columna_cuarenta_nueve, columna_cuarentaiuno_nueve, columna_cuarentaidos_nueve, columna_cuarentaitres_nueve, columna_cuarentaicuatro_nueve, columna_cuarentaicinco_nueve, columna_cuarentaiseis_nueve, columna_cuarentaisiete_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text, columna_veintiseis_nueve, self.textfield_columna_veintiseis.text, columna_veintisiete_nueve, self.textfield_columna_veintisiete.text, columna_veintiocho_nueve, self.textfield_columna_veintiocho.text, columna_veintinueve_nueve, self.textfield_columna_veintinueve.text, columna_treinta_nueve, self.textfield_columna_treinta.text, columna_treintaiuno_nueve, self.textfield_columna_treintaiuno.text, columna_treintaidos_nueve, self.textfield_columna_treintaidos.text, columna_treintaitres_nueve, self.textfield_columna_treintaitres.text, columna_treintaicuatro_nueve, self.textfield_columna_treintaicuatro.text, columna_treintaicinco_nueve, self.textfield_columna_treintaicinco.text, columna_treintaiseis_nueve, self.textfield_columna_treintaiseis.text, columna_treintaisiete_nueve, self.textfield_columna_treintaisiete.text, columna_treintaiocho_nueve, self.textfield_columna_treintaiocho.text, columna_treintainueve_nueve, self.textfield_columna_treintainueve.text, columna_cuarenta_nueve, self.textfield_columna_cuarenta.text, columna_cuarentaiuno_nueve, self.textfield_columna_cuarentaiuno.text, columna_cuarentaidos_nueve, self.textfield_columna_cuarentaidos.text, columna_cuarentaitres_nueve, self.textfield_columna_cuarentaitres.text, columna_cuarentaicuatro_nueve, self.textfield_columna_cuarentaicuatro.text, columna_cuarentaicinco_nueve, self.textfield_columna_cuarentaicinco.text, columna_cuarentaiseis_nueve, self.textfield_columna_cuarentaiseis.text, columna_cuarentaisiete_nueve, self.textfield_columna_cuarentaisiete.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}



// CUARENTAIOCHO
-(void)insertarDBBotonesCUARENTAIOCHO{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@', '%@','%@','%@', '%@', '%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, columna_veintiseis_nueve, columna_veintisiete_nueve, columna_veintiocho_nueve, columna_veintinueve_nueve, columna_treinta_nueve, columna_treintaiuno_nueve, columna_treintaidos_nueve, columna_treintaitres_nueve, columna_treintaicuatro_nueve, columna_treintaicinco_nueve, columna_treintaiseis_nueve, columna_treintaisiete_nueve, columna_treintaiocho_nueve, columna_treintainueve_nueve, columna_cuarenta_nueve, columna_cuarentaiuno_nueve, columna_cuarentaidos_nueve, columna_cuarentaitres_nueve, columna_cuarentaicuatro_nueve, columna_cuarentaicinco_nueve, columna_cuarentaiseis_nueve, columna_cuarentaisiete_nueve, columna_cuarentaiocho_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text, columna_veintiseis_nueve, self.textfield_columna_veintiseis.text, columna_veintisiete_nueve, self.textfield_columna_veintisiete.text, columna_veintiocho_nueve, self.textfield_columna_veintiocho.text, columna_veintinueve_nueve, self.textfield_columna_veintinueve.text, columna_treinta_nueve, self.textfield_columna_treinta.text, columna_treintaiuno_nueve, self.textfield_columna_treintaiuno.text, columna_treintaidos_nueve, self.textfield_columna_treintaidos.text, columna_treintaitres_nueve, self.textfield_columna_treintaitres.text, columna_treintaicuatro_nueve, self.textfield_columna_treintaicuatro.text, columna_treintaicinco_nueve, self.textfield_columna_treintaicinco.text, columna_treintaiseis_nueve, self.textfield_columna_treintaiseis.text, columna_treintaisiete_nueve, self.textfield_columna_treintaisiete.text, columna_treintaiocho_nueve, self.textfield_columna_treintaiocho.text, columna_treintainueve_nueve, self.textfield_columna_treintainueve.text, columna_cuarenta_nueve, self.textfield_columna_cuarenta.text, columna_cuarentaiuno_nueve, self.textfield_columna_cuarentaiuno.text, columna_cuarentaidos_nueve, self.textfield_columna_cuarentaidos.text, columna_cuarentaitres_nueve, self.textfield_columna_cuarentaitres.text, columna_cuarentaicuatro_nueve, self.textfield_columna_cuarentaicuatro.text, columna_cuarentaicinco_nueve, self.textfield_columna_cuarentaicinco.text, columna_cuarentaiseis_nueve, self.textfield_columna_cuarentaiseis.text, columna_cuarentaisiete_nueve, self.textfield_columna_cuarentaisiete.text, columna_cuarentaiocho_nueve, self.textfield_columna_cuarentaiocho.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}



// CUARENTAINUEVE
-(void)insertarDBBotonesCUARENTAINUEVE{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@', '%@','%@','%@', '%@', '%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, columna_veintiseis_nueve, columna_veintisiete_nueve, columna_veintiocho_nueve, columna_veintinueve_nueve, columna_treinta_nueve, columna_treintaiuno_nueve, columna_treintaidos_nueve, columna_treintaitres_nueve, columna_treintaicuatro_nueve, columna_treintaicinco_nueve, columna_treintaiseis_nueve, columna_treintaisiete_nueve, columna_treintaiocho_nueve, columna_treintainueve_nueve, columna_cuarenta_nueve, columna_cuarentaiuno_nueve, columna_cuarentaidos_nueve, columna_cuarentaitres_nueve, columna_cuarentaicuatro_nueve, columna_cuarentaicinco_nueve, columna_cuarentaiseis_nueve, columna_cuarentaisiete_nueve, columna_cuarentaiocho_nueve, columna_cuarentainueve_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text, columna_veintiseis_nueve, self.textfield_columna_veintiseis.text, columna_veintisiete_nueve, self.textfield_columna_veintisiete.text, columna_veintiocho_nueve, self.textfield_columna_veintiocho.text, columna_veintinueve_nueve, self.textfield_columna_veintinueve.text, columna_treinta_nueve, self.textfield_columna_treinta.text, columna_treintaiuno_nueve, self.textfield_columna_treintaiuno.text, columna_treintaidos_nueve, self.textfield_columna_treintaidos.text, columna_treintaitres_nueve, self.textfield_columna_treintaitres.text, columna_treintaicuatro_nueve, self.textfield_columna_treintaicuatro.text, columna_treintaicinco_nueve, self.textfield_columna_treintaicinco.text, columna_treintaiseis_nueve, self.textfield_columna_treintaiseis.text, columna_treintaisiete_nueve, self.textfield_columna_treintaisiete.text, columna_treintaiocho_nueve, self.textfield_columna_treintaiocho.text, columna_treintainueve_nueve, self.textfield_columna_treintainueve.text, columna_cuarenta_nueve, self.textfield_columna_cuarenta.text, columna_cuarentaiuno_nueve, self.textfield_columna_cuarentaiuno.text, columna_cuarentaidos_nueve, self.textfield_columna_cuarentaidos.text, columna_cuarentaitres_nueve, self.textfield_columna_cuarentaitres.text, columna_cuarentaicuatro_nueve, self.textfield_columna_cuarentaicuatro.text, columna_cuarentaicinco_nueve, self.textfield_columna_cuarentaicinco.text, columna_cuarentaiseis_nueve, self.textfield_columna_cuarentaiseis.text, columna_cuarentaisiete_nueve, self.textfield_columna_cuarentaisiete.text, columna_cuarentaiocho_nueve, self.textfield_columna_cuarentaiocho.text, columna_cuarentainueve_nueve, self.textfield_columna_cuarentainueve.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}



// CINCUENTA
-(void)insertarDBBotonesCINCUENTA{
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@BOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@BOTON9 (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@', '%@','%@','%@','%@', '%@','%@','%@', '%@', '%@','%@','%@','%@','%@')", nombreProyectoActual_boton_nueve, columna_uno_nueve, columna_dos_nueve, columna_tres_nueve, columna_cuatro_nueve, columna_cinco_nueve, columna_seis_nueve, columna_siete_nueve, columna_ocho_nueve, columna_nueve_nueve, columna_diez_nueve, columna_once_nueve, columna_doce_nueve, columna_trece_nueve, columna_catorce_nueve, columna_quince_nueve, columna_dieciseis_nueve, columna_diecisiete_nueve, columna_dieciocho_nueve, columna_diecinueve_nueve, columna_veinte_nueve, columna_veintiuno_nueve, columna_veintidos_nueve, columna_veintitres_nueve, columna_veinticuatro_nueve, columna_veinticinco_nueve, columna_veintiseis_nueve, columna_veintisiete_nueve, columna_veintiocho_nueve, columna_veintinueve_nueve, columna_treinta_nueve, columna_treintaiuno_nueve, columna_treintaidos_nueve, columna_treintaitres_nueve, columna_treintaicuatro_nueve, columna_treintaicinco_nueve, columna_treintaiseis_nueve, columna_treintaisiete_nueve, columna_treintaiocho_nueve, columna_treintainueve_nueve, columna_cuarenta_nueve, columna_cuarentaiuno_nueve, columna_cuarentaidos_nueve, columna_cuarentaitres_nueve, columna_cuarentaicuatro_nueve, columna_cuarentaicinco_nueve, columna_cuarentaiseis_nueve, columna_cuarentaisiete_nueve, columna_cuarentaiocho_nueve, columna_cuarentainueve_nueve, columna_cincuenta_nueve, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@BOTON9 SET %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\", %@ = \"%@\"", nombreProyectoActual_boton_nueve, columna_uno_nueve, self.textfield_columna_uno.text, columna_dos_nueve, self.textfield_columna_dos.text, columna_tres_nueve, self.textfield_columna_tres.text, columna_cuatro_nueve, self.textfield_columna_cuatro.text, columna_cinco_nueve, self.textfield_columna_cinco.text, columna_seis_nueve, self.textfield_columna_seis.text, columna_siete_nueve, self.textfield_columna_siete.text, columna_ocho_nueve, self.textfield_columna_ocho.text, columna_nueve_nueve, self.textfield_columna_nueve.text, columna_diez_nueve, self.textfield_columna_diez.text, columna_once_nueve, self.textfield_columna_once.text, columna_doce_nueve, self.textfield_columna_doce.text, columna_trece_nueve, self.textfield_columna_trece.text, columna_catorce_nueve, self.textfield_columna_catorce.text, columna_quince_nueve, self.textfield_columna_quince.text, columna_dieciseis_nueve, self.textfield_columna_dieciseis.text, columna_diecisiete_nueve, self.textfield_columna_diecisiete.text, columna_dieciocho_nueve, self.textfield_columna_dieciocho.text, columna_diecinueve_nueve, self.textfield_columna_diecinueve.text, columna_veinte_nueve, self.textfield_columna_veinte.text, columna_veintiuno_nueve, self.textfield_columna_veintiuno.text, columna_veintidos_nueve, self.textfield_columna_veintidos.text, columna_veintitres_nueve, self.textfield_columna_veintitres.text, columna_veinticuatro_nueve, self.textfield_columna_veinticuatro.text, columna_veinticinco_nueve, self.textfield_columna_veinticinco.text, columna_veintiseis_nueve, self.textfield_columna_veintiseis.text, columna_veintisiete_nueve, self.textfield_columna_veintisiete.text, columna_veintiocho_nueve, self.textfield_columna_veintiocho.text, columna_veintinueve_nueve, self.textfield_columna_veintinueve.text, columna_treinta_nueve, self.textfield_columna_treinta.text, columna_treintaiuno_nueve, self.textfield_columna_treintaiuno.text, columna_treintaidos_nueve, self.textfield_columna_treintaidos.text, columna_treintaitres_nueve, self.textfield_columna_treintaitres.text, columna_treintaicuatro_nueve, self.textfield_columna_treintaicuatro.text, columna_treintaicinco_nueve, self.textfield_columna_treintaicinco.text, columna_treintaiseis_nueve, self.textfield_columna_treintaiseis.text, columna_treintaisiete_nueve, self.textfield_columna_treintaisiete.text, columna_treintaiocho_nueve, self.textfield_columna_treintaiocho.text, columna_treintainueve_nueve, self.textfield_columna_treintainueve.text, columna_cuarenta_nueve, self.textfield_columna_cuarenta.text, columna_cuarentaiuno_nueve, self.textfield_columna_cuarentaiuno.text, columna_cuarentaidos_nueve, self.textfield_columna_cuarentaidos.text, columna_cuarentaitres_nueve, self.textfield_columna_cuarentaitres.text, columna_cuarentaicuatro_nueve, self.textfield_columna_cuarentaicuatro.text, columna_cuarentaicinco_nueve, self.textfield_columna_cuarentaicinco.text, columna_cuarentaiseis_nueve, self.textfield_columna_cuarentaiseis.text, columna_cuarentaisiete_nueve, self.textfield_columna_cuarentaisiete.text, columna_cuarentaiocho_nueve, self.textfield_columna_cuarentaiocho.text, columna_cuarentainueve_nueve, self.textfield_columna_cuarentainueve.text, columna_cincuenta_nueve, self.textfield_columna_cincuenta.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
}




// CON ESTA FUNCION SE PONE EN LOS LABELS, LOS NOMBRES DE LAS COLUMNAS CORRESPONDIENTES
// LA FORMA COMO FUNCIONA, ES QUE EN EL ARRAY "DATOS" SE TIENE EN FORMATO JSON TODA LA TABLA DEL NOMBRE DEL PROYECTO ACTUAL
// ENTONCES CON EL "OBJECTOFORKEY" SE AGARRA EL DATO ESPECIFICO QUE QUEREMOS
// POR EJEMPLO, EN EL CASO DEL LABEL PARA LA COLUMNA UNO, UTILIZAMOS EL OBJECTFORKEY DE LA COLUMNA UNO DE LA TABLA MYSQL
-(void)ponerNombresLabels{
    
    NSString *uno = [[datos objectAtIndex:0] objectForKey:@"columnaUno"];
    NSString *dos = [[datos objectAtIndex:0] objectForKey:@"columnaDos"];
    NSString *tres = [[datos objectAtIndex:0] objectForKey:@"columnaTres"];
    NSString *cuatro = [[datos objectAtIndex:0] objectForKey:@"columnaCuatro"];
    NSString *cinco = [[datos objectAtIndex:0] objectForKey:@"columnaCinco"];
    NSString *seis = [[datos objectAtIndex:0] objectForKey:@"columnaSeis"];
    NSString *siete = [[datos objectAtIndex:0] objectForKey:@"columnaSiete"];
    NSString *ocho = [[datos objectAtIndex:0] objectForKey:@"columnaOcho"];
    NSString *nueve = [[datos objectAtIndex:0] objectForKey:@"columnaNueve"];
    NSString *diez = [[datos objectAtIndex:0] objectForKey:@"columnaDiez"];
    NSString *once = [[datos objectAtIndex:0] objectForKey:@"columnaOnce"];
    NSString *doce = [[datos objectAtIndex:0] objectForKey:@"columnaDoce"];
    NSString *trece = [[datos objectAtIndex:0] objectForKey:@"columnaTrece"];
    NSString *catorce = [[datos objectAtIndex:0] objectForKey:@"columnaCatorce"];
    NSString *quince = [[datos objectAtIndex:0] objectForKey:@"columnaQuince"];
    
    NSString *dieciseis = [[datos objectAtIndex:0] objectForKey:@"columnaDieciseis"];
    NSString *diecisiete = [[datos objectAtIndex:0] objectForKey:@"columnaDiecisiete"];
    NSString *dieciocho = [[datos objectAtIndex:0] objectForKey:@"columnaDieciocho"];
    NSString *diecinueve = [[datos objectAtIndex:0] objectForKey:@"columnaDiecinueve"];
    NSString *veinte = [[datos objectAtIndex:0] objectForKey:@"columnaVeinte"];
    NSString *veintiuno = [[datos objectAtIndex:0] objectForKey:@"columnaVeintiuno"];
    NSString *veintidos = [[datos objectAtIndex:0] objectForKey:@"columnaVeintidos"];
    NSString *veintitres = [[datos objectAtIndex:0] objectForKey:@"columnaVeintitres"];
    NSString *veinticuatro = [[datos objectAtIndex:0] objectForKey:@"columnaVeinticuatro"];
    NSString *veinticinco = [[datos objectAtIndex:0] objectForKey:@"columnaVeinticinco"];
    NSString *veintiseis = [[datos objectAtIndex:0] objectForKey:@"columnaVeintiseis"];
    NSString *veintisiete = [[datos objectAtIndex:0] objectForKey:@"columnaVeintisiete"];
    NSString *veintiocho = [[datos objectAtIndex:0] objectForKey:@"columnaVeintiocho"];
    NSString *veintinueve = [[datos objectAtIndex:0] objectForKey:@"columnaVeintinueve"];
    NSString *treinta = [[datos objectAtIndex:0] objectForKey:@"columnaTreinta"];
    NSString *treintaiuno = [[datos objectAtIndex:0] objectForKey:@"columnaTreintaiuno"];
    NSString *treintaidos = [[datos objectAtIndex:0] objectForKey:@"columnaTreintaidos"];
    NSString *treintaitres = [[datos objectAtIndex:0] objectForKey:@"columnaTreintaitres"];
    NSString *treintaicuatro = [[datos objectAtIndex:0] objectForKey:@"columnaTreintaicuatro"];
    NSString *treintaicinco = [[datos objectAtIndex:0] objectForKey:@"columnaTreintaicinco"];
    NSString *treintaiseis = [[datos objectAtIndex:0] objectForKey:@"columnaTreintaiseis"];
    NSString *treintaisiete = [[datos objectAtIndex:0] objectForKey:@"columnaTreintaisiete"];
    NSString *treintaiocho = [[datos objectAtIndex:0] objectForKey:@"columnaTreintaiocho"];
    NSString *treintainueve = [[datos objectAtIndex:0] objectForKey:@"columnaTreintainueve"];
    NSString *cuarenta = [[datos objectAtIndex:0] objectForKey:@"columnaCuarenta"];
    NSString *cuarentaiuno = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentaiuno"];
    NSString *cuarentaidos = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentaidos"];
    NSString *cuarentaitres = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentaitres"];
    NSString *cuarentaicuatro = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentaicuatro"];
    NSString *cuarentaicinco = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentaicinco"];
    NSString *cuarentaiseis = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentaiseis"];
    NSString *cuarentaisiete = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentaisiete"];
    NSString *cuarentaiocho = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentaiocho"];
    NSString *cuarentainueve = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentainueve"];
    NSString *cincuenta = [[datos objectAtIndex:0] objectForKey:@"columnaCincuenta"];
    
    
    
    _label_columna_uno.text = uno;
    _label_columna_dos.text = dos;
    _label_columna_tres.text = tres;
    _label_columna_cuatro.text = cuatro;
    _label_columna_cinco.text = cinco;
    _label_columna_seis.text = seis;
    _label_columna_siete.text = siete;
    _label_columna_ocho.text = ocho;
    _label_columna_nueve.text = nueve;
    _label_columna_diez.text = diez;
    _label_columna_once.text = once;
    _label_columna_doce.text = doce;
    _label_columna_trece.text = trece;
    _label_columna_catorce.text = catorce;
    _label_columna_quince.text = quince;
    _label_columna_dieciseis.text = dieciseis;
    _label_columna_diecisiete.text = diecisiete;
    _label_columna_dieciocho.text = dieciocho;
    _label_columna_diecinueve.text = diecinueve;
    _label_columna_veinte.text = veinte;
    _label_columna_veintiuno.text = veintiuno;
    _label_columna_veintidos.text = veintidos;
    _label_columna_veintitres.text = veintitres;
    _label_columna_veinticuatro.text = veinticuatro;
    _label_columna_veinticinco.text = veinticinco;
    _label_columna_veintiseis.text = veintiseis;
    _label_columna_veintisiete.text = veintisiete;
    _label_columna_veintiocho.text = veintiocho;
    _label_columna_veintinueve.text = veintinueve;
    _label_columna_treinta.text = treinta;
    _label_columna_treintaiuno.text = treintaiuno;
    _label_columna_treintaidos.text = treintaidos;
    _label_columna_treintaitres.text = treintaitres;
    _label_columna_treintaicuatro.text = treintaicuatro;
    _label_columna_treintaicinco.text = treintaicinco;
    _label_columna_treintaiseis.text = treintaiseis;
    _label_columna_treintaisiete.text = treintaisiete;
    _label_columna_treintaiocho.text = treintaiocho;
    _label_columna_treintainueve.text = treintainueve;
    _label_columna_cuarenta.text = cuarenta;
    _label_columna_cuarentaiuno.text = cuarentaiuno;
    _label_columna_cuarentaidos.text = cuarentaidos;
    _label_columna_cuarentaitres.text = cuarentaitres;
    _label_columna_cuarentaicuatro.text = cuarentaicuatro;
    _label_columna_cuarentaicinco.text = cuarentaicinco;
    _label_columna_cuarentaiseis.text = cuarentaiseis;
    _label_columna_cuarentaisiete.text = cuarentaisiete;
    _label_columna_cuarentaiocho.text = cuarentaiocho;
    _label_columna_cuarentainueve.text = cuarentainueve;
    _label_columna_cincuenta.text = cincuenta;
    
    
    
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






- (IBAction)agregar:(id)sender {
    
    
    
    int numero_columnas_int = [numero_columnas_nueve intValue];
    
    switch (numero_columnas_int) {
        case 1:
            [self insertarDBBotonesUNO];
            break;
        case 2:
            [self insertarDBBotonesDOS];
            break;
        case 3:
            [self insertarDBBotonesTRES];
            break;
        case 4:
            [self insertarDBBotonesCUATRO];
            break;
        case 5:
            [self insertarDBBotonesCINCO];
            break;
        case 6:
            [self insertarDBBotonesSEIS];
            break;
        case 7:
            [self insertarDBBotonesSIETE];
            break;
        case 8:
            [self insertarDBBotonesOCHO];
            break;
        case 9:
            [self insertarDBBotonesNUEVE];
            break;
        case 10:
            [self insertarDBBotonesDIEZ];
            break;
        case 11:
            [self insertarDBBotonesONCE];
            break;
        case 12:
            [self insertarDBBotonesDOCE];
            break;
        case 13:
            [self insertarDBBotonesTRECE];
            break;
        case 14:
            [self insertarDBBotonesCATORCE];
            break;
        case 15:
            [self insertarDBBotonesQUINCE];
            break;
        case 16:
            [self insertarDBBotonesDIECISEIS];
            break;
        case 17:
            [self insertarDBBotonesDIECISIETE];
            break;
        case 18:
            [self insertarDBBotonesDIECIOCHO];
            break;
        case 19:
            [self insertarDBBotonesDIECINUEVE];
            break;
        case 20:
            [self insertarDBBotonesVEINTE];
            break;
        case 21:
            [self insertarDBBotonesVEINTIUNO];
            break;
        case 22:
            [self insertarDBBotonesVEINTIDOS];
            break;
        case 23:
            [self insertarDBBotonesVEINTITRES];
            break;
        case 24:
            [self insertarDBBotonesVEINTICUATRO];
            break;
        case 25:
            [self insertarDBBotonesVEINTICINCO];
            break;
        case 26:
            [self insertarDBBotonesVEINTISEIS];
            break;
        case 27:
            [self insertarDBBotonesVEINTISIETE];
            break;
        case 28:
            [self insertarDBBotonesVEINTIOCHO];
            break;
        case 29:
            [self insertarDBBotonesVEINTINUEVE];
            break;
        case 30:
            [self insertarDBBotonesTREINTA];
            break;
        case 31:
            [self insertarDBBotonesTREINTAIUNO];
            break;
        case 32:
            [self insertarDBBotonesTREINTAIDOS];
            break;
        case 33:
            [self insertarDBBotonesTREINTAITRES];
            break;
        case 34:
            [self insertarDBBotonesTREINTAICUATRO];
            break;
        case 35:
            [self insertarDBBotonesTREINTAICINCO];
            break;
        case 36:
            [self insertarDBBotonesTREINTAISEIS];
            break;
        case 37:
            [self insertarDBBotonesTREINTAISIETE];
            break;
        case 38:
            [self insertarDBBotonesTREINTAIOCHO];
            break;
        case 39:
            [self insertarDBBotonesTREINTAINUEVE];
            break;
        case 40:
            [self insertarDBBotonesCUARENTA];
            break;
        case 41:
            [self insertarDBBotonesCUARENTAIUNO];
            break;
        case 42:
            [self insertarDBBotonesCUARENTAIDOS];
            break;
        case 43:
            [self insertarDBBotonesCUARENTAITRES];
            break;
        case 44:
            [self insertarDBBotonesCUARENTAICUATRO];
            break;
        case 45:
            [self insertarDBBotonesCUARENTAICINCO];
            break;
        case 46:
            [self insertarDBBotonesCUARENTAISEIS];
            break;
        case 47:
            [self insertarDBBotonesCUARENTAISIETE];
            break;
        case 48:
            [self insertarDBBotonesCUARENTAIOCHO];
            break;
        case 49:
            [self insertarDBBotonesCUARENTAINUEVE];
            break;
        case 50:
            [self insertarDBBotonesCINCUENTA];
            break;
            
        default:
            break;
    }
    
    [self insertarTitulos];
    
}



// AQUI SE ABRE LA TABLA QUE VA A TENER LOS TITULOS DE LOS BOTONES DE LOS PROYECTOS
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


-(void)updatearTITULOS{
    
    [self createOrOpenDBTITULOS];
    
    char *error;
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE TITULOS SET NUEVE = \"%@\" WHERE NOMBREPROYECTO = \"%@\" ", self.titulo_boton.text, nombre_proyecto_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE TITULOS UPDATEADO");
            
        }
        sqlite3_close(censos);
    }
    
}



-(void)insertarTitulos{
    
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@TITULOBOTON9.db", nombreProyectoActual_boton_nueve];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM %@TITULOBOTON9", nombreProyectoActual_boton_nueve];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@BOTON9 REINICIADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO %@TITULOBOTON9 (TITULO) values ('%@')", nombreProyectoActual_boton_nueve, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@TITULOBOTON9 INICIALIZADA", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE %@TITULOBOTON9 SET TITULO = \"%@\"", nombreProyectoActual_boton_nueve, self.titulo_boton.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE %@TITULOBOTON9 UPDATEADO", nombreProyectoActual_boton_nueve);
        }
        sqlite3_close(censos);
    }
    
}



@end
