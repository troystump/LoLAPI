//
//  LoLAggregatedStats.h
//  LoLAPI
//
//  Created by Troy Stump on 4/27/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import "LoLBaseDTO.h"


@interface LoLAggregatedStats : LoLBaseDTO

@property (nonatomic, assign) NSInteger averageAssists;
@property (nonatomic, assign) NSInteger averageChampionsKilled;
@property (nonatomic, assign) NSInteger averageCombatPlayerScore;
@property (nonatomic, assign) NSInteger averageNodeCapture;
@property (nonatomic, assign) NSInteger averageNodeCaptureAssist;
@property (nonatomic, assign) NSInteger averageNodeNeutralize;
@property (nonatomic, assign) NSInteger averageNodeNeutralizeAssist;
@property (nonatomic, assign) NSInteger averageNumDeaths;
@property (nonatomic, assign) NSInteger averageObjectivePlayerScore;
@property (nonatomic, assign) NSInteger averageTeamObjective;
@property (nonatomic, assign) NSInteger averageTotalPlayerScore;
@property (nonatomic, assign) NSInteger botGamesPlayed;
@property (nonatomic, assign) NSInteger killingSpree;
@property (nonatomic, assign) NSInteger maxAssists;
@property (nonatomic, assign) NSInteger maxChampionsKilled;
@property (nonatomic, assign) NSInteger maxCombatPlayerScore;
@property (nonatomic, assign) NSInteger maxLargestCriticalStrike;
@property (nonatomic, assign) NSInteger maxLargestKillingSpree;
@property (nonatomic, assign) NSInteger maxNodeCapture;
@property (nonatomic, assign) NSInteger maxNodeCaptureAssist;
@property (nonatomic, assign) NSInteger maxNodeNeutralize;
@property (nonatomic, assign) NSInteger maxNodeNeutralizeAssist;
@property (nonatomic, assign) NSInteger maxNumDeaths;
@property (nonatomic, assign) NSInteger maxObjectivePlayerScore;
@property (nonatomic, assign) NSInteger maxTeamObjective;
@property (nonatomic, assign) NSInteger maxTimePlayed;
@property (nonatomic, assign) NSInteger maxTimeSpentLiving;
@property (nonatomic, assign) NSInteger maxTotalPlayerScore;
@property (nonatomic, assign) NSInteger mostChampionKillsPerSession;
@property (nonatomic, assign) NSInteger mostSpellsCast;
@property (nonatomic, assign) NSInteger normalGamesPlayed;
@property (nonatomic, assign) NSInteger rankedPremadeGamesPlayed;
@property (nonatomic, assign) NSInteger rankedSoloGamesPlayed;
@property (nonatomic, assign) NSInteger totalAssists;
@property (nonatomic, assign) NSInteger totalChampionKills;
@property (nonatomic, assign) NSInteger totalDamageDealt;
@property (nonatomic, assign) NSInteger totalDamageTaken;
@property (nonatomic, assign) NSInteger totalDeathsPerSession;
@property (nonatomic, assign) NSInteger totalDoubleKills;
@property (nonatomic, assign) NSInteger totalFirstBlood;
@property (nonatomic, assign) NSInteger totalGoldEarned;
@property (nonatomic, assign) NSInteger totalHeal;
@property (nonatomic, assign) NSInteger totalMagicDamageDealt;
@property (nonatomic, assign) NSInteger totalMinionKills;
@property (nonatomic, assign) NSInteger totalNeutralMinionsKilled;
@property (nonatomic, assign) NSInteger totalNodeCapture;
@property (nonatomic, assign) NSInteger totalNodeNeutralize;
@property (nonatomic, assign) NSInteger totalPentaKills;
@property (nonatomic, assign) NSInteger totalPhysicalDamageDealt;
@property (nonatomic, assign) NSInteger totalQuadraKills;
@property (nonatomic, assign) NSInteger totalSessionsLost;
@property (nonatomic, assign) NSInteger totalSessionsPlayed;
@property (nonatomic, assign) NSInteger totalSessionsWon;
@property (nonatomic, assign) NSInteger totalTripleKills;
@property (nonatomic, assign) NSInteger totalTurretsKilled;
@property (nonatomic, assign) NSInteger totalUnrealKills;

@end