//
//  LoLVersion.h
//  LoLAPI
//
//  Created by Troy Stump on 2/13/14.
//  Copyright (c) 2014 Troy Stump. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LoLVersion : NSObject

// properties
@property NSUInteger major;
@property NSUInteger minor;


// methods
- (id)initWithMajorVersion:(NSInteger)majorVersion andMinorVersion:(NSInteger)minorVersion;
- (NSString*)getVersion;

@end