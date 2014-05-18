//
//  LoLTeamStatDetail.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLTeamStatDetail : LoLBaseDTO

@property (nonatomic, strong) NSNumber *averageGamesPlayed;
@property (nonatomic, strong) NSString *fullId;
@property (nonatomic, strong) NSNumber *losses;
@property (nonatomic, strong) NSString *teamStatType;
@property (nonatomic, strong) NSNumber *wins;

@end