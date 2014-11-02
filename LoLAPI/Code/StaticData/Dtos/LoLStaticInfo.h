//
//  LoLStaticInfo.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLStaticInfo : LoLBaseDTO

@property (nonatomic, assign) NSInteger attack;
@property (nonatomic, assign) NSInteger defense;
@property (nonatomic, assign) NSInteger difficulty;
@property (nonatomic, assign) NSInteger magic;

@end