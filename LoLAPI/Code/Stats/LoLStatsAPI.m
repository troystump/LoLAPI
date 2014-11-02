//
//  LoLStatsAPI.m
//  LoLAPI
//
//  Created by Troy Stump on 2/9/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import <RestKit/RestKit.h>
#import "LoLMillisecondsSince1970ToDateValueTransformer.h"
#import "LoLStatsAPI.h"
#import "LoLBaseAPIPrivate.h"
// dtos
#import "LoLAggregatedStats.h"
#import "LoLChampionStats.h"
#import "LoLPlayerStatsSummary.h"


@implementation LoLStatsAPI

- (id)initWithConfig:(LoLAPIConfig*)apiConfig hostURL:(NSURL*)hostURL andPathToAPI:(NSString*)apiPath usingRegion:(LoLRegionID)selectedRegion
{
    if (self = [super initWithConfig:apiConfig hostURL:hostURL andPathToAPI:apiPath usingRegion:selectedRegion]) {
        [self setupDTOMappings];
    }
    
    return self;
}

- (void)getRankedStatsForSummonerWithID:(NSInteger)summonerID fromSeason:(LoLSeason)season usingAPIKey:(NSString*)apiKey success:(void(^)(LoLRankedStats *rankedStats))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/by-summoner/%ld/ranked", self.relativePathToBaseURL, (long)summonerID]
                                           parameters:@{
                                                        @"season": [LoLSeasonHelper seasonAsString:season],
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];
}


- (void)getStatsSummariesForSummonerWithID:(NSInteger)summonerID fromSeason:(LoLSeason)season usingAPIKey:(NSString*)apiKey success:(void(^)(LoLPlayerStatsSummaryList *statsSummaries))successBlock failure:(void(^)(NSError *error))failureBlock
{    
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/by-summoner/%ld/summary", self.relativePathToBaseURL, (long)summonerID]
                                           parameters:@{
                                                        @"season": [LoLSeasonHelper seasonAsString:season],
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
    RKObjectMapping *rankedStatsMapping;
    RKObjectMapping *championStatsMapping;
    RKObjectMapping *aggregatedStatsMapping;
    RKObjectMapping *playerStatsSummaryListMapping;
    RKObjectMapping *playerStatsSummaryMapping;
    NSMutableArray *rankedStatsPropertyNames = [LoLRankedStats getAllPropertyNames];
    NSMutableArray *championStatsPropertyNames = [LoLChampionStats getAllPropertyNames];
    NSMutableArray *playerStatsSummaryListPropertyNames = [LoLPlayerStatsSummaryList getAllPropertyNames];
    NSMutableArray *playerStatsSummaryPropertyNames = [LoLPlayerStatsSummary getAllPropertyNames];

    
    // remove any relationship mapping attributes to avoid "duplicate mapping" error
    [rankedStatsPropertyNames removeObject:@"champions"];
    [championStatsPropertyNames removeObject:@"stats"];
    [playerStatsSummaryListPropertyNames removeObject:@"playerStatSummaries"];
    [playerStatsSummaryPropertyNames removeObject:@"aggregatedStats"];
    
    // create mapping for RankedStats DTO
    rankedStatsMapping = [RKObjectMapping mappingForClass:[LoLRankedStats class]];
    [rankedStatsMapping addAttributeMappingsFromArray:rankedStatsPropertyNames];
    
    // create mapping for ChampionStats DTO
    championStatsMapping = [RKObjectMapping mappingForClass:[LoLChampionStats class]];
    [championStatsMapping addAttributeMappingsFromArray:championStatsPropertyNames];
    
    // create mapping for AggregatedStats DTO
    aggregatedStatsMapping = [RKObjectMapping mappingForClass:[LoLAggregatedStats class]];
    [aggregatedStatsMapping addAttributeMappingsFromArray:[LoLAggregatedStats getAllPropertyNames]];
    
    // create mapping for PlayerStatsSummaryList DTO
    playerStatsSummaryListMapping = [RKObjectMapping mappingForClass:[LoLPlayerStatsSummaryList class]];
    [playerStatsSummaryListMapping addAttributeMappingsFromArray:playerStatsSummaryListPropertyNames];
    
    // create mapping for PlayerStatsSummary DTO
    playerStatsSummaryMapping = [RKObjectMapping mappingForClass:[LoLPlayerStatsSummary class]];
    [playerStatsSummaryMapping addAttributeMappingsFromArray:playerStatsSummaryPropertyNames];
    
    // create relationship mapping to link the ChampionStats DTO to the RankedStats DTO
    [rankedStatsMapping addRelationshipMappingWithSourceKeyPath:@"champions" mapping:championStatsMapping];
    
    // create relationship mapping to link the AggregatedStats DTO to the ChampionStats DTO
    [championStatsMapping addRelationshipMappingWithSourceKeyPath:@"stats" mapping:aggregatedStatsMapping];
    
    // create relationship mapping to link the PlayerStatsSummary DTO to the PlayerStatsSummaryList DTO
    [playerStatsSummaryListMapping addRelationshipMappingWithSourceKeyPath:@"playerStatSummaries" mapping:playerStatsSummaryMapping];
    
    // create relationship mapping to link the AggregatedStats DTO to the PlayerStatsSummary DTO
    [playerStatsSummaryMapping addRelationshipMappingWithSourceKeyPath:@"aggregatedStats" mapping:aggregatedStatsMapping];

    return @[
             [RKResponseDescriptor responseDescriptorWithMapping:rankedStatsMapping
                                                          method:RKRequestMethodGET
                                                     pathPattern:[NSString stringWithFormat:@"%@/by-summoner/:summonerId/ranked", self.relativePathToBaseURL]
                                                         keyPath:nil
                                                     statusCodes:nil],
             [RKResponseDescriptor responseDescriptorWithMapping:playerStatsSummaryListMapping
                                                          method:RKRequestMethodGET
                                                     pathPattern:[NSString stringWithFormat:@"%@/by-summoner/:summonerId/summary", self.relativePathToBaseURL]
                                                         keyPath:nil
                                                     statusCodes:nil]
             ];
}

@end