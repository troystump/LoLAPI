//
//  LoLMessage.h
//  LoLAPI
//
//  Created by Troy Stump on 10/26/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLMessage : LoLBaseDTO

@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *created_at;
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, strong) NSString *severity;
@property (nonatomic, strong) NSArray *translations;
@property (nonatomic, strong) NSString *updated_at;

@end