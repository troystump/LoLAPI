//
//  LoLStaticRuneList.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"
#import "LoLStaticBasicData.h"


@interface LoLStaticRuneList : LoLBaseDTO

@property (nonatomic, strong) LoLStaticBasicData *basic;
@property (nonatomic, strong) NSDictionary *data; // Map[string, RuneDto]
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *version;

@end