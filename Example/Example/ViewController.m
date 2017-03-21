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

#define XIBTextTableViewCell    @"TextTableViewCell"
#define XIBVideoTableViewCell   @"VideoTableViewCell"

@interface ViewController ()
{
    
}

@end

@implementation ViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //Testing for disappearing - stop video's
    self.notifyCellsWhenDisappearing = TRUE;
    
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
    
    if(self.navigationController.viewControllers.count==1) {
        BlazeRow *row = [BlazeRow rowWithXibName:XIBTextTableViewCell];
        [row setCellTapped:^{
            ViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
            [self.navigationController pushViewController:vc animated:TRUE];
        }];
        [section addRow:row];
    }
    else {        
        //Video-link
        {
            BlazeVideoRow *videoRow = [BlazeVideoRow rowWithXibName:XIBVideoTableViewCell];
            videoRow.videoURL = [NSURL URLWithString:@"http://a1408.g.akamai.net/5/1408/1388/2005110405/1a1a1ad948be278cff2d96046ad90768d848b41947aa1986/sample_mpeg4.mp4"];
            videoRow.videoDisableControls = FALSE;
            videoRow.videoAutoPlay = TRUE;
            [section addRow:videoRow];
        }
        
        //Youtube Video
        {
            BlazeVideoRow *videoRow = [BlazeVideoRow rowWithXibName:XIBVideoTableViewCell];
            videoRow.youtubeID = @"ysGTmXOTUng";
            videoRow.videoAutoPlay = TRUE;
            [section addRow:videoRow];
        }
    }    
    
    //Reload
    [self.tableView reloadData];
}

@end










