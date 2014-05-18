//
//  LoLSummonerAPI.h
//  LoLAPI
//
//  Created by Troy Stump on 2/9/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import "LoLBaseAPI.h"


@interface LoLSummonerAPI : LoLBaseAPI

// properties
/* empty */


// methods
- (void)getSummonersWithNames:(NSArray*)summonerNames usingAPIKey:(NSString*)apiKey success:(void(^)(NSDictionary *summoners))successBlock failure:(void(^)(NSError *error))failureBlock;
- (void)getSummonersWithIDs:(NSArray*)summonerIDs usingAPIKey:(NSString*)apiKey success:(void(^)(NSDictionary *summoners))successBlock failure:(void(^)(NSError *error))failureBlock;
- (void)getMasteryPagesForSummonersWithIDs:(NSArray*)summonerIDs usingAPIKey:(NSString*)apiKey success:(void(^)(NSDictionary *masteryPages))successBlock failure:(void(^)(NSError *error))failureBlock;
- (void)getSummonerNamesWithIDs:(NSArray*)summonerIDs usingAPIKey:(NSString*)apiKey success:(void(^)(NSDictionary *summonerNames))successBlock failure:(void(^)(NSError *error))failureBlock;
- (void)getRunePagesForSummonersWithIDs:(NSArray*)summonerIDs usingAPIKey:(NSString*)apiKey success:(void(^)(NSDictionary *runePages))successBlock failure:(void(^)(NSError *error))failureBlock;

@end