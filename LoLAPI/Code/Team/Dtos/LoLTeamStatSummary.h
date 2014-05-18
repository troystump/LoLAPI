//
//  LoLTeamStatSummary.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLTeamStatSummary : LoLBaseDTO

@property (nonatomic, strong) NSString *fullId;
@property (nonatomic, strong) NSArray *teamStatDetails; // List[TeamStatDetailDto]

@end