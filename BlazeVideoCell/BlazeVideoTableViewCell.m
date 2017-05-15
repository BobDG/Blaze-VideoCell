//
//  BlazeTableViewCell.m
//  Blaze
//
//  Created by Bob de Graaf on 21-01-16.
//  Copyright © 2016 GraafICT. All rights reserved.
//

#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

#import "YTPlayerView.h"
#import "BlazeVideoRow.h"
#import "BlazeVideoTableViewCell.h"

@interface BlazeVideoTableViewCell ()
{
    
}

@property(nonatomic,strong) YTPlayerView *youTubePlayerView;
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
    
    //Youtube
    if(row.youtubeID.length) {
        self.youTubePlayerView = nil;
        self.youTubePlayerView = [[YTPlayerView alloc] initWithFrame:self.videoPlayerView.bounds];
        self.youTubePlayerView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self.videoPlayerView addSubview:self.youTubePlayerView];
        
        NSMutableDictionary *playerVars = [[NSMutableDictionary alloc] initWithDictionary:@{@"playsinline" : @(TRUE)}];
        //Please note that Autoplay for Youtube is not working yet - https://github.com/youtube/youtube-ios-player-helper/issues/67
        if(row.videoAutoPlay) {
            playerVars[@"autoplay"] = @1;
        }
        [self.youTubePlayerView loadWithVideoId:row.youtubeID playerVars:playerVars];
        return;
    }
    
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

-(void)willDisappear
{
    [self pause];
}

-(void)pause
{
    if(self.playerViewController) {
        [self.playerViewController.player pause];
    }
    else if(self.youTubePlayerView) {
        [self.youTubePlayerView pauseVideo];
    }
}

-(void)awakeFromNib
{
    [super awakeFromNib];
}

@end



















































