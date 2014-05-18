//
//  SummonerAPI.m
//  Portals
//
//  Created by Troy Stump on 2/9/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import <RestKit/RestKit.h>
#import "LoLSummonerAPI.h"
#import "LoLBaseAPIPrivate.h"
// dtos
#import "LoLMastery.h"
#import "LoLMasteryPage.h"
#import "LoLMasteryPages.h"
#import "LoLRunePage.h"
#import "LoLRunePages.h"
#import "LoLRuneSlot.h"
#import "LoLSummoner.h"


@implementation LoLSummonerAPI

- (id)initWithConfig:(LoLAPIConfig*)apiConfig hostURL:(NSURL*)hostURL andPathToAPI:(NSString*)apiPath usingRegion:(LoLRegionID)selectedRegion
{
    if (self = [super initWithConfig:apiConfig hostURL:hostURL andPathToAPI:apiPath usingRegion:selectedRegion]) {
        [self setupDTOMappings];
    }
    
    return self;
}


- (void)getSummonersWithNames:(NSArray*)summonerNames usingAPIKey:(NSString*)apiKey success:(void(^)(NSDictionary *summoners))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/by-name/%@", self.relativePathToBaseURL, [summonerNames componentsJoinedByString:@","]]
                                           parameters:@{
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];
}


- (void)getSummonersWithIDs:(NSArray*)summonerIDs usingAPIKey:(NSString*)apiKey success:(void(^)(NSDictionary *summoners))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/%@", self.relativePathToBaseURL, [summonerIDs componentsJoinedByString:@","]]
                                           parameters:@{
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];
}


- (void)getMasteryPagesForSummonersWithIDs:(NSArray*)summonerIDs usingAPIKey:(NSString*)apiKey success:(void(^)(NSDictionary *masteryPages))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/%@/masteries", self.relativePathToBaseURL, [summonerIDs componentsJoinedByString:@","]]
                                           parameters:@{
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];
}


- (void)getSummonerNamesWithIDs:(NSArray*)summonerIDs usingAPIKey:(NSString*)apiKey success:(void(^)(NSDictionary *summonerNames))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(AFHTTPRequestOperation*, id) = ^(AFHTTPRequestOperation *operation, id result) {
        successBlock(result);
    };
    void (^failure)(AFHTTPRequestOperation *operation, NSError *error) = ^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager.HTTPClient getPath:[NSString stringWithFormat:@"%@/%@/name", self.relativePathToBaseURL, [summonerIDs componentsJoinedByString:@","]]
                                           parameters:@{
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];
}


- (void)getRunePagesForSummonersWithIDs:(NSArray*)summonerIDs usingAPIKey:(NSString*)apiKey success:(void(^)(NSDictionary *runePages))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/%@/runes", self.relativePathToBaseURL, [summonerIDs componentsJoinedByString:@","]]
                                           parameters:@{
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];
}



#pragma Mark - Private Helpers

- (void)setupDTOMappings
{
    [self.apiManager addResponseDescriptorsFromArray:[self loadSummonerDTOMapping]];
    
    [self.apiManager addResponseDescriptor:[self loadMasteryPagesDTOMapping]];
    
    [self.apiManager addResponseDescriptor:[self loadRunePagesDTOMapping]];
}


- (NSArray*)loadSummonerDTOMapping
{
    RKObjectMapping *summonerMapping;
    RKDynamicMapping *dynamicSummonerMapping;

    
    // create mapping for Summoner
    summonerMapping = [RKObjectMapping mappingForClass:[LoLSummoner class]];
    [summonerMapping addAttributeMappingsFromArray:[LoLSummoner getAllPropertyNames]];
    
    // LoL api uses the summoner IDs as keys into a dictionary of summoners
    // since these keys are dynamic, we need to dynamically map each of these
    // summoner keys onto a summoner object.
    dynamicSummonerMapping = [[RKDynamicMapping alloc] init];
    [dynamicSummonerMapping setObjectMappingForRepresentationBlock:^RKObjectMapping*(id representation)
     {
         NSArray* summonerIDs = [representation allKeys];
         RKObjectMapping *summonerIDAsKeyMapping = [RKObjectMapping mappingForClass:[NSMutableDictionary class]];
         
         
         for (NSNumber *summonerID in summonerIDs)
         {
             [summonerIDAsKeyMapping addRelationshipMappingWithSourceKeyPath:[NSString stringWithFormat:@"%@", summonerID] mapping:summonerMapping];
         }
         
         return summonerIDAsKeyMapping;
     }];
    
    return @[
             [RKResponseDescriptor responseDescriptorWithMapping:dynamicSummonerMapping
                                                                      method:RKRequestMethodGET
                                                                 pathPattern:[NSString stringWithFormat:@"%@/:summonerIds", self.relativePathToBaseURL]
                                                                     keyPath:nil
                                                                 statusCodes:nil],
             [RKResponseDescriptor responseDescriptorWithMapping:dynamicSummonerMapping
                                                          method:RKRequestMethodGET
                                                     pathPattern:[NSString stringWithFormat:@"%@/by-name/:summonerNames", self.relativePathToBaseURL]
                                                         keyPath:nil
                                                     statusCodes:nil]
             ];
}


- (RKResponseDescriptor*)loadMasteryPagesDTOMapping
{
    RKObjectMapping *masteryPagesMapping;
    RKObjectMapping *masteryPageMapping;
    RKObjectMapping *masteryMapping;
    NSMutableArray *masteryPagesPropertyNames = [LoLMasteryPages getAllPropertyNames];
    NSMutableArray *masteryPagePropertyNames = [LoLMasteryPage getAllPropertyNames];
    RKResponseDescriptor *responseDescriptor;
    
    
    // remove any relationship mapping attributes to avoid "duplicate mapping" error
    [masteryPagesPropertyNames removeObject:@"pages"];
    [masteryPagePropertyNames removeObject:@"masteries"];
    
    // create mapping for MasteryPages DTO
    masteryPagesMapping = [RKObjectMapping mappingForClass:[LoLMasteryPages class]];
    [masteryPagesMapping addAttributeMappingsFromArray:masteryPagesPropertyNames];
    
    // create mapping for MasteryPage DTO
    masteryPageMapping = [RKObjectMapping mappingForClass:[LoLMasteryPage class]];
    [masteryPageMapping addAttributeMappingsFromArray:masteryPagePropertyNames];

    // create mapping for a Mastery DTO
    masteryMapping = [RKObjectMapping mappingForClass:[LoLMastery class]];
    [masteryMapping addAttributeMappingsFromArray:[LoLMastery getAllPropertyNames]];
    
    // create relationship mapping to link the MasteryPage DTO to the MasteryPages DTO
    [masteryPagesMapping addRelationshipMappingWithSourceKeyPath: @"pages" mapping:masteryPageMapping];
    
    // create relationship mapping to link the Mastery DTO to the MasteryPage DTO
    [masteryPageMapping addRelationshipMappingWithSourceKeyPath: @"masteries" mapping:masteryMapping];

    // LoL api uses the summoner IDs as keys into a dictionary of summoners
    // since these keys are dynamic, we need to dynamically map each of these
    // summoner keys onto a summoner object.
    RKDynamicMapping* dynamicSummonerMapping = [RKDynamicMapping new];
    [dynamicSummonerMapping setObjectMappingForRepresentationBlock:^RKObjectMapping *(id representation)
     {
         NSArray* summonerIDs = [representation allKeys];
         RKObjectMapping *summonerIDAsKeyMapping = [RKObjectMapping mappingForClass:[NSMutableDictionary class]];
         
         
         for (NSNumber *summonerID in summonerIDs)
         {
             [summonerIDAsKeyMapping addRelationshipMappingWithSourceKeyPath:[NSString stringWithFormat:@"%@", summonerID] mapping:masteryPagesMapping];
         }
         
         return summonerIDAsKeyMapping;
     }];
    
    responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:dynamicSummonerMapping
                                                                      method:RKRequestMethodGET
                                                                 pathPattern:[NSString stringWithFormat:@"%@/:summonerIds/masteries", self.relativePathToBaseURL]
                                                                     keyPath:nil
                                                                 statusCodes:nil];
    
    return responseDescriptor;
}


- (RKResponseDescriptor*)loadRunePagesDTOMapping
{
    RKObjectMapping *runePagesMapping;
    RKObjectMapping *runePageMapping;
    RKObjectMapping *runeSlotMapping;
    NSMutableArray *runePagesPropertyNames = [LoLRunePages getAllPropertyNames];
    NSMutableArray *runePagePropertyNames = [LoLRunePage getAllPropertyNames];
    RKResponseDescriptor *responseDescriptor;
    
    
    // remove any relationship mapping attributes to avoid "duplicate mapping" error
    [runePagesPropertyNames removeObject:@"pages"];
    [runePagePropertyNames removeObject:@"slots"];
    
    
    // create mapping for RunePages DTO
    runePagesMapping = [RKObjectMapping mappingForClass:[LoLRunePages class]];
    [runePagesMapping addAttributeMappingsFromArray:runePagesPropertyNames];
    
    // create mapping for RunePage DTO
    runePageMapping = [RKObjectMapping mappingForClass:[LoLRunePage class]];
    [runePageMapping addAttributeMappingsFromArray:runePagePropertyNames];
    
    // create mapping for a RuneSlot DTO
    runeSlotMapping = [RKObjectMapping mappingForClass:[LoLRuneSlot class]];
    [runeSlotMapping addAttributeMappingsFromArray:[LoLRuneSlot getAllPropertyNames]];
    
    // create relationship mapping to link the RunePage DTO to the RunePages DTO
    [runePagesMapping addRelationshipMappingWithSourceKeyPath: @"pages" mapping:runePageMapping];
    
    // create relationship mapping to link the RuneSlot DTO to the RunePage DTO
    [runePageMapping addRelationshipMappingWithSourceKeyPath: @"slots" mapping:runeSlotMapping];
    
    // LoL api uses the summoner IDs as keys into a dictionary of summoners
    // since these keys are dynamic, we need to dynamically map each of these
    // summoner keys onto a summoner object.
    RKDynamicMapping* dynamicSummonerMapping = [RKDynamicMapping new];
    [dynamicSummonerMapping setObjectMappingForRepresentationBlock:^RKObjectMapping *(id representation)
     {
         NSArray* summonerIDs = [representation allKeys];
         RKObjectMapping *summonerIDAsKeyMapping = [RKObjectMapping mappingForClass:[NSMutableDictionary class]];
         
         
         for (NSNumber *summonerID in summonerIDs)
         {
             [summonerIDAsKeyMapping addRelationshipMappingWithSourceKeyPath:[NSString stringWithFormat:@"%@", summonerID] mapping:runePagesMapping];
         }
         
         return summonerIDAsKeyMapping;
     }];
    
    responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:dynamicSummonerMapping
                                                                      method:RKRequestMethodGET
                                                                 pathPattern:[NSString stringWithFormat:@"%@/:summonerIds/runes", self.relativePathToBaseURL]
                                                                     keyPath:nil
                                                                 statusCodes:nil];
    
    return responseDescriptor;
}

@end