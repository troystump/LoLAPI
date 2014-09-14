//
//  LoLStaticDataAPI.m
//  LoLAPI
//
//  Created by Troy Stump on 2/9/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import <RestKit/RestKit.h>
#import "LoLStaticDataAPI.h"
#import "LoLBaseAPIPrivate.h"
// dtos
#import "LoLStaticChampionSpell.h"
#import "LoLStaticImage.h"
#import "LoLStaticInfo.h"
#import "LoLStaticPassive.h"
#import "LoLStaticRecommended.h"
#import "LoLStaticSkin.h"
#import "LoLStaticStats.h"
#import "LoLStaticLevelTip.h"
#import "LoLStaticSpellVariables.h"
#import "LoLStaticBlock.h"
#import "LoLStaticBlockItem.h"
#import "LoLStaticBasicData.h"
#import "LoLStaticGroup.h"
#import "LoLStaticItemTree.h"
#import "LoLStaticBasicDataStats.h"
#import "LoLStaticGold.h"
#import "LoLStaticMetaData.h"
#import "LoLStaticMasteryTree.h"
#import "LoLStaticMasteryTreeList.h"
#import "LoLStaticMasteryTreeItem.h"


@implementation LoLStaticDataAPI


- (id)initWithConfig:(LoLAPIConfig*)apiConfig hostURL:(NSURL*)hostURL andPathToAPI:(NSString*)apiPath usingRegion:(LoLRegionID)selectedRegion
{
    if (self = [super initWithConfig:apiConfig hostURL:hostURL andPathToAPI:apiPath usingRegion:selectedRegion]) {
        self.url = [self createURLToAPI];
        self.relativePathToBaseURL = [self.url relativePath];
        [self setupDTOMappings];
    }
    
    return self;
}


- (void)getStaticChampionsWithKeysAsIDs:(BOOL)isDataByID additionalData:(LoLStaticChampData)champDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion usingAPIKey:(NSString*)apiKey success:(void(^)(LoLStaticChampionList *staticChampionList))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };

    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/champion", self.relativePathToBaseURL]
                                           parameters:@{
                                                        @"locale": [LoLStaticDataAPI localeAsString:locale],
                                                        @"version": dataDragonVersion ? dataDragonVersion : @"",
                                                        @"dataById": isDataByID ? @"true" : @"false",
                                                        @"champData": [self buildStaticChampDataParametersAsQueryString:champDataTags],
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];
}


- (void)getStaticChampionWithID:(NSInteger)championID additionalData:(LoLStaticChampData)champDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion usingAPIKey:(NSString*)apiKey success:(void(^)(LoLStaticChampion *staticChampion))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/champion/%ld", self.relativePathToBaseURL, (long)championID]
                                           parameters:@{
                                                        @"locale": [LoLStaticDataAPI localeAsString:locale],
                                                        @"version": dataDragonVersion ? dataDragonVersion : @"",
                                                        @"champData": [self buildStaticChampDataParametersAsQueryString:champDataTags],
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];
}


- (void)getStaticItemsWithAdditionalData:(LoLStaticItemData)itemDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion usingAPIKey:(NSString*)apiKey success:(void(^)(LoLStaticItemList *staticItemList))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/item", self.relativePathToBaseURL]
                                           parameters:@{
                                                        @"locale": [LoLStaticDataAPI localeAsString:locale],
                                                        @"version": dataDragonVersion ? dataDragonVersion : @"",
                                                        @"itemListData": [self buildStaticItemDataParametersAsQueryString:itemDataTags],
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];
}


- (void)getStaticItemWithID:(NSInteger)itemID additionalData:(LoLStaticItemData)itemDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion usingAPIKey:(NSString*)apiKey success:(void(^)(LoLStaticItem *staticItem))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/item/%ld", self.relativePathToBaseURL, (long)itemID]
                                           parameters:@{
                                                        @"locale": [LoLStaticDataAPI localeAsString:locale],
                                                        @"version": dataDragonVersion ? dataDragonVersion : @"",
                                                        @"itemData": [self buildStaticItemDataParametersAsQueryString:itemDataTags],
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];
}


- (void)getStaticMasteriesWithAdditionalData:(LoLStaticMasteryData)masteryDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion usingAPIKey:(NSString*)apiKey success:(void(^)(LoLStaticMasteryList *staticMasteryList))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/mastery", self.relativePathToBaseURL]
                                           parameters:@{
                                                        @"locale": [LoLStaticDataAPI localeAsString:locale],
                                                        @"version": dataDragonVersion ? dataDragonVersion : @"",
                                                        @"masteryListData": [self buildStaticMasteryDataParametersAsQueryString:masteryDataTags],
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];
}


- (void)getStaticMasteryWithID:(NSInteger)masteryID additionalData:(LoLStaticMasteryData)masteryDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion usingAPIKey:(NSString*)apiKey success:(void(^)(LoLStaticMastery *staticMastery))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^actionSuccess)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result)
    {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/mastery/%ld", self.relativePathToBaseURL, (long)masteryID]
                                           parameters:@{
                                                        @"locale": [LoLStaticDataAPI localeAsString:locale],
                                                        @"version": dataDragonVersion ? dataDragonVersion : @"",
                                                        @"masteryData": [self buildStaticMasteryDataParametersAsQueryString:masteryDataTags],
                                                        @"api_key": apiKey
                                                        }
                                              success:actionSuccess
                                              failure:failure];
}


- (void)getStaticRealmDataUsingAPIKey:(NSString*)apiKey success:(void(^)(LoLStaticRealm *staticRealm))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/realm", self.relativePathToBaseURL]
                                           parameters:@{
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];
}


- (void)getStaticRunesWithAdditionalData:(LoLStaticRuneData)runeDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion usingAPIKey:(NSString*)apiKey success:(void(^)(LoLStaticRuneList *staticRuneList))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/rune", self.relativePathToBaseURL]
                                           parameters:@{
                                                        @"locale": [LoLStaticDataAPI localeAsString:locale],
                                                        @"version": dataDragonVersion ? dataDragonVersion : @"",
                                                        @"runeListData": [self buildStaticRuneDataParametersAsQueryString:runeDataTags],
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];
}


- (void)getStaticRuneWithID:(NSInteger)runeID additionalData:(LoLStaticRuneData)runeDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion usingAPIKey:(NSString*)apiKey success:(void(^)(LoLStaticRune *staticRune))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/rune/%ld", self.relativePathToBaseURL, (long)runeID]
                                           parameters:@{
                                                        @"locale": [LoLStaticDataAPI localeAsString:locale],
                                                        @"version": dataDragonVersion ? dataDragonVersion : @"",
                                                        @"runeData": [self buildStaticRuneDataParametersAsQueryString:runeDataTags],
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];
}


- (void)getStaticSummonerSpellsWithKeysAsIDs:(BOOL)isDataByID additionalData:(LoLStaticSpellData)spellDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion usingAPIKey:(NSString*)apiKey success:(void(^)(LoLStaticSummonerSpellList *staticSummonerSpellList))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/summoner-spell", self.relativePathToBaseURL]
                                           parameters:@{
                                                        @"locale": [LoLStaticDataAPI localeAsString:locale],
                                                        @"version": dataDragonVersion ? dataDragonVersion : @"",
                                                        @"dataById": isDataByID ? @"true" : @"false",
                                                        @"spellData": [self buildStaticSpellDataParametersAsQueryString:spellDataTags],
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];
}


- (void)getStaticSummonerSpellWithID:(NSInteger)summonerSpellID additionalData:(LoLStaticSpellData)spellDataTags locale:(LoLStaticDataLocale)locale version:(NSString*)dataDragonVersion usingAPIKey:(NSString*)apiKey success:(void(^)(LoLStaticSummonerSpell *staticSummonerSpell))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/summoner-spell/%ld", self.relativePathToBaseURL, (long)summonerSpellID]
                                           parameters:@{
                                                        @"locale": [LoLStaticDataAPI localeAsString:locale],
                                                        @"version": dataDragonVersion ? dataDragonVersion : @"",
                                                        @"spellData": [self buildStaticSpellDataParametersAsQueryString:spellDataTags],
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];
}


- (void)getStaticVersionsDataUsingAPIKey:(NSString*)apiKey success:(void(^)(NSArray *versions))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(AFHTTPRequestOperation*, id) = ^(AFHTTPRequestOperation *operation, id result) {
        successBlock(result);
    };
    void (^failure)(AFHTTPRequestOperation *operation, NSError *error) = ^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager.HTTPClient getPath:[NSString stringWithFormat:@"%@/versions", self.relativePathToBaseURL]
                                             parameters:@{
                                                          @"api_key": apiKey
                                                          }
                                                success:success
                                                failure:failure];
}



#pragma mark - Private Helpers

// we needed to override this method since its full url path is slightly different from all of the other apis -__-
-(NSURL*) createURLToAPI
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@/v%@", self.apiPath, self.apiConfig.name, self.selectedRegion.value, [self.apiConfig.version getVersion]] relativeToURL:self.hostURL];
}


- (void)setupDTOMappings
{
    RKObjectManager *sharedRestKitObjectManager = self.apiManager;
    
    
    [sharedRestKitObjectManager addResponseDescriptorsFromArray:[self loadStaticChampionDTOMapping]];
    
    [sharedRestKitObjectManager addResponseDescriptorsFromArray:[self loadStaticItemDTOMapping]];
    
    [sharedRestKitObjectManager addResponseDescriptorsFromArray:[self loadStaticMasteryDTOMapping]];
    
    [sharedRestKitObjectManager addResponseDescriptor:[self loadStaticRealmDTOMapping]];
    
    [sharedRestKitObjectManager addResponseDescriptorsFromArray:[self loadStaticRuneDTOMapping]];
    
    [sharedRestKitObjectManager addResponseDescriptorsFromArray:[self loadStaticSpellDTOMapping]];
}


- (NSArray*)loadStaticChampionDTOMapping
{
    RKObjectMapping *staticChampionListMapping;
    RKObjectMapping *staticChampionMapping;
    RKObjectMapping *staticChampionSpellMapping;
    RKObjectMapping *staticImageMapping;
    RKObjectMapping *staticInfoMapping;
    RKObjectMapping *staticPassiveMapping;
    RKObjectMapping *staticRecommendedMapping;
    RKObjectMapping *staticSkinMapping;
    RKObjectMapping *staticStatsMapping;
    RKObjectMapping *staticLevelTipMapping;
    RKObjectMapping *staticSpellVariablesMapping;
    RKObjectMapping *staticBlockMapping;
    RKObjectMapping *staticBlockItemMapping;
    RKDynamicMapping *dynamicStaticChampionListDataMapping;
    NSMutableArray *staticChampionListPropertyNames = [LoLStaticChampionList getAllPropertyNames];
    NSMutableArray *staticChampionPropertyNames = [LoLStaticChampion getAllPropertyNames];
    NSMutableArray *staticChampionSpellPropertyNames = [LoLStaticChampionSpell getAllPropertyNames];
    NSMutableArray *staticPassivePropertyNames = [LoLStaticPassive getAllPropertyNames];
    NSMutableArray *staticRecommendedPropertyNames = [LoLStaticRecommended getAllPropertyNames];
    NSMutableArray *staticBlockPropertyNames = [LoLStaticBlock getAllPropertyNames];
    NSString *nameOfDescriptionProperty = @"rawDescription";
    
    
    // remove any relationship mapping attributes to avoid "duplicate mapping" error
    [staticChampionListPropertyNames removeObject:@"data"];
    [staticChampionPropertyNames removeObjectsInArray:@[@"image", @"info", @"passive", @"recommended", @"skins", @"spells", @"stats"]];
    [staticChampionSpellPropertyNames removeObjectsInArray:@[@"altimages", @"image", @"leveltip", @"vars"]];
    [staticPassivePropertyNames removeObject:@"image"];
    [staticRecommendedPropertyNames removeObject:@"blocks"];
    [staticBlockPropertyNames removeObject:@"items"];

    // create mapping for StaticChampionList DTO
    staticChampionListMapping = [RKObjectMapping mappingForClass:[LoLStaticChampionList class]];
    [staticChampionListMapping addAttributeMappingsFromArray:staticChampionListPropertyNames];
    
    // create mapping for StaticChampion DTO
    staticChampionMapping = [RKObjectMapping mappingForClass:[LoLStaticChampion class]];
    [staticChampionMapping addAttributeMappingsFromArray:staticChampionPropertyNames];
    
    // create mapping for StaticChampionSpell DTO
    staticChampionSpellMapping = [RKObjectMapping mappingForClass:[LoLStaticChampionSpell class]];
    // xcode 6+: need to manually rename/map our response's "description" property to our "staticBasicDataDescription" property
    [staticChampionSpellPropertyNames removeObject:nameOfDescriptionProperty];
    [staticChampionSpellMapping addAttributeMappingsFromDictionary:@{@"description" : nameOfDescriptionProperty}];
    // map remaining properties
    [staticChampionSpellMapping addAttributeMappingsFromArray:staticChampionSpellPropertyNames];
    
    // create mapping for StaticImage DTO
    staticImageMapping = [RKObjectMapping mappingForClass:[LoLStaticImage class]];
    [staticImageMapping addAttributeMappingsFromArray:[LoLStaticImage getAllPropertyNames]];
    
    // create mapping for StaticInfo DTO
    staticInfoMapping = [RKObjectMapping mappingForClass:[LoLStaticInfo class]];
    [staticInfoMapping addAttributeMappingsFromArray:[LoLStaticInfo getAllPropertyNames]];
    
    // create mapping for StaticPassive DTO
    staticPassiveMapping = [RKObjectMapping mappingForClass:[LoLStaticPassive class]];
    // xcode 6+: need to manually rename/map our response's "description" property to our "staticBasicDataDescription" property
    [staticPassivePropertyNames removeObject:nameOfDescriptionProperty];
    [staticPassiveMapping addAttributeMappingsFromDictionary:@{@"description" : nameOfDescriptionProperty}];
    // map remaining properties
    [staticPassiveMapping addAttributeMappingsFromArray:staticPassivePropertyNames];
    
    // create mapping for StaticRecommended DTO
    staticRecommendedMapping = [RKObjectMapping mappingForClass:[LoLStaticRecommended class]];
    [staticRecommendedMapping addAttributeMappingsFromArray:staticRecommendedPropertyNames];
    
    // create mapping for StaticSkin DTO
    staticSkinMapping = [RKObjectMapping mappingForClass:[LoLStaticSkin class]];
    [staticSkinMapping addAttributeMappingsFromArray:[LoLStaticSkin getAllPropertyNames]];
    
    // create mapping for StaticStats DTO
    staticStatsMapping = [RKObjectMapping mappingForClass:[LoLStaticStats class]];
    [staticStatsMapping addAttributeMappingsFromArray:[LoLStaticStats getAllPropertyNames]];

    // create mapping for StaticLevelTip DTO
    staticLevelTipMapping = [RKObjectMapping mappingForClass:[LoLStaticLevelTip class]];
    [staticLevelTipMapping addAttributeMappingsFromArray:[LoLStaticLevelTip getAllPropertyNames]];
    
    // create mapping for StaticSpellVariables DTO
    staticSpellVariablesMapping = [RKObjectMapping mappingForClass:[LoLStaticSpellVariables class]];
    [staticSpellVariablesMapping addAttributeMappingsFromArray:[LoLStaticSpellVariables getAllPropertyNames]];
    
    // create mapping for StaticBlock DTO
    staticBlockMapping = [RKObjectMapping mappingForClass:[LoLStaticBlock class]];
    [staticBlockMapping addAttributeMappingsFromArray:staticBlockPropertyNames];
    
    // create mapping for StaticBlockItem DTO
    staticBlockItemMapping = [RKObjectMapping mappingForClass:[LoLStaticBlockItem class]];
    [staticBlockItemMapping addAttributeMappingsFromArray:[LoLStaticBlockItem getAllPropertyNames]];
    
    // LoL api uses the champion names as keys into a dictionary of champions
    // since these keys are dynamic, we need to use dynamic mapping
    dynamicStaticChampionListDataMapping = [[RKDynamicMapping alloc] init];
    [dynamicStaticChampionListDataMapping setObjectMappingForRepresentationBlock:^RKObjectMapping*(id representation)
    {
        NSArray* championNames = [representation allKeys];
        RKObjectMapping *championNameAsKeyMapping = [RKObjectMapping mappingForClass:[NSMutableDictionary class]];
        
        
        for (NSString *championName in championNames) {
            [championNameAsKeyMapping addRelationshipMappingWithSourceKeyPath:[NSString stringWithFormat:@"%@", championName] mapping:staticChampionMapping];
        }
        
        return championNameAsKeyMapping;
    }];

    // create relationship mapping to link the dictionary of StaticChampion DTOs to the ChampionList DTO
    [staticChampionListMapping addRelationshipMappingWithSourceKeyPath:@"data" mapping:dynamicStaticChampionListDataMapping];
    
    // create relationship mapping to link the StaticImage DTO to the StaticChampion DTO
    [staticChampionMapping addRelationshipMappingWithSourceKeyPath:@"image" mapping:staticImageMapping];
    
    // create relationship mapping to link the StaticInfo DTO to the StaticChampion DTO
    [staticChampionMapping addRelationshipMappingWithSourceKeyPath:@"info" mapping:staticInfoMapping];
    
    // create relationship mapping to link the StaticPassive DTO to the StaticChampion DTO
    [staticChampionMapping addRelationshipMappingWithSourceKeyPath:@"passive" mapping:staticPassiveMapping];

    // create relationship mapping to link the StaticRecommended DTO to the StaticChampion DTO
    [staticChampionMapping addRelationshipMappingWithSourceKeyPath:@"recommended" mapping:staticRecommendedMapping];

    // create relationship mapping to link the StaticSkin DTO to the StaticChampion DTO
    [staticChampionMapping addRelationshipMappingWithSourceKeyPath:@"skins" mapping:staticSkinMapping];

    // create relationship mapping to link the array of StaticChampionSpell DTOs to the StaticChampion DTO
    [staticChampionMapping addRelationshipMappingWithSourceKeyPath:@"spells" mapping:staticChampionSpellMapping];
    
    // create relationship mapping to link the StaticStats DTO to the StaticChampion DTO
    [staticChampionMapping addRelationshipMappingWithSourceKeyPath:@"stats" mapping:staticStatsMapping];

    // create relationship mapping to link the array of StaticImage DTOs to the StaticChampionSpell DTO
    [staticChampionSpellMapping addRelationshipMappingWithSourceKeyPath:@"altimages" mapping:staticImageMapping];
    
    // create relationship mapping to link the StaticImage DTO to the StaticChampionSpell DTO
    [staticChampionSpellMapping addRelationshipMappingWithSourceKeyPath:@"image" mapping:staticImageMapping];
    
    // create relationship mapping to link the StaticLevelTip DTO to the StaticChampionSpell DTO
    [staticChampionSpellMapping addRelationshipMappingWithSourceKeyPath:@"leveltip" mapping:staticLevelTipMapping];
    
    // create relationship mapping to link the array of StaticSpellVariables DTOs to the StaticChampionSpell DTO
    [staticChampionSpellMapping addRelationshipMappingWithSourceKeyPath:@"vars" mapping:staticSpellVariablesMapping];

    // create relationship mapping to link the StaticImage DTO to the StaticPassive DTO
    [staticPassiveMapping addRelationshipMappingWithSourceKeyPath:@"image" mapping:staticImageMapping];

    // create relationship mapping to link the array of StaticBlock DTOs to the StaticRecommended DTO
    [staticRecommendedMapping addRelationshipMappingWithSourceKeyPath:@"blocks" mapping:staticBlockMapping];
    
    // create relationship mapping to link the array of StaticBlockItem DTOs to the StaticBlock DTO
    [staticBlockMapping addRelationshipMappingWithSourceKeyPath:@"image" mapping:staticBlockItemMapping];
    
    return @[
             [RKResponseDescriptor responseDescriptorWithMapping:staticChampionListMapping
                                                          method:RKRequestMethodGET
                                                     pathPattern:[NSString stringWithFormat:@"%@/champion", self.relativePathToBaseURL]
                                                         keyPath:nil
                                                     statusCodes:nil],
             [RKResponseDescriptor responseDescriptorWithMapping:staticChampionMapping
                                                          method:RKRequestMethodGET
                                                     pathPattern:[NSString stringWithFormat:@"%@/champion/:championId", self.relativePathToBaseURL]
                                                         keyPath:nil
                                                     statusCodes:nil]
             ];
}


- (NSArray*)loadStaticItemDTOMapping
{
    RKObjectMapping *staticItemListMapping;
    RKObjectMapping *staticBasicDataMapping;
    RKObjectMapping *staticGroupMapping;
    RKObjectMapping *staticItemMapping;
    RKObjectMapping *staticItemTreeMapping;
    RKObjectMapping *staticBasicDataStatsMapping;
    RKObjectMapping *staticGoldMapping;
    RKObjectMapping *staticImageMapping;
    RKObjectMapping *staticMetaDataMapping;
    RKDynamicMapping *dynamicItemMapping;
    NSMutableArray *staticItemListPropertyNames = [LoLStaticItemList getAllPropertyNames];
    NSMutableArray *staticBasicDataPropertyNames = [LoLStaticBasicData getAllPropertyNames];
    NSMutableArray *staticItemPropertyNames = [LoLStaticItem getAllPropertyNames];
    NSString *nameOfDescriptionProperty = @"rawDescription";
    
    
    // remove any relationship mapping attributes to avoid "duplicate mapping" error
    [staticItemListPropertyNames removeObjectsInArray:@[@"basic", @"data", @"groups", @"tree"]];
    [staticBasicDataPropertyNames removeObjectsInArray:@[@"gold", @"image", @"rune", @"stats"]];
    [staticItemPropertyNames removeObjectsInArray:@[@"gold", @"image", @"rune", @"stats"]];

    // create mapping for StaticItemList DTO
    staticItemListMapping = [RKObjectMapping mappingForClass:[LoLStaticItemList class]];
    [staticItemListMapping addAttributeMappingsFromArray:staticItemListPropertyNames];
    
    // create mapping for StaticBasicData DTO
    staticBasicDataMapping = [RKObjectMapping mappingForClass:[LoLStaticBasicData class]];
    // xcode 6+: need to manually rename/map our response's "description" property to our "staticBasicDataDescription" property
    [staticBasicDataPropertyNames removeObject:nameOfDescriptionProperty];
    [staticBasicDataMapping addAttributeMappingsFromDictionary:@{@"description" : nameOfDescriptionProperty}];
    // map remaining properties
    [staticBasicDataMapping addAttributeMappingsFromArray:staticBasicDataPropertyNames];
    
    // create mapping for StaticGroup DTO
    staticGroupMapping = [RKObjectMapping mappingForClass:[LoLStaticGroup class]];
    [staticGroupMapping addAttributeMappingsFromArray:[LoLStaticGroup getAllPropertyNames]];
    
    // create mapping for StaticItem DTO
    staticItemMapping = [RKObjectMapping mappingForClass:[LoLStaticItem class]];
    // xcode 6+: need to manually rename/map our response's "description" property to our "staticBasicDataDescription" property
    [staticItemPropertyNames removeObject:nameOfDescriptionProperty];
    [staticItemMapping addAttributeMappingsFromDictionary:@{@"description" : nameOfDescriptionProperty}];
    // map remaining properties
    [staticItemMapping addAttributeMappingsFromArray:staticItemPropertyNames];
    
    // create mapping for StaticItemTree DTO
    staticItemTreeMapping = [RKObjectMapping mappingForClass:[LoLStaticItemTree class]];
    [staticItemTreeMapping addAttributeMappingsFromArray:[LoLStaticItemTree getAllPropertyNames]];
    
    // create mapping for StaticBasicDataStats DTO
    staticBasicDataStatsMapping = [RKObjectMapping mappingForClass:[LoLStaticBasicDataStats class]];
    [staticBasicDataStatsMapping addAttributeMappingsFromArray:[LoLStaticBasicDataStats getAllPropertyNames]];

    // create mapping for StaticGold DTO
    staticGoldMapping = [RKObjectMapping mappingForClass:[LoLStaticGold class]];
    [staticGoldMapping addAttributeMappingsFromArray:[LoLStaticGold getAllPropertyNames]];

    // create mapping for StaticImage DTO
    staticImageMapping = [RKObjectMapping mappingForClass:[LoLStaticImage class]];
    [staticImageMapping addAttributeMappingsFromArray:[LoLStaticImage getAllPropertyNames]];

    // create mapping for StaticMetaData DTO
    staticMetaDataMapping = [RKObjectMapping mappingForClass:[LoLStaticMetaData class]];
    [staticMetaDataMapping addAttributeMappingsFromArray:[LoLStaticMetaData getAllPropertyNames]];
    
    // create relationship mapping to link the StaticBasicData DTO to the StaticItemList DTO
    [staticItemListMapping addRelationshipMappingWithSourceKeyPath:@"basic" mapping:staticBasicDataMapping];

    // LoL api uses the item ids as keys into a dictionary of items
    // since these keys are dynamic, we need to use dynamic mapping
    dynamicItemMapping = [[RKDynamicMapping alloc] init];
    [dynamicItemMapping setObjectMappingForRepresentationBlock:^RKObjectMapping*(id representation)
     {
         NSArray* itemIDs = [representation allKeys];
         RKObjectMapping *itemIDAsKeyMapping = [RKObjectMapping mappingForClass:[NSMutableDictionary class]];
         
         
         for (NSNumber *itemID in itemIDs) {
             [itemIDAsKeyMapping addRelationshipMappingWithSourceKeyPath:[NSString stringWithFormat:@"%@", itemID] mapping:staticItemMapping];
         }
         
         return itemIDAsKeyMapping;
     }];

    // create relationship mapping to link the dictionary of StaticItem DTOs to the StaticItemList DTO
    [staticItemListMapping addRelationshipMappingWithSourceKeyPath:@"data" mapping:dynamicItemMapping];

    // create relationship mapping to link the array of StaticGroup DTOs to the StaticItemList DTO
    [staticItemListMapping addRelationshipMappingWithSourceKeyPath:@"groups" mapping:staticGroupMapping];

    // create relationship mapping to link the array of StaticItemTree DTOs to the StaticItemList DTO
    [staticItemListMapping addRelationshipMappingWithSourceKeyPath:@"tree" mapping:staticItemTreeMapping];
    
    // create relationship mapping to link the StaticGold DTO to the StaticBasicData DTO
    [staticBasicDataMapping addRelationshipMappingWithSourceKeyPath:@"gold" mapping:staticGoldMapping];

    // create relationship mapping to link the StaticImage DTO to the StaticBasicData DTO
    [staticBasicDataMapping addRelationshipMappingWithSourceKeyPath:@"image" mapping:staticImageMapping];
    
    // create relationship mapping to link the StaticMetaData DTO to the StaticBasicData DTO
    [staticBasicDataMapping addRelationshipMappingWithSourceKeyPath:@"rune" mapping:staticMetaDataMapping];
    
    // create relationship mapping to link the StaticBasicDataStats DTO to the StaticBasicData DTO
    [staticBasicDataMapping addRelationshipMappingWithSourceKeyPath:@"stats" mapping:staticBasicDataStatsMapping];
    
    // create relationship mapping to link the StaticGold DTO to the StaticItem DTO
    [staticImageMapping addRelationshipMappingWithSourceKeyPath:@"gold" mapping:staticGoldMapping];
    
    // create relationship mapping to link the StaticImage DTO to the StaticItem DTO
    [staticImageMapping addRelationshipMappingWithSourceKeyPath:@"image" mapping:staticImageMapping];

    // create relationship mapping to link the StaticMetaData DTO to the StaticItem DTO
    [staticImageMapping addRelationshipMappingWithSourceKeyPath:@"rune" mapping:staticMetaDataMapping];

    // create relationship mapping to link the StaticBasicDataStats DTO to the StaticItem DTO
    [staticImageMapping addRelationshipMappingWithSourceKeyPath:@"stats" mapping:staticBasicDataStatsMapping];
    
    return @[
             [RKResponseDescriptor responseDescriptorWithMapping:staticItemListMapping
                                                          method:RKRequestMethodGET
                                                     pathPattern:[NSString stringWithFormat:@"%@/item", self.relativePathToBaseURL]
                                                         keyPath:nil
                                                     statusCodes:nil],
             [RKResponseDescriptor responseDescriptorWithMapping:staticItemMapping
                                                          method:RKRequestMethodGET
                                                     pathPattern:[NSString stringWithFormat:@"%@/item/:itemId", self.relativePathToBaseURL]
                                                         keyPath:nil
                                                     statusCodes:nil]
             ];
}


- (NSArray*)loadStaticMasteryDTOMapping
{
    RKObjectMapping *staticMasteryListMapping;
    RKObjectMapping *staticMasteryMapping;
    RKObjectMapping *staticMasteryTreeMapping;
    RKObjectMapping *staticImageMapping;
    RKObjectMapping *staticMasteryTreeListMapping;
    RKObjectMapping *staticMasteryTreeItemMapping;
    RKDynamicMapping *dynamicStaticMasteryMapping;
    NSMutableArray *staticMasteryListPropertyNames = [LoLStaticMasteryList getAllPropertyNames];
    NSMutableArray *staticMasteryPropertyNames = [LoLStaticMastery getAllPropertyNames];
    NSMutableArray *staticMasteryTreePropertyNames = [LoLStaticMasteryTree getAllPropertyNames];
    NSMutableArray *staticMasteryTreeListPropertyNames = [LoLStaticMasteryTreeList getAllPropertyNames];
    NSString *nameOfDescriptionProperty = @"rawDescription";
    
    
    // remove any relationship mapping attributes to avoid "duplicate mapping" error
    [staticMasteryListPropertyNames removeObjectsInArray:@[@"data", @"tree"]];
    [staticMasteryPropertyNames removeObjectsInArray:@[@"image"]];
    [staticMasteryTreePropertyNames removeObjectsInArray:@[@"Defense", @"Offense", @"Utility"]];
    [staticMasteryTreeListPropertyNames removeObjectsInArray:@[@"masteryTreeItems"]];

    // create mapping for StaticMasteryList DTO
    staticMasteryListMapping = [RKObjectMapping mappingForClass:[LoLStaticMasteryList class]];
    [staticMasteryListMapping addAttributeMappingsFromArray:staticMasteryListPropertyNames];
    
    // create mapping for StaticMastery DTO
    staticMasteryMapping = [RKObjectMapping mappingForClass:[LoLStaticMastery class]];
    // xcode 6+: need to manually rename/map our response's "description" property to our "staticBasicDataDescription" property
    [staticMasteryPropertyNames removeObject:nameOfDescriptionProperty];
    [staticMasteryMapping addAttributeMappingsFromDictionary:@{@"description" : nameOfDescriptionProperty}];
    // map remaining properties
    [staticMasteryMapping addAttributeMappingsFromArray:staticMasteryPropertyNames];
    
    // create mapping for StaticMasteryTree DTO
    staticMasteryTreeMapping = [RKObjectMapping mappingForClass:[LoLStaticMasteryTree class]];
    [staticMasteryTreeMapping addAttributeMappingsFromArray:staticMasteryTreePropertyNames];
    
    // create mapping for StaticImage DTO
    staticImageMapping = [RKObjectMapping mappingForClass:[LoLStaticImage class]];
    [staticImageMapping addAttributeMappingsFromArray:[LoLStaticImage getAllPropertyNames]];
    
    // create mapping for StaticMasteryTreeList DTO
    staticMasteryTreeListMapping = [RKObjectMapping mappingForClass:[LoLStaticMasteryTreeList class]];
    [staticMasteryTreeListMapping addAttributeMappingsFromArray:staticMasteryTreeListPropertyNames];

    // create mapping for StaticMasteryTreeItem DTO
    staticMasteryTreeItemMapping = [RKObjectMapping mappingForClass:[LoLStaticMasteryTreeItem class]];
    [staticMasteryTreeItemMapping addAttributeMappingsFromArray:[LoLStaticMasteryTreeItem getAllPropertyNames]];
    
    // LoL api uses the mastery ids as keys into a dictionary of masteries
    // since these keys are dynamic, we need to use dynamic mapping
    dynamicStaticMasteryMapping = [[RKDynamicMapping alloc] init];
    [dynamicStaticMasteryMapping setObjectMappingForRepresentationBlock:^RKObjectMapping*(id representation)
     {
         NSArray* masteryIDs = [representation allKeys];
         RKObjectMapping *masteryIDAsKeyMapping = [RKObjectMapping mappingForClass:[NSMutableDictionary class]];
         
         
         for (NSNumber *masteryID in masteryIDs) {
             [masteryIDAsKeyMapping addRelationshipMappingWithSourceKeyPath:[NSString stringWithFormat:@"%@", masteryID] mapping:staticMasteryMapping];
         }
         
         return masteryIDAsKeyMapping;
     }];

    // create relationship mapping to link the dictionary of StaticMastery DTOs to the StaticMasteryList DTO
    [staticMasteryListMapping addRelationshipMappingWithSourceKeyPath:@"data" mapping:dynamicStaticMasteryMapping];
    
    // create relationship mapping to link the StaticMasteryTree DTO to the StaticMasteryList DTO
    [staticMasteryListMapping addRelationshipMappingWithSourceKeyPath:@"tree" mapping:staticMasteryTreeMapping];
    
    // create relationship mapping to link the StaticImage DTO to the StaticMastery DTO
    [staticMasteryMapping addRelationshipMappingWithSourceKeyPath:@"image" mapping:staticImageMapping];
    
    // create relationship mapping to link the array of StaticMasteryTreeList DTOs to the StaticMasteryTree DTO
    [staticMasteryTreeMapping addRelationshipMappingWithSourceKeyPath:@"Defense" mapping:staticMasteryTreeListMapping];
    
    // create relationship mapping to link the array of StaticMasteryTreeList DTOs to the StaticMasteryTree DTO
    [staticMasteryTreeMapping addRelationshipMappingWithSourceKeyPath:@"Offense" mapping:staticMasteryTreeListMapping];
    
    // create relationship mapping to link the array of StaticMasteryTreeList DTOs to the StaticMasteryTree DTO
    [staticMasteryTreeMapping addRelationshipMappingWithSourceKeyPath:@"Utility" mapping:staticMasteryTreeListMapping];
    
    // create relationship mapping to link the array of StaticMasteryTreeItem DTOs to the StaticMasteryTreeList DTO
    [staticMasteryTreeListMapping addRelationshipMappingWithSourceKeyPath:@"Utility" mapping:staticMasteryTreeItemMapping];
    
    return @[
             [RKResponseDescriptor responseDescriptorWithMapping:staticMasteryListMapping
                                                          method:RKRequestMethodGET
                                                     pathPattern:[NSString stringWithFormat:@"%@/mastery", self.relativePathToBaseURL]
                                                         keyPath:nil
                                                     statusCodes:nil],
             [RKResponseDescriptor responseDescriptorWithMapping:staticMasteryMapping
                                                          method:RKRequestMethodGET
                                                     pathPattern:[NSString stringWithFormat:@"%@/mastery/:masteryId", self.relativePathToBaseURL]
                                                         keyPath:nil
                                                     statusCodes:nil]
             ];
}


- (RKResponseDescriptor*)loadStaticRealmDTOMapping
{
    RKObjectMapping *staticRealmMapping;
    
    
    // create mapping for StaticMasteryList DTO
    staticRealmMapping = [RKObjectMapping mappingForClass:[LoLStaticRealm class]];
    [staticRealmMapping addAttributeMappingsFromArray:[LoLStaticRealm getAllPropertyNames]];
    
    return [RKResponseDescriptor responseDescriptorWithMapping:staticRealmMapping
                                                        method:RKRequestMethodGET
                                                   pathPattern:[NSString stringWithFormat:@"%@/realm", self.relativePathToBaseURL]
                                                       keyPath:nil
                                                   statusCodes:nil];
}


- (NSArray*)loadStaticRuneDTOMapping
{
    RKObjectMapping *staticRuneListMapping;
    RKObjectMapping *staticBasicDataMapping;
    RKObjectMapping *staticRuneMapping;
    RKObjectMapping *staticBasicDataStatsMapping;
    RKObjectMapping *staticGoldMapping;
    RKObjectMapping *staticImageMapping;
    RKObjectMapping *staticMetaDataMapping;
    RKDynamicMapping *dynamicStaticRuneMapping;
    NSMutableArray *staticRuneListPropertyNames = [LoLStaticRuneList getAllPropertyNames];
    NSMutableArray *staticBasicDataPropertyNames = [LoLStaticBasicData getAllPropertyNames];
    NSMutableArray *staticRunePropertyNames = [LoLStaticRune getAllPropertyNames];
    NSString *nameOfDescriptionProperty = @"rawDescription";

    
    // remove any relationship mapping attributes to avoid "duplicate mapping" error
    [staticRuneListPropertyNames removeObjectsInArray:@[@"basic", @"data"]];
    [staticBasicDataPropertyNames removeObjectsInArray:@[@"gold", @"image", @"rune", @"stats"]];
    [staticRunePropertyNames removeObjectsInArray:@[@"gold", @"image", @"rune", @"stats"]];
    
    // create mapping for StaticRuneList DTO
    staticRuneListMapping = [RKObjectMapping mappingForClass:[LoLStaticRuneList class]];
    [staticRuneListMapping addAttributeMappingsFromArray:staticRuneListPropertyNames];

    // create mapping for StaticBasicData DTO
    staticBasicDataMapping = [RKObjectMapping mappingForClass:[LoLStaticBasicData class]];
    // xcode 6+: need to manually rename/map our response's "description" property to our "staticBasicDataDescription" property
    [staticBasicDataPropertyNames removeObject:nameOfDescriptionProperty];
    [staticBasicDataMapping addAttributeMappingsFromDictionary:@{@"description" : nameOfDescriptionProperty}];
    // map remaining properties
    [staticBasicDataMapping addAttributeMappingsFromArray:staticBasicDataPropertyNames];
    
    // create mapping for StaticRune DTO
    staticRuneMapping = [RKObjectMapping mappingForClass:[LoLStaticRune class]];
    // xcode 6+: need to manually rename/map our response's "description" property to our "staticBasicDataDescription" property
    [staticRunePropertyNames removeObject:nameOfDescriptionProperty];
    [staticRuneMapping addAttributeMappingsFromDictionary:@{@"description" : nameOfDescriptionProperty}];
    // map remaining properties
    [staticRuneMapping addAttributeMappingsFromArray:staticRunePropertyNames];

    // create mapping for StaticBasicDataStats DTO
    staticBasicDataStatsMapping = [RKObjectMapping mappingForClass:[LoLStaticBasicDataStats class]];
    [staticBasicDataStatsMapping addAttributeMappingsFromArray:[LoLStaticBasicDataStats getAllPropertyNames]];
    
    // create mapping for StaticGold DTO
    staticGoldMapping = [RKObjectMapping mappingForClass:[LoLStaticGold class]];
    [staticGoldMapping addAttributeMappingsFromArray:[LoLStaticGold getAllPropertyNames]];
    
    // create mapping for StaticImage DTO
    staticImageMapping = [RKObjectMapping mappingForClass:[LoLStaticImage class]];
    [staticImageMapping addAttributeMappingsFromArray:[LoLStaticImage getAllPropertyNames]];
    
    // create mapping for StaticMetaData DTO
    staticMetaDataMapping = [RKObjectMapping mappingForClass:[LoLStaticMetaData class]];
    [staticMetaDataMapping addAttributeMappingsFromArray:[LoLStaticMetaData getAllPropertyNames]];
    
    // create relationship mapping to link the StaticBasicData DTO to the StaticRuneList DTO
    [staticRuneListMapping addRelationshipMappingWithSourceKeyPath:@"basic" mapping:staticBasicDataMapping];
    
    // LoL api uses the rune ids as keys into a dictionary of runes
    // since these keys are dynamic, we need to use dynamic mapping
    dynamicStaticRuneMapping = [[RKDynamicMapping alloc] init];
    [dynamicStaticRuneMapping setObjectMappingForRepresentationBlock:^RKObjectMapping*(id representation)
     {
         NSArray* runeIDs = [representation allKeys];
         RKObjectMapping *runeIDAsKeyMapping = [RKObjectMapping mappingForClass:[NSMutableDictionary class]];
         
         
         for (NSNumber *runeID in runeIDs) {
             [runeIDAsKeyMapping addRelationshipMappingWithSourceKeyPath:[NSString stringWithFormat:@"%@", runeID] mapping:staticRuneMapping];
         }
         
         return runeIDAsKeyMapping;
     }];
    
    // create relationship mapping to link the dictionary of StaticRune DTOs to the StaticRuneList DTO
    [staticRuneListMapping addRelationshipMappingWithSourceKeyPath:@"data" mapping:dynamicStaticRuneMapping];
    
    // create relationship mapping to link the StaticGold DTO to the StaticBasicData DTO
    [staticBasicDataMapping addRelationshipMappingWithSourceKeyPath:@"gold" mapping:staticGoldMapping];
    
    // create relationship mapping to link the StaticImage DTO to the StaticBasicData DTO
    [staticBasicDataMapping addRelationshipMappingWithSourceKeyPath:@"image" mapping:staticImageMapping];
    
    // create relationship mapping to link the StaticMetaData DTO to the StaticBasicData DTO
    [staticBasicDataMapping addRelationshipMappingWithSourceKeyPath:@"rune" mapping:staticMetaDataMapping];
    
    // create relationship mapping to link the StaticBasicDataStats DTO to the StaticBasicData DTO
    [staticBasicDataMapping addRelationshipMappingWithSourceKeyPath:@"stats" mapping:staticBasicDataStatsMapping];
    
    // create relationship mapping to link the StaticGold DTO to the StaticRune DTO
    [staticRuneMapping addRelationshipMappingWithSourceKeyPath:@"gold" mapping:staticGoldMapping];
    
    // create relationship mapping to link the StaticImage DTO to the StaticRune DTO
    [staticRuneMapping addRelationshipMappingWithSourceKeyPath:@"image" mapping:staticImageMapping];

    // create relationship mapping to link the StaticMetaData DTO to the StaticRune DTO
    [staticRuneMapping addRelationshipMappingWithSourceKeyPath:@"rune" mapping:staticMetaDataMapping];
    
    // create relationship mapping to link the StaticBasicDataStats DTO to the StaticRune DTO
    [staticRuneMapping addRelationshipMappingWithSourceKeyPath:@"stats" mapping:staticBasicDataStatsMapping];
    
    
    return @[
             [RKResponseDescriptor responseDescriptorWithMapping:staticRuneListMapping
                                                          method:RKRequestMethodGET
                                                     pathPattern:[NSString stringWithFormat:@"%@/rune", self.relativePathToBaseURL]
                                                         keyPath:nil
                                                     statusCodes:nil],
             [RKResponseDescriptor responseDescriptorWithMapping:staticRuneMapping
                                                          method:RKRequestMethodGET
                                                     pathPattern:[NSString stringWithFormat:@"%@/rune/:runeId", self.relativePathToBaseURL]
                                                         keyPath:nil
                                                     statusCodes:nil]
             ];
}


- (NSArray*)loadStaticSpellDTOMapping
{
    RKObjectMapping *staticSummonerSpellListMapping;
    RKObjectMapping *staticSummonerSpellMapping;
    RKObjectMapping *staticImageMapping;
    RKObjectMapping *staticLevelTipMapping;
    RKObjectMapping *staticSpellVariablesMapping;
    RKDynamicMapping *dynamicStaticSummonerSpellMapping;
    NSMutableArray *staticSummonerSpellListPropertyNames = [LoLStaticSummonerSpellList getAllPropertyNames];
    NSMutableArray *staticSummonerSpellPropertyNames = [LoLStaticSummonerSpell getAllPropertyNames];
    NSString *nameOfDescriptionProperty = @"rawDescription";

    
    // remove any relationship mapping attributes to avoid "duplicate mapping" error
    [staticSummonerSpellListPropertyNames removeObjectsInArray:@[@"data"]];
    [staticSummonerSpellPropertyNames removeObjectsInArray:@[@"image", @"leveltip", @"vars"]];
    
    // create mapping for StaticSummonerSpellList DTO
    staticSummonerSpellListMapping = [RKObjectMapping mappingForClass:[LoLStaticSummonerSpellList class]];
    [staticSummonerSpellListMapping addAttributeMappingsFromArray:staticSummonerSpellListPropertyNames];

    // create mapping for StaticSummonerSpell DTO
    staticSummonerSpellMapping = [RKObjectMapping mappingForClass:[LoLStaticSummonerSpell class]];
    // xcode 6+: need to manually rename/map our response's "description" property to our "staticBasicDataDescription" property
    [staticSummonerSpellPropertyNames removeObject:nameOfDescriptionProperty];
    [staticSummonerSpellMapping addAttributeMappingsFromDictionary:@{@"description" : nameOfDescriptionProperty}];
    // map remaining properties
    [staticSummonerSpellMapping addAttributeMappingsFromArray:staticSummonerSpellPropertyNames];
    
    // create mapping for StaticImage DTO
    staticImageMapping = [RKObjectMapping mappingForClass:[LoLStaticImage class]];
    [staticImageMapping addAttributeMappingsFromArray:[LoLStaticImage getAllPropertyNames]];
    
    // create mapping for StaticLevelTip DTO
    staticLevelTipMapping = [RKObjectMapping mappingForClass:[LoLStaticLevelTip class]];
    [staticLevelTipMapping addAttributeMappingsFromArray:[LoLStaticLevelTip getAllPropertyNames]];
    
    // create mapping for StaticSpellVariables DTO
    staticSpellVariablesMapping = [RKObjectMapping mappingForClass:[LoLStaticSpellVariables class]];
    [staticSpellVariablesMapping addAttributeMappingsFromArray:[LoLStaticSpellVariables getAllPropertyNames]];
    
    // LoL api uses the summoner spell ids as keys into a dictionary of summoner spells
    // since these keys are dynamic, we need to use dynamic mapping
    dynamicStaticSummonerSpellMapping = [[RKDynamicMapping alloc] init];
    [dynamicStaticSummonerSpellMapping setObjectMappingForRepresentationBlock:^RKObjectMapping*(id representation)
     {
         NSArray* summonerSpellIDs = [representation allKeys];
         RKObjectMapping *summonerSpellIDAsKeyMapping = [RKObjectMapping mappingForClass:[NSMutableDictionary class]];
         
         
         for (NSNumber *summonerSpellID in summonerSpellIDs) {
             [summonerSpellIDAsKeyMapping addRelationshipMappingWithSourceKeyPath:[NSString stringWithFormat:@"%@", summonerSpellID] mapping:staticSummonerSpellMapping];
         }
         
         return summonerSpellIDAsKeyMapping;
     }];
    
    // create relationship mapping to link the dictionary of StaticSummonerSpell DTOs to the StaticSummonerSpellList DTO
    [staticSummonerSpellListMapping addRelationshipMappingWithSourceKeyPath:@"data" mapping:dynamicStaticSummonerSpellMapping];
    
    // create relationship mapping to link the StaticImage DTO to the StaticSummonerSpell DTO
    [staticSummonerSpellMapping addRelationshipMappingWithSourceKeyPath:@"image" mapping:staticImageMapping];
    
    // create relationship mapping to link the StaticLevelTip DTO to the StaticSummonerSpell DTO
    [staticSummonerSpellMapping addRelationshipMappingWithSourceKeyPath:@"leveltip" mapping:staticLevelTipMapping];
    
    // create relationship mapping to link the StaticSpellVariables DTO to the StaticSummonerSpell DTO
    [staticSummonerSpellMapping addRelationshipMappingWithSourceKeyPath:@"vars" mapping:staticSpellVariablesMapping];
    
    return @[
             [RKResponseDescriptor responseDescriptorWithMapping:staticSummonerSpellListMapping
                                                          method:RKRequestMethodGET
                                                     pathPattern:[NSString stringWithFormat:@"%@/summoner-spell", self.relativePathToBaseURL]
                                                         keyPath:nil
                                                     statusCodes:nil],
             [RKResponseDescriptor responseDescriptorWithMapping:staticSummonerSpellMapping
                                                          method:RKRequestMethodGET
                                                     pathPattern:[NSString stringWithFormat:@"%@/summoner-spell/:spellId", self.relativePathToBaseURL]
                                                         keyPath:nil
                                                     statusCodes:nil]
             ];
}


#pragma  mark - Internal Methods
- (NSString*)buildStaticChampDataParametersAsQueryString:(LoLStaticChampData)champDataTags
{
    NSMutableArray *champDataParamaters = [[NSMutableArray alloc] init];
    
    
    if (champDataTags) {
        if (champDataTags & LoLStaticChampDataAll) {
            [champDataParamaters addObject:@"all"];
        } else {
            if (champDataTags & LoLStaticChampDataAllyTips) {
                [champDataParamaters addObject:@"allytips"];
            }
            
            if (champDataTags & LoLStaticChampDataAltImages) {
                [champDataParamaters addObject:@"altimages"];
            }
            
            if (champDataTags & LoLStaticChampDataBlurb) {
                [champDataParamaters addObject:@"blurb"];
            }
            
            if (champDataTags & LoLStaticChampDataEnemyTips) {
                [champDataParamaters addObject:@"enemytips"];
            }
            
            if (champDataTags & LoLStaticChampDataImage) {
                [champDataParamaters addObject:@"image"];
            }
            
            if (champDataTags & LoLStaticChampDataInfo) {
                [champDataParamaters addObject:@"info"];
            }
            
            if (champDataTags & LoLStaticChampDataLore) {
                [champDataParamaters addObject:@"lore"];
            }
            
            if (champDataTags & LoLStaticChampDataParamaterType) {
                [champDataParamaters addObject:@"partype"];
            }
            
            if (champDataTags & LoLStaticChampDataPassive) {
                [champDataParamaters addObject:@"passive"];
            }
            
            if (champDataTags & LoLStaticChampDataRecommended) {
                [champDataParamaters addObject:@"recommended"];
            }
            
            if (champDataTags & LoLStaticChampDataSkins) {
                [champDataParamaters addObject:@"skins"];
            }
            
            if (champDataTags & LoLStaticChampDataSpells) {
                [champDataParamaters addObject:@"spells"];
            }
            
            if (champDataTags & LoLStaticChampDataStats) {
                [champDataParamaters addObject:@"stats"];
            }
            
            if (champDataTags & LoLStaticChampDataTags) {
                [champDataParamaters addObject:@"tags"];
            }
        }
    }

    return [champDataParamaters componentsJoinedByString:@","];
}


- (NSString*)buildStaticItemDataParametersAsQueryString:(LoLStaticItemData)itemDataTags
{
    NSMutableArray *itemDataParamaters = [[NSMutableArray alloc] init];
    
    
    if (itemDataTags) {
        if (itemDataTags & LoLStaticItemDataAll) {
            [itemDataParamaters addObject:@"all"];
        } else {
            if (itemDataTags & LoLStaticItemDataColloquial) {
                [itemDataParamaters addObject:@"colloq"];
            }
            
            if (itemDataTags & LoLStaticItemDataConsumeOnFull) {
                [itemDataParamaters addObject:@"consumeOnFull"];
            }
            
            if (itemDataTags & LoLStaticItemDataConsumed) {
                [itemDataParamaters addObject:@"consumed"];
            }
            
            if (itemDataTags & LoLStaticItemDataDepth) {
                [itemDataParamaters addObject:@"depth"];
            }
            
            if (itemDataTags & LoLStaticItemDataFrom) {
                [itemDataParamaters addObject:@"from"];
            }
            
            if (itemDataTags & LoLStaticItemDataGold) {
                [itemDataParamaters addObject:@"gold"];
            }
            
            if (itemDataTags & LoLStaticItemDataGroups) {
                [itemDataParamaters addObject:@"groups"];
            }
            
            if (itemDataTags & LoLStaticItemDataHideFromAll) {
                [itemDataParamaters addObject:@"hideFromAll"];
            }
            
            if (itemDataTags & LoLStaticItemDataImage) {
                [itemDataParamaters addObject:@"image"];
            }
            
            if (itemDataTags & LoLStaticItemDataInStore) {
                [itemDataParamaters addObject:@"inStore"];
            }
            
            if (itemDataTags & LoLStaticItemDataInto) {
                [itemDataParamaters addObject:@"into"];
            }
            
            if (itemDataTags & LoLStaticItemDataMaps) {
                [itemDataParamaters addObject:@"maps"];
            }
            
            if (itemDataTags & LoLStaticItemDataRequiredChampion) {
                [itemDataParamaters addObject:@"requiredChampion"];
            }
            
            if (itemDataTags & LoLStaticItemDataSanitizedDescription) {
                [itemDataParamaters addObject:@"sanitizedDescription"];
            }
            
            if (itemDataTags & LoLStaticItemDataSpecialRecipe) {
                [itemDataParamaters addObject:@"specialRecipe"];
            }
            
            if (itemDataTags & LoLStaticItemDataStacks) {
                [itemDataParamaters addObject:@"stacks"];
            }
            
            if (itemDataTags & LoLStaticItemDataStats) {
                [itemDataParamaters addObject:@"stats"];
            }
            
            if (itemDataTags & LoLStaticItemDataTags) {
                [itemDataParamaters addObject:@"tags"];
            }
            
            if (itemDataTags & LoLStaticItemDataTree) {
                [itemDataParamaters addObject:@"tree"];
            }
        }
    }
    
    return [itemDataParamaters componentsJoinedByString:@","];
}


- (NSString*)buildStaticMasteryDataParametersAsQueryString:(LoLStaticMasteryData)masteryDataTags
{
    NSMutableArray *masteryDataParamaters = [[NSMutableArray alloc] init];
    
    
    if (masteryDataTags) {
        if (masteryDataTags & LoLStaticMasteryDataAll) {
            [masteryDataParamaters addObject:@"all"];
        } else {
            if (masteryDataTags & LoLStaticMasteryDataImage) {
                [masteryDataParamaters addObject:@"image"];
            }
            
            if (masteryDataTags & LoLStaticMasteryDataPreRequisites) {
                [masteryDataParamaters addObject:@"prereq"];
            }
            
            if (masteryDataTags & LoLStaticMasteryDataRanks) {
                [masteryDataParamaters addObject:@"ranks"];
            }

            if (masteryDataTags & LoLStaticMasteryDataSanitizedDescription) {
                [masteryDataParamaters addObject:@"sanitizedDescription"];
            }
            
            if (masteryDataTags & LoLStaticMasteryDataTree) {
                [masteryDataParamaters addObject:@"tree"];
            }
        }
    }
    
    return [masteryDataParamaters componentsJoinedByString:@","];
}


- (NSString*)buildStaticRuneDataParametersAsQueryString:(LoLStaticRuneData)runeDataTags
{
    NSMutableArray *runeDataParamaters = [[NSMutableArray alloc] init];
    
    
    if (runeDataTags) {
        if (runeDataTags & LoLStaticRuneDataAll) {
            [runeDataParamaters addObject:@"all"];
        } else {
            if (runeDataTags & LoLStaticRuneDataBasic) {
                [runeDataParamaters addObject:@"basic"];
            }
            
            if (runeDataTags & LoLStaticRuneDataColloquial) {
                [runeDataParamaters addObject:@"colloq"];
            }
            
            if (runeDataTags & LoLStaticRuneDataConsumeOnFull) {
                [runeDataParamaters addObject:@"consumeOnFull"];
            }
            
            if (runeDataTags & LoLStaticRuneDataConsumed) {
                [runeDataParamaters addObject:@"consumed"];
            }
            
            if (runeDataTags & LoLStaticRuneDataDepth) {
                [runeDataParamaters addObject:@"depth"];
            }
            
            if (runeDataTags & LoLStaticRuneDataFrom) {
                [runeDataParamaters addObject:@"from"];
            }
            
            if (runeDataTags & LoLStaticRuneDataGold) {
                [runeDataParamaters addObject:@"gold"];
            }
            
            if (runeDataTags & LoLStaticRuneDataHideFromAll) {
                [runeDataParamaters addObject:@"hideFromAll"];
            }
            
            if (runeDataTags & LoLStaticRuneDataImage) {
                [runeDataParamaters addObject:@"image"];
            }
            
            if (runeDataTags & LoLStaticRuneDataInStore) {
                [runeDataParamaters addObject:@"inStore"];
            }
            
            if (runeDataTags & LoLStaticRuneDataInto) {
                [runeDataParamaters addObject:@"into"];
            }
            
            if (runeDataTags & LoLStaticRuneDataMaps) {
                [runeDataParamaters addObject:@"maps"];
            }
            
            if (runeDataTags & LoLStaticRuneDataRequiredChampion) {
                [runeDataParamaters addObject:@"requiredChampion"];
            }
            
            if (runeDataTags & LoLStaticRuneDataSanitizedDescription) {
                [runeDataParamaters addObject:@"sanitizedDescription"];
            }
            
            if (runeDataTags & LoLStaticRuneDataSpecialRecipe) {
                [runeDataParamaters addObject:@"specialRecipe"];
            }
            
            if (runeDataTags & LoLStaticRuneDataStacks) {
                [runeDataParamaters addObject:@"stacks"];
            }
            
            if (runeDataTags & LoLStaticRuneDataStats) {
                [runeDataParamaters addObject:@"stats"];
            }
            
            if (runeDataTags & LoLStaticRuneDataTags) {
                [runeDataParamaters addObject:@"tags"];
            }
        }
    }
    
    return [runeDataParamaters componentsJoinedByString:@","];
}


- (NSString*)buildStaticSpellDataParametersAsQueryString:(LoLStaticSpellData)spellDataTags
{
    NSMutableArray *spellDataParamaters = [[NSMutableArray alloc] init];
    
    
    if (spellDataTags) {
        if (spellDataTags & LoLStaticSpellDataAll) {
            [spellDataParamaters addObject:@"all"];
        } else {
            if (spellDataTags & LoLStaticSpellDataCooldown) {
                [spellDataParamaters addObject:@"cooldown"];
            }
            
            if (spellDataTags & LoLStaticSpellDataCooldownBurn) {
                [spellDataParamaters addObject:@"cooldownBurn"];
            }
            
            if (spellDataTags & LoLStaticSpellDataCost) {
                [spellDataParamaters addObject:@"cost"];
            }

            if (spellDataTags & LoLStaticSpellDataCostBurn) {
                [spellDataParamaters addObject:@"costBurn"];
            }
            
            if (spellDataTags & LoLStaticSpellDataCostType) {
                [spellDataParamaters addObject:@"costType"];
            }
            
            if (spellDataTags & LoLStaticSpellDataEffect) {
                [spellDataParamaters addObject:@"effect"];
            }
            
            if (spellDataTags & LoLStaticSpellDataEffectBurn) {
                [spellDataParamaters addObject:@"effectBurn"];
            }
            
            if (spellDataTags & LoLStaticSpellDataImage) {
                [spellDataParamaters addObject:@"image"];
            }
            
            if (spellDataTags & LoLStaticSpellDataKey) {
                [spellDataParamaters addObject:@"key"];
            }
            
            if (spellDataTags & LoLStaticSpellDataLevelTip) {
                [spellDataParamaters addObject:@"leveltip"];
            }
            
            if (spellDataTags & LoLStaticSpellDataMaxRank) {
                [spellDataParamaters addObject:@"maxrank"];
            }
            
            if (spellDataTags & LoLStaticSpellDataModes) {
                [spellDataParamaters addObject:@"modes"];
            }
            
            if (spellDataTags & LoLStaticSpellDataRange) {
                [spellDataParamaters addObject:@"range"];
            }
            
            if (spellDataTags & LoLStaticSpellDataRangeBurn) {
                [spellDataParamaters addObject:@"rangeBurn"];
            }
            
            if (spellDataTags & LoLStaticSpellDataResource) {
                [spellDataParamaters addObject:@"resource"];
            }
            
            if (spellDataTags & LoLStaticSpellDataSanitizedDescription) {
                [spellDataParamaters addObject:@"sanitizedDescription"];
            }
            
            if (spellDataTags & LoLStaticSpellDataSanitizedTooltip) {
                [spellDataParamaters addObject:@"sanitizedTooltip"];
            }
            
            if (spellDataTags & LoLStaticSpellDataTooltip) {
                [spellDataParamaters addObject:@"tooltip"];
            
            }
            
            if (spellDataTags & LoLStaticSpellDataVariables) {
                [spellDataParamaters addObject:@"vars"];
            }
        }
    }
    
    return [spellDataParamaters componentsJoinedByString:@","];
}


+ (NSString*)localeAsString:(LoLStaticDataLocale)locale
{
    static NSDictionary *localeDictionary;
    static dispatch_once_t onceToken;
    NSString *resultLocale;
    
    dispatch_once(&onceToken, ^{
        localeDictionary = @{
                             @(LoLStaticDataLocaleEnglishUS): @"en_US",
                             @(LoLStaticDataLocaleSpanish): @"es_ES",
                             @(LoLStaticDataLocaleFrench): @"fr_FR",
                             @(LoLStaticDataLocaleGerman): @"de_DE",
                             @(LoLStaticDataLocaleItalian): @"it_IT",
                             @(LoLStaticDataLocalePolish): @"pl_PL",
                             @(LoLStaticDataLocaleGreek): @"el_GR",
                             @(LoLStaticDataLocaleRomanian): @"ro_RO",
                             @(LoLStaticDataLocalePortugueseBrazil): @"pt_BR",
                             @(LoLStaticDataLocaleTurkish): @"tr_TR",
                             @(LoLStaticDataLocaleThai): @"th_TH",
                             @(LoLStaticDataLocaleVietnamese): @"vn_VN",
                             @(LoLStaticDataLocaleIndonesian): @"id_ID",
                             @(LoLStaticDataLocaleRussian): @"ru_RU",
                             @(LoLStaticDataLocaleKorean): @"ko_KR",
                             @(LoLStaticDataLocaleChineseChina): @"zh_CN",
                             @(LoLStaticDataLocaleChineseTaiwan): @"zh_TW"
                             };
    });
    
    resultLocale = [localeDictionary objectForKey:@(locale)];
    
    return resultLocale ? resultLocale : @"";
}

@end