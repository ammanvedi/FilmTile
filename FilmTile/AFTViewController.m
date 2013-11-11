   //
//  AFTViewController.m
//  FilmTile
//
//  Created by Amman on 04/04/2013.
//  Copyright (c) 2013 Amman. All rights reserved.
//

#import "AFTViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "AFTFilmViewController.h"


@interface AFTViewController ()

@end

@implementation AFTViewController

@synthesize passedImagesFromJSON;

UIImageView *imageViewArray[25];
int numberOfImages = 5;
int rows = 5;
int w = 150, h = 200;
int countimg = 1;

MagnifierView *Mag;

CGFloat currentX = 0.0f;
CGFloat currentY = 0.0f;


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    
    CGRect visibleRect;
    visibleRect.origin = self.main_scroll_view.contentOffset;
    visibleRect.size = self.main_scroll_view.bounds.size;

    for(int y = 0; y < (numberOfImages*rows); y++)
    {
        
        
        if (CGRectContainsRect(visibleRect, imageViewArray[y].frame)){
            //NSLog(@"view with index %d is fully visible", y);
            [imageViewArray[y] setAlpha:1.0f];
            
            
        }else{
            [imageViewArray[y] setAlpha:0.3f];
        }
        
       
    }
}


- (void)viewDidLoad
{
    
    NSLog(@"starting... clearing cache");
    [[SDImageCache sharedImageCache] clearDisk];
    NSLog(@"finished... clearing cache");
    
    NSLog(@"starting... setting up view and downloading images");
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.


    
    //The setup code (in viewDidLoad in your view controller)
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    [self.main_scroll_view addGestureRecognizer:singleFingerTap];
    

    [self.main_scroll_view setDelegate:self];
    
    [self.main_scroll_view setContentSize:CGSizeMake((CGFloat)w*numberOfImages, (CGFloat)h*rows)];
    [self.main_scroll_view setBackgroundColor:[UIColor blackColor]];
    [self.main_scroll_view scrollRectToVisible:CGRectMake((self.main_scroll_view.contentSize.width/2), (self.main_scroll_view.contentSize.height/2), 320, 548) animated:YES];
   
    
    
    for (int y = 1; y <= rows; y++) {
       

            for (int i=1; i <= numberOfImages; i++) {
                
                NSString* urlname = @"placeholder_download.jpg";
                UIImage *img = [UIImage imageNamed:urlname];
            
                // create image
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
                //[imageView setBackgroundColor:color];
                //[imageView setImage:img];
                
                [imageView setImageWithURL:[NSURL URLWithString:[self.passedImagesFromJSON[countimg-1] objectForKey:@"Image"]] placeholderImage:img];
                
                 NSLog(@"Image: %@",[self.passedImagesFromJSON[countimg-1] objectForKey:@"Image"]);
                [imageView setUserInteractionEnabled:YES];
            
                // put image on correct position
                CGRect rect = imageView.frame;
                rect.origin.x = currentX;
                rect.origin.y = currentY;
                imageView.frame = rect;
            
                // update currentX
                currentX += w ;
            
                
                [imageView setAlpha:0.3f];
                
                [self.main_scroll_view addSubview:imageView];
                
            
                [self.main_scroll_view addSubview:imageView];
                imageViewArray[countimg - 1] = imageView;
                
                countimg++;
            
            }
        
        currentX =0.0f;
        currentY += h;
        
    }
    
    countimg = 1;
    currentX = 0.0f;
    currentY = 0.0f;

    
    self.main_scroll_view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    
    
    [self.view addSubview:self.main_scroll_view]; 
    [self.view addSubview:self.vingette_view];
    [self.view addSubview:self.back_btn];
    //[self.view addSubview:Mag];
    
    NSLog(@"finished... setting up view and downloading images");
    
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    CGPoint location = [recognizer locationInView:[recognizer.view superview]];
    
    CGPoint locationInView = [self.main_scroll_view convertPoint:location fromView:self.view];
    
     //printf("touchedx: %f touchedy: %f\n", locationInView.x, locationInView.y);
    
    for (int b = 0; b < ((rows*numberOfImages) ); b++) {
        //printf("touchedx: %f touchedy: %f index: %i\n", imageViewArray[b].frame.origin.x, imageViewArray[b].frame.origin.y, b);
        
        if((locationInView.x >= imageViewArray[b].frame.origin.x) && (locationInView.x <= (imageViewArray[b].frame.origin.x + w)
                                                                        && (locationInView.y >= imageViewArray[b].frame.origin.y) && (locationInView.y <= (imageViewArray[b].frame.origin.y + h))))
        {
            //printf("touchedx: %f touchedy: %f index: %i\n", imageViewArray[b].frame.origin.x, imageViewArray[b].frame.origin.y, b);
            
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
            AFTFilmViewController *fvc = [[AFTFilmViewController alloc] init];
            fvc = [storyboard instantiateViewControllerWithIdentifier:@"FilmView"];
            fvc.selectedImage = imageViewArray[b].image;
            fvc.passedData = [self.passedImagesFromJSON objectAtIndex:b];
            [fvc setModalPresentationStyle:UIModalPresentationFullScreen];
            [self presentViewController:fvc animated:YES completion:nil];
            
            break;
        
        }
        
    }
    
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
