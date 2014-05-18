//
//  LoLAPIManager.m
//  LoLAPI
//
//  Created by Troy Stump on 5/16/14.
//
//

#import "LoLAPIManager.h"


@implementation LoLAPIManager

static NSString *_apiKey;
static LoLRegionID _region;
static LoLChampionAPI *_championAPI;
static LoLGameAPI *_gameAPI;
static LoLLeagueAPI *_leagueAPI;
static LoLStaticDataAPI *_staticDataAPI;
static LoLStatsAPI *_statsAPI;
static LoLSummonerAPI *_summonerAPI;
static LoLTeamAPI *_teamAPI;


// don't call this explicitly from the client
- (instancetype)init
{
    if (self = [super init]) {
        [self installAPIs];
    }
    
    return self;
}


+ (void)initWithAPIKey:(NSString*)apiKey region:(LoLRegionID)region
{
    _apiKey = apiKey;
    _region = region;
    
    [LoLAPIManager sharedManager];
}


+ (instancetype)sharedManager
{
    static id sharedInstance;
    static dispatch_once_t once;
    
    
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}



#pragma mark - Init APIs

- (void)installAPIs
{
    NSString *pathToAPI = @"api/lol";

    
    _championAPI = [[LoLChampionAPI alloc] initWithConfig:[[LoLAPIConfig alloc] initRouteToAPI:@"champion"
                                                                               forMajorVersion:1
                                                                               andMinorVersion:2
                                                                         withSupportForRegions:[LoLRegionHelper getRegions]]
                                                  hostURL:[LoLRegionHelper hostURLWithRegionID:_region]
                                             andPathToAPI:pathToAPI usingRegion:_region];
    
    _gameAPI = [[LoLGameAPI alloc] initWithConfig:[[LoLAPIConfig alloc] initRouteToAPI:@"game"
                                                                       forMajorVersion:1
                                                                       andMinorVersion:3
                                                                 withSupportForRegions:[LoLRegionHelper getRegions]]
                                          hostURL:[LoLRegionHelper hostURLWithRegionID:_region]
                                     andPathToAPI:pathToAPI
                                      usingRegion:_region];
    
    _leagueAPI = [[LoLLeagueAPI alloc] initWithConfig:[[LoLAPIConfig alloc] initRouteToAPI:@"league"
                                                                           forMajorVersion:2
                                                                           andMinorVersion:4
                                                                     withSupportForRegions:[LoLRegionHelper getRegions]]
                                              hostURL:[LoLRegionHelper hostURLWithRegionID:_region]
                                         andPathToAPI:pathToAPI
                                          usingRegion:_region];
    
    _staticDataAPI = [[LoLStaticDataAPI alloc] initWithConfig:[[LoLAPIConfig alloc] initRouteToAPI:@"static-data"
                                                                                   forMajorVersion:1
                                                                                   andMinorVersion:2
                                                                             withSupportForRegions:[LoLRegionHelper getRegions]]
                                                      hostURL:[LoLRegionHelper hostURLWithRegionID:_region]
                                                 andPathToAPI:pathToAPI
                                                  usingRegion:_region];
    
    _statsAPI = [[LoLStatsAPI alloc] initWithConfig:[[LoLAPIConfig alloc] initRouteToAPI:@"stats"
                                                                         forMajorVersion:1
                                                                         andMinorVersion:3
                                                                   withSupportForRegions:[LoLRegionHelper getRegions]]
                                            hostURL:[LoLRegionHelper hostURLWithRegionID:_region]
                                       andPathToAPI:pathToAPI
                                        usingRegion:_region];
    
    _summonerAPI = [[LoLSummonerAPI alloc] initWithConfig:[[LoLAPIConfig alloc] initRouteToAPI:@"summoner"
                                                                               forMajorVersion:1
                                                                               andMinorVersion:4
                                                                         withSupportForRegions:[LoLRegionHelper getRegions]]
                                                  hostURL:[LoLRegionHelper hostURLWithRegionID:_region]
                                             andPathToAPI:pathToAPI
                                              usingRegion:_region];
    
    _teamAPI = [[LoLTeamAPI alloc] initWithConfig:[[LoLAPIConfig alloc] initRouteToAPI:@"team"
                                                                       forMajorVersion:2
                                                                       andMinorVersion:3
                                                                 withSupportForRegions:[LoLRegionHelper getRegions]]
                                          hostURL:[LoLRegionHelper hostURLWithRegionID:_region]
                                     andPathToAPI:pathToAPI
                                      usingRegion:_region];
}



#pragma mark - Champion API

+ (void)getChampionsWithFreeToPlayStatusOnly:(BOOL)isFreeToPlay success:(void(^)(NSArray *champions))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_championAPI getChampionsWithFreeToPlayStatusOnly:isFreeToPlay usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}


+ (void)getChampionWithID:(NSInteger)championID success:(void(^)(LoLChampion *champion))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_championAPI getChampionWithID:championID usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}



#pragma mark - Game API

+ (void)getRecentGamesForSummonerWithID:(NSInteger)summonerID success:(void(^)(LoLRecentGames *recentGames))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_gameAPI getRecentGamesForSummonerWithID:summonerID usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}



#pragma mark - League API

+ (void)getLeaguesDataForSummonersWithIDs:(NSArray*)summonerIDs success:(void(^)(NSDictionary *summonerLeagues))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_leagueAPI getLeaguesDataForSummonersWithIDs:summonerIDs usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}


+ (void)getLeaguesEntryDataForSummonersWithIDs:(NSArray*)summonerIDs success:(void(^)(NSDictionary *summonerLeagueEntries))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_leagueAPI getLeaguesEntryDataForSummonersWithIDs:summonerIDs usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}


+ (void)getLeaguesDataForTeamsWithIDs:(NSArray*)teamIDs success:(void(^)(NSDictionary *teamLeagues))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_leagueAPI getLeaguesDataForTeamsWithIDs:teamIDs usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}


+ (void)getLeaguesEntryDataForTeamsWithIDs:(NSArray*)teamIDs success:(void(^)(NSDictionary *teamLeagueEntries))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_leagueAPI getLeaguesEntryDataForTeamsWithIDs:teamIDs usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}


+ (void)getChallengerTierLeague:(LoLChallengerTierLeague)challengerTierLeague success:(void(^)(LoLLeague *challengerTierLeague))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_leagueAPI getChallengerTierLeague:challengerTierLeague usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}



#pragma mark - Static Data API

+ (void)getStaticChampionsWithKeysAsIDs:(BOOL)isDataByID additionalData:(LoLStaticChampData)champDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion success:(void(^)(LoLStaticChampionList *staticChampionList))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_staticDataAPI getStaticChampionsWithKeysAsIDs:isDataByID additionalData:champDataTags locale:locale version:dataDragonVersion usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}


+ (void)getStaticChampionWithID:(NSInteger)championID additionalData:(LoLStaticChampData)champDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion success:(void(^)(LoLStaticChampion *staticChampion))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_staticDataAPI getStaticChampionWithID:championID additionalData:champDataTags locale:locale version:dataDragonVersion usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}


+ (void)getStaticItemsWithAdditionalData:(LoLStaticItemData)itemDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion success:(void(^)(LoLStaticItemList *staticItemList))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_staticDataAPI getStaticItemsWithAdditionalData:itemDataTags locale:locale version:dataDragonVersion usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}


+ (void)getStaticItemWithID:(NSInteger)itemID additionalData:(LoLStaticItemData)itemDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion success:(void(^)(LoLStaticItem *staticItem))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_staticDataAPI getStaticItemWithID:itemID additionalData:itemDataTags locale:locale version:dataDragonVersion usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}


+ (void)getStaticMasteriesWithAdditionalData:(LoLStaticMasteryData)masteryDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion success:(void(^)(LoLStaticMasteryList *staticMasteryList))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_staticDataAPI getStaticMasteriesWithAdditionalData:masteryDataTags locale:locale version:dataDragonVersion usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}


+ (void)getStaticMasteryWithID:(NSInteger)masteryID additionalData:(LoLStaticMasteryData)masteryDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion success:(void(^)(LoLStaticMastery *staticMastery))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_staticDataAPI getStaticMasteryWithID:masteryID additionalData:masteryDataTags locale:locale version:dataDragonVersion usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}


+ (void)getStaticRealmDataWithSuccess:(void(^)(LoLStaticRealm *staticRealm))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_staticDataAPI getStaticRealmDataUsingAPIKey:_apiKey success:successBlock failure:failureBlock];
}


+ (void)getStaticRunesWithAdditionalData:(LoLStaticRuneData)runeDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion success:(void(^)(LoLStaticRuneList *staticRuneList))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_staticDataAPI getStaticRunesWithAdditionalData:runeDataTags locale:locale version:dataDragonVersion usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}


+ (void)getStaticRuneWithID:(NSInteger)runeID additionalData:(LoLStaticRuneData)runeDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion success:(void(^)(LoLStaticRune *staticRune))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_staticDataAPI getStaticRuneWithID:runeID additionalData:runeDataTags locale:locale version:dataDragonVersion usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}


+ (void)getStaticSummonerSpellsWithKeysAsIDs:(BOOL)isDataByID additionalData:(LoLStaticSpellData)spellDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion success:(void(^)(LoLStaticSummonerSpellList *staticSummonerSpellList))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_staticDataAPI getStaticSummonerSpellsWithKeysAsIDs:isDataByID additionalData:spellDataTags locale:locale version:dataDragonVersion usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}


+ (void)getStaticSummonerSpellWithID:(NSInteger)summonerSpellID additionalData:(LoLStaticSpellData)spellDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion success:(void(^)(LoLStaticSummonerSpell *staticSummonerSpell))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_staticDataAPI getStaticSummonerSpellWithID:summonerSpellID additionalData:spellDataTags locale:locale version:dataDragonVersion usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}


+ (void)getStaticVersionsDataWithSuccess:(void(^)(NSArray *versions))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_staticDataAPI getStaticVersionsDataUsingAPIKey:_apiKey success:successBlock failure:failureBlock];
}



#pragma mark - Stats API

+ (void)getRankedStatsForSummonerWithID:(NSInteger)summonerID fromSeason:(LoLSeason)season success:(void(^)(LoLRankedStats *rankedStats))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_statsAPI getRankedStatsForSummonerWithID:summonerID fromSeason:season usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}


+ (void)getStatsSummariesForSummonerWithID:(NSInteger)summonerID fromSeason:(LoLSeason)season success:(void(^)(LoLPlayerStatsSummaryList *statsSummaries))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_statsAPI getStatsSummariesForSummonerWithID:summonerID fromSeason:season usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}



#pragma mark - Summoner API

+ (void)getSummonersWithNames:(NSArray*)summonerNames success:(void(^)(NSDictionary *summoners))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_summonerAPI getSummonersWithNames:summonerNames usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}


+ (void)getSummonersWithIDs:(NSArray*)summonerIDs success:(void(^)(NSDictionary *summoners))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_summonerAPI getSummonersWithIDs:summonerIDs usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}


+ (void)getMasteryPagesForSummonersWithIDs:(NSArray*)summonerIDs success:(void(^)(NSDictionary *masteryPages))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_summonerAPI getMasteryPagesForSummonersWithIDs:summonerIDs usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}


+ (void)getSummonerNamesWithIDs:(NSArray*)summonerIDs success:(void(^)(NSDictionary *summonerNames))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_summonerAPI getSummonerNamesWithIDs:summonerIDs usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}


+ (void)getRunePagesForSummonersWithIDs:(NSArray*)summonerIDs success:(void(^)(NSDictionary *runePages))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_summonerAPI getRunePagesForSummonersWithIDs:summonerIDs usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}



#pragma mark - Team API

+ (void)getTeamsForSummonersWithIDs:(NSArray*)summonerIDs success:(void(^)(NSDictionary *teams))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_teamAPI getTeamsForSummonersWithIDs:summonerIDs usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}


+ (void)getTeamsForTeamsWithIDs:(NSArray*)teamIDs success:(void(^)(NSDictionary *teams))successBlock failure:(void(^)(NSError *error))failureBlock
{
    [_teamAPI getTeamsForSummonersWithIDs:teamIDs usingAPIKey:_apiKey success:successBlock failure:failureBlock];
}

@end