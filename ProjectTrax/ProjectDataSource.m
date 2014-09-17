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
    NSString *urlStr =@"http://10.78.5.90:9090/ProjectDashBoard/service/get/ProjList/E873125/@nve$h454";
    NSURL *url = [NSURL URLWithString:urlStr];
    NSData *Data =[NSData dataWithContentsOfURL:url];
    
    NSError *error=nil;
        NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:Data options:NSJSONReadingMutableContainers error:&error];
        
        NSMutableArray *projectjsonData= jsonData[@"projects"];
        NSMutableArray *projectDataArray = [[NSMutableArray alloc]init];
    
        
        for (NSDictionary *proj in projectjsonData)
        {
            ProjectModel *projectData =  [[ProjectModel alloc]init];
            
            NSString *projno = proj[@"prjno"];
            if ([projno isEqualToString:nil] ||[projno isEqualToString:@""])
            {
                projectData.projno = @"N/A";
            }
            else
            {
                projectData.projno = projno;
            }
            
            NSString * projName = proj[@"fileRef"];
            if ((projName ==nil) ||[projName isEqualToString:@""] ) 
            {
                projectData.projName =  @"N/A";
            }
            else
            {
                projectData.projName =  projName;
            }
            
            NSString * updOn = proj[@"updatedOn"];
            if ((updOn ==nil) ||[updOn isEqualToString:@""])
            {
               projectData.updOn = @"N/A" ;
            }
            else
            {
                projectData.updOn = updOn;
                
             
            }
             NSString* projMan = proj[@"prjManager"];
            if ((projMan  == nil) ||[projMan isEqualToString:@""])
            {
                projectData.projMan = @"N/A";
            }
            else
            {
                projectData.projMan=projMan;
            }
             projectData.cost_color= [self getIconName:proj[@"cost_color"] :proj[@"cost_trend"]];
             projectData.scope_color= [self getIconName:proj[@"scope_color"] :proj[@"scope_trend"]];
             projectData.sch_color= [self getIconName:proj[@"sch_color"] :proj[@"sch_trend"]];
             projectData.risk_color= [self getIconName:proj[@"risk_color"] :proj[@"risk_trend"]];
            
            
            //projectData.cost_color=proj[@"cost_color"];
            //projectData.cost_trend=proj[@"cost_trend"];
            //projectData.scope_color=proj[@"scope_color"];
            //projectData.scope_trend=proj[@"scope_trend"];
            //projectData.sch_color=proj[@"sch_color"];
            //projectData.sch_trend=proj[@"sch_trend"];
            //projectData.risk_color=proj[@"risk_color"];
            //projectData.risk_trend=proj[@"risk_trend"];
            
            
            projectData.isFav=proj[@"is_Fav"];
            
            NSString* desc=proj[@"desc"];
            if ((desc ==nil) ||[desc isEqualToString:@""])
            {
                projectData.desc =@"N/A";
            }
            else
            {
                projectData.desc =desc;
            }
            
            NSString* stage=proj[@"stage"];
            if ((stage ==nil) ||[stage isEqualToString:@""])
            {
                projectData.stage=@"N/A";
            }
            else
            {
                projectData.stage=stage;
            }
            NSString* duration=proj[@"duration"];
            if ((duration == nil) ||[duration isEqualToString:@""])
            {
                projectData.duration=@"N/A";
            }
            else
            {
                projectData.duration=duration;
            }
            NSArray*  region=proj[@"region"];
            if ((region == nil) ||([region count]==0))
            {
                projectData.region = [[NSArray alloc]initWithObjects:@"N/A",nil];  //@"N/A";
            }
            else
            {
                projectData.region=region;
            }
            NSString* category = proj[@"category"];
            if ((category == nil) ||[category isEqualToString:@""])
            {
                projectData.category = @"N/A";
            }
            else
            {
                projectData.category = category;
            }
            NSString* subcategory=proj[@"subcategory"];
            if ((subcategory == nil) ||[subcategory isEqualToString:@""])
            {
                projectData.subcategory =@"N/A";
            }
            else
            {
                projectData.subcategory =subcategory;
            }
            NSString* sponser=proj[@"sponsor"];
           // NSLog(@"sponser  :  %@",sponser);
            if ((sponser == nil) ||[sponser isEqualToString:@""])
            {
                projectData.sponser = @"N/A";
            }
            else
            {
                projectData.sponser =sponser;
            }
            NSString* waterLine=proj[@"waterline"];
            if ((waterLine == nil) ||[waterLine isEqualToString:@""])
            {
                projectData.waterLine = @"N/A";
            }
            else
            {
                projectData.waterLine =waterLine;
            }
            NSString* priority=proj[@"priority"];
            if ((priority == nil) ||[priority isEqualToString:@""])
            {
                projectData.priority = @"N/A";
            }
            else
            {
                projectData.priority = priority;
            }
            NSArray*  plnLeader=proj[@"planLeader"];
            if ((plnLeader ==nil) ||([plnLeader count]==0))
            {
                projectData.plnLeader = [[NSArray alloc]initWithObjects:@"N/A",nil];
            }
            else
            {
                projectData.plnLeader = plnLeader;
            }
            
       ///////////////////////////////////////////////////////////////////////////////////////
            NSMutableArray* highlights=proj[@"highlights"];
            NSLog(@"highlight size  : %d",[highlights count]);
            NSMutableArray *nLights=[NSMutableArray new];
            for(int i=0;i<[highlights count];i++)
            {
                if(([highlights objectAtIndex:i]==nil)||[[highlights objectAtIndex:i]isEqualToString:@""])
                {}
                else
                {
                    [nLights addObject:[highlights objectAtIndex:i]];
                }
            }
            NSLog(@"nlights size : %d",[nLights count]);
            if ([nLights count]==0)
            {
                NSMutableArray *nL = [[NSMutableArray alloc]init];
                [nL addObject:@"N/A"];
               projectData.highlights = nL;
            }
            else
            {
                projectData.highlights = nLights;
            }
            
        ///////////////////////////////////////////////////////////////////////////////////////
            
            NSArray* nextsteps=proj[@"nextsteps"];
            NSLog(@"next step   :  %d",[nextsteps count]);
            NSMutableArray* nStep=[[NSMutableArray alloc]init];
            for (int i =0; i<[nextsteps count]; i++) {
                if (([nextsteps objectAtIndex:i] == nil)||([[nextsteps objectAtIndex:i] isEqualToString:@""]))
                {
                    
                }
                else
                {   NSLog(@"   %@  next step data  :  %@",projectData.projName ,[nextsteps objectAtIndex:i]);
                    [nStep addObject:[nextsteps objectAtIndex:i]];
                }
            }
            NSLog(@"nstep count :  %d",[nStep count]);
            if ([nStep count]==0)
            {
                
                NSMutableArray *nS = [[NSMutableArray alloc]init];
                [nS addObject:@"N/A"];
                projectData.nextsteps = nS;
            }
            else
            {
                projectData.nextsteps = nStep;
            
            }
          
       ///////////////////////////////////////////////////////////////////////////////////////
          
            NSArray* issues_risks=proj[@"issues_risks"];
            NSLog(@"issue_count : %d",[issues_risks count]);
            
            NSMutableArray *nissue = [NSMutableArray new];
            
            
            for (int i=0; i<[issues_risks count]; i++)
            {
                NSDictionary *issData =  [issues_risks objectAtIndex:i];
                NSString *risk =issData[@"risk"];
                NSString *riskIndicator = issData[@"riskIndicator"];
                NSArray *actions = issData[@"actions"];
                
                if ((risk == nil) || [risk isEqualToString:@""] )
                {
                    NSMutableDictionary *nDict = [[NSMutableDictionary alloc]init];
                    [nDict setObject:@"N/A" forKey:@"risk"];
                    [nDict setObject:@"N/A" forKey:@"riskIndicator"];
                     NSMutableArray *act = [[NSMutableArray alloc]init];
                    [act addObject:@"N/A"];
                    [nDict setObject:act forKey:@"actions"];
                    [nissue addObject:nDict];
                    goto OUT;
                }
                else
                {
                    if([actions count]==0)
                    {
                        NSMutableDictionary *nDict = [[NSMutableDictionary alloc]init];
                        [nDict setObject:risk forKey:@"risk"];
                        [nDict setObject:riskIndicator forKey:@"riskIndicator"];
                        NSMutableArray *act = [[NSMutableArray alloc]init];
                        [act addObject:@"N/A"];
                        [nDict setObject:act forKey:@"actions"];
                        [nissue addObject:nDict];
                    }
                    else
                    {
                        NSMutableDictionary *nDict = [[NSMutableDictionary alloc]init];
                        [nDict setObject:risk forKey:@"risk"];
                        [nDict setObject:riskIndicator forKey:@"riskIndicator"];
                        NSMutableArray *act = [[NSMutableArray alloc]init];
                        for (int j=0; j<[actions count]; j++)
                            {
                                if(([actions objectAtIndex:j]==nil)&&([[actions objectAtIndex:j]isEqualToString:@""]))
                                {
                                    [act addObject:@"N/A"];
                                }
                                else
                                {
                                    [act addObject:[actions objectAtIndex:j]];
                    
                                }
                            }
                            [nDict setObject:act forKey:@"actions"];
                            [nissue addObject:nDict];
                     }
                }
                
                
            }
            OUT :
            
                projectData.issues_risks=nissue;
            
         ///////////////////////////////////////////////////////////////////////////////////////
            [projectDataArray addObject:projectData];
           
        }
    
    return projectDataArray;
}

- (NSString *)getIconName :(NSString *)icolor : (NSString *)itrend
{
    NSString *iconName =[NSString new];
    
    NSString *ncolor =icolor;//
    NSString *ntrend =itrend;//
    
    NSString *redIcon = @"Arrow-RED-40x40.png";
    NSString *greenIcon = @"Arrow-Green-40x40.png";
    NSString *yellowIcon = @"Yellow-Stable-40x40.png";
    
    
    NSString *color;
    NSString *trend;
    NSArray *C_L =[ncolor componentsSeparatedByString:@";"];
    for (int i =0;i<[C_L count]; i++)
    {
        if ([[C_L objectAtIndex:i]rangeOfString:@"color"].location != NSNotFound)
        {
            color = [C_L objectAtIndex:i];
            color = [color stringByReplacingOccurrencesOfString:@" color:" withString:@""];
           
        }
    }
    
    
    NSArray *C_T =[ntrend componentsSeparatedByString:@"/"];
    for (int i =0;i<[C_T count]; i++)
    {
        if ([[C_T objectAtIndex:i]rangeOfString:@"Arrow"].location != NSNotFound)
        {
            trend = [C_T objectAtIndex:i];
            trend = [trend stringByReplacingOccurrencesOfString:@"%20Arrow.jpg><" withString:@""];
        }
    }
    
    
    if (([trend caseInsensitiveCompare:@"up"]==NSOrderedSame)  && ([color caseInsensitiveCompare:@"red"]==NSOrderedSame))
    {
        iconName = redIcon;
    }
    else if (([trend caseInsensitiveCompare:@"up"]==NSOrderedSame)  && ([color caseInsensitiveCompare:@"green"]==NSOrderedSame))
    {
        iconName = greenIcon;
    }
    else if (([trend caseInsensitiveCompare:@"up"]==NSOrderedSame)  && ([color caseInsensitiveCompare:@"yellow"]==NSOrderedSame))
    {
        iconName = yellowIcon;
    }
    else if (([trend caseInsensitiveCompare:@"down"]==NSOrderedSame)  && ([color caseInsensitiveCompare:@"red"]==NSOrderedSame))
    {
        iconName = redIcon;
    }
    else if (([trend caseInsensitiveCompare:@"down"]==NSOrderedSame)  && ([color caseInsensitiveCompare:@"green"]==NSOrderedSame))
    {
        iconName = yellowIcon;
    }
    else if (([trend caseInsensitiveCompare:@"down"]==NSOrderedSame)  && ([color caseInsensitiveCompare:@"yellow"]==NSOrderedSame))
    {
        iconName = yellowIcon;
    }
    else if (([trend caseInsensitiveCompare:@"sideway"]==NSOrderedSame)  && ([color caseInsensitiveCompare:@"red"]==NSOrderedSame))
    {
        iconName = redIcon;
    }
    else if (([trend caseInsensitiveCompare:@"sideway"]==NSOrderedSame)  && ([color caseInsensitiveCompare:@"green"]==NSOrderedSame))
    {
        iconName = greenIcon;
    }
    else
    {
        iconName = yellowIcon;
    }
    
    return iconName;
    
}


@end
