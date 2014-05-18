//
//  LoLStaticMetaData.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLStaticMetaData : LoLBaseDTO

@property (nonatomic, assign) BOOL isRune;
@property (nonatomic, strong) NSString *tier;
@property (nonatomic, strong) NSString *type;

@end