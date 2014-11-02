//
//  LoLLeagueAPI.m
//  LoLAPI
//
//  Created by Troy Stump on 2/17/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import <RestKit/RestKit.h>
#import "LoLLeagueAPI.h"
#import "LoLBaseAPIPrivate.h"
// models
#import "LoLLeagueEntry.h"
#import "LoLMiniSeries.h"


@implementation LoLLeagueAPI

-(id) initWithConfig:(LoLAPIConfig*)apiConfig hostURL:(NSURL*)hostURL andPathToAPI:(NSString*)apiPath usingRegion:(LoLRegionID)selectedRegion
{
    if (self = [super initWithConfig:apiConfig hostURL:hostURL andPathToAPI:apiPath usingRegion:selectedRegion]) {
        [self setupDTOMappings];
    }
    
    return self;
}


- (void)getLeaguesDataForSummonersWithIDs:(NSArray*)summonerIDs usingAPIKey:(NSString*)apiKey success:(void(^)(NSDictionary *summonerLeagues))successBlock failure:(void(^)(NSError *error))failureBlock;
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/by-summoner/%@", self.relativePathToBaseURL, [summonerIDs componentsJoinedByString:@","]]
                                           parameters:@{
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];
}


- (void)getLeaguesEntryDataForSummonersWithIDs:(NSArray*)summonerIDs usingAPIKey:(NSString*)apiKey success:(void(^)(NSDictionary *summonerLeagueEntires))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/by-summoner/%@/entry", self.relativePathToBaseURL, [summonerIDs componentsJoinedByString:@","]]
                                           parameters:@{
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];    
}


- (void)getLeaguesDataForTeamsWithIDs:(NSArray*)teamIDs usingAPIKey:(NSString*)apiKey success:(void(^)(NSDictionary *teamLeagues))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/by-team/%@", self.relativePathToBaseURL, [teamIDs componentsJoinedByString:@","]]
                                           parameters:@{
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];
}


- (void)getLeaguesEntryDataForTeamsWithIDs:(NSArray*)teamIDs usingAPIKey:(NSString*)apiKey success:(void(^)(NSDictionary *teamLeagueEntries))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/by-team/%@/entry", self.relativePathToBaseURL, [teamIDs componentsJoinedByString:@","]]
                                           parameters:@{
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];
}


- (void)getChallengerTierLeague:(LoLChallengerTierLeague)challengerTierLeague usingAPIKey:(NSString*)apiKey success:(void(^)(LoLLeague *challengerTierLeague))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/challenger", self.relativePathToBaseURL]
                                           parameters:@{
                                                        @"type": [LoLChallengerTierLeagueHelper challengerTierLeagueAsString:challengerTierLeague],
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];
}


#pragma Mark - Private Helpers
- (void)setupDTOMappings
{
    [self.apiManager addResponseDescriptorsFromArray:[self loadLeagueDTOMapping]];
}


- (NSArray*)loadLeagueDTOMapping
{
    RKObjectMapping *leagueMapping;
    RKObjectMapping *leagueEntryMapping;
    RKObjectMapping *miniSeriesMapping;
    RKDynamicMapping *dynamicLeagueMapping;
    NSMutableArray *leaguePropertyNames = [LoLLeague getAllPropertyNames];
    NSMutableArray *leagueEntryPropertyNames = [LoLLeagueEntry getAllPropertyNames];
    
    
    // remove any relationship mapping attributes to avoid "duplicate mapping" error
    [leaguePropertyNames removeObject:@"entries"];
    [leagueEntryPropertyNames removeObject:@"miniSeries"];
    
    // create mapping for League DTO
    leagueMapping = [RKObjectMapping mappingForClass:[LoLLeague class]];
    [leagueMapping addAttributeMappingsFromArray: leaguePropertyNames];
    
    // create mapping for LeagueEntry DTO
    leagueEntryMapping = [RKObjectMapping mappingForClass:[LoLLeagueEntry class]];
    [leagueEntryMapping addAttributeMappingsFromArray: leagueEntryPropertyNames];
    
    // create mapping for MiniSeries DTO
    miniSeriesMapping = [RKObjectMapping mappingForClass:[LoLMiniSeries class]];
    [miniSeriesMapping addAttributeMappingsFromArray:[LoLMiniSeries getAllPropertyNames]];
    
    // create relationship mapping to link the LeagueEntry DTO to the League DTO
    [leagueMapping addRelationshipMappingWithSourceKeyPath:@"entries" mapping:leagueEntryMapping];
    
    // create relationship mapping to link the MiniSeries DTO to the LeagueEntry DTO
    [leagueEntryMapping addRelationshipMappingWithSourceKeyPath:@"miniSeries" mapping:miniSeriesMapping];
    
    // LoL api uses the summoner ids as keys into a dictionary of summoner team entries
    // since these keys are dynamic, we need to use dynamic mapping
    dynamicLeagueMapping = [[RKDynamicMapping alloc] init];
    [dynamicLeagueMapping setObjectMappingForRepresentationBlock:^RKObjectMapping*(id representation)
     {
         NSArray* summonerIDs = [representation allKeys];
         RKObjectMapping *summonerIDAsKeyMapping = [RKObjectMapping mappingForClass:[NSMutableDictionary class]];
         
         
         for (NSString *summonerID in summonerIDs) {
             [summonerIDAsKeyMapping addRelationshipMappingWithSourceKeyPath:summonerID mapping:leagueMapping];
         }
         
         return summonerIDAsKeyMapping;
     }];
    
    return @[
             [RKResponseDescriptor responseDescriptorWithMapping:dynamicLeagueMapping
                                                          method:RKRequestMethodGET
                                                     pathPattern:[NSString stringWithFormat:@"%@/by-summoner/:summonerIds", self.relativePathToBaseURL]
                                                         keyPath:nil
                                                     statusCodes:nil],
             [RKResponseDescriptor responseDescriptorWithMapping:dynamicLeagueMapping
                                                          method:RKRequestMethodGET
                                                     pathPattern:[NSString stringWithFormat:@"%@/by-summoner/:summonerIds/entry", self.relativePathToBaseURL]
                                                         keyPath:nil
                                                     statusCodes:nil],
             [RKResponseDescriptor responseDescriptorWithMapping:dynamicLeagueMapping
                                                          method:RKRequestMethodGET
                                                     pathPattern:[NSString stringWithFormat:@"%@/by-team/:teamIds", self.relativePathToBaseURL]
                                                         keyPath:nil
                                                     statusCodes:nil],
             [RKResponseDescriptor responseDescriptorWithMapping:dynamicLeagueMapping
                                                          method:RKRequestMethodGET
                                                     pathPattern:[NSString stringWithFormat:@"%@/by-team/:teamIds/entry", self.relativePathToBaseURL]
                                                         keyPath:nil
                                                     statusCodes:nil],
             [RKResponseDescriptor responseDescriptorWithMapping:leagueMapping
                                                          method:RKRequestMethodGET
                                                     pathPattern:[NSString stringWithFormat:@"%@/challenger", self.relativePathToBaseURL]
                                                         keyPath:nil
                                                     statusCodes:nil]
             ];
}

@end