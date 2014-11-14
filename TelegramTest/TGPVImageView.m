//
//  TGPVImageView.m
//  Telegram
//
//  Created by keepcoder on 11.11.14.
//  Copyright (c) 2014 keepcoder. All rights reserved.
//

#import "TGPVImageView.h"
#import "TMLoaderView.h"
@interface TGPVImageView ()
@property (nonatomic,strong) TMLoaderView *loader;
@end

@implementation TGPVImageView


-(id)initWithFrame:(NSRect)frameRect {
    if(self = [super initWithFrame:frameRect]) {
        self.loader = [[TMLoaderView alloc] initWithFrame:NSMakeRect(0, 0, 50, 50)];
        
        self.loader.style = TMCircularProgressDarkStyle;
        [self.loader setState:TMLoaderViewStateDownloading];
     
    }
    
    return self;
}

-(void)setObject:(TGImageObject *)object {
    [super setObject:object];
}

-(void)setImage:(NSImage *)image {
    [super setImage:image];

    if(self.image == nil) {
        self.backgroundColor = NSColorFromRGBWithAlpha(0x000000, 0.8);
        [self.loader setCenterByView:self];
        [self.loader setCurrentProgress:self.object.downloadItem.progress];
        [self addSubview:self.loader];
    } else {
        [self.loader removeFromSuperview];
        self.backgroundColor = nil;
    }

}

-(void)setFrameSize:(NSSize)newSize {
    [super setFrameSize:newSize];
    [self.loader setCenterByView:self];
}


-(void)didUpdatedProgress:(float)progress {
    [self.loader setProgress:progress animated:YES];
}

@end