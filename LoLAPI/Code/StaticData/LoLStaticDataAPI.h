//
//  LoLStaticDataAPI.h
//  LoLAPI
//
//  Created by Troy Stump on 2/9/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import "LoLBaseAPI.h"
// dtos
#import "LoLStaticChampionList.h"
#import "LoLStaticChampion.h"
#import "LoLStaticItemList.h"
#import "LoLStaticItem.h"
#import "LoLStaticMasteryList.h"
#import "LoLStaticMastery.h"
#import "LoLStaticRealm.h"
#import "LoLStaticRuneList.h"
#import "LoLStaticRune.h"
#import "LoLStaticSummonerSpellList.h"
#import "LoLStaticSummonerSpell.h"


typedef NS_ENUM(NSInteger, LoLStaticDataLocale)
{
    LoLStaticDataLocaleDefault = 0,
    LoLStaticDataLocaleEnglishUS,
    LoLStaticDataLocaleSpanish,
    LoLStaticDataLocaleFrench,
    LoLStaticDataLocaleGerman,
    LoLStaticDataLocaleItalian,
    LoLStaticDataLocalePolish,
    LoLStaticDataLocaleGreek,
    LoLStaticDataLocaleRomanian,
    LoLStaticDataLocalePortugueseBrazil,
    LoLStaticDataLocaleTurkish,
    LoLStaticDataLocaleThai,
    LoLStaticDataLocaleVietnamese,
    LoLStaticDataLocaleIndonesian,
    LoLStaticDataLocaleRussian,
    LoLStaticDataLocaleKorean,
    LoLStaticDataLocaleChineseChina,
    LoLStaticDataLocaleChineseTaiwan
};

typedef NS_OPTIONS(NSInteger, LoLStaticChampData)
{
    LoLStaticChampDataNone = 0,
    LoLStaticChampDataAll = 1 << 0,
    LoLStaticChampDataAllyTips = 1 << 1,
    LoLStaticChampDataAltImages = 1 << 2,
    LoLStaticChampDataBlurb = 1 << 3,
    LoLStaticChampDataEnemyTips = 1 << 4,
    LoLStaticChampDataImage = 1 << 5,
    LoLStaticChampDataInfo = 1 << 6,
    LoLStaticChampDataLore = 1 << 7,
    LoLStaticChampDataParamaterType = 1 << 8,
    LoLStaticChampDataPassive = 1 << 9,
    LoLStaticChampDataRecommended = 1 << 10,
    LoLStaticChampDataSkins = 1 << 11,
    LoLStaticChampDataSpells = 1 << 12,
    LoLStaticChampDataStats = 1 << 13,
    LoLStaticChampDataTags = 1 << 14
};

typedef NS_OPTIONS(NSInteger, LoLStaticItemData)
{
    LoLStaticItemDataNone = 0,
    LoLStaticItemDataAll = 1 << 0,
    LoLStaticItemDataColloquial = 1 << 1,
    LoLStaticItemDataConsumeOnFull = 1 << 2,
    LoLStaticItemDataConsumed = 1 << 3,
    LoLStaticItemDataDepth = 1 << 4,
    LoLStaticItemDataFrom = 1 << 5,
    LoLStaticItemDataGold = 1 << 6,
    LoLStaticItemDataGroups = 1 << 7,
    LoLStaticItemDataHideFromAll = 1 << 8,
    LoLStaticItemDataImage = 1 << 9,
    LoLStaticItemDataInStore = 1 << 10,
    LoLStaticItemDataInto = 1 << 11,
    LoLStaticItemDataMaps = 1 << 12,
    LoLStaticItemDataRequiredChampion = 1 << 13,
    LoLStaticItemDataSanitizedDescription = 1 << 14,
    LoLStaticItemDataSpecialRecipe = 1 << 15,
    LoLStaticItemDataStacks = 1 << 16,
    LoLStaticItemDataStats = 1 << 17,
    LoLStaticItemDataTags = 1 << 18,
    LoLStaticItemDataTree = 1 << 19
};

typedef NS_OPTIONS(NSInteger, LoLStaticMasteryData)
{
    LoLStaticMasteryDataNone = 0,
    LoLStaticMasteryDataAll = 1 << 0,
    LoLStaticMasteryDataImage = 1 << 1,
    LoLStaticMasteryDataPreRequisites = 1 << 2,
    LoLStaticMasteryDataRanks = 1 << 3,
    LoLStaticMasteryDataSanitizedDescription = 1 << 4,
    LoLStaticMasteryDataTree = 1 << 5
};

typedef NS_OPTIONS(NSInteger, LoLStaticRuneData)
{
    LoLStaticRuneDataNone = 0,
    LoLStaticRuneDataAll = 1 << 0,
    LoLStaticRuneDataBasic = 1 << 1,
    LoLStaticRuneDataColloquial = 1 << 2,
    LoLStaticRuneDataConsumeOnFull = 1 << 3,
    LoLStaticRuneDataConsumed = 1 << 4,
    LoLStaticRuneDataDepth = 1 << 5,
    LoLStaticRuneDataFrom = 1 << 6,
    LoLStaticRuneDataGold = 1 << 7,
    LoLStaticRuneDataHideFromAll = 1 << 8,
    LoLStaticRuneDataImage = 1 << 9,
    LoLStaticRuneDataInStore = 1 << 10,
    LoLStaticRuneDataInto = 1 << 11,
    LoLStaticRuneDataMaps = 1 << 12,
    LoLStaticRuneDataRequiredChampion = 1 << 13,
    LoLStaticRuneDataSanitizedDescription = 1 << 14,
    LoLStaticRuneDataSpecialRecipe = 1 << 15,
    LoLStaticRuneDataStacks = 1 << 16,
    LoLStaticRuneDataStats = 1 << 17,
    LoLStaticRuneDataTags = 1 << 18
};

typedef NS_OPTIONS(NSInteger, LoLStaticSpellData)
{
    LoLStaticSpellDataNone = 0,
    LoLStaticSpellDataAll = 1 << 0,
    LoLStaticSpellDataCooldown = 1 << 1,
    LoLStaticSpellDataCooldownBurn = 1 << 2,
    LoLStaticSpellDataCost = 1 << 3,
    LoLStaticSpellDataCostBurn = 1 << 4,
    LoLStaticSpellDataCostType = 1 << 5,
    LoLStaticSpellDataEffect = 1 << 6,
    LoLStaticSpellDataEffectBurn = 1 << 7,
    LoLStaticSpellDataImage = 1 << 8,
    LoLStaticSpellDataKey = 1 << 9,
    LoLStaticSpellDataLevelTip = 1 << 10,
    LoLStaticSpellDataMaxRank = 1 << 11,
    LoLStaticSpellDataModes = 1 << 12,
    LoLStaticSpellDataRange = 1 << 13,
    LoLStaticSpellDataRangeBurn = 1 << 14,
    LoLStaticSpellDataResource = 1 << 15,
    LoLStaticSpellDataSanitizedDescription = 1 << 16,
    LoLStaticSpellDataSanitizedTooltip = 1 << 17,
    LoLStaticSpellDataTooltip = 1 << 18,
    LoLStaticSpellDataVariables = 1 << 19
};


@interface LoLStaticDataAPI : LoLBaseAPI

// properties
/* empty */


// methods
- (void)getStaticChampionsWithKeysAsIDs:(BOOL)isDataByID additionalData:(LoLStaticChampData)champDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion usingAPIKey:(NSString*)apiKey success:(void(^)(LoLStaticChampionList *staticChampionList))successBlock failure:(void(^)(NSError *error))failureBlock;
- (void)getStaticChampionWithID:(NSInteger)championID additionalData:(LoLStaticChampData)champDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion usingAPIKey:(NSString*)apiKey success:(void(^)(LoLStaticChampion *staticChampion))successBlock failure:(void(^)(NSError *error))failureBlock;

- (void)getStaticItemsWithAdditionalData:(LoLStaticItemData)itemDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion usingAPIKey:(NSString*)apiKey success:(void(^)(LoLStaticItemList *staticItemList))successBlock failure:(void(^)(NSError *error))failureBlock;
- (void)getStaticItemWithID:(NSInteger)itemID additionalData:(LoLStaticItemData)itemDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion usingAPIKey:(NSString*)apiKey success:(void(^)(LoLStaticItem *staticItem))successBlock failure:(void(^)(NSError *error))failureBlock;

- (void)getStaticMasteriesWithAdditionalData:(LoLStaticMasteryData)masteryDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion usingAPIKey:(NSString*)apiKey success:(void(^)(LoLStaticMasteryList *staticMasteryList))successBlock failure:(void(^)(NSError *error))failureBlock;
- (void)getStaticMasteryWithID:(NSInteger)masteryID additionalData:(LoLStaticMasteryData)masteryDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion usingAPIKey:(NSString*)apiKey success:(void(^)(LoLStaticMastery *staticMastery))successBlock failure:(void(^)(NSError *error))failureBlock;

- (void)getStaticRealmDataUsingAPIKey:(NSString*)apiKey success:(void(^)(LoLStaticRealm *staticRealm))successBlock failure:(void(^)(NSError *error))failureBlock;

- (void)getStaticRunesWithAdditionalData:(LoLStaticRuneData)runeDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion usingAPIKey:(NSString*)apiKey success:(void(^)(LoLStaticRuneList *staticRuneList))successBlock failure:(void(^)(NSError *error))failureBlock;
- (void)getStaticRuneWithID:(NSInteger)runeID additionalData:(LoLStaticRuneData)runeDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion usingAPIKey:(NSString*)apiKey success:(void(^)(LoLStaticRune *staticRune))successBlock failure:(void(^)(NSError *error))failureBlock;

- (void)getStaticSummonerSpellsWithKeysAsIDs:(BOOL)isDataByID additionalData:(LoLStaticSpellData)spellDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion usingAPIKey:(NSString*)apiKey success:(void(^)(LoLStaticSummonerSpellList *staticSummonerSpellList))successBlock failure:(void(^)(NSError *error))failureBlock;
- (void)getStaticSummonerSpellWithID:(NSInteger)summonerSpellID additionalData:(LoLStaticSpellData)spellDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion usingAPIKey:(NSString*)apiKey success:(void(^)(LoLStaticSummonerSpell *staticSummonerSpell))successBlock failure:(void(^)(NSError *error))failureBlock;

- (void)getStaticVersionsDataUsingAPIKey:(NSString*)apiKey success:(void(^)(NSArray *versions))successBlock failure:(void(^)(NSError *error))failureBlock;

@end