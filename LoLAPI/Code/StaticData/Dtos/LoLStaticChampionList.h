//
//  LoLStaticChampionList.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLStaticChampionList : LoLBaseDTO

@property (nonatomic, strong) NSDictionary *data; // Map[string, ChampionDto]
@property (nonatomic, strong) NSString *format;
@property (nonatomic, strong) NSDictionary *keys; // Map[string, string]
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *version;

@end