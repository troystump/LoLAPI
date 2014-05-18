//
//  LoLStaticInfo.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLStaticInfo : LoLBaseDTO

@property (nonatomic, strong) NSNumber *attack;
@property (nonatomic, strong) NSNumber *defense;
@property (nonatomic, strong) NSNumber *difficulty;
@property (nonatomic, strong) NSNumber *magic;

@end