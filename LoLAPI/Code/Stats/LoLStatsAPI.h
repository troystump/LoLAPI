//
//  LoLStatsAPI.h
//  LoLAPI
//
//  Created by Troy Stump on 2/9/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import "LoLBaseAPI.h"
#import "LoLSeasonHelper.h"
// dtos
#import "LoLPlayerStatsSummaryList.h"
#import "LoLRankedStats.h"


@interface LoLStatsAPI : LoLBaseAPI

// properties
/* empty */


// methods
- (void)getRankedStatsForSummonerWithID:(NSInteger)summonerID fromSeason:(LoLSeason)season usingAPIKey:(NSString*)apiKey success:(void(^)(LoLRankedStats *rankedStats))successBlock failure:(void(^)(NSError *error))failureBlock;
- (void)getStatsSummariesForSummonerWithID:(NSInteger)summonerID fromSeason:(LoLSeason)season usingAPIKey:(NSString*)apiKey success:(void(^)(LoLPlayerStatsSummaryList *statsSummaries))successBlock failure:(void(^)(NSError *error))failureBlock;

@end