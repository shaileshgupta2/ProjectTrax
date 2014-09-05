//
//  ProjectModel.h
//  Trax
//
//  Created by Kiran Bandla on 8/20/14.
//  Copyright (c) 2014 ITSS TS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProjectModel : NSObject

@property (nonatomic,assign) NSString *projNo;

@property (nonatomic,assign) NSString *projName;
@property (nonatomic,assign) NSString *projMan;

@property (nonatomic,assign) NSString *updOn;

@property (nonatomic,strong) NSString *stage;
@property (nonatomic,strong) NSString *function;

@property (nonatomic,strong) NSString *sch;
@property (nonatomic,strong) NSString *cost;
@property (nonatomic,strong) NSString *scp;
@property (nonatomic,strong) NSString *risk;

@property (nonatomic,strong) NSString *isFav;





-(id) initWithId : (NSString *)  prjno :(NSString *)  prjname :(NSString *)  prjmanager : (NSString *) updatedon : (NSString *) prjstage : (NSString *) prjfunction : (NSString *) prjSch: (NSString *) prjCost:(NSString *) prjScp: (NSString *) prjRisk:(NSString *) isFav;
@end
