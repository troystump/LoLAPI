//
//  LoLSummoner.h
//  LoLAPI
//
//  Created by Troy Stump on 2/8/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoLBaseDTO.h"


@interface LoLSummoner : LoLBaseDTO

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *profileIconId;
@property (nonatomic, strong) NSNumber *revisionDate; // summoner last modified
@property (nonatomic, strong) NSNumber *summonerLevel;

@end