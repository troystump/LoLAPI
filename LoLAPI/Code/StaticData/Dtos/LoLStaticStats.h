//
//  LoLStaticStats.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLStaticStats : LoLBaseDTO

@property (nonatomic, assign) double armor;
@property (nonatomic, assign) double armorperlevel;
@property (nonatomic, assign) double attackdamage;
@property (nonatomic, assign) double attackdamageperlevel;
@property (nonatomic, assign) double attackrange;
@property (nonatomic, assign) double attackspeedoffset;
@property (nonatomic, assign) double attackspeedperlevel;
@property (nonatomic, assign) double crit;
@property (nonatomic, assign) double critperlevel;
@property (nonatomic, assign) double hp;
@property (nonatomic, assign) double hpperlevel;
@property (nonatomic, assign) double hpregen;
@property (nonatomic, assign) double hpregenperlevel;
@property (nonatomic, assign) double movespeed;
@property (nonatomic, assign) double mp;
@property (nonatomic, assign) double mpperlevel;
@property (nonatomic, assign) double mpregen;
@property (nonatomic, assign) double mpregenperlevel;
@property (nonatomic, assign) double spellblock;
@property (nonatomic, assign) double spellblockperlevel;

@end