//
//  LoLStaticItemList.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"
// dtos
#import "LoLStaticBasicData.h"


@interface LoLStaticItemList : LoLBaseDTO

@property (nonatomic, strong) LoLStaticBasicData *basic;
@property (nonatomic, strong) NSDictionary *data; // Map[string, ItemDto]
@property (nonatomic, strong) NSArray *groups; // List[GroupDto]
@property (nonatomic, strong) NSArray *tree; // List[ItemTreeDto]
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *version;

@end