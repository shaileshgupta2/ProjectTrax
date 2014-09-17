//
//  ProjectCell.m
//  Trax
//
//  Created by Kiran Bandla on 8/20/14.
//  Copyright (c) 2014 ITSS TS. All rights reserved.
//

#import "ProjectCell.h"

@implementation ProjectCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _cost_this = [[UIImageView alloc] initWithFrame:(CGRectMake(0, 0, 99, 79))];
        _risk_this = [[UIImageView alloc] initWithFrame:(CGRectMake(0, 0, 99, 79))];

        _nameField = [[UILabel alloc] initWithFrame:(CGRectMake(107, 8, 173, 42))];
        _nameField.font = [UIFont systemFontOfSize:17];
        _nameField.textAlignment = NSTextAlignmentCenter;
        
        _UpdatedOn = [[UILabel alloc] initWithFrame:(CGRectMake(137, 49, 113, 21))];
        _UpdatedOn.font = [UIFont systemFontOfSize:13];
        _UpdatedOn.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:_cost_this];
        [self.contentView addSubview:_risk_this];

        [self.contentView addSubview:_nameField];
        [self.contentView addSubview:_UpdatedOn];
    }
    
    return self;
}
@end
