//
//  ImageViewController.m
//  Demo
//
//  Created by Yeshwanth julapalli on 12/25/16.
//  Copyright © 2016 Yeshwanth julapalli. All rights reserved.
//


#import "ImageViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>


@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       // Do any additional setup after loading the view.
     [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(void)viewDidAppear:(BOOL)animated{
    [_activityIndicator startAnimating];
    [_image sd_setImageWithURL:[NSURL URLWithString:_imageUrl]
              placeholderImage:[UIImage imageNamed:@"my_profile_profile_default_image"]
                     completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType,NSURL *imgUrl) {
                         [_activityIndicator stopAnimating];
                     }];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)back:(id)sender {
[self dismissViewControllerAnimated:YES completion:nil];
}
@end
