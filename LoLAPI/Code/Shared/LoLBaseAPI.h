//
//  LoLBaseAPI.h
//  LoLAPI
//
//  Created by Troy Stump on 2/11/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import "LoLAPIConfig.h"
#import "LoLRegionHelper.h"


@interface LoLBaseAPI : NSObject
// properties
@property (readonly) LoLAPIConfig *apiConfig;


// methods
- (id)initWithConfig:(LoLAPIConfig*)apiConfig hostURL:(NSURL*)hostURL andPathToAPI:(NSString*)apiPath usingRegion:(LoLRegionID)selectedRegion;
@end