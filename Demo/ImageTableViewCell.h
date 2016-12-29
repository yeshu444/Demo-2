//
//  ImageTableViewCell.h
//  Demo
//
//  Created by Yeshwanth julapalli on 12/25/16.
//  Copyright © 2016 Yeshwanth julapalli. All rights reserved.
//



#import <UIKit/UIKit.h>

@interface ImageTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *text;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@end
