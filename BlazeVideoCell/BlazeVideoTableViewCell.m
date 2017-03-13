//
//  BlazeTableViewCell.m
//  Blaze
//
//  Created by Bob de Graaf on 21-01-16.
//  Copyright © 2016 GraafICT. All rights reserved.
//

#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

#import "BlazeVideoRow.h"
#import "BlazeVideoTableViewCell.h"

@interface BlazeVideoTableViewCell ()
{
    
}

@property(nonatomic,strong) AVPlayerViewController *playerViewController;

@end

@implementation BlazeVideoTableViewCell

#pragma mark - Update

-(void)updateCell
{
    //Get html row
    BlazeVideoRow *row = (BlazeVideoRow *)self.row;
    
    //Clear previous
    [self.videoPlayerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //Setup player
    if(!self.playerViewController) {
        self.playerViewController = [AVPlayerViewController new];
    }
    
    //Create asset/item
    AVURLAsset *asset = [AVURLAsset assetWithURL:row.videoURL];
    AVPlayerItem *item = [AVPlayerItem playerItemWithAsset:asset];
    [self.playerViewController.view setFrame:self.videoPlayerView.bounds];
    self.playerViewController.showsPlaybackControls = !row.videoDisableControls;
    
    //Create player
    AVPlayer *player = [[AVPlayer alloc] initWithPlayerItem:item];
    
    //Assign player
    self.playerViewController.player = player;
    
    //Add to view
    [self.videoPlayerView addSubview:self.playerViewController.view];
    
    //Autoplay
    if(row.videoAutoPlay) {
        [player play];
    }
}

-(void)pause
{
    [self.playerViewController.player pause];
}

-(void)awakeFromNib
{
    [super awakeFromNib];
}

@end



















































