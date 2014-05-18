//
//  LoLAPIConfig.m
//  LoLAPI
//
//  Created by Troy Stump on 2/12/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import "LoLAPIConfig.h"

@implementation LoLAPIConfig

- (id)initRouteToAPI:(NSString*)apiName forMajorVersion:(NSInteger)majorVersion andMinorVersion:(NSInteger)minorVersion withSupportForRegions:(NSDictionary*)regions
{
    if (self = [super init]) {
            _name = apiName;
            _version = [[LoLVersion alloc] initWithMajorVersion:majorVersion andMinorVersion:minorVersion];
            _regions = regions;
        }
    
    return self;
}

@end