//
//  StatusCell.m
//  Screen4TestAppliaction
//
//  Created by ITSSTS MacMini on 21/08/14.
//  Copyright (c) 2014 ITSSTS MacMini. All rights reserved.
//

#import "StatusCell.h"

@implementation StatusCell




- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(NSString *)reuseIdentifier
{
    return @"CustomCellIdentifier";
}

@end
