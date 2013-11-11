//
//  AFTFilmViewController.m
//  FilmTile
//
//  Created by Amman on 08/04/2013.
//  Copyright (c) 2013 Amman. All rights reserved.
//

#import "AFTFilmViewController.h"
#import <QuartzCore/CALayer.h>
#import "AFTFilmTableViewCell.h"

@interface AFTFilmViewController ()

@end

@implementation AFTFilmViewController
@synthesize poster_image;
@synthesize title_text;
@synthesize main_table_view;
@synthesize passedData;
@synthesize selectedImage;
@synthesize main_img;

NSDictionary *d;

UIImage *runtime;
UIImage *boxoffice;
UIImage *score;
UIImage *starring;
UIImage *slate;
UIImage *year;
UIImage *lang;
UIImage *country;

- (void)viewDidLoad
{
    
    d = (NSDictionary*)self.passedData;
    
    runtime = [UIImage imageNamed:@"clock.png"];
    boxoffice = [UIImage imageNamed:@"boxoffice.png"];
    score = [UIImage imageNamed:@"score.png"];
    starring = [UIImage imageNamed:@"starring.png"];
    slate = [UIImage imageNamed:@"slate.png"];
    year = [UIImage imageNamed:@"year.png"];
    lang = [UIImage imageNamed:@"lang.png"];
    country = [UIImage imageNamed:@"country.png"];
    
    [super viewDidLoad];
    [self.main_table_view setDelegate:self];
    [self.main_table_view setDataSource:self];
    [self.title_text setTextColor:[UIColor whiteColor]];
    [[self.Main_Web_View scrollView] setBounces:NO];
    [[self.Main_Web_View scrollView] setScrollEnabled:NO];
    [[self.Main_Web_View scrollView] setUserInteractionEnabled:YES];
    [self.Main_Web_View setUserInteractionEnabled:YES];
    
    [self.poster_image setImage:self.selectedImage];
    [self.title_text setText:[d objectForKey:@"Title"]];
    
    poster_image.layer.shadowColor = [UIColor blackColor].CGColor;
    poster_image.layer.shadowOffset = CGSizeMake(0, 1);
    poster_image.layer.shadowOpacity = 1;
    poster_image.layer.shadowRadius = 3.0;
    poster_image.clipsToBounds = NO;
    
    [main_img.layer setBorderColor: [[UIColor lightGrayColor] CGColor]];
    [main_img.layer setBorderWidth: 3.0];
    main_img.layer.shadowColor = [UIColor blackColor].CGColor;
    main_img.layer.shadowOffset = CGSizeMake(0, 1);
    main_img.layer.shadowOpacity = 1;
    main_img.layer.shadowRadius = 3.0;
    main_img.clipsToBounds = NO;
    

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [d count] - 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"info_cell";
    
    AFTFilmTableViewCell *cell = [tableView
                              dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[AFTFilmTableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    if(indexPath.row == 0)
    {
        [cell.Data_label setText:[d objectForKey:@"Runtime"]];
        [cell.image_icon_cell setImage:runtime];
        
        
    }
    
    if(indexPath.row == 1)
    {
        [cell.Data_label setText:[d objectForKey:@"Director"]];
        [cell.image_icon_cell setImage:slate];
    }
    
    if(indexPath.row == 2)
    {
        [cell.Data_label setText:[d objectForKey:@"Starring"]];
        [cell.image_icon_cell setImage:starring];
    }
    
    if(indexPath.row == 3)
    {
        [cell.Data_label setText:[d objectForKey:@"Country"]];
        [cell.image_icon_cell setImage:country];
    }
    
    if(indexPath.row == 4)
    {
        [cell.Data_label setText:[d objectForKey:@"RT Score"]];
        [cell.image_icon_cell setImage:score];
    }
    
    if(indexPath.row == 5)
    {
        [cell.Data_label setText:[d objectForKey:@"BoxOffice"]];
        [cell.image_icon_cell setImage:boxoffice];
    }
    
    if(indexPath.row == 6)
    {
        [cell.Data_label setText:[d objectForKey:@"Year"]];
        [cell.image_icon_cell setImage:year];
    }
    
    if(indexPath.row == 7)
    {
        [cell.Data_label setText:[d objectForKey:@"Language"]];
        [cell.image_icon_cell setImage:lang];
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backpressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
