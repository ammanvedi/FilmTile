//
//  AFTFilmTableViewCell.m
//  FilmTile
//
//  Created by Amman Vedi on 13/04/2013.
//  Copyright (c) 2013 Amman. All rights reserved.
//

#import "AFTFilmTableViewCell.h"

@implementation AFTFilmTableViewCell

@synthesize Data_label;
@synthesize image_icon_cell;
@synthesize color_line;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
