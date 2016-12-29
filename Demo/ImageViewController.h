//
//  ImageViewController.h
//  Demo
//
//  Created by Yeshwanth julapalli on 12/25/16.
//  Copyright © 2016 Yeshwanth julapalli. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) NSString *imageUrl;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

- (IBAction)back:(id)sender;
@end
