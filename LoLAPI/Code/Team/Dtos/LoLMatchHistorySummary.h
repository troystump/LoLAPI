//
//  LoLMatchHistorySummary.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLMatchHistorySummary : LoLBaseDTO

@property (nonatomic, assign) NSInteger assists;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, assign) NSInteger deaths;
@property (nonatomic, assign) NSInteger gameId;
@property (nonatomic, strong) NSString *gameMode;
@property (nonatomic, assign) BOOL invalid;
@property (nonatomic, assign) NSInteger kills;
@property (nonatomic, assign) NSInteger mapId;
@property (nonatomic, assign) NSInteger opposingTeamKills;
@property (nonatomic, strong) NSString *opposingTeamName;
@property (nonatomic, assign) BOOL win;

@end