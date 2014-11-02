//
//  LoLShard.h
//  LoLAPI
//
//  Created by Troy Stump on 10/20/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLShard : LoLBaseDTO

@property (nonatomic, strong) NSString *hostname;
@property (nonatomic, strong) NSArray *locales; // List[string]
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *region_tag;
@property (nonatomic, strong) NSString *slug;

@end