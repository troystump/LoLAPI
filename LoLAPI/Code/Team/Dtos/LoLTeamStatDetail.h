//
//  LoLTeamStatDetail.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLTeamStatDetail : LoLBaseDTO

@property (nonatomic, assign) NSInteger averageGamesPlayed;
@property (nonatomic, assign) NSInteger losses;
@property (nonatomic, strong) NSString *teamStatType;
@property (nonatomic, assign) NSInteger wins;

@end