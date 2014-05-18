//
//  LoLStaticSpellVariables.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLStaticSpellVariables : LoLBaseDTO

@property (nonatomic, strong) NSArray* coeff; // List[double]
@property (nonatomic, strong) NSString *dyn;
@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *ranksWith;

@end