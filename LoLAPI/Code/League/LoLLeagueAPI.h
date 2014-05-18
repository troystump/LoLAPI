//
//  LoLLeagueAPI.h
//  LoLAPI
//
//  Created by Troy Stump on 2/17/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import "LoLBaseAPI.h"
#import "LoLLeague.h"
#import "LoLChallengerTierLeagueHelper.h"


@interface LoLLeagueAPI : LoLBaseAPI

// properties
/* empty */


// methods
- (void)getLeaguesDataForSummonersWithIDs:(NSArray*)summonerIDs usingAPIKey:(NSString*)apiKey success:(void(^)(NSDictionary *summonerLeagues))successBlock failure:(void(^)(NSError *error))failureBlock;
- (void)getLeaguesEntryDataForSummonersWithIDs:(NSArray*)summonerIDs usingAPIKey:(NSString*)apiKey success:(void(^)(NSDictionary *summonerLeagueEntries))successBlock failure:(void(^)(NSError *error))failureBlock;
- (void)getLeaguesDataForTeamsWithIDs:(NSArray*)teamIDs usingAPIKey:(NSString*)apiKey success:(void(^)(NSDictionary *teamLeagues))successBlock failure:(void(^)(NSError *error))failureBlock;
- (void)getLeaguesEntryDataForTeamsWithIDs:(NSArray*)teamIDs usingAPIKey:(NSString*)apiKey success:(void(^)(NSDictionary *teamLeagueEntries))successBlock failure:(void(^)(NSError *error))failureBlock;
- (void)getChallengerTierLeague:(LoLChallengerTierLeague)challengerTierLeague usingAPIKey:(NSString*)apiKey success:(void(^)(LoLLeague *challengerTierLeague))successBlock failure:(void(^)(NSError *error))failureBlock;

@end