//
//  ProjectModel.h
//  Trax
//
//  Created by Kiran Bandla on 8/20/14.
//  Copyright (c) 2014 ITSS TS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProjectModel : NSObject

@property (nonatomic,strong) NSString *projno;
@property (nonatomic,strong) NSString *projName;
@property (nonatomic,strong) NSString *updOn;
@property (nonatomic,strong) NSString *projMan;

@property (nonatomic,strong) NSString *sch_color,*sch_trend;
@property (nonatomic,strong) NSString *cost_color,*cost_trend;
@property (nonatomic,strong) NSString *scope_color,*scope_trend;
@property (nonatomic,strong) NSString *risk_color,*risk_trend;
@property (nonatomic,strong) NSString *isFav;
@property (nonatomic,strong) NSString *desc ;
@property (nonatomic,strong) NSString *stage;
@property (nonatomic,strong) NSString *duration ;
@property (nonatomic,strong) NSArray *region ;
@property (nonatomic,strong) NSString *category ;
@property (nonatomic,strong) NSString *subcategory ;
@property (nonatomic,strong) NSString *sponser ;
@property (nonatomic,strong) NSString *waterLine ;
@property (nonatomic,strong) NSString *priority ;
@property (nonatomic,strong) NSArray *plnLeader;
@property (nonatomic,strong) NSArray *highlights;
@property (nonatomic,strong) NSArray *nextsteps;
@property (nonatomic,strong) NSArray *issues_risks;
@property (nonatomic,strong) NSString *function;







//-(id) initWithId : (NSString *)  prjno :(NSString *)  prjname :(NSString *)  prjmanager : (NSString *) updatedon : (NSString *) prjstage : (NSString *) prjfunction : (NSString *) prjSch: (NSString *) prjCost:(NSString *) prjScp: (NSString *) prjRisk:(NSString *) isFav;
@end
