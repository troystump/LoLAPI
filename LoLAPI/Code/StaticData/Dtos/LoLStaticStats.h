//
//  LoLStaticStats.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLStaticStats : LoLBaseDTO

@property (nonatomic, strong) NSNumber *armor;
@property (nonatomic, strong) NSNumber *armorperlevel;
@property (nonatomic, strong) NSNumber *attackdamage;
@property (nonatomic, strong) NSNumber *attackdamageperlevel;
@property (nonatomic, strong) NSNumber *attackrange;
@property (nonatomic, strong) NSNumber *attackspeedoffset;
@property (nonatomic, strong) NSNumber *attackspeedperlevel;
@property (nonatomic, strong) NSNumber *crit;
@property (nonatomic, strong) NSNumber *critperlevel;
@property (nonatomic, strong) NSNumber *hp;
@property (nonatomic, strong) NSNumber *hpperlevel;
@property (nonatomic, strong) NSNumber *hpregen;
@property (nonatomic, strong) NSNumber *hpregenperlevel;
@property (nonatomic, strong) NSNumber *movespeed;
@property (nonatomic, strong) NSNumber *mp;
@property (nonatomic, strong) NSNumber *mpperlevel;
@property (nonatomic, strong) NSNumber *mpregen;
@property (nonatomic, strong) NSNumber *mpregenperlevel;
@property (nonatomic, strong) NSNumber *spellblock;
@property (nonatomic, strong) NSNumber *spellblockperlevel;

@end