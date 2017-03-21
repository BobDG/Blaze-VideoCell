//
//  BlazeRow.h
//  Blaze
//
//  Created by Bob de Graaf on 16-04-15.
//  Copyright (c) 2015 GraafICT. All rights reserved.
//

@import Blaze;

@interface BlazeVideoRow : BlazeRow
{
    
}

@property(nonatomic) bool videoAutoPlay;
@property(nonatomic) bool videoDisableControls;

@property(nonatomic,strong) NSURL *videoURL;
@property(nonatomic,strong) NSString *youtubeID;

@end
