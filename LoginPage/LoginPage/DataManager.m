//
//  DataManager.m
//  LoginPage
//
//  Created by Aditya Kumar on 08/02/17.
//  Copyright © 2017 mindfire. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager


-(NSMutableArray *)getNotesData
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"notesList.plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:plistPath])
    {
        return nil;
    }
    else
        return [NSMutableArray arrayWithContentsOfFile:plistPath];
}

-(void)saveNote:(Note *)note
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"notesList.plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSMutableArray* dataFromPlist;
    
    if ([fileManager fileExistsAtPath:plistPath])
    {
        dataFromPlist = [NSMutableArray arrayWithContentsOfFile:plistPath];
    }
    else
        dataFromPlist = [[NSMutableArray alloc] init];
    
    NSDictionary* dataDict = [NSDictionary dictionaryWithObjectsAndKeys:note.titleOfTheNotes, @"title", note.descriptionOfTheNotes, @"description", nil];
    
    [dataFromPlist addObject:dataDict];
    
    BOOL didWriteToFile = [dataFromPlist writeToFile:plistPath atomically:YES];
    
    if(didWriteToFile)
    {
        NSLog(@"Write to .plist file is a SUCCESS!");
    }
    else
    {
        NSLog(@"Write to .plist file is a FAILURE!");
    }

}





@end
