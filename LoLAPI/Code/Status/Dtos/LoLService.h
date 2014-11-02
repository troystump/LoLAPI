//
//  LoLService.h
//  LoLAPI
//
//  Created by Troy Stump on 10/25/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLService : LoLBaseDTO

@property (nonatomic, strong) NSArray *incidents; // List[Incident]
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *slug;
@property (nonatomic, strong) NSString *status;

@end