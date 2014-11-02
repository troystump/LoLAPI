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

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger profileIconId;
@property (nonatomic, strong) NSDate *revisionDate; // summoner last modified
@property (nonatomic, assign) NSInteger summonerLevel;

@end