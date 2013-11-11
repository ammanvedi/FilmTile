//
//  AFTSplashViewController.h
//  FilmTile
//
//  Created by Amman on 06/04/2013.
//  Copyright (c) 2013 Amman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AFTSplashViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *go;
@property (strong, nonatomic) NSMutableArray *topassimages;
-(void)downloadImages;
- (IBAction)gopressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *json_status_image;

@end
