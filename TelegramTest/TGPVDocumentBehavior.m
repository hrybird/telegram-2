//
//  TGPVDocumentBehavior.m
//  Telegram
//
//  Created by keepcoder on 17.02.15.
//  Copyright (c) 2015 keepcoder. All rights reserved.
//

#import "TGPVDocumentBehavior.h"

@implementation TGPVDocumentBehavior


-(void)load:(long)max_id next:(BOOL)next limit:(int)limit callback:(void (^)(NSArray *))callback {
    
    if(callback)
        callback(@[]);
    
    
}

-(void)clear {
    
}

-(NSArray *)convertObjects:(NSArray *)list {
    NSMutableArray *converted = [[NSMutableArray alloc] init];
    
    [list enumerateObjectsUsingBlock:^(PreviewObject *obj, NSUInteger idx, BOOL *stop) {
        
        
        if([obj.media isKindOfClass:[TL_photoSize class]]) {
            
            TGPVImageObject *imgObj = [[TGPVImageObject alloc] initWithLocation:[(TL_photoSize *)obj.media location] placeHolder:obj.reservedObject sourceId:_user.n_id size:0];
            
            imgObj.imageSize = NSMakeSize([(TL_photoSize *)obj.media w], [(TL_photoSize *)obj.media h]);
            
            TGPhotoViewerItem *item = [[TGPhotoViewerItem alloc] initWithImageObject:imgObj previewObject:obj];
            
            [converted addObject:item];
        }
        
    }];
    
    return converted;
}

-(void)removeItems:(NSArray *)items {
    
}

-(void)addItems {
    
}

-(int)totalCount {
    return 1;
}

-(BOOL)isReversedContentView {
    return NO;
}



@end
