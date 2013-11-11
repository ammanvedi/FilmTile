//
//  AFTFilmViewController.h
//  FilmTile
//
//  Created by Amman on 08/04/2013.
//  Copyright (c) 2013 Amman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AFTFilmViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *main_img;
- (IBAction)backpressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIWebView *Main_Web_View;
@property (weak, nonatomic) IBOutlet UIButton *back_flm;
@property (weak, nonatomic) IBOutlet UILabel *title_text;
@property (weak, nonatomic) IBOutlet UIImageView *poster_image;
@property (weak, nonatomic) IBOutlet UITableView *main_table_view;
@property (strong,nonatomic) NSMutableArray *passedData;
@property (strong,nonatomic) UIImage *selectedImage;

@end
