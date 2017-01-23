//
//  ViewController.m
//  Example
//
//  Created by Bob de Graaf on 05-01-17.
//  Copyright © 2017 GraafICT. All rights reserved.
//


#import "BDGMacros.h"
#import "BlazeVideoRow.h"
#import "ViewController.h"

#define XIBVideoCell             @"VideoTableViewCell"

@interface ViewController ()
{
    
}

@property(nonatomic,strong) NSString *videoURLString;

@end

@implementation ViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //Video url
    self.videoURLString = @"http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_1mb.mp4";
    
    //Load content
    [self loadTableContent];
}

-(void)loadTableContent
{
    //Clear
    [self.tableArray removeAllObjects];
    
    //Section
    BlazeSection *section = [BlazeSection new];
    [self.tableArray addObject:section];
    
    //Row Label
    BlazeVideoRow *videoRow = [BlazeVideoRow rowWithXibName:XIBVideoCell];
    videoRow.videoURL = [NSURL URLWithString:self.videoURLString];
    videoRow.videoDisableControls = FALSE;
    videoRow.videoAutoPlay = TRUE;
    [section addRow:videoRow];
    
    //Reload
    [self.tableView reloadData];
}

@end










