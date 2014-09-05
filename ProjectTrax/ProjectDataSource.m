//
//  ProjectDataSource.m
//  Trax
//
//  Created by Kiran Bandla on 8/20/14.
//  Copyright (c) 2014 ITSS TS. All rights reserved.
//

#import "ProjectDataSource.h"
#import "ProjectModel.h"
@implementation ProjectDataSource

-(NSArray *)getAllProjects
{
    
    NSMutableArray *projectDataArray = [[NSMutableArray alloc]init];
    ProjectModel *project1 = [[ProjectModel alloc] initWithId:@"WL1":@"LProj1" :@"Kiran":@"1/2/2012" :@"Testins" :@"tt" :@"up" :@"down" :@"up" :@"down" :@"NO"];
     ProjectModel *project2 = [[ProjectModel alloc] initWithId:@"WL2":@"QProj2" :@"Kiran":@"1/2/2012" :@"Testins" :@"tt" :@"up" :@"down" :@"up" :@"down" :@"NO"];
     ProjectModel *project3 = [[ProjectModel alloc] initWithId:@"WL3":@"AProj3":@"Kiran" :@"1/2/2012" :@"Testins" :@"tt" :@"up" :@"down" :@"up" :@"down" :@"NO"];
     ProjectModel *project4 = [[ProjectModel alloc] initWithId:@"WL4":@"FProj4" :@"Preethi":@"1/2/2012" :@"Testins" :@"tt" :@"up" :@"down" :@"up" :@"down" :@"NO"];
     ProjectModel *project5 = [[ProjectModel alloc] initWithId:@"WL5":@"Proj5":@"Preethi" :@"1/2/2012" :@"Testins" :@"tt" :@"up" :@"down" :@"up" :@"down" :@"NO"];
     ProjectModel *project6 = [[ProjectModel alloc] initWithId:@"WL6":@"Proj6" :@"Preethi":@"1/2/2012" :@"Testins" :@"tt" :@"up" :@"down" :@"up" :@"down" :@"NO"];
     ProjectModel *project7 = [[ProjectModel alloc] initWithId:@"WL7":@"Proj7" :@"Preethi":@"1/2/2012" :@"Testins" :@"tt" :@"up" :@"down" :@"up" :@"down" :@"NO"];
     ProjectModel *project8 = [[ProjectModel alloc] initWithId:@"WL8":@"Proj76" :@"Preethi":@"1/2/2012" :@"Testins" :@"tt" :@"up" :@"down" :@"up" :@"down" :@"NO"];
     ProjectModel *project9 = [[ProjectModel alloc] initWithId:@"WL9":@"Proj77" :@"Preethi":@"1/2/2012" :@"Testins" :@"tt" :@"up" :@"down" :@"up" :@"down" :@"NO"];
     ProjectModel *project10 = [[ProjectModel alloc] initWithId:@"WL10":@"Proj78" :@"Preethi":@"1/2/2012" :@"Testins" :@"tt" :@"up" :@"down" :@"up" :@"down" :@"NO"];
     ProjectModel *project11 = [[ProjectModel alloc] initWithId:@"WL11":@"Proj79" :@"Preethi":@"1/2/2012" :@"Testins" :@"tt" :@"up" :@"down" :@"up" :@"down" :@"NO"];
     ProjectModel *project12 = [[ProjectModel alloc] initWithId:@"WL12":@"Proj70" :@"Preethi":@"1/2/2012" :@"Testins" :@"tt" :@"up" :@"down" :@"up" :@"down" :@"NO"];
     ProjectModel *project13 = [[ProjectModel alloc] initWithId:@"WL13":@"Proj71" :@"Preethi":@"1/2/2012" :@"Testins" :@"tt" :@"up" :@"down" :@"up" :@"down" :@"NO"];
     ProjectModel *project14 = [[ProjectModel alloc] initWithId:@"WL14":@"Proj72" :@"Preethi":@"1/2/2012" :@"Testins" :@"tt" :@"up" :@"down" :@"up" :@"down" :@"NO"];
    
    [projectDataArray addObject:project1];
    [projectDataArray addObject:project2];

    [projectDataArray addObject:project3];

    [projectDataArray addObject:project4];

    [projectDataArray addObject:project5];

    [projectDataArray addObject:project6];
    [projectDataArray addObject:project7];
    [projectDataArray addObject:project8];
    [projectDataArray addObject:project9];
    [projectDataArray addObject:project10];
    [projectDataArray addObject:project11];
    [projectDataArray addObject:project12];
    [projectDataArray addObject:project13];
    [projectDataArray addObject:project14];
    return projectDataArray;
}
/*-(NSArray *)getAllTrendingProjects
{
    
    NSMutableArray *trendingprojectDataArray = [[NSMutableArray alloc]init];
    ProjectModel *project1 = [[ProjectModel alloc] initWithId:@"TWL1":@"Projt1" :@"Kiran":@"1/2/2012" :@"Testins" :@"tt" :@"up" :@"down" :@"up" :@"down" :@"NO"];
    ProjectModel *project2 = [[ProjectModel alloc] initWithId:@"TWL2":@"Projt2" :@"Kiran":@"1/2/2012" :@"Testins" :@"tt" :@"up" :@"down" :@"up" :@"down" :@"NO"];
    ProjectModel *project3 = [[ProjectModel alloc] initWithId:@"tWL3":@"Projt3":@"Kiran" :@"1/2/2012" :@"Testins" :@"tt" :@"up" :@"down" :@"up" :@"down" :@"NO"];
    ProjectModel *project4 = [[ProjectModel alloc] initWithId:@"tWL4":@"Projt4" :@"Preethi":@"1/2/2012" :@"Testins" :@"tt" :@"up" :@"down" :@"up" :@"down" :@"NO"];
    ProjectModel *project5 = [[ProjectModel alloc] initWithId:@"tWL5":@"Projt5":@"Preethi" :@"1/2/2012" :@"Testins" :@"tt" :@"up" :@"down" :@"up" :@"down" :@"NO"];
    ProjectModel *project6 = [[ProjectModel alloc] initWithId:@"tWL6":@"Projt6" :@"Preethi":@"1/2/2012" :@"Testins" :@"tt" :@"up" :@"down" :@"up" :@"down" :@"NO"];
    ProjectModel *project7 = [[ProjectModel alloc] initWithId:@"tWL7":@"Projt7" :@"Preethi":@"1/2/2012" :@"Testins" :@"tt" :@"up" :@"down" :@"up" :@"down" :@"NO"];
    
    [trendingprojectDataArray addObject:project1];
    [trendingprojectDataArray addObject:project2];
    
    [trendingprojectDataArray addObject:project3];
    
    [trendingprojectDataArray addObject:project4];
    
    [trendingprojectDataArray addObject:project5];
    
    [trendingprojectDataArray addObject:project6];
    [trendingprojectDataArray addObject:project7];
    return trendingprojectDataArray;
}
*/
@end
