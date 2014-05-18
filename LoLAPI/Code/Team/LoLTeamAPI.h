//
//  LoLTeamAPI.h
//  LoLAPI
//
//  Created by Troy Stump on 2/17/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import "LoLBaseAPI.h"


@interface LoLTeamAPI : LoLBaseAPI

// properties
/* empty */


// methods
- (void)getTeamsForSummonersWithIDs:(NSArray*)summonerIDs usingAPIKey:(NSString*)apiKey success:(void(^)(NSDictionary *teams))successBlock failure:(void(^)(NSError *error))failureBlock;
- (void)getTeamsForTeamsWithIDs:(NSArray*)teamIDs usingAPIKey:(NSString*)apiKey success:(void(^)(NSDictionary *teams))successBlock failure:(void(^)(NSError *error))failureBlock;

@end