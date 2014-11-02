//
//  LoLTranslation.h
//  LoLAPI
//
//  Created by Troy Stump on 10/26/14.
//
//

#import "LoLBaseDTO.h"


@interface LoLTranslation : LoLBaseDTO

@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *locale;
@property (nonatomic, strong) NSString *created_at;

@end