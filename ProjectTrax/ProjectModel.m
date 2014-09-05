//
//  ProjectModel.m
//  Trax
//
//  Created by Kiran Bandla on 8/20/14.
//  Copyright (c) 2014 ITSS TS. All rights reserved.
//

#import "ProjectModel.h"

@implementation ProjectModel

-(id) initWithId :  (NSString *)  prjno :(NSString *)  prjname :(NSString *)  prjmanager : (NSString *) updatedon : (NSString *) prjstage : (NSString *) prjfunction : (NSString *) prjSch: (NSString *) prjCost:(NSString *) prjScp: (NSString *) prjRisk:(NSString *) isFav
{
    if(self = [super init])
    {
        _projNo = prjno;
    _projName=prjname;
    _projMan=prjmanager;
    _updOn = updatedon;
    
    _stage = prjstage;
    _function= prjfunction;
    _sch=prjSch;
    _scp=prjScp;
    _cost=prjCost;
    _risk=prjRisk;
    _isFav=isFav;
    }
    return self;
}
@end
