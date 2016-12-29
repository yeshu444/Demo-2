//
//  ViewController.m
//  Demo
//
//  Created by Yeshwanth julapalli on 12/25/16.
//  Copyright © 2016 Yeshwanth julapalli. All rights reserved.
//



#import "ViewController.h"
#import "ImageTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "ImageViewController.h"


@interface ViewController ()
{
    NSMutableArray *imageNtextArray;
    NSString *name;
    NSArray *images;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Sample images";
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
       [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{
     imageNtextArray = [[NSMutableArray alloc]init];
    images = @[@"https://www.kandooadventures.com/assets/Uploads/amazon-rainforest.jpg",
               @"https://upload.wikimedia.org/wikipedia/commons/4/4b/Amazon_Manaus_forest.jpg",
               @"https://www.kandooadventures.com/assets/Uploads/amazon-rainforest.jpg",
               @"https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Amazon_rainforest.jpg/256px-Amazon_rainforest.jpg",
               @"https://upload.wikimedia.org/wikipedia/commons/4/4b/Amazon_Manaus_forest.jpg",
               @"https://www.kandooadventures.com/assets/Uploads/amazon-rainforest.jpg",
               @"https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Amazon_rainforest.jpg/256px-Amazon_rainforest.jpg",
               @"https://upload.wikimedia.org/wikipedia/commons/4/4b/Amazon_Manaus_forest.jpg",
               @"https://www.kandooadventures.com/assets/Uploads/amazon-rainforest.jpg"
               ];
    
    for (int i = 0; i < images.count; i++) {
        name = [NSString stringWithFormat:@"Name %d",i];
        NSDictionary *dict = @{
                               @"name":name,
                               @"image":images[i]
                               };
        [imageNtextArray addObject:dict];
    }
    [self.tableview reloadData];
}

#pragma mark UITableView Delegate -

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

#pragma mark UITableViewDelegate Methods


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return imageNtextArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier;
    
    cellIdentifier = @"images";
    ImageTableViewCell *detailsCell= (ImageTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(detailsCell == nil)
    {
        detailsCell =[[ImageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
   
    detailsCell.text.text = imageNtextArray[indexPath.row][@"name"];
    NSString *strImageUrl =imageNtextArray[indexPath.row][@"image"];
    [detailsCell.activityIndicator startAnimating];
    
    [detailsCell.image sd_setImageWithURL:[NSURL URLWithString:strImageUrl]
                         placeholderImage:[UIImage imageNamed:@"my_profile_profile_default_image"]
                                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                    [detailsCell.activityIndicator stopAnimating];
                                }];
    return detailsCell;
}


#pragma mark - UITableViewDataSource Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *mainstoryboard;
    
    if (!mainstoryboard) {
        mainstoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    }
    ImageViewController  *imageVC = [mainstoryboard instantiateViewControllerWithIdentifier:@"imageVC"];
    imageVC.imageUrl = imageNtextArray[indexPath.row][@"image"];
    UINavigationController *navBar=[[UINavigationController alloc]initWithRootViewController:imageVC];
    [self presentViewController:navBar animated:YES completion:nil];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  
}


@end
