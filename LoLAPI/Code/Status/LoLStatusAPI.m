//
//  LoLStatusAPI.m
//  LoLAPI
//
//  Created by Troy Stump on 2/9/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import <Restkit/Restkit.h>
#import "LoLStatusAPI.h"
#import "LoLBaseAPIPrivate.h"
// dtos
#import "LoLService.h"
#import "LoLIncident.h"
#import "LoLMessage.h"
#import "LoLTranslation.h"


@implementation LoLStatusAPI

- (instancetype)initWithConfig:(LoLAPIConfig*)apiConfig hostURL:(NSURL*)hostURL andPathToAPI:(NSString*)apiPath usingRegion:(LoLRegionID)selectedRegion
{
    if (self = [super initWithConfig:apiConfig hostURL:hostURL andPathToAPI:apiPath usingRegion:selectedRegion]) {
        [self setupDTOMappings];
    }
    
    return self;
}


- (void)getShardsWithSuccess:(void(^)(NSArray *shards))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result array]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@shards", [self urlSafeRelativePathWithTrailingSlash]]
                           parameters:nil
                              success:success
                              failure:failure];
}


- (void)getShardStatusWithRegion:(LoLRegionID)region success:(void(^)(LoLShardStatus *shardStatus))successBlock failure:(void(^)(NSError *error))failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock([result firstObject]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    
    
    [self.apiManager getObjectsAtPath:[NSString stringWithFormat:@"%@shards/%@", [self urlSafeRelativePathWithTrailingSlash], [LoLRegionHelper getRegionWithID:region].value]
                           parameters:nil
                              success:success
                              failure:failure];
}



#pragma mark - Private Helpers

- (void)setupDTOMappings
{
    [self.apiManager addResponseDescriptorsFromArray:[self loadShardDTOMapping]];
    
    [self.apiManager addResponseDescriptorsFromArray:[self loadShardStatusDTOMapping]];
}


- (NSArray*)loadShardDTOMapping
{
    RKObjectMapping *shardMapping;
    
    
    // create mapping for Shard DTO
    shardMapping = [RKObjectMapping mappingForClass:[LoLShard class]];
    [shardMapping addAttributeMappingsFromArray:[LoLShard getAllPropertyNames]];
    
    
    return @[
             [RKResponseDescriptor responseDescriptorWithMapping:shardMapping
                                                          method:RKRequestMethodGET
                                                     pathPattern:@"shards"
                                                         keyPath:nil
                                                     statusCodes:nil]
             ];
}


- (NSArray*)loadShardStatusDTOMapping
{
    RKObjectMapping *shardStatusMapping;
    RKObjectMapping *serviceMapping;
    RKObjectMapping *incidentMapping;
    RKObjectMapping *messageMapping;
    RKObjectMapping *translationMapping;
    NSMutableArray *shardStatusPropertyNames = [LoLShardStatus getAllPropertyNames];
    NSMutableArray *servicePropertyNames = [LoLService getAllPropertyNames];
    NSMutableArray *incidentPropertyNames = [LoLIncident getAllPropertyNames];
    NSMutableArray *messagePropertyNames = [LoLMessage getAllPropertyNames];


    // remove any relationship mapping attributes to avoid "duplicate mapping" error
    [shardStatusPropertyNames removeObject:@"services"];
    [servicePropertyNames removeObject:@"incidents"];
    [incidentPropertyNames removeObject:@"updates"];
    [messagePropertyNames removeObject:@"translations"];
    
    // create mapping for ShardStatus DTO
    shardStatusMapping = [RKObjectMapping mappingForClass:[LoLShardStatus class]];
    [shardStatusMapping addAttributeMappingsFromArray:shardStatusPropertyNames];
    
    // create mapping for Service DTO
    serviceMapping = [RKObjectMapping mappingForClass:[LoLService class]];
    [serviceMapping addAttributeMappingsFromArray:servicePropertyNames];
    
    // create mapping for Incident DTO
    incidentMapping = [RKObjectMapping mappingForClass:[LoLIncident class]];
    [incidentMapping addAttributeMappingsFromArray:incidentPropertyNames];
    
    // create mapping for Message DTO
    messageMapping = [RKObjectMapping mappingForClass:[LoLMessage class]];
    [messageMapping addAttributeMappingsFromArray:messagePropertyNames];
    
    // create mapping for Translation DTO
    translationMapping = [RKObjectMapping mappingForClass:[LoLTranslation class]];
    [translationMapping addAttributeMappingsFromArray:[LoLTranslation getAllPropertyNames]];

    // create relationship mapping to link the array of Service DTOs to the ShardStatus DTO
    [shardStatusMapping addRelationshipMappingWithSourceKeyPath:@"services" mapping:serviceMapping];

    // create relationship mapping to link the array of Incident DTOs to the Service DTO
    [serviceMapping addRelationshipMappingWithSourceKeyPath:@"incidents" mapping:incidentMapping];
    
    // create relationship mapping to link the array of Message DTOs to the Incident DTO
    [incidentMapping addRelationshipMappingWithSourceKeyPath:@"updates" mapping:messageMapping];
    
    // create relationship mapping to link the array of Translation DTOs to the Message DTO
    [messageMapping addRelationshipMappingWithSourceKeyPath:@"translations" mapping:translationMapping];
    
    
    return @[
             [RKResponseDescriptor responseDescriptorWithMapping:shardStatusMapping
                                                          method:RKRequestMethodGET
                                                     pathPattern:@"shards/:region"
                                                         keyPath:nil
                                                     statusCodes:nil]
             ];
}

@end