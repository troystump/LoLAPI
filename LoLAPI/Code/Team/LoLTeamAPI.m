//
//  LoLTeamAPI.m
//  LoLAPI
//
//  Created by Troy Stump on 2/17/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import <RestKit/RestKit.h>
#import "LoLTeamAPI.h"
#import "LoLBaseAPIPrivate.h"
// dtos
#import "LoLMatchHistorySummary.h"
#import "LoLMessageOfDay.h"
#import "LoLRoster.h"
#import "LoLTeam.h"
#import "LoLTeamMemberInfo.h"
#import "LoLTeamStatDetail.h"
#import "LoLTeamStatSummary.h"


@implementation LoLTeamAPI

-(id) initWithConfig:(LoLAPIConfig*)apiConfig hostURL:(NSURL*)hostURL andPathToAPI:(NSString*)apiPath usingRegion:(LoLRegionID)selectedRegion
{
    if (self = [super initWithConfig:apiConfig hostURL:hostURL andPathToAPI:apiPath usingRegion:selectedRegion]) {
        [self setupDTOMappings];
    }
    
    return self;
}


- (void)getTeamsForSummonersWithIDs:(NSArray*)summonerIDs usingAPIKey:(NSString*)apiKey success:(void(^)(NSDictionary *teams))successBlock failure:(void(^)(NSError *error))failureBlock;
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/by-summoner/%@", self.relativePathToBaseURL, [summonerIDs componentsJoinedByString:@","]]
                                           parameters:@{
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];
}


- (void)getTeamsForTeamsWithIDs:(NSArray*)teamIDs usingAPIKey:(NSString*)apiKey success:(void(^)(NSDictionary *teams))successBlock failure:(void(^)(NSError *error))failureBlock;
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@/%@", self.relativePathToBaseURL, [teamIDs componentsJoinedByString:@","]]
                                           parameters:@{
                                                        @"api_key": apiKey
                                                        }
                                              success:success
                                              failure:failure];
}



#pragma mark - Private Helpers

- (void)setupDTOMappings
{
    [self.apiManager addResponseDescriptorsFromArray:[self loadTeamDTOMapping]];
}


- (NSArray*)loadTeamDTOMapping
{
    RKObjectMapping *teamMapping;
    RKObjectMapping *matchHistorySummaryMapping;
    RKObjectMapping *messageOfDayMapping;
    RKObjectMapping *rosterMapping;
    RKObjectMapping *teamStatSummaryMapping;
    RKObjectMapping *teamMemberInfoMapping;
    RKObjectMapping *teamStatDetailMapping;
    NSMutableArray *teamPropertyNames = [LoLTeam getAllPropertyNames];
    NSMutableArray *rosterPropertyNames = [LoLRoster getAllPropertyNames];
    NSMutableArray *teamStatSummaryPropertyNames = [LoLTeamStatSummary getAllPropertyNames];
    
    
    // remove any relationship mapping attributes to avoid "duplicate mapping" error
    [teamPropertyNames removeObjectsInArray:@[@"matchHistory", @"messageOfDay", @"roster", @"teamStatSummary"]];
    [rosterPropertyNames removeObject:@"memberList"];
    [teamStatSummaryPropertyNames removeObject:@"teamStatDetails"];
    
    // create mapping for Team DTO
    teamMapping = [RKObjectMapping mappingForClass:[LoLTeam class]];
    [teamMapping addAttributeMappingsFromArray:teamPropertyNames];
    
    // create mapping for MatchHistorySummary DTO
    matchHistorySummaryMapping = [RKObjectMapping mappingForClass:[LoLMatchHistorySummary class]];
    [matchHistorySummaryMapping addAttributeMappingsFromArray:[LoLMatchHistorySummary getAllPropertyNames]];
    
    // create mapping for a MessageOfDay DTO
    messageOfDayMapping = [RKObjectMapping mappingForClass:[LoLMessageOfDay class]];
    [messageOfDayMapping addAttributeMappingsFromArray:[LoLMessageOfDay getAllPropertyNames]];
    
    // create mapping for a Roster DTO
    rosterMapping = [RKObjectMapping mappingForClass:[LoLRoster class]];
    [rosterMapping addAttributeMappingsFromArray:rosterPropertyNames];
    
    // create mapping for a TeamStatSummary DTO
    teamStatSummaryMapping = [RKObjectMapping mappingForClass:[LoLTeamStatSummary class]];
    [teamStatSummaryMapping addAttributeMappingsFromArray:teamStatSummaryPropertyNames];

    // create mapping for a TeamMemberInfo DTO
    teamMemberInfoMapping = [RKObjectMapping mappingForClass:[LoLTeamMemberInfo class]];
    [teamMemberInfoMapping addAttributeMappingsFromArray:[LoLTeamMemberInfo getAllPropertyNames]];
    
    // create mapping for a TeamStatDetail DTO
    teamStatDetailMapping = [RKObjectMapping mappingForClass:[LoLTeamStatDetail class]];
    [teamStatDetailMapping addAttributeMappingsFromArray:[LoLTeamStatDetail getAllPropertyNames]];
    
    // create relationship mapping to link the MatchHistorySummary DTO to the Team DTO
    [teamMapping addRelationshipMappingWithSourceKeyPath: @"matchHistory" mapping:matchHistorySummaryMapping];
    
    // create relationship mapping to link the MessageOfDay DTO to the Team DTO
    [teamMapping addRelationshipMappingWithSourceKeyPath: @"messageOfDay" mapping:messageOfDayMapping];
    
    // create relationship mapping to link the Roster DTO to the Team DTO
    [teamMapping addRelationshipMappingWithSourceKeyPath: @"roster" mapping:rosterMapping];
    
    // create relationship mapping to link the TeamStatSummary DTO to the Team DTO
    [teamMapping addRelationshipMappingWithSourceKeyPath: @"teamStatSummary" mapping:teamStatSummaryMapping];

    // create relationship mapping to link the TeamMemberInfo DTO to the Roster DTO
    [rosterMapping addRelationshipMappingWithSourceKeyPath: @"memberList" mapping:teamMemberInfoMapping];
    
    // create relationship mapping to link the TeamStatDetailMapping DTO to the TeamStatSummary DTO
    [teamStatSummaryMapping addRelationshipMappingWithSourceKeyPath: @"teamStatDetails" mapping:teamStatDetailMapping];
    
    // LoL api uses the team IDs as keys into a dictionary of teams
    // since these keys are dynamic, we need to dynamically map each of these
    // team keys onto a team object.
    RKDynamicMapping* dynamicTeamMapping = [[RKDynamicMapping alloc] init];
    [dynamicTeamMapping setObjectMappingForRepresentationBlock:^RKObjectMapping *(id representation)
     {
         NSArray* teamIDs = [representation allKeys];
         RKObjectMapping *teamIDAsKeyMapping = [RKObjectMapping mappingForClass:[NSMutableDictionary class]];
         
         
         for (NSNumber *teamID in teamIDs)
         {
             [teamIDAsKeyMapping addRelationshipMappingWithSourceKeyPath:[NSString stringWithFormat:@"%@", teamID] mapping:teamMapping];
         }
         
         return teamIDAsKeyMapping;
     }];

    return @[
             [RKResponseDescriptor responseDescriptorWithMapping:dynamicTeamMapping
                                                          method:RKRequestMethodGET
                                                     pathPattern:[NSString stringWithFormat:@"%@/by-summoner/:summonerIds", self.relativePathToBaseURL]
                                                         keyPath:nil
                                                     statusCodes:nil],
             [RKResponseDescriptor responseDescriptorWithMapping:dynamicTeamMapping
                                                          method:RKRequestMethodGET
                                                     pathPattern:[NSString stringWithFormat:@"%@/:teamIds", self.relativePathToBaseURL]
                                                         keyPath:nil
                                                     statusCodes:nil]
             ];
}

@end