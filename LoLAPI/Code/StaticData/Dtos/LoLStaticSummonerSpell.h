//
//  LoLStaticSummonerSpell.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"
#import "LoLStaticImage.h"
#import "LoLStaticLevelTip.h"
#import "LoLStaticSpellVariables.h"


@interface LoLStaticSummonerSpell : LoLBaseDTO

@property (nonatomic, strong) NSArray *cooldown; // List[double]
@property (nonatomic, strong) NSString *cooldownBurn;
@property (nonatomic, strong) NSArray *cost; // List[int]
@property (nonatomic, strong) NSString *costBurn;
@property (nonatomic, strong) NSString *costType;
@property (nonatomic, strong) NSString *rawDescription; // "description" property of response
@property (nonatomic, strong) NSArray *effect; // List[object] This field is a List of List of Integer.
@property (nonatomic, strong) NSArray *effectBurn; // List[string]
@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) LoLStaticImage *image;
@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) LoLStaticLevelTip *leveltip;
@property (nonatomic, strong) NSNumber *maxrank;
@property (nonatomic, strong) NSArray *modes; // List[string]
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSObject *range; // This field is either a List of Integer or the String 'self' for spells that target one's own champion.
@property (nonatomic, strong) NSString *rangeBurn;
@property (nonatomic, strong) NSString *resource;
@property (nonatomic, strong) NSString *sanitizedDescription;
@property (nonatomic, strong) NSString *sanitizedTooltip;
@property (nonatomic, strong) NSNumber *summonerLevel;
@property (nonatomic, strong) NSString *tooltip;
@property (nonatomic, strong) NSArray *vars; // List[SpellVarsDto]

@end