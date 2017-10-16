//
//  SettingsGeneralViewController.m
//  Censos
//
//  Created by Juan Pestana on 9/10/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "SettingsGeneralViewController.h"
#import "Location.h"



@interface SettingsGeneralViewController (){
    HomeModel *_homeModel;
    NSArray *_feedItems;
    
    // VARIABLES DE SQLITE
    sqlite3 *censos;
    NSString *dbPathString;
}


@end

// VARIABLES GLOBALES

//ESTAS VARIABLES SON PARA TRAER LA INFO DE MYSQL Y PODER CREAR LAS TABLAS CON NOMBRES VARIABLES
NSString *nombreProyecto;
NSString *numero_columnas;
NSString *columna_uno;
NSString *columna_dos;
NSString *columna_tres;
NSString *columna_cuatro;
NSString *columna_cinco;
NSString *columna_seis;
NSString *columna_siete;
NSString *columna_ocho;
NSString *columna_nueve;
NSString *columna_diez;
NSString *columna_once;
NSString *columna_doce;
NSString *columna_trece;
NSString *columna_catorce;
NSString *columna_quince;
NSString *columna_dieciseis;
NSString *columna_diecisiete;
NSString *columna_dieciocho;
NSString *columna_diecinueve;
NSString *columna_veinte;
NSString *columna_veintiuno;
NSString *columna_veintidos;
NSString *columna_veintitres;
NSString *columna_veinticuatro;
NSString *columna_veinticinco;
NSString *columna_veintiseis;
NSString *columna_veintisiete;
NSString *columna_veintiocho;
NSString *columna_veintinueve;
NSString *columna_treinta;
NSString *columna_treintaiuno;
NSString *columna_treintaidos;
NSString *columna_treintaitres;
NSString *columna_treintaicuatro;
NSString *columna_treintaicinco;
NSString *columna_treintaiseis;
NSString *columna_treintaisiete;
NSString *columna_treintaiocho;
NSString *columna_treintainueve;
NSString *columna_cuarenta;
NSString *columna_cuarentaiuno;
NSString *columna_cuarentaidos;
NSString *columna_cuarentaitres;
NSString *columna_cuarentaicuatro;
NSString *columna_cuarentaicinco;
NSString *columna_cuarentaiseis;
NSString *columna_cuarentaisiete;
NSString *columna_cuarentaiocho;
NSString *columna_cuarentainueve;
NSString *columna_cincuenta;

NSString *check_nombre_proyecto;



@implementation SettingsGeneralViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *strURLDEL = [NSString stringWithFormat:@"http://oe.dataprodb.com/ios/deleteFail.php"];
    
    NSData *dataURLDEL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURLDEL]];
    
    NSString *strResultDEL = [[NSString alloc] initWithData:dataURLDEL encoding:NSUTF8StringEncoding];
    
    NSLog(@"STATUS DELETED FAIL: %@", strResultDEL);
    
    
    _labelNumeroColumnas.hidden = YES;
    
   // NSLog(@"Documents Directory: %@", [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject]);
    
    [self selfActualizarVARIABLE];
    
    
   
    
    //////////////////////////////////////////////// TABLEVIEW EMPIEZA /////////////////////////////////////////////////////
    
    // Set this view controller object as the delegate and data source for the table view
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // Create array object and assign it to _feedItems variable
    _feedItems = [[NSArray alloc] init];
    
    // Create new HomeModel object and assign it to _homeModel variable
    _homeModel = [[HomeModel alloc] init];
    
    // Set this view controller object as the delegate for the home model object
    _homeModel.delegate = self;
    
    // Call the download items method of the home model object
    [_homeModel downloadItems];
    
    
    
    //////////////////////////////////////////////// TABLEVIEW TERMINA ////////////////////////////////////////////////////
    
    
    
    
}

////// METODO PARA CHECAR SI HAY PROYECTO SELECCIONADO O NO
///// Y DEPENDIENDO DE ESO MOSTRAR O NO LOS BOTONES

-(void)checkProyecto{
    
    
    if ([check_nombre_proyecto isEqualToString:@""]) {
        
        _boton_uno.hidden = YES;
        _boton_dos.hidden = YES;
        _boton_tres.hidden = YES;
        _boton_cuatro.hidden = YES;
        _boton_cinco.hidden = YES;
        _boton_seis.hidden = YES;
        _boton_siete.hidden = YES;
        _boton_ocho.hidden = YES;
        _boton_nueve.hidden = YES;
        _boton_diez.hidden = YES;
        _boton_once.hidden = YES;
        _boton_doce.hidden = YES;
        _boton_trece.hidden = YES;
        _boton_catorce.hidden = YES;
        _boton_quince.hidden = YES;

    }else{
        _boton_uno.hidden = NO;
        _boton_dos.hidden = NO;
        _boton_tres.hidden = NO;
        _boton_cuatro.hidden = NO;
        _boton_cinco.hidden = NO;
        _boton_seis.hidden = NO;
        _boton_siete.hidden = NO;
        _boton_ocho.hidden = NO;
        _boton_nueve.hidden = NO;
        _boton_diez.hidden = NO;
        _boton_once.hidden = NO;
        _boton_doce.hidden = NO;
        _boton_trece.hidden = NO;
        _boton_catorce.hidden = NO;
        _boton_quince.hidden = NO;
    }
    
}

//////////////////////////////////////////////// TABLEVIEW EMPIEZA ////////////////////////////////////////////////////


-(void)itemsDownloaded:(NSArray *)items
{
    // This delegate method will get called when the items are finished downloading
    
    // Set the downloaded items to the array
    _feedItems = items;
    
    // Reload the table view
    [self.tableView reloadData];
}

#pragma mark Table View Delegate Methods

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.textColor=[UIColor colorWithRed:0.18 green:0.184 blue:0.192 alpha:1]; /*#2e2f31*/
    cell.detailTextLabel.font=[UIFont fontWithName:@"SFUIDisplay-Light" size:20.0];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of feed items (initially 0)
    return _feedItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Retrieve cell
    NSString *cellIdentifier = @"BasicCell";
    UITableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // Get the location to be shown
    Location *item = _feedItems[indexPath.row];
    
    // Get references to labels of cell
    myCell.textLabel.textAlignment = NSTextAlignmentCenter;
    myCell.textLabel.text = item.nombreProyecto;
    
    
    
    return myCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // Get the location to be shown
    Location *item = _feedItems[indexPath.row];
    
    
    _labelNombreProyecto.text = item.nombreProyecto;
    _labelNumeroColumnas.text = item.numeroColumnas;
    
}

//////////////////////////////////////////////// TABLEVIEW TERMINA ///////////////////////////////////////////////////


//////////////////////////////////////////////// SQLITE EMPIEZA ///////////////////////////////////////////////////////
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
            
            NSLog(@"TABLA CREADA");
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
                check_nombre_proyecto = nombreDeProyecto;
                
            }
        }
    }
    sqlite3_close(censos);
    
    [self checkProyecto];

}

//////////////////////////////////////////////// SQLITE TERMINA ///////////////////////////////////////////////////////



//////////////////////////// AQUI EMPIEZAN METODOS DE CREAR TABLAS CON NOMBRES DE PROYECTO DEPENDIENDO DE LA CANTIDAD DE COLUMNAS QUE VA A TENER


-(void)traerDatosDeMYSQL{
    
    NSString *nombreProyectoActual = self.labelNombreProyecto.text;
    
    // AQUI SE HACE EL LLAMADO AL ARCHIVO PHP PARA TRAER LOS DATOS DE INTERNET
    // ESTE METODO ESTA RELACIONADO CON LOS VOIDS DE ABAJO QUE TIENE "CONNECTION" EN EL TITULO
    NSString *strURL = [NSString stringWithFormat:@"http://oe.dataprodb.com/ios/columnasBotones.php?nombreProyecto=%@", nombreProyectoActual];
    
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

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    datos = [NSJSONSerialization JSONObjectWithData:data options:nil error:nil];
    
    // AQUI VOY  A PONER EN TODAS LAS VARIABLES GLOBALES QUE TENGO LOS VALORES CORRESPONDIENTES QUE VIENEN DE LA
    // BASE DE MYSQL PARA PODER GENERAR LAS TABLAS DE LOS PROYECTOS EN SQLITE Y DESPUES ESTAS PODER MANDARLAS POR BATCH
    nombreProyecto = [[datos objectAtIndex:0] objectForKey:@"nombreProyecto"];
    numero_columnas = [[datos objectAtIndex:0] objectForKey:@"numeroColumnas"];
    columna_uno = [[datos objectAtIndex:0] objectForKey:@"columnaUno"];
    columna_dos = [[datos objectAtIndex:0] objectForKey:@"columnaDos"];
    columna_tres = [[datos objectAtIndex:0] objectForKey:@"columnaTres"];
    columna_cuatro = [[datos objectAtIndex:0] objectForKey:@"columnaCuatro"];
    columna_cinco = [[datos objectAtIndex:0] objectForKey:@"columnaCinco"];
    columna_seis = [[datos objectAtIndex:0] objectForKey:@"columnaSeis"];
    columna_siete = [[datos objectAtIndex:0] objectForKey:@"columnaSiete"];
    columna_ocho = [[datos objectAtIndex:0] objectForKey:@"columnaOcho"];
    columna_nueve = [[datos objectAtIndex:0] objectForKey:@"columnaNueve"];
    columna_diez = [[datos objectAtIndex:0] objectForKey:@"columnaDiez"];
    columna_once = [[datos objectAtIndex:0] objectForKey:@"columnaOnce"];
    columna_doce = [[datos objectAtIndex:0] objectForKey:@"columnaDoce"];
    columna_trece = [[datos objectAtIndex:0] objectForKey:@"columnaTrece"];
    columna_catorce = [[datos objectAtIndex:0] objectForKey:@"columnaCatorce"];
    columna_quince = [[datos objectAtIndex:0] objectForKey:@"columnaQuince"];
    columna_dieciseis = [[datos objectAtIndex:0] objectForKey:@"columnaDieciseis"];
    columna_diecisiete = [[datos objectAtIndex:0] objectForKey:@"columnaDiecisiete"];
    columna_dieciocho = [[datos objectAtIndex:0] objectForKey:@"columnaDieciocho"];
    columna_diecinueve = [[datos objectAtIndex:0] objectForKey:@"columnaDiecinueve"];
    columna_veinte = [[datos objectAtIndex:0] objectForKey:@"columnaVeinte"];
    columna_veintiuno = [[datos objectAtIndex:0] objectForKey:@"columnaVeintiuno"];
    columna_veintidos = [[datos objectAtIndex:0] objectForKey:@"columnaVeintidos"];
    columna_veintitres = [[datos objectAtIndex:0] objectForKey:@"columnaVeintitres"];
    columna_veinticuatro = [[datos objectAtIndex:0] objectForKey:@"columnaVeinticuatro"];
    columna_veinticinco = [[datos objectAtIndex:0] objectForKey:@"columnaVeinticinco"];
    columna_veintiseis = [[datos objectAtIndex:0] objectForKey:@"columnaVeintiseis"];
    columna_veintisiete = [[datos objectAtIndex:0] objectForKey:@"columnaVeintisiete"];
    columna_veintiocho = [[datos objectAtIndex:0] objectForKey:@"columnaVeintiocho"];
    columna_veintinueve = [[datos objectAtIndex:0] objectForKey:@"columnaVeintinueve"];
    columna_treinta = [[datos objectAtIndex:0] objectForKey:@"columnaTreinta"];
    columna_treintaiuno = [[datos objectAtIndex:0] objectForKey:@"columnaTreintaiuno"];
    columna_treintaidos = [[datos objectAtIndex:0] objectForKey:@"columnaTreintaidos"];
    columna_treintaitres = [[datos objectAtIndex:0] objectForKey:@"columnaTreintaitres"];
    columna_treintaicuatro = [[datos objectAtIndex:0] objectForKey:@"columnaTreintaicuatro"];
    columna_treintaicinco = [[datos objectAtIndex:0] objectForKey:@"columnaTreintaicinco"];
    columna_treintaiseis = [[datos objectAtIndex:0] objectForKey:@"columnaTreintaiseis"];
    columna_treintaisiete = [[datos objectAtIndex:0] objectForKey:@"columnaTreintaisiete"];
    columna_treintaiocho = [[datos objectAtIndex:0] objectForKey:@"columnaTreintaiocho"];
    columna_treintainueve = [[datos objectAtIndex:0] objectForKey:@"columnaTreintainueve"];
    columna_cuarenta = [[datos objectAtIndex:0] objectForKey:@"columnaCuarenta"];
    columna_cuarentaiuno = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentaiuno"];
    columna_cuarentaidos = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentaidos"];
    columna_cuarentaitres = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentaitres"];
    columna_cuarentaicuatro = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentaicuatro"];
    columna_cuarentaicinco = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentaicinco"];
    columna_cuarentaiseis = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentaiseis"];
    columna_cuarentaisiete = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentaisiete"];
    columna_cuarentaiocho = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentaiocho"];
    columna_cuarentainueve = [[datos objectAtIndex:0] objectForKey:@"columnaCuarentainueve"];
    columna_cincuenta =[[datos objectAtIndex:0] objectForKey:@"columnaCincuenta"];
    
    
    
    // AQUI SE VA A AGARRAR EL NUMERO DE COLUMNAS DEL PROYECTO Y HACER EL SWITCH PARA VER EN QUE METODO
    // ENTRA PARA CREAR LA TABLA CON EL NOMBRE DE SU PROYECTO PERO VARIABLE
    
    // CONVERTIR STRING A NUMERO
    NSString *stringInt = numero_columnas;
    int numero_columnas = [stringInt intValue];
    
    [self crearTitulos];
    
    switch (numero_columnas) {
        case 1:
            [self crearTablaConNombreProyectoActualUNO];
            [self crearBotonUNO];
            break;
        case 2:
            [self crearTablaConNombreProyectoActualDOS];
            [self crearBotonDOS];
            break;
        case 3:
            [self crearTablaConNombreProyectoActualTRES];
            [self crearBotonTRES];
            break;
        case 4:
            [self crearTablaConNombreProyectoActualCUATRO];
            [self crearBotonCUATRO];
            break;
        case 5:
            [self crearTablaConNombreProyectoActualCINCO];
            [self crearBotonCINCO];
            break;
        case 6:
            [self crearTablaConNombreProyectoActualSEIS];
            [self crearBotonSEIS];
            break;
        case 7:
            [self crearTablaConNombreProyectoActualSIETE];
            [self crearBotonSIETE];
            break;
        case 8:
            [self crearTablaConNombreProyectoActualOCHO];
            [self crearBotonOCHO];
            break;
        case 9:
            [self crearTablaConNombreProyectoActualNUEVE];
            [self crearBotonNUEVE];
            break;
        case 10:
            [self crearTablaConNombreProyectoActualDIEZ];
            [self crearBotonDIEZ];
            break;
        case 11:
            [self crearTablaConNombreProyectoActualONCE];
            [self crearBotonONCE];
            break;
        case 12:
            [self crearTablaConNombreProyectoActualDOCE];
            [self crearBotonDOCE];
            break;
        case 13:
            [self crearTablaConNombreProyectoActualTRECE];
            [self crearBotonTRECE];
            break;
        case 14:
            [self crearTablaConNombreProyectoActualCATORCE];
            [self crearBotonCATORCE];
            break;
        case 15:
            [self crearTablaConNombreProyectoActualQUINCE];
            [self crearBotonQUINCE];
            break;
        case 16:
            [self crearTablaConNombreProyectoActualDIECISEIS];
            [self crearBotonDIECISEIS];
            break;
        case 17:
            [self crearTablaConNombreProyectoActualDIECISIETE];
            [self crearBotonDIECISIETE];
            break;
        case 18:
            [self crearTablaConNombreProyectoActualDIECIOCHO];
            [self crearBotonDIECIOCHO];
            break;
        case 19:
            [self crearTablaConNombreProyectoActualDIECINUEVE];
            [self crearBotonDIECINUEVE];
            break;
        case 20:
            [self crearTablaConNombreProyectoActualVEINTE];
            [self crearBotonVEINTE];
            break;
        case 21:
            [self crearTablaConNombreProyectoActualVEINTIUNO];
            [self crearBotonVEINTIUNO];
            break;
        case 22:
            [self crearTablaConNombreProyectoActualVEINTIDOS];
            [self crearBotonVEINTIDOS];
            break;
        case 23:
            [self crearTablaConNombreProyectoActualVEINTITRES];
            [self crearBotonVEINTITRES];
            break;
        case 24:
            [self crearTablaConNombreProyectoActualVEINTICUATRO];
            [self crearBotonVEINTICUATRO];
            break;
        case 25:
            [self crearTablaConNombreProyectoActualVEINTICINCO];
            [self crearBotonVEINTICINCO];
            break;
        case 26:
            [self crearTablaConNombreProyectoActualVEINTISEIS];
            [self crearBotonVEINTISEIS];
            break;
        case 27:
            [self crearTablaConNombreProyectoActualVEINTISIETE];
            [self crearBotonVEINTISIETE];
            break;
        case 28:
            [self crearTablaConNombreProyectoActualVEINTIOCHO];
            [self crearBotonVEINTIOCHO];
            break;
        case 29:
            [self crearTablaConNombreProyectoActualVEINTINUEVE];
            [self crearBotonVEINTINUEVE];
            break;
        case 30:
            [self crearTablaConNombreProyectoActualTREINTA];
            [self crearBotonTREINTA];
            break;
        case 31:
            [self crearTablaConNombreProyectoActualTREINTAIUNO];
            [self crearBotonTREINTAIUNO];
            break;
        case 32:
            [self crearTablaConNombreProyectoActualTREINTAIDOS];
            [self crearBotonTREINTAIDOS];
            break;
        case 33:
            [self crearTablaConNombreProyectoActualTREINTAITRES];
            [self crearBotonTREINTAITRES];
            break;
        case 34:
            [self crearTablaConNombreProyectoActualTREINTAICUATRO];
            [self crearBotonTREINTAICUATRO];
            break;
        case 35:
            [self crearTablaConNombreProyectoActualTREINTAICINCO];
            [self crearBotonTREINTAICINCO];
            break;
        case 36:
            [self crearTablaConNombreProyectoActualTREINTAISEIS];
            [self crearBotonTREINTAISEIS];
            break;
        case 37:
            [self crearTablaConNombreProyectoActualTREINTAISIETE];
            [self crearBotonTREINTAISIETE];
            break;
        case 38:
            [self crearTablaConNombreProyectoActualTREINTAIOCHO];
            [self crearBotonTREINTAIOCHO];
            break;
        case 39:
            [self crearTablaConNombreProyectoActualTREINTAINUEVE];
            [self crearBotonTREINTAINUEVE];
            break;
        case 40:
            [self crearTablaConNombreProyectoActualCUARENTA];
            [self crearBotonCUARENTA];
            break;
        case 41:
            [self crearTablaConNombreProyectoActualCUARENTAIUNO];
            [self crearBotonCUARENTAIUNO];
            break;
        case 42:
            [self crearTablaConNombreProyectoActualCUARENTAIDOS];
            [self crearBotonCUARENTAIDOS];
            break;
        case 43:
            [self crearTablaConNombreProyectoActualCUARENTAITRES];
            [self crearBotonCUARENTAITRES];
            break;
        case 44:
            [self crearTablaConNombreProyectoActualCUARENTAICUATRO];
            [self crearBotonCUARENTAICUATRO];
            break;
        case 45:
            [self crearTablaConNombreProyectoActualCUARENTAICINCO];
            [self crearBotonCUARENTAICINCO];
            break;
        case 46:
            [self crearTablaConNombreProyectoActualCUARENTAISEIS];
            [self crearBotonCUARENTAISEIS];
            break;
        case 47:
            [self crearTablaConNombreProyectoActualCUARENTAISIETE];
            [self crearBotonCUARENTAISIETE];
            break;
        case 48:
            [self crearTablaConNombreProyectoActualCUARENTAIOCHO];
            [self crearBotonCUARENTAIOCHO];
            break;
        case 49:
            [self crearTablaConNombreProyectoActualCUARENTAINUEVE];
            [self crearBotonCUARENTAINUEVE];
            break;
        case 50:
            [self crearTablaConNombreProyectoActualCINCUENTA];
            [self crearBotonCINCUENTA];
            break;
            
        default:
            break;
    }
    
    [self createOrOpenDBTITULOS];
    
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




////////////// AQUI SE CREAN HACEN LOS METODOS PARA CREAR TABLAS DEL UNO AL CINCUENTA QUE SE LLAMAN CON EL SWITCH DE
// LA FUNCION DE CONNECTION DID FINISH LOADING

// UNO
-(void)crearTablaConNombreProyectoActualUNO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// DOS
-(void)crearTablaConNombreProyectoActualDOS{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// TRES
-(void)crearTablaConNombreProyectoActualTRES{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}

// CUATRO
-(void)crearTablaConNombreProyectoActualCUATRO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}

// CINCO
-(void)crearTablaConNombreProyectoActualCINCO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// SEIS
-(void)crearTablaConNombreProyectoActualSEIS{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// SIETE
-(void)crearTablaConNombreProyectoActualSIETE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}

// OCHO
-(void)crearTablaConNombreProyectoActualOCHO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// NUEVE
-(void)crearTablaConNombreProyectoActualNUEVE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}



// DIEZ
-(void)crearTablaConNombreProyectoActualDIEZ{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}



// ONCE
-(void)crearTablaConNombreProyectoActualONCE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// DOCE
-(void)crearTablaConNombreProyectoActualDOCE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// TRECE
-(void)crearTablaConNombreProyectoActualTRECE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// CATORCE
-(void)crearTablaConNombreProyectoActualCATORCE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// QUINCE
-(void)crearTablaConNombreProyectoActualQUINCE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// DIECISEIS
-(void)crearTablaConNombreProyectoActualDIECISEIS{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}



// DIECISIETE
-(void)crearTablaConNombreProyectoActualDIECISIETE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// DIECIOCHO
-(void)crearTablaConNombreProyectoActualDIECIOCHO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// DIECINUEVE
-(void)crearTablaConNombreProyectoActualDIECINUEVE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// VEINTE
-(void)crearTablaConNombreProyectoActualVEINTE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// VEINTIUNO
-(void)crearTablaConNombreProyectoActualVEINTIUNO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// VEINTIDOS
-(void)crearTablaConNombreProyectoActualVEINTIDOS{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// VEINTITRES
-(void)crearTablaConNombreProyectoActualVEINTITRES{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}

// VEINTICUATRO
-(void)crearTablaConNombreProyectoActualVEINTICUATRO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// VEINTICINCO
-(void)crearTablaConNombreProyectoActualVEINTICINCO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// VEINTISEIS
-(void)crearTablaConNombreProyectoActualVEINTISEIS{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// VEINTISIETE
-(void)crearTablaConNombreProyectoActualVEINTISIETE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}

// VEINTIOCHO
-(void)crearTablaConNombreProyectoActualVEINTIOCHO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// VEINTINUEVE
-(void)crearTablaConNombreProyectoActualVEINTINUEVE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}

// TREINTA
-(void)crearTablaConNombreProyectoActualTREINTA{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// TREINTAIUNO
-(void)crearTablaConNombreProyectoActualTREINTAIUNO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// TREINTAIDOS
-(void)crearTablaConNombreProyectoActualTREINTAIDOS{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// TREINTAITRES
-(void)crearTablaConNombreProyectoActualTREINTAITRES{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// TREINTAICUATRO
-(void)crearTablaConNombreProyectoActualTREINTAICUATRO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}

// TREINTAICINCO
-(void)crearTablaConNombreProyectoActualTREINTAICINCO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}

// TREINTAISEIS
-(void)crearTablaConNombreProyectoActualTREINTAISEIS{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}



// TREINTAISIETE
-(void)crearTablaConNombreProyectoActualTREINTAISIETE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// TREINTAIOCHO
-(void)crearTablaConNombreProyectoActualTREINTAIOCHO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}



// TREINTAINUEVE
-(void)crearTablaConNombreProyectoActualTREINTAINUEVE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho, columna_treintainueve];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}

// CUARENTA
-(void)crearTablaConNombreProyectoActualCUARENTA{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho, columna_treintainueve, columna_cuarenta];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// CUARENTAIUNO
-(void)crearTablaConNombreProyectoActualCUARENTAIUNO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho, columna_treintainueve, columna_cuarenta, columna_cuarentaiuno];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// CUARENTAIDOS
-(void)crearTablaConNombreProyectoActualCUARENTAIDOS{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho, columna_treintainueve, columna_cuarenta, columna_cuarentaiuno, columna_cuarentaidos];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}




// CUARENTAITRES
-(void)crearTablaConNombreProyectoActualCUARENTAITRES{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho, columna_treintainueve, columna_cuarenta, columna_cuarentaiuno, columna_cuarentaidos, columna_cuarentaitres];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}

// CUARENTAICUATRO
-(void)crearTablaConNombreProyectoActualCUARENTAICUATRO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho, columna_treintainueve, columna_cuarenta, columna_cuarentaiuno, columna_cuarentaidos, columna_cuarentaitres, columna_cuarentaicuatro];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// CUARENTAICINCO
-(void)crearTablaConNombreProyectoActualCUARENTAICINCO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho, columna_treintainueve, columna_cuarenta, columna_cuarentaiuno, columna_cuarentaidos, columna_cuarentaitres, columna_cuarentaicuatro, columna_cuarentaicinco];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// CUARENTAISEIS
-(void)crearTablaConNombreProyectoActualCUARENTAISEIS{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho, columna_treintainueve, columna_cuarenta, columna_cuarentaiuno, columna_cuarentaidos, columna_cuarentaitres, columna_cuarentaicuatro, columna_cuarentaicinco, columna_cuarentaiseis];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// CUARENTAISIETE
-(void)crearTablaConNombreProyectoActualCUARENTAISIETE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho, columna_treintainueve, columna_cuarenta, columna_cuarentaiuno, columna_cuarentaidos, columna_cuarentaitres, columna_cuarentaicuatro, columna_cuarentaicinco, columna_cuarentaiseis, columna_cuarentaisiete];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}



// CUARENTAIOCHO
-(void)crearTablaConNombreProyectoActualCUARENTAIOCHO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho, columna_treintainueve, columna_cuarenta, columna_cuarentaiuno, columna_cuarentaidos, columna_cuarentaitres, columna_cuarentaicuatro, columna_cuarentaicinco, columna_cuarentaiseis, columna_cuarentaisiete, columna_cuarentaiocho];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}

// CUARENTAINUEVE
-(void)crearTablaConNombreProyectoActualCUARENTAINUEVE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho, columna_treintainueve, columna_cuarenta, columna_cuarentaiuno, columna_cuarentaidos, columna_cuarentaitres, columna_cuarentaicuatro, columna_cuarentaicinco, columna_cuarentaiseis, columna_cuarentaisiete, columna_cuarentaiocho, columna_cuarentainueve];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}


// CINCUENTA
-(void)crearTablaConNombreProyectoActualCINCUENTA{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    char *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPathString]) {
        const char *dbPath = [dbPathString UTF8String];
        
        if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
            
            NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, LATITUD TEXT, LONGITUD TEXT, FECHA TEXT, CENSADOR TEXT, STATE TEXT)", nombreProyecto, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho, columna_treintainueve, columna_cuarenta, columna_cuarentaiuno, columna_cuarentaidos, columna_cuarentaitres, columna_cuarentaicuatro, columna_cuarentaicinco, columna_cuarentaiseis, columna_cuarentaisiete, columna_cuarentaiocho, columna_cuarentainueve, columna_cincuenta];
            
            const char *sql_stmt = (char *)[sql_str UTF8String];
            sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
            sqlite3_close(censos);
            
            NSLog(@"TABLA %@ CREADA CON VARIABLES", nombreProyecto);
        }
    }
}



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// AQUI VOY A TENER CINCUENTA METODOS, UNO PARA CADA POSBIEL NUMERO DE COLUMNAS
// LO QUE VA A HACER CADA UNO, ES UN CICLO DE 12 REPETICIONES PARA CREAR DOCE TABLAS PARA LOS DOCE BOTONES QUE PUEDE LLEGAR A TENER

-(void)crearTitulos{
    
    
    for (int ic = 1; ic < 16; ic++) {
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@TITULOBOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@TITULOBOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, TITULO TEXT)", nombreProyecto, ic];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@TITULOBOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }

    
    
}



// UNO
-(void)crearBotonUNO{
    
    
    
    for (int ic = 1; ic < 16; ic++) {
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT)", nombreProyecto, ic, columna_uno];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// DOS
-(void)crearBotonDOS{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}


// TRES
-(void)crearBotonTRES{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// CUATRO
-(void)crearBotonCUATRO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}
// CINCO
-(void)crearBotonCINCO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// SEIS
-(void)crearBotonSEIS{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// SIETE
-(void)crearBotonSIETE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}
// OCHO
-(void)crearBotonOCHO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// NUEVE
-(void)crearBotonNUEVE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}


// DIEZ
-(void)crearBotonDIEZ{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}



// ONCE
-(void)crearBotonONCE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT )", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// DOCE
-(void)crearBotonDOCE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// TRECE
-(void)crearBotonTRECE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// CATORCE
-(void)crearBotonCATORCE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// QUINCE
-(void)crearBotonQUINCE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// DIECISEIS
-(void)crearBotonDIECISEIS{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}


// DIECISIETE
-(void)crearBotonDIECISIETE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// DIECIOCHO
-(void)crearBotonDIECIOCHO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// DIECINUEVE
-(void)crearBotonDIECINUEVE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// VEINTE
-(void)crearBotonVEINTE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}


// VEINTIUNO
-(void)crearBotonVEINTIUNO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// VEINTIDOS
-(void)crearBotonVEINTIDOS{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// VEINTITRES
-(void)crearBotonVEINTITRES{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// VEINTICUATRO
-(void)crearBotonVEINTICUATRO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// VEINTICINCO
-(void)crearBotonVEINTICINCO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// VEINTISEIS
-(void)crearBotonVEINTISEIS{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// VEINTISIETE
-(void)crearBotonVEINTISIETE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// VEINTIOCHO
-(void)crearBotonVEINTIOCHO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// VEINTINUEVE
-(void)crearBotonVEINTINUEVE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// TREINTA
-(void)crearBotonTREINTA{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// TREINTAIUNO
-(void)crearBotonTREINTAIUNO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// TREINTAIDOS
-(void)crearBotonTREINTAIDOS{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// TREINTAITRES
-(void)crearBotonTREINTAITRES{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// TREINTAICUATRO
-(void)crearBotonTREINTAICUATRO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// TREINTAICINCO
-(void)crearBotonTREINTAICINCO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// TREINTAISEIS
-(void)crearBotonTREINTAISEIS{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}


// TREINTAISIETE
-(void)crearBotonTREINTAISIETE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}


// TREINTAIOCHO
-(void)crearBotonTREINTAIOCHO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}


// TREINTAINUEVE
-(void)crearBotonTREINTAINUEVE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho, columna_treintainueve];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// CUARENTA
-(void)crearBotonCUARENTA{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho, columna_treintainueve, columna_cuarenta];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// CUARENTAIUNO
-(void)crearBotonCUARENTAIUNO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho, columna_treintainueve, columna_cuarenta, columna_cuarentaiuno];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}


// CUARENTAIDOS
-(void)crearBotonCUARENTAIDOS{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho, columna_treintainueve, columna_cuarenta, columna_cuarentaiuno, columna_cuarentaidos];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}



// CUARENTAITRES
-(void)crearBotonCUARENTAITRES{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho, columna_treintainueve, columna_cuarenta, columna_cuarentaiuno, columna_cuarentaidos, columna_cuarentaitres];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// CUARENTAICUATRO
-(void)crearBotonCUARENTAICUATRO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho, columna_treintainueve, columna_cuarenta, columna_cuarentaiuno, columna_cuarentaidos, columna_cuarentaitres, columna_cuarentaicuatro];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}


// CUARENTAICINCO
-(void)crearBotonCUARENTAICINCO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho, columna_treintainueve, columna_cuarenta, columna_cuarentaiuno, columna_cuarentaidos, columna_cuarentaitres, columna_cuarentaicuatro, columna_cuarentaicinco];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// CUARENTAISEIS
-(void)crearBotonCUARENTAISEIS{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho, columna_treintainueve, columna_cuarenta, columna_cuarentaiuno, columna_cuarentaidos, columna_cuarentaitres, columna_cuarentaicuatro, columna_cuarentaicinco, columna_cuarentaiseis];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}


// CUARENTAISIETE
-(void)crearBotonCUARENTAISIETE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho, columna_treintainueve, columna_cuarenta, columna_cuarentaiuno, columna_cuarentaidos, columna_cuarentaitres, columna_cuarentaicuatro, columna_cuarentaicinco, columna_cuarentaiseis, columna_cuarentaisiete];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}


// CUARENTAIOCHO
-(void)crearBotonCUARENTAIOCHO{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1 ; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho, columna_treintainueve, columna_cuarenta, columna_cuarentaiuno, columna_cuarentaidos, columna_cuarentaitres, columna_cuarentaicuatro, columna_cuarentaicinco, columna_cuarentaiseis, columna_cuarentaisiete, columna_cuarentaiocho];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// CUARENTAINUEVE
-(void)crearBotonCUARENTAINUEVE{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho, columna_treintainueve, columna_cuarenta, columna_cuarentaiuno, columna_cuarentaidos, columna_cuarentaitres, columna_cuarentaicuatro, columna_cuarentaicinco, columna_cuarentaiseis, columna_cuarentaisiete, columna_cuarentaiocho, columna_cuarentainueve];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}

// CINCUENTA
-(void)crearBotonCINCUENTA{
    
    // AQUI ME QUEDE
    // ACORDARME QUE LAS TABLAS DEBEN DE LLEVAR LATITUD, LONGITUD, ETC...
    for (int ic = 1; ic < 16; ic++) {
        
        
        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [path objectAtIndex:0];
        
        NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@BOTON%d.db", nombreProyecto, ic];
        
        dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
        
        char *error;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPathString]) {
            const char *dbPath = [dbPathString UTF8String];
            
            if (sqlite3_open(dbPath, &censos)==SQLITE_OK) {
                
                NSString *sql_str = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@BOTON%d (ID INTEGER PRIMARY KEY AUTOINCREMENT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT, %@ TEXT)", nombreProyecto, ic, columna_uno, columna_dos, columna_tres, columna_cuatro, columna_cinco, columna_seis, columna_siete, columna_ocho, columna_nueve, columna_diez, columna_once, columna_doce, columna_trece, columna_catorce, columna_quince, columna_dieciseis, columna_diecisiete, columna_dieciocho, columna_diecinueve, columna_veinte, columna_veintiuno, columna_veintidos, columna_veintitres, columna_veinticuatro, columna_veinticinco, columna_veintiseis, columna_veintisiete, columna_veintiocho, columna_veintinueve, columna_treinta, columna_treintaiuno, columna_treintaidos, columna_treintaitres, columna_treintaicuatro, columna_treintaicinco, columna_treintaiseis, columna_treintaisiete, columna_treintaiocho, columna_treintainueve, columna_cuarenta, columna_cuarentaiuno, columna_cuarentaidos, columna_cuarentaitres, columna_cuarentaicuatro, columna_cuarentaicinco, columna_cuarentaiseis, columna_cuarentaisiete, columna_cuarentaiocho, columna_cuarentainueve, columna_cincuenta];
                
                const char *sql_stmt = (char *)[sql_str UTF8String];
                sqlite3_exec(censos, sql_stmt, NULL, NULL, &error);
                sqlite3_close(censos);
                
                NSLog(@"TABLA %@BOTON%d CREADA CON VARIABLES", nombreProyecto, ic);
            }
        }
    }
}




/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//////////////////////////// BOTON PRINCIPAL /////////////////////////////
// ESTE ES EL BOTON DONDE SE SELECCION EL PROYECTO Y SE LLAMA A TODAS LAS DEMAS FUNCIONES
- (IBAction)seleccionarProyecto:(id)sender {
    
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"%@.db", nombreProyecto];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    [self createOrOpenDBNombreProyectoActual];
    
    /////////////////// PROCESO PARA PONER EN BASE SQLITE EL NOMBRE DE PROYECTO ACTUAL INICIA///////////////////////////////////////////////////////
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM NOMBREPROYECTOACTUAL"];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE NOMBRE PROYECTO ACTUAL REINICIADA");
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO NOMBREPROYECTOACTUAL (NOMBREPROYECTO,NUMEROCOLUMNAS) values ('%@','%@')", inicializador, inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE NOMBRE PROYECTO ACTUAL INICIALIZADA");
        }
        sqlite3_close(censos);
    }
    
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE NOMBREPROYECTOACTUAL SET NOMBREPROYECTO = \"%@\", NUMEROCOLUMNAS = \"%@\"", self.labelNombreProyecto.text, self.labelNumeroColumnas.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE NOMBRE PROYECTO ACTUAL UPDATEADO");
            
        }
        sqlite3_close(censos);
    }
    
    //////////////////////// PROCESO PARA PONER EN BASE SQLITE EL NOMBRE DE PROYECTO ACTUAL TERMINA ///////////////////////////////////////////////////////
    
    [self selfActualizarVARIABLE];
    
    // AQUI EMPIEZA ENTONCES EL LLAMADO DEL METODO PARA CREAR BASE DE DATOS DE PROYECTO FINAL (LA QUE SE ENVIA POR BATCH) CON EL SWITCH DEPENDIENDO DE CUANTAS COLUMNAS TENGA EL PROYECTO
    
    [self traerDatosDeMYSQL];
    
    [self createOrOpenDBTITULOS];
    
    
}




@end
