//
//  jsonParser.h
//  ProjectTrax
//
//  Created by ITSSTS MacMini on 05/09/14.
//  Copyright (c) 2014 ITSS TS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface jsonParser : NSObject


@property  NSArray *projects;

@property NSString *prjno;
@property NSString *prjName;
@property NSString *updatedOn;
@property NSString *prjManager;
@property NSString *cost_color;
@property NSString *cost_trend;
@property NSString *risk_color;
@property NSString *risk_trend;
@property NSString *scope_color;
@property NSString *scope_trend;
@property NSString *sch_color;
@property NSString *sch_trend;
@property NSString *is_Fav;
@property NSString *desc;
@property NSString *stage;
@property NSString *duration;
@property NSString *region;
@property NSString *category;
@property NSString *subcategory;
@property NSString *sponsor;
@property NSString *waterline;
@property NSString *priority;

@property NSArray *planLeader;

@property NSArray *highlights;
@property NSArray *nextsteps;
@property NSArray *issues;
@property NSArray *risks;





-(void)loadJson;


@end
