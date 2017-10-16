//
//  CensadorViewController.m
//  Censos
//
//  Created by Juan Pestana on 11/15/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "CensadorViewController.h"

@interface CensadorViewController (){
    // VARIABLES DE SQLITE
    sqlite3 *censos;
    NSString *dbPathString;
    

}

@end

@implementation CensadorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createOrOpenDBCensador];
    
    self.botonSeleccionar.hidden = YES;

    // Do any additional setup after loading the view.
}

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

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    // make sure all fields are have something in them
    
    if ((_censadorText.text.length  > 0)) {
        self.botonSeleccionar.hidden = NO;
    }
    else {
        self.botonSeleccionar.hidden = YES;
    }
}


//
//- (BOOL)textView:(UITextField *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
//{
//    if (_censadorText.text.length > 1 || (_censadorText.text.length > 0 && ![_censadorText.text isEqualToString:@""]))
//    {
//        self.botonSeleccionar.hidden = YES;
//    }
//    else
//    {
//        self.botonSeleccionar.hidden = NO;
//    }
//    
//    return YES;
//}



- (IBAction)seleccionar:(id)sender {
    
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    
    NSString *path_con_nombre_variable = [NSString stringWithFormat:@"censador.db"];
    
    dbPathString = [docPath stringByAppendingPathComponent:path_con_nombre_variable];
    
    
    
    char *error;
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"DELETE FROM CENSADOR"];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE CENSADOR REINICIADA");
        }
        sqlite3_close(censos);
    }
    
    // INICIALIZAR BASE DE DATOS EN DONDE ESTA EL NOMBRE DEL PROYECTO EN EL QUE SE ESTA TRABAJANDO ACTUALMENTE
    NSString *inicializador = @"i";
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"INSERT INTO CENSADOR (CENSADOR) values ('%@')", inicializador];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE CENSADOR INICIALIZADA");
        }
        sqlite3_close(censos);
    }
    
    // UPDATE BASE PARA PONER EL PROYECTO EN EL CUAL SE ESTA TRABAJANDO ACTUALMENTE
    if (sqlite3_open([dbPathString UTF8String], &censos)==SQLITE_OK) {
        NSString *insertStmt = [NSString stringWithFormat:@"UPDATE CENSADOR SET CENSADOR = \"%@\"", self.censadorText.text];
        
        const char *insert_stmt = [insertStmt UTF8String];
        
        if (sqlite3_exec(censos, insert_stmt, NULL, NULL, &error)==SQLITE_OK){
            
            NSLog(@"BASE CENSADOR UPDATEADO");
        }
        sqlite3_close(censos);
    }
}
- (IBAction)cambioTexto:(id)sender {
    
    if (_censadorText.text && _censadorText.text.length > 0)
    {

        _botonSeleccionar.hidden = NO;
    }
    else
    {
        _botonSeleccionar.hidden = YES;
    }
}

- (IBAction)cambioDeTexto:(id)sender {
    
    if ([_censadorText hasText]) {
        _botonSeleccionar.hidden = NO;
    }else{
        _botonSeleccionar.hidden = YES;
    }
}
- (IBAction)escribio:(id)sender {
    
    if ([_censadorText hasText]) {
        _botonSeleccionar.hidden = NO;
    }else{
        _botonSeleccionar.hidden = YES;
    }
}
@end
