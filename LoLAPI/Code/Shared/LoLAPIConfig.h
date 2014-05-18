//
//  LoLAPIConfig.h
//  LoLAPI
//
//  Created by Troy Stump on 2/12/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#include "LoLVersion.h"


@interface LoLAPIConfig : NSObject

// properties
@property (readonly) NSString *name;
@property (readonly) LoLVersion *version;
@property (readonly) NSDictionary *regions;


// methods
- (id)initRouteToAPI:(NSString*)apiName forMajorVersion:(NSInteger)majorVersion andMinorVersion:(NSInteger)minorVersion withSupportForRegions:(NSDictionary*)regions;

@end