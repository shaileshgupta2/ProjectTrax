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

-(void)loadData
{
    NSURL *url = [[NSURL alloc]initWithString:@"sharepoint json link"];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30];
    
    NSData *urlData;
    NSURLResponse *response;
    NSError *error;
    
    urlData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
    
    
    projects = [NSJSONSerialization JSONObjectWithData:urlData options:0 error:&error];
    // project can have only a single stage....
    
    
    
    
    
    
    
}


@end
