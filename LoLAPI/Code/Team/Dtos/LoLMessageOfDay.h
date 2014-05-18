//
//  LoLMessageOfDay.h
//  LoLAPI
//
//  Created by Troy Stump on 5/4/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLMessageOfDay : LoLBaseDTO

@property (nonatomic, strong) NSNumber *createDate;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSNumber *version;

@end