//
//  LoLGameAPI.h
//  LoLAPI
//
//  Created by Troy Stump on 2/9/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import "LoLBaseAPI.h"
#import "LoLRecentGames.h"


@interface LoLGameAPI : LoLBaseAPI

// properties
/* empty */


// methods
- (void)getRecentGamesForSummonerWithID:(NSInteger)summonerID usingAPIKey:(NSString*)apiKey success:(void(^)(LoLRecentGames *recentGames))successBlock failure:(void(^)(NSError *error))failureBlock;

@end