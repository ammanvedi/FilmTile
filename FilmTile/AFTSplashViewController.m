//
//  AFTSplashViewController.m
//  FilmTile
//
//  Created by Amman on 06/04/2013.
//  Copyright (c) 2013 Amman. All rights reserved.
//
//2

#import "AFTSplashViewController.h"
#import "AFTViewController.h"

//define a grand central dispatch job queue to deal with out async operations
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) 
//another GCD queue to deal with our image loading
#define dloadimages dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)



@interface AFTSplashViewController ()

@end



@implementation AFTSplashViewController

//synthesize our property so that its a complete property of the class
@synthesize topassimages;


//imageview array to hold our downloaded images
UIImage *imageArray[25];



- (void)viewDidLoad
{
    //enable the go button
    self.go.enabled = NO;
    //call the superclass method to perform essential view operations on the load of the view
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSLog(@"starting... loading json data");
    
    //download the json data from internet, asynchronously
    dispatch_async(kBgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.ammanv.com/films.json"]];
        [self performSelectorOnMainThread:@selector(fetchedData:)
                               withObject:data waitUntilDone:YES];
    });
    
   
}



- (void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData 
                          
                          options:kNilOptions
                          error:&error];
    
    NSMutableArray *dta = json;
    
    

    //pass the data about the images that need to be downloaded to the next view
    //so we need to package it in an array
    topassimages = [[NSMutableArray alloc] initWithArray:dta];
    [self.json_status_image setImage:[UIImage imageNamed:@"json_done.png"]];
    [self.go setAlpha:1.0f];
    self.go.enabled = YES;

    NSLog(@"finished... loading json data");

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)gopressed:(id)sender {
    
    //move to the next view controller
    //i have done it the manual way with code because its easier to pass data 
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    AFTViewController *sfvc = [[AFTViewController alloc] init];
    sfvc = [storyboard instantiateViewControllerWithIdentifier:@"AFTViewController"];
    sfvc.passedImagesFromJSON = topassimages;
    [sfvc setModalPresentationStyle:UIModalPresentationFullScreen];
    [self presentViewController:sfvc animated:YES completion:nil];
}
@end
