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

@property (nonatomic, assign) NSInteger championId;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSArray *fellowPlayers; // List[PlayerDto]
@property (nonatomic, assign) NSInteger gameId;
@property (nonatomic, strong) NSString *gameMode;
@property (nonatomic, strong) NSString *gameType;
@property (nonatomic, assign) BOOL invalid;
@property (nonatomic, assign) NSInteger ipEarned;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, assign) NSInteger mapId;
@property (nonatomic, assign) NSInteger spell1;
@property (nonatomic, assign) NSInteger spell2;
@property (nonatomic, strong) LoLRawGameStats *stats;
@property (nonatomic, strong) NSString *subType;
@property (nonatomic, assign) NSInteger teamId;

@end