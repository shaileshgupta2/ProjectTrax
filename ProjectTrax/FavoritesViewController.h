//
//  FavoritesViewController.h
//  Trax
//
//  Created by Kiran Bandla on 8/26/14.
//  Copyright (c) 2014 ITSS TS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FavoritesViewController;
@protocol FavPrjProtocol

-(NSMutableArray *) getfavouritesFromProjects : (FavoritesViewController *) cntr;


@end
@interface FavoritesViewController : UIViewController



@property (nonatomic,assign) id <FavPrjProtocol> favPrjSource;
@property(nonatomic) NSMutableArray *favouritePipelineprojects;
@property(nonatomic) NSMutableArray *favouriteProjects;
@end
