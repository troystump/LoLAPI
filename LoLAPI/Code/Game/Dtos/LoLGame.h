//
//  LoLGame.h
//  LoLAPI
//
//  Created by Troy Stump on 2/8/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoLBaseDTO.h"
#import "LoLRawGameStats.h"


@interface LoLGame : LoLBaseDTO

@property (nonatomic, strong) NSNumber *championId;
@property (nonatomic, strong) NSNumber *createDate;
@property (nonatomic, strong) NSArray *fellowPlayers; // list of player models
@property (nonatomic, strong) NSNumber *gameId;
@property (nonatomic, strong) NSString *gameMode;
@property (nonatomic, strong) NSString *gameType;
@property (nonatomic, assign) BOOL invalid;
@property (nonatomic, strong) NSNumber *ipEarned;
@property (nonatomic, strong) NSNumber *level;
@property (nonatomic, strong) NSNumber *mapId;
@property (nonatomic, strong) NSNumber *spell1;
@property (nonatomic, strong) NSNumber *spell2;
@property (nonatomic, strong) LoLRawGameStats *stats;
@property (nonatomic, strong) NSString *subType;
@property (nonatomic, strong) NSNumber *teamId;

@end