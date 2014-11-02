//
//  LoLLeagueItem.h
//  LoLAPI
//
//  Created by Troy Stump on 4/26/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import "LoLBaseDTO.h"
#import "LoLMiniSeries.h"


@interface LoLLeagueEntry : LoLBaseDTO

@property (nonatomic, strong) NSString *division;
@property (nonatomic, assign) BOOL isFreshBlood;
@property (nonatomic, assign) BOOL isHotStreak;
@property (nonatomic, assign) BOOL isInactive;
@property (nonatomic, assign) BOOL isVeteran;
@property (nonatomic, assign) NSInteger leaguePoints;
@property (nonatomic, strong) LoLMiniSeries *miniSeries;
@property (nonatomic, strong) NSString *playerOrTeamId;
@property (nonatomic, strong) NSString *playerOrTeamName;
@property (nonatomic, assign) NSInteger wins;

@end