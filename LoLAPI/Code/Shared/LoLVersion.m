//
//  LoLVersion.m
//  LoLAPI
//
//  Created by Troy Stump on 2/13/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import "LoLVersion.h"


@implementation LoLVersion

- (id)initWithMajorVersion:(NSInteger)majorVersion andMinorVersion:(NSInteger)minorVersion
{
    if (self = [super init]) {
        _major = majorVersion;
        _minor = minorVersion;
    }
    
    return self;
}


- (NSString*)getVersion
{
    NSString* major;
    NSString* minor;
    
    
    if (_major > 0)
        {
        major = [@(_major) stringValue];
        }
    else
        {
        major = @"0";
        }
    
    if (_minor > 0)
        {
        minor = [@"." stringByAppendingString:[@(_minor) stringValue]];
        }
    else
        {
        minor = @"";
        }
    
    return [major stringByAppendingString:minor];
}

@end