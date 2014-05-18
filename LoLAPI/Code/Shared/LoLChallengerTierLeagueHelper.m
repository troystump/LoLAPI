//
//  LoLChallengerTierLeagueHelper.m
//  LeagueMe
//
//  Created by Troy Stump on 5/11/14.
//
//

#import "LoLChallengerTierLeagueHelper.h"

@implementation LoLChallengerTierLeagueHelper

+ (NSString*)challengerTierLeagueAsString:(LoLChallengerTierLeague)challengerTierLeague
{
    static NSDictionary *challengerTierLeagueDictionary;
    static dispatch_once_t onceToken;
    
    
    dispatch_once(&onceToken, ^{
        challengerTierLeagueDictionary = @{
                             @(LoLChallengerTierLeagueRankedSolo5x5) : @"RANKED_SOLO_5x5",
                             @(LoLChallengerTierLeagueRankedTeam3x3) : @"RANKED_TEAM_3x3",
                             @(LoLChallengerTierLeagueRankedTeam5x5): @"RANKED_TEAM_5x5"
                             };
    });
    
    return [challengerTierLeagueDictionary objectForKey:@(challengerTierLeague)];
}


@end