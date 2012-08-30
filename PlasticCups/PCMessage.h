//
//  PCMessage.h
//  PlasticCups
//
//  Created by Gavin Williams on 30/08/2012.
//  Copyright (c) 2012 Gavin Williams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PCCommand.h"
#import "GCDAsyncSocket.h"

@interface PCMessage : NSObject

@property (nonatomic, strong) PCCommand *command;
@property (nonatomic, strong) NSMutableArray *recipients;
@property (nonatomic, strong) GCDAsyncSocket *sender;

+ (PCMessage *) decode: (NSData *) message error: (NSError **) error;
- (NSData *) encode;
- (void) addRecipient: (GCDAsyncSocket *) recipient;

@end