//
//  AFTViewController.h
//  FilmTile
//
//  Created by Amman on 04/04/2013.
//  Copyright (c) 2013 Amman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MagnifierView.h"

@interface AFTViewController : UIViewController <UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *main_scroll_view;
@property (strong, nonatomic) IBOutlet UIImageView *vingette_view;
- (IBAction)back:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *back_btn;
@property (strong,nonatomic) NSMutableArray *passedImagesFromJSON;
- (IBAction)backpressed:(id)sender;

@end
