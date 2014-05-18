//
//  LoLMatchHistorySummary.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLMatchHistorySummary : LoLBaseDTO

@property (nonatomic, strong) NSNumber *assists;
@property (nonatomic, strong) NSNumber *date;
@property (nonatomic, strong) NSNumber *deaths;
@property (nonatomic, strong) NSNumber *gameId;
@property (nonatomic, strong) NSString *gameMode;
@property (nonatomic, assign) BOOL invalid;
@property (nonatomic, strong) NSNumber *kills;
@property (nonatomic, strong) NSNumber *mapId;
@property (nonatomic, strong) NSNumber *opposingTeamKills;
@property (nonatomic, strong) NSString *opposingTeamName;
@property (nonatomic, assign) BOOL win;

@end