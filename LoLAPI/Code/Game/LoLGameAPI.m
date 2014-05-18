//
//  LoLGameAPI.m
//  LoLAPI
//
//  Created by Troy Stump on 2/9/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import <RestKit/RestKit.h>
#import "LoLGameAPI.h"
#import "LoLBaseAPIPrivate.h"
// dtos
#import "LoLGame.h"
#import "LoLPlayer.h"
#import "LoLRawGameStats.h"
#import "LoLRecentGames.h"


@implementation LoLGameAPI

- (id)initWithConfig:(LoLAPIConfig*)apiConfig hostURL:(NSURL*)hostURL andPathToAPI:(NSString*)apiPath usingRegion:(LoLRegionID)selectedRegion
{
    if (self = [super initWithConfig:apiConfig hostURL:hostURL andPathToAPI:apiPath usingRegion:selectedRegion]) {
        [self setupDTOMappings];
    }
    
    return self;
}


- (void)getRecentGamesForSummonerWithID:(NSInteger)summonerID usingAPIKey:(NSString*)apiKey success:(void(^)(LoLRecentGames *recentGames))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/by-summoner/%ld/recent", self.relativePathToBaseURL, (long)summonerID]
                                           parameters:@{
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];
}



#pragma mark Private Helpers

- (void)setupDTOMappings
{
    [self.apiManager addResponseDescriptor:[self loadRecentGamesDTOMapping]];
}


- (RKResponseDescriptor*)loadRecentGamesDTOMapping
{
    RKObjectMapping *recentGamesMapping;
    RKObjectMapping *gameMapping;
    RKObjectMapping *playerMapping;
    RKObjectMapping *rawGameStatsMapping;
    RKResponseDescriptor *responseDescriptor;
    NSMutableArray *recentGamesPropertyNames = [LoLRecentGames getAllPropertyNames];
    NSMutableArray *gamePropertyNames = [LoLGame getAllPropertyNames];
    
    
    // remove any relationship mapping attributes to avoid "duplicate mapping" error
    [recentGamesPropertyNames removeObject:@"games"];
    [gamePropertyNames removeObjectsInArray:@[@"fellowPlayers", @"stats"]];
    
    // create mapping for RecentGames DTO
    recentGamesMapping = [RKObjectMapping mappingForClass:[LoLRecentGames class]];
    [recentGamesMapping addAttributeMappingsFromArray: recentGamesPropertyNames];
    
    // create mapping for Game DTO
    gameMapping = [RKObjectMapping mappingForClass:[LoLGame class]];
    [gameMapping addAttributeMappingsFromArray: gamePropertyNames];

    // create mapping for Player DTO
    playerMapping = [RKObjectMapping mappingForClass:[LoLPlayer class]];
    [playerMapping addAttributeMappingsFromArray:[LoLPlayer getAllPropertyNames]];
    
    // create mapping for RawGameStats DTO
    rawGameStatsMapping = [RKObjectMapping mappingForClass:[LoLRawGameStats class]];
    [rawGameStatsMapping addAttributeMappingsFromArray:[LoLRawGameStats getAllPropertyNames]];
    
    // create relationship mapping to link the Game DTO to the RecentGames DTO
    [recentGamesMapping addRelationshipMappingWithSourceKeyPath:@"games" mapping:gameMapping];

    // create relationship mapping to link the Player DTO to the Game DTO
    [gameMapping addRelationshipMappingWithSourceKeyPath:@"fellowPlayers" mapping:playerMapping];
    
    // create relationship mapping to link the RawGameStats DTO
    [gameMapping addRelationshipMappingWithSourceKeyPath:@"stats" mapping:rawGameStatsMapping];
    
    responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:recentGamesMapping
                                                                      method:RKRequestMethodGET
                                                                 pathPattern:[NSString stringWithFormat:@"%@/by-summoner/:summonerId/recent", self.relativePathToBaseURL]
                                                                     keyPath:nil
                                                                 statusCodes:nil];
    
    return responseDescriptor;
}

@end