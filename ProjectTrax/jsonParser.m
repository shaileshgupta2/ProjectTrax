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
    
    NSString *urlStr =@"http://199.63.177.119:2222/ProjectDashBoard/service/get/ProjList";
    NSURL *url = [NSURL URLWithString:urlStr];
    NSData *Data =[NSData dataWithContentsOfURL:url];
    NSLog(@"----");
    //  NSLog(@"Data :%@",Data);
    
    //if(Data !=nil)
    {
        NSError *error=nil;
        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:Data options:NSJSONReadingMutableContainers error:&error];
        
        //  NSLog(@"JsonData :%@",jsonData);
        
        NSArray *project = jsonData[@"projects"];
        for (NSDictionary *proj in project) {
            
            
            NSLog(@"----");
            NSLog(@"----Projno: %@", proj[@"prjno"] );
            NSLog(@"----prjName: %@", proj[@"prjName"] );
            NSLog(@"----updatedOn: %@", proj[@"updatedOn"] );
            NSLog(@"----prjManager: %@", proj[@"prjManager"] );
            
            NSLog(@"----cost_color:  %@",proj[@"cost_color"]);
            NSLog(@"----cost_trend:  %@",proj[@"cost_trend"]);
            NSLog(@"----scope_color:  %@",proj[@"scope_color"]);
            NSLog(@"----scope_trend:  %@",proj[@"scope_trend"]);
            NSLog(@"----sch_color:  %@",proj[@"sch_color"]);
            NSLog(@"----sch_trend:  %@",proj[@"sch_trend"]);
            NSLog(@"----sch_color:  %@",proj[@"risk_color"]);
            NSLog(@"----sch_trend:  %@",proj[@"risk_trend"]);
            
            NSLog(@"----is_Fav:  %@",proj[@"is_Fav"]);
            NSLog(@"----desc:  %@",proj[@"desc"]);
            NSLog(@"----stage:  %@",proj[@"stage"]);
            NSLog(@"----duration:  %@",proj[@"duration"]);
            NSLog(@"----region:  %@",proj[@"region"]);
            NSLog(@"----category:  %@",proj[@"category"]);
            NSLog(@"----subcategory:  %@",proj[@"subcategory"]);
            NSLog(@"----sponsor:  %@",proj[@"sponsor"]);
            NSLog(@"----waterline:  %@",proj[@"waterline"]);
            NSLog(@"----priority:  %@",proj[@"priority"]);
            
            
            NSArray *plnLeader = proj[@"planLeader"];
            NSLog(@"----planLeader");
            for (int i =0; i<[plnLeader count]; i++)
            {
                NSLog(@"                %d :  %@",i+1,[plnLeader objectAtIndex:i]);
            }
            
            
            NSArray *highlights = proj[@"highlights"];
            NSLog(@"----highlights");
            for (int i =0; i<[highlights count]; i++)
            {
                NSLog(@"                %d :  %@",i+1,[highlights objectAtIndex:i]);
            }
            
            
            NSArray *nextsteps = proj[@"nextsteps"];
            NSLog(@"----nextsteps");
            for (int i =0; i<[nextsteps count]; i++)
            {
                NSLog(@"                %d :  %@",i+1,[nextsteps objectAtIndex:i]);
            }
            
            //
            NSArray *issues_risks = proj[@"issues_risks"];
            NSLog(@"----issues_risks");
            for (NSDictionary *iss_risk in issues_risks) {
                
                NSLog(@"                risk:  %@",iss_risk[@"risk"]);
                NSLog(@"                riskIndicator:  %@",iss_risk[@"riskIndicator"]);
                NSLog(@"                actions");
                NSArray *actions = iss_risk[@"actions"];
                for (int i =0; i<[actions count]; i++) {
                    NSLog(@"                        %d:  %@",i+1,[actions objectAtIndex:i]);
                }
                
            }
            
            //NSLog(@"----issues_risks:  %@",proj[@"issues_risks"]);
            
            
            
            
            // NSLog(@"----:  %@",proj[@""]);
            NSLog(@"----");
            
        }
        
    }
    //else
    {
        NSLog(@"No Data Recieved");}
    


    
    
    
  /*  NSString *filePath = [[NSBundle mainBundle]pathForResource:@"json_structure" ofType:@"json"];
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
    */
    
    
}


@end
