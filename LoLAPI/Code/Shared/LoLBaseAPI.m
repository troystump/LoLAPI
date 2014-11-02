//
//  LoLBaseAPI.m
//  LoLAPI
//
//  Created by Troy Stump on 2/11/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import "LoLBaseAPI.h"
#import "LoLBaseAPIPrivate.h"


@implementation LoLBaseAPI

- (id)initWithConfig:(LoLAPIConfig*)apiConfig hostURL:(NSURL*)hostURL andPathToAPI:(NSString*)apiPath usingRegion:(LoLRegionID)selectedRegion
{
    if (self = [super init]) {
        _apiConfig = apiConfig;
        _hostURL = hostURL;
        _apiPath = apiPath;
        _selectedRegion = [[LoLRegionInfo alloc] initWithRegion:selectedRegion];
        _url = [self createURLToAPI];
        _relativePathToBaseURL = [self createPathToAPIRelativeToHostURL];
        _apiManager = [RKObjectManager managerWithBaseURL:_url.baseURL];
    }

    return self;
}


// works for all except lol-static-data api. we will override in that class, so leave the generic implementation here
- (NSURL*)createURLToAPI
{
    return [NSURL URLWithString:[self createPathToAPIRelativeToHostURL] relativeToURL:self.hostURL];
}


- (NSString*)createPathToAPIRelativeToHostURL
{
    NSString *resultPath = @"";
    
    
    if (self.apiPath.length && self.selectedRegion.value) {
        resultPath = [NSString stringWithFormat:@"%@/%@/v%@/%@", self.apiPath, self.selectedRegion.value, [_apiConfig.version getVersion], _apiConfig.name];
    }
    
    return resultPath;
}


- (NSString*)urlSafeRelativePathWithTrailingSlash
{
    return self.relativePathToBaseURL.length ? [NSString stringWithFormat:@"%@/", self.relativePathToBaseURL] : @"";
}

@end