//
//  LoLRegionInfo.h
//  LoLAPI
//
//  Created by Troy Stump on 2/16/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import "LoLRegionIDEnum.h"


@interface LoLRegionInfo : NSObject

// properties
@property (readonly) LoLRegionID uid;
@property (readonly) NSString *name;
@property (readonly) NSString *value;


// methods
- (id)initWithRegion:(LoLRegionID)region;

@end