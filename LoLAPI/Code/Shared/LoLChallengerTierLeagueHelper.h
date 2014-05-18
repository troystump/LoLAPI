//
//  LoLChallengerTierLeagueHelper.h
//  LoLAPI
//
//  Created by Troy Stump on 5/11/14.
//
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, LoLChallengerTierLeague)
{
    LoLChallengerTierLeagueRankedSolo5x5 = 0,
    LoLChallengerTierLeagueRankedTeam3x3,
    LoLChallengerTierLeagueRankedTeam5x5
};

@interface LoLChallengerTierLeagueHelper : NSObject

+ (NSString*)challengerTierLeagueAsString:(LoLChallengerTierLeague)challengerTierLeague;

@end