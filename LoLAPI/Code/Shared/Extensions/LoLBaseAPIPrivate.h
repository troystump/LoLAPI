//
//  LoLBaseAPIPrivate.h
//  LoLAPI
//
//  Created by Troy Stump on 2/17/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import <RestKit/RestKit.h>
#import "LoLBaseAPI.h"
#import "LoLRegionInfo.h"


@interface LoLBaseAPI ()

//properties
@property (nonatomic, strong) RKObjectManager *apiManager;
@property (nonatomic, strong) NSURL *hostURL;
@property (nonatomic, strong) NSString *apiPath;
@property (nonatomic, strong)NSURL *url;
@property (nonatomic, readwrite) NSString *relativePathToBaseURL;
@property (nonatomic, strong) LoLRegionInfo *selectedRegion;


// methods
-(NSURL*) createURLToAPI;

@end
