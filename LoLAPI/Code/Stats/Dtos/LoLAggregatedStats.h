//
//  LoLAggregatedStats.h
//  LoLAPI
//
//  Created by Troy Stump on 4/27/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import "LoLBaseDTO.h"


@interface LoLAggregatedStats : LoLBaseDTO

@property (nonatomic, strong) NSNumber *averageAssists;
@property (nonatomic, strong) NSNumber *averageChampionsKilled;
@property (nonatomic, strong) NSNumber *averageCombatPlayerScore;
@property (nonatomic, strong) NSNumber *averageNodeCapture;
@property (nonatomic, strong) NSNumber *averageNodeCaptureAssist;
@property (nonatomic, strong) NSNumber *averageNodeNeutralize;
@property (nonatomic, strong) NSNumber *averageNodeNeutralizeAssist;
@property (nonatomic, strong) NSNumber *averageNumDeaths;
@property (nonatomic, strong) NSNumber *averageObjectivePlayerScore;
@property (nonatomic, strong) NSNumber *averageTeamObjective;
@property (nonatomic, strong) NSNumber *averageTotalPlayerScore;
@property (nonatomic, strong) NSNumber *botGamesPlayed;
@property (nonatomic, strong) NSNumber *killingSpree;
@property (nonatomic, strong) NSNumber *maxAssists;
@property (nonatomic, strong) NSNumber *maxChampionsKilled;
@property (nonatomic, strong) NSNumber *maxCombatPlayerScore;
@property (nonatomic, strong) NSNumber *maxLargestCriticalStrike;
@property (nonatomic, strong) NSNumber *maxLargestKillingSpree;
@property (nonatomic, strong) NSNumber *maxNodeCapture;
@property (nonatomic, strong) NSNumber *maxNodeCaptureAssist;
@property (nonatomic, strong) NSNumber *maxNodeNeutralize;
@property (nonatomic, strong) NSNumber *maxNodeNeutralizeAssist;
@property (nonatomic, strong) NSNumber *maxNumDeaths;
@property (nonatomic, strong) NSNumber *maxObjectivePlayerScore;
@property (nonatomic, strong) NSNumber *maxTeamObjective;
@property (nonatomic, strong) NSNumber *maxTimePlayed;
@property (nonatomic, strong) NSNumber *maxTimeSpentLiving;
@property (nonatomic, strong) NSNumber *maxTotalPlayerScore;
@property (nonatomic, strong) NSNumber *mostChampionKillsPerSession;
@property (nonatomic, strong) NSNumber *mostSpellsCast;
@property (nonatomic, strong) NSNumber *normalGamesPlayed;
@property (nonatomic, strong) NSNumber *rankedPremadeGamesPlayed;
@property (nonatomic, strong) NSNumber *rankedSoloGamesPlayed;
@property (nonatomic, strong) NSNumber *totalAssists;
@property (nonatomic, strong) NSNumber *totalChampionKills;
@property (nonatomic, strong) NSNumber *totalDamageDealt;
@property (nonatomic, strong) NSNumber *totalDamageTaken;
@property (nonatomic, strong) NSNumber *totalDeathsPerSession;
@property (nonatomic, strong) NSNumber *totalDoubleKills;
@property (nonatomic, strong) NSNumber *totalFirstBlood;
@property (nonatomic, strong) NSNumber *totalGoldEarned;
@property (nonatomic, strong) NSNumber *totalHeal;
@property (nonatomic, strong) NSNumber *totalMagicDamageDealt;
@property (nonatomic, strong) NSNumber *totalMinionKills;
@property (nonatomic, strong) NSNumber *totalNeutralMinionsKilled;
@property (nonatomic, strong) NSNumber *totalNodeCapture;
@property (nonatomic, strong) NSNumber *totalNodeNeutralize;
@property (nonatomic, strong) NSNumber *totalPentaKills;
@property (nonatomic, strong) NSNumber *totalPhysicalDamageDealt;
@property (nonatomic, strong) NSNumber *totalQuadraKills;
@property (nonatomic, strong) NSNumber *totalSessionsLost;
@property (nonatomic, strong) NSNumber *totalSessionsPlayed;
@property (nonatomic, strong) NSNumber *totalSessionsWon;
@property (nonatomic, strong) NSNumber *totalTripleKills;
@property (nonatomic, strong) NSNumber *totalTurretsKilled;
@property (nonatomic, strong) NSNumber *totalUnrealKills;

@end