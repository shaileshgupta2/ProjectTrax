//
//  jsonParser.m
//  ProjectTrax
//
//  Created by ITSSTS MacMini on 05/09/14.
//  Copyright (c) 2014 ITSS TS. All rights reserved.
//

#import "jsonParser.h"

@implementation jsonParser

@synthesize projects,prjno,prjName,updatedOn,prjManager,cost_color,cost_trend,risk_color,risk_trend,scope_color,scope_trend,sch_color,sch_trend,is_Fav,desc,stage,duration,region,category,subcategory,sponsor,waterline,priority,planLeader,highlights,nextsteps,issues,risks;

-(void)loadJson
{
  //  NSURL *url = [[NSURL alloc]initWithString:@"sharepoint json link"];
    
  //  NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30];
    
  //  NSData *urlData;
  //  NSURLResponse *response;
  //  NSError *error;
    
 //   urlData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
    
    
 //   projects = [NSJSONSerialization JSONObjectWithData:urlData options:0 error:&error];
    // project can have only a single stage....
    
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"json_structure" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
   
        NSArray *project = json[@"projects"];
        for (NSDictionary *proj in project) {
            
        
        NSLog(@"----");
        NSLog(@"----Projno: %@", proj[@"prjno"] );
        NSLog(@"----prjName: %@", proj[@"prjName"] );
        NSLog(@"----updatedOn: %@", proj[@"updatedOn"] );
        NSLog(@"----prjManager: %@", proj[@"prjManager"] );
        
        NSLog(@"----");
        }
    
    
   /* "prjno": "John",
    "prjName": "Doe",
    "updatedOn": "111",
    "prjManager": "Kiran",
    "cost_color": "red",
    "cost_trend": "up",
    "risk_color": "red",
    "risk_trend": "up",
    "scope_color": "red",
    "scope_trend": "up",
    "sch_color": "red",*/
    
    
}


@end
