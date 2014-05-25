//
//  LoLAPIManager.h
//  LoLAPI
//
//  Created by Troy Stump on 5/16/14.
//
//

#import <Foundation/Foundation.h>
#import "LoLChampionAPI.h"
#import "LoLGameAPI.h"
#import "LoLLeagueAPI.h"
#import "LoLStaticDataAPI.h"
#import "LoLStatsAPI.h"
#import "LoLSummonerAPI.h"
#import "LoLTeamAPI.h"


@interface LoLAPIManager : NSObject

+ (void)initWithAPIKey:(NSString*)apiKey region:(LoLRegionID)region;
+ (BOOL)setSelectedRegion:(LoLRegionID)region;
+ (instancetype)sharedManager;

// champion api
+ (void)getChampionsWithFreeToPlayStatusOnly:(BOOL)isFreeToPlay success:(void(^)(LoLChampionList *championList))successBlock failure:(void(^)(NSError *error))failureBlock;
+ (void)getChampionWithID:(NSInteger)championID success:(void(^)(LoLChampion *champion))successBlock failure:(void(^)(NSError *error))failureBlock;

// game api
+ (void)getRecentGamesForSummonerWithID:(NSInteger)summonerID success:(void(^)(LoLRecentGames *recentGames))successBlock failure:(void(^)(NSError *error))failureBlock;

// league api
+ (void)getLeaguesDataForSummonersWithIDs:(NSArray*)summonerIDs success:(void(^)(NSDictionary *summonerLeagues))successBlock failure:(void(^)(NSError *error))failureBlock;
+ (void)getLeaguesEntryDataForSummonersWithIDs:(NSArray*)summonerIDs success:(void(^)(NSDictionary *summonerLeagueEntries))successBlock failure:(void(^)(NSError *error))failureBlock;
+ (void)getLeaguesDataForTeamsWithIDs:(NSArray*)teamIDs success:(void(^)(NSDictionary *teamLeagues))successBlock failure:(void(^)(NSError *error))failureBlock;
+ (void)getLeaguesEntryDataForTeamsWithIDs:(NSArray*)teamIDs success:(void(^)(NSDictionary *teamLeagueEntries))successBlock failure:(void(^)(NSError *error))failureBlock;
+ (void)getChallengerTierLeague:(LoLChallengerTierLeague)challengerTierLeague success:(void(^)(LoLLeague *challengerTierLeague))successBlock failure:(void(^)(NSError *error))failureBlock;

// static data api
+ (void)getStaticChampionsWithKeysAsIDs:(BOOL)isDataByID additionalData:(LoLStaticChampData)champDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion success:(void(^)(LoLStaticChampionList *staticChampionList))successBlock failure:(void(^)(NSError *error))failureBlock;
+ (void)getStaticChampionWithID:(NSInteger)championID additionalData:(LoLStaticChampData)champDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion success:(void(^)(LoLStaticChampion *staticChampion))successBlock failure:(void(^)(NSError *error))failureBlock;
+ (void)getStaticItemsWithAdditionalData:(LoLStaticItemData)itemDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion success:(void(^)(LoLStaticItemList *staticItemList))successBlock failure:(void(^)(NSError *error))failureBlock;
+ (void)getStaticItemWithID:(NSInteger)itemID additionalData:(LoLStaticItemData)itemDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion success:(void(^)(LoLStaticItem *staticItem))successBlock failure:(void(^)(NSError *error))failureBlock;
+ (void)getStaticMasteriesWithAdditionalData:(LoLStaticMasteryData)masteryDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion success:(void(^)(LoLStaticMasteryList *staticMasteryList))successBlock failure:(void(^)(NSError *error))failureBlock;
+ (void)getStaticMasteryWithID:(NSInteger)masteryID additionalData:(LoLStaticMasteryData)masteryDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion success:(void(^)(LoLStaticMastery *staticMastery))successBlock failure:(void(^)(NSError *error))failureBlock;
+ (void)getStaticRealmDataWithSuccess:(void(^)(LoLStaticRealm *staticRealm))successBlock failure:(void(^)(NSError *error))failureBlock;
+ (void)getStaticRunesWithAdditionalData:(LoLStaticRuneData)runeDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion success:(void(^)(LoLStaticRuneList *staticRuneList))successBlock failure:(void(^)(NSError *error))failureBlock;
+ (void)getStaticRuneWithID:(NSInteger)runeID additionalData:(LoLStaticRuneData)runeDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion success:(void(^)(LoLStaticRune *staticRune))successBlock failure:(void(^)(NSError *error))failureBlock;
+ (void)getStaticSummonerSpellsWithKeysAsIDs:(BOOL)isDataByID additionalData:(LoLStaticSpellData)spellDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion success:(void(^)(LoLStaticSummonerSpellList *staticSummonerSpellList))successBlock failure:(void(^)(NSError *error))failureBlock;
+ (void)getStaticSummonerSpellWithID:(NSInteger)summonerSpellID additionalData:(LoLStaticSpellData)spellDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion success:(void(^)(LoLStaticSummonerSpell *staticSummonerSpell))successBlock failure:(void(^)(NSError *error))failureBlock;
+ (void)getStaticVersionsDataWithSuccess:(void(^)(NSArray *versions))successBlock failure:(void(^)(NSError *error))failureBlock;

// stats api
+ (void)getRankedStatsForSummonerWithID:(NSInteger)summonerID fromSeason:(LoLSeason)season success:(void(^)(LoLRankedStats *rankedStats))successBlock failure:(void(^)(NSError *error))failureBlock;
+ (void)getStatsSummariesForSummonerWithID:(NSInteger)summonerID fromSeason:(LoLSeason)season success:(void(^)(LoLPlayerStatsSummaryList *statsSummaries))successBlock failure:(void(^)(NSError *error))failureBlock;

// summoner api
+ (void)getSummonersWithNames:(NSArray*)summonerNames success:(void(^)(NSDictionary *summoners))successBlock failure:(void(^)(NSError *error))failureBlock;
+ (void)getSummonersWithIDs:(NSArray*)summonerIDs success:(void(^)(NSDictionary *summoners))successBlock failure:(void(^)(NSError *error))failureBlock;
+ (void)getMasteryPagesForSummonersWithIDs:(NSArray*)summonerIDs success:(void(^)(NSDictionary *masteryPages))successBlock failure:(void(^)(NSError *error))failureBlock;
+ (void)getSummonerNamesWithIDs:(NSArray*)summonerIDs success:(void(^)(NSDictionary *summonerNames))successBlock failure:(void(^)(NSError *error))failureBlock;
+ (void)getRunePagesForSummonersWithIDs:(NSArray*)summonerIDs success:(void(^)(NSDictionary *runePages))successBlock failure:(void(^)(NSError *error))failureBlock;

// team api
+ (void)getTeamsForSummonersWithIDs:(NSArray*)summonerIDs success:(void(^)(NSDictionary *teams))successBlock failure:(void(^)(NSError *error))failureBlock;
+ (void)getTeamsForTeamsWithIDs:(NSArray*)teamIDs success:(void(^)(NSDictionary *teams))successBlock failure:(void(^)(NSError *error))failureBlock;

@end