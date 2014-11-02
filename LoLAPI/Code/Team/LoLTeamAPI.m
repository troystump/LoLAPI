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
#import "LoLRoster.h"
#import "LoLTeam.h"
#import "LoLTeamMemberInfo.h"
#import "LoLTeamStatDetail.h"


@implementation LoLTeamAPI

- (id)initWithConfig:(LoLAPIConfig*)apiConfig hostURL:(NSURL*)hostURL andPathToAPI:(NSString*)apiPath usingRegion:(LoLRegionID)selectedRegion
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
    RKObjectMapping *rosterMapping;
    RKObjectMapping *teamMemberInfoMapping;
    RKObjectMapping *teamStatDetailMapping;
    NSMutableArray *teamPropertyNames = [LoLTeam getAllPropertyNames];
    NSMutableArray *rosterPropertyNames = [LoLRoster getAllPropertyNames];
    
    
    // remove any relationship mapping attributes to avoid "duplicate mapping" error
    [teamPropertyNames removeObjectsInArray:@[@"matchHistory", @"roster", @"teamStatDetails"]];
    [rosterPropertyNames removeObject:@"memberList"];
    
    // create mapping for Team DTO
    teamMapping = [RKObjectMapping mappingForClass:[LoLTeam class]];
    [teamMapping addAttributeMappingsFromArray:teamPropertyNames];
    
    // create mapping for MatchHistorySummary DTO
    matchHistorySummaryMapping = [RKObjectMapping mappingForClass:[LoLMatchHistorySummary class]];
    [matchHistorySummaryMapping addAttributeMappingsFromArray:[LoLMatchHistorySummary getAllPropertyNames]];
    
    // create mapping for a Roster DTO
    rosterMapping = [RKObjectMapping mappingForClass:[LoLRoster class]];
    [rosterMapping addAttributeMappingsFromArray:rosterPropertyNames];
    
    // create mapping for a TeamMemberInfo DTO
    teamMemberInfoMapping = [RKObjectMapping mappingForClass:[LoLTeamMemberInfo class]];
    [teamMemberInfoMapping addAttributeMappingsFromArray:[LoLTeamMemberInfo getAllPropertyNames]];
    
    // create mapping for a TeamStatDetail DTO
    teamStatDetailMapping = [RKObjectMapping mappingForClass:[LoLTeamStatDetail class]];
    [teamStatDetailMapping addAttributeMappingsFromArray:[LoLTeamStatDetail getAllPropertyNames]];
    
    // create relationship mapping to link the MatchHistorySummary DTO to the Team DTO
    [teamMapping addRelationshipMappingWithSourceKeyPath:@"matchHistory" mapping:matchHistorySummaryMapping];
    
    // create relationship mapping to link the Roster DTO to the Team DTO
    [teamMapping addRelationshipMappingWithSourceKeyPath:@"roster" mapping:rosterMapping];
    
    // create relationship mapping to link the TeamStatDetailMapping DTO to the Team DTO
    [teamMapping addRelationshipMappingWithSourceKeyPath:@"teamStatDetails" mapping:teamStatDetailMapping];

    // create relationship mapping to link the TeamMemberInfo DTO to the Roster DTO
    [rosterMapping addRelationshipMappingWithSourceKeyPath:@"memberList" mapping:teamMemberInfoMapping];
    
    // LoL api uses the team IDs as keys into a dictionary of teams
    // since these keys are dynamic, we need to dynamically map each of these
    // team keys onto a team object.
    RKDynamicMapping* dynamicTeamMapping = [[RKDynamicMapping alloc] init];
    [dynamicTeamMapping setObjectMappingForRepresentationBlock:^RKObjectMapping *(id representation) {
         NSArray* teamIDs = [representation allKeys];
         RKObjectMapping *teamIDAsKeyMapping = [RKObjectMapping mappingForClass:[NSMutableDictionary class]];
         
         
         for (NSString *teamID in teamIDs) {
             [teamIDAsKeyMapping addRelationshipMappingWithSourceKeyPath:teamID mapping:teamMapping];
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