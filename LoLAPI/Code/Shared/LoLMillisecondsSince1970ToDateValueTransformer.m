//
//  LoLMillisecondsSince1970ToDateValueTransformer.m
//  LoLAPI
//
//  Created by Troy Stump on 11/2/14.
//
//

#import "LoLMillisecondsSince1970ToDateValueTransformer.h"


@implementation LoLMillisecondsSince1970ToDateValueTransformer

+ (instancetype)millisecondsSince1970ToDateValueTransformer
{
    LoLMillisecondsSince1970ToDateValueTransformer *millisecondsSince1970ToDateValueTransformer = [self new];

    
    return millisecondsSince1970ToDateValueTransformer;
}


- (BOOL)validateTransformationFromClass:(Class)inputValueClass toClass:(Class)outputValueClass
{
    return [inputValueClass isSubclassOfClass:[NSNumber class]] && [outputValueClass isSubclassOfClass:[NSDate class]];
}


- (BOOL)transformValue:(id)inputValue toValue:(id *)outputValue ofClass:(Class)outputValueClass error:(NSError **)error
{
    RKValueTransformerTestInputValueIsKindOfClass(inputValue, (@[ [NSNumber class] ]), error);
    RKValueTransformerTestOutputValueClassIsSubclassOfClass(outputValueClass, (@[ [NSDate class] ]), error);
    *outputValue = [NSDate dateWithTimeIntervalSince1970:[inputValue unsignedLongValue] / 1000.f];
    
    return YES;
}

@end