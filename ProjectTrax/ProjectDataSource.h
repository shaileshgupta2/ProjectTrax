//
//  ProjectDataSource.h
//  Trax
//
//  Created by Kiran Bandla on 8/20/14.
//  Copyright (c) 2014 ITSS TS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProjectDataSource : NSObject
-(NSArray *)getAllProjects;
-(NSString *)getIconName :(NSString *)icolor : (NSString *)itrend;
@end
