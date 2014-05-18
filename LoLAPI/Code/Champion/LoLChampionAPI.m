//
//  LoLChampionAPI.m
//  LoLAPI
//
//  Created by Troy Stump on 2/9/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import <Restkit/Restkit.h>
#import "LoLChampionAPI.h"
#import "LoLBaseAPIPrivate.h"
// dtos
#import "LoLChampionList.h"


@implementation LoLChampionAPI

- (id)initWithConfig:(LoLAPIConfig*)apiConfig hostURL:(NSURL*)hostURL andPathToAPI:(NSString*)apiPath usingRegion:(LoLRegionID)selectedRegion
{
    if (self = [super initWithConfig:apiConfig hostURL:hostURL andPathToAPI:apiPath usingRegion:selectedRegion]) {
        [self setupDTOMappings];
    }
    
    return self;
}


- (void)getChampionsWithFreeToPlayStatusOnly:(BOOL)isFreeToPlay usingAPIKey:(NSString*)apiKey success:(void(^)(NSArray *champions))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock(result.array);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@", self.relativePathToBaseURL]
                                           parameters:@{
                                                        @"freeToPlay": isFreeToPlay ? @"true" : @"false",
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];
}


- (void)getChampionWithID:(NSInteger)championID usingAPIKey:(NSString*)apiKey success:(void(^)(LoLChampion *champion))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/%ld", self.relativePathToBaseURL, (long)championID]
                                           parameters:@{
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];
}



#pragma mark - Private Helpers

- (void)setupDTOMappings
{
    [self.apiManager addResponseDescriptorsFromArray:[self loadChampionDTOMapping]];
}


- (NSArray*)loadChampionDTOMapping
{
    RKObjectMapping *championListMapping;
    RKObjectMapping *championMapping;
    NSMutableArray *championListProperties = [LoLChampionList getAllPropertyNames];
    
    
    [championListProperties removeObject:@"champions"];
    
    // create mapping for ChampionList DTO
    championListMapping = [RKObjectMapping mappingForClass:[LoLChampionList class]];
    [championListMapping addAttributeMappingsFromArray:championListProperties];
    
    // create mapping for Champion DTO
    championMapping = [RKObjectMapping mappingForClass:[LoLChampion class]];
    [championMapping addAttributeMappingsFromArray:[LoLChampion getAllPropertyNames]];
    
    // create relationship mapping to link the ChampionList DTO to the Champion DTO
    [championListMapping addRelationshipMappingWithSourceKeyPath:@"champions" mapping:championMapping];
    
    return @[
             [RKResponseDescriptor responseDescriptorWithMapping:championMapping
                                                          method:RKRequestMethodGET
                                                     pathPattern:[NSString stringWithFormat:@"%@/:championId", self.relativePathToBaseURL]
                                                         keyPath:nil
                                                     statusCodes:nil],
             [RKResponseDescriptor responseDescriptorWithMapping:championListMapping
                                                                      method:RKRequestMethodGET
                                                                 pathPattern:[NSString stringWithFormat:@"%@", self.relativePathToBaseURL]
                                                                     keyPath:nil
                                                                 statusCodes:nil]
             ];
}

@end