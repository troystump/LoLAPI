//
//  LoLTeam.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"
#import "LoLMessageOfDay.h"
#import "LoLRoster.h"
#import "LoLTeamStatSummary.h"

@interface LoLTeam : LoLBaseDTO

@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSString *fullId;
@property (nonatomic, strong) NSDate *lastGameDate;
@property (nonatomic, strong) NSDate *lastJoinDate;
@property (nonatomic, strong) NSDate *lastJoinedRankedTeamQueueDate;
@property (nonatomic, strong) NSArray *matchHistory;	// List[MatchHistorySummaryDto]
@property (nonatomic, strong) LoLMessageOfDay *messageOfDay;
@property (nonatomic, strong) NSDate *modifyDate;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) LoLRoster *roster;
@property (nonatomic, strong) NSDate *secondLastJoinDate;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) LoLTeamStatSummary *teamStatSummary;
@property (nonatomic, strong) NSDate *thirdLastJoinDate;

@end