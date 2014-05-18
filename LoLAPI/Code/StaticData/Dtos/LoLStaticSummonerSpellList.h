//
//  LoLStaticSummonerSpellList.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLStaticSummonerSpellList : LoLBaseDTO

@property (nonatomic, strong) NSDictionary *data; // Map[string, SummonerSpellDto]
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *version;

@end