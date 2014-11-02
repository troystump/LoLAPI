//
//  LoLStaticItem.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"
//dtos
#import "LoLStaticGold.h"
#import "LoLStaticImage.h"
#import "LoLStaticMetaData.h"
#import "LoLStaticBasicDataStats.h"


@interface LoLStaticItem : LoLBaseDTO

@property (nonatomic, strong) NSString *colloq;
@property (nonatomic, assign) BOOL consumeOnFull;
@property (nonatomic, assign) BOOL consumed;
@property (nonatomic, assign) NSInteger depth;
@property (nonatomic, strong) NSString *rawDescription;
@property (nonatomic, strong) NSDictionary *effect; // Map[string, string]
@property (nonatomic, strong) NSArray *from; // List[string]
@property (nonatomic, strong) LoLStaticGold *gold;
@property (nonatomic, strong) NSString *group;
@property (nonatomic, assign) BOOL hideFromAll;
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, strong) LoLStaticImage *image;
@property (nonatomic, assign) BOOL inStore;
@property (nonatomic, strong) NSArray *into; // List[string]
@property (nonatomic, strong) NSDictionary *maps; // Map[string, boolean]
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *plaintext;
@property (nonatomic, strong) NSString *requiredChampion;
@property (nonatomic, strong) LoLStaticMetaData *rune;
@property (nonatomic, strong) NSString *sanitizedDescription;
@property (nonatomic, assign) NSInteger specialRecipe;
@property (nonatomic, assign) NSInteger stacks;
@property (nonatomic, strong) LoLStaticBasicDataStats *stats;
@property (nonatomic, strong) NSArray *tags; // List[string]

@end