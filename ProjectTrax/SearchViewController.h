//
//  SearchViewController.h
//  ProjectTrax
//
//  Created by Kiran Bandla on 9/2/14.
//  Copyright (c) 2014 ITSS TS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SINavigationMenuView.h"

@interface SearchViewController : UIViewController <SINavigationMenuDelegate>
@property(nonatomic) NSMutableArray *currentSearchProjects;

@end
