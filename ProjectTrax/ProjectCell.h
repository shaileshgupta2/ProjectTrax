//
//  ProjectCell.h
//  Trax
//
//  Created by Kiran Bandla on 8/20/14.
//  Copyright (c) 2014 ITSS TS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SWTableViewCell.h"

@interface ProjectCell : SWTableViewCell
{
    
}
@property (weak, nonatomic) IBOutlet UILabel *nameField;

@property (weak, nonatomic) IBOutlet UILabel *UpdatedOn;
@property (weak, nonatomic) IBOutlet UIImageView *cost_this;
@property (weak, nonatomic) IBOutlet UIImageView *cost_past;
@end
