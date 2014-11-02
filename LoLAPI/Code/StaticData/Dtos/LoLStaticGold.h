//
//  LoLStaticGold.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLStaticGold : LoLBaseDTO

@property (nonatomic, assign) NSInteger base;
@property (nonatomic, assign) BOOL purchasable;
@property (nonatomic, assign) NSInteger sell;
@property (nonatomic, assign) NSInteger total;

@end