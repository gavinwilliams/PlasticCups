//
//  PCCommand.h
//  PlasticCups
//
//  Created by Gavin Williams on 30/08/2012.
//  Copyright (c) 2012 Gavin Williams. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCCommand : NSObject

@property (nonatomic, strong) NSString *command;
@property (nonatomic, strong) NSDictionary *data;

- (void) execute;

@end