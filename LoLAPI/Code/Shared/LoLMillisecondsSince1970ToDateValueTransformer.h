//
//  LoLMillisecondsSince1970ToDateValueTransformer.h
//  LoLAPI
//
//  Created by Troy Stump on 11/2/14.
//
//

#import "RKValueTransformers.h"


@interface LoLMillisecondsSince1970ToDateValueTransformer : RKValueTransformer

+ (instancetype)millisecondsSince1970ToDateValueTransformer;

@end