//
//  LoLRegionHelper.h
//  LoLAPI
//
//  Created by Troy Stump on 2/11/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import "LoLRegionIDEnum.h"
#import "LoLRegionInfo.h"


@interface LoLRegionHelper : NSObject

// properties
/* empty */

// methods
+ (NSDictionary*)getRegions;
+ (LoLRegionInfo*)getRegionWithID:(LoLRegionID)regionID;
+ (NSDictionary*)getRegionsWithIDs:(NSArray*)regionIDs;
+ (NSURL*)hostURLWithRegionID:(LoLRegionID)regionID;

@end