//
//  ProjectDataSource.m
//  Trax
//
//  Created by Kiran Bandla on 8/20/14.
//  Copyright (c) 2014 ITSS TS. All rights reserved.
//

#import "ProjectDataSource.h"
#import "ProjectModel.h"
#import "jsonParser.h"
@implementation ProjectDataSource

-(NSMutableArray *)getAllProjects
{
    NSString *urlStr =@"http://199.63.177.119:2222/ProjectDashBoard/service/get/ProjList";
    NSURL *url = [NSURL URLWithString:urlStr];
    NSData *Data =[NSData dataWithContentsOfURL:url];
    NSLog(@"----");
    
    
        NSError *error=nil;
        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:Data options:NSJSONReadingMutableContainers error:&error];
        
    
        NSMutableArray *projectjsonData= jsonData[@"projects"];
    NSMutableArray *projectDataArray = [[NSMutableArray alloc]init];
    
        
        for (NSDictionary *proj in projectjsonData) {
            ProjectModel *projectData =  [[ProjectModel alloc]init];
            
            projectData.projno = proj[@"prjno"];
            projectData.projName =  proj[@"prjName"];
            projectData.updOn = proj[@"updatedOn"] ;
            projectData.projMan = proj[@"prjManager"];
            projectData.cost_color=proj[@"cost_color"];
            projectData.cost_trend=proj[@"cost_trend"];
            projectData.scope_color=proj[@"scope_color"];
            projectData.scope_trend=proj[@"scope_trend"];
            projectData.sch_color=proj[@"sch_color"];
            projectData.sch_trend=proj[@"sch_trend"];
            projectData.risk_color=proj[@"risk_color"];
            projectData.risk_trend=proj[@"risk_trend"];
            projectData.isFav=proj[@"is_Fav"];
            projectData.desc=proj[@"desc"];
            projectData.stage=proj[@"stage"];
            projectData.duration=proj[@"duration"];
            projectData.region=proj[@"region"];
            projectData.category=proj[@"category"];
            projectData.subcategory=proj[@"subcategory"];
            projectData.sponser=proj[@"sponsor"];
            projectData.waterLine=proj[@"waterline"];
            projectData.priority=proj[@"priority"];
            projectData.plnLeader=proj[@"planLeader"];
            projectData.highlights=proj[@"highlights"];
            projectData.nextsteps=proj[@"nextsteps"];
            projectData.issues_risks=proj[@"issues_risks"];
            
            [projectDataArray addObject:projectData];
           
        }
        
        


    
    
    return projectDataArray;
}
@end
