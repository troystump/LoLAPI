//
//  LoLStaticGold.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLStaticGold : LoLBaseDTO

@property (nonatomic, strong) NSNumber *base;
@property (nonatomic, assign) BOOL purchasable;
@property (nonatomic, strong) NSNumber *sell;
@property (nonatomic, strong) NSNumber *total;

@end