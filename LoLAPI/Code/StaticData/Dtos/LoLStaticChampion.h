//
//  LoLStaticChampion.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"
// dtos
#import "LoLStaticImage.h"
#import "LoLStaticInfo.h"
#import "LoLStaticPassive.h"
#import "LoLStaticStats.h"


@interface LoLStaticChampion : LoLBaseDTO

@property (nonatomic, strong) NSArray *allytips; // List[string]
@property (nonatomic, strong) NSString *blurb;
@property (nonatomic, strong) NSArray *enemytips; // List[string]
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, strong) LoLStaticImage *image;
@property (nonatomic, strong) LoLStaticInfo *info;
@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSString *lore;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *partype;
@property (nonatomic, strong) LoLStaticPassive *passive;
@property (nonatomic, strong) NSArray *recommended; // List[RecommendedDto]
@property (nonatomic, strong) NSArray *skins; // List[SkinDto]
@property (nonatomic, strong) NSArray *spells; // List[ChampionSpellDto]
@property (nonatomic, strong) LoLStaticStats *stats; // StatsDto
@property (nonatomic, strong) NSArray *tags; // List[string]
@property (nonatomic, strong) NSString *title;

@end