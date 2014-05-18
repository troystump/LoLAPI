//
//  LoLBaseDTO.m
//  LoLAPI
//
//  Created by Troy Stump on 4/21/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import <objc/runtime.h>
#import "LoLBaseDTO.h"


@implementation LoLBaseDTO

+ (NSMutableArray*)getAllPropertyNames
{
    unsigned int numberOfProperties;
    objc_property_t *properties = class_copyPropertyList([self class], &numberOfProperties);
    NSMutableArray *propertyNames = [NSMutableArray array];
    
    
    for (unsigned int nextPropertyIndex = 0; nextPropertyIndex < numberOfProperties; ++nextPropertyIndex) {
        objc_property_t property = properties[nextPropertyIndex];
        NSString *nameOfProperty = [NSString stringWithUTF8String:property_getName(property)];
        
        
        [propertyNames addObject:nameOfProperty];
    }
    
    free(properties);
    
    return propertyNames;
}

@end