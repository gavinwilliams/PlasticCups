//
//  PCMessage.m
//  PlasticCups
//
//  Created by Gavin Williams on 30/08/2012.
//  Copyright (c) 2012 Gavin Williams. All rights reserved.
//

#import "PCMessage.h"

@implementation PCMessage

@synthesize command;
@synthesize recipients;

+ (PCMessage *) decode: (NSData *) message error:(NSError *__autoreleasing *)error {

	PCMessage *pcmessage = [[self alloc] init];
	
	/*
	NSDictionary *decodedmessage = [NSJSONSerialization JSONObjectWithData:message options:NSJSONReadingMutableContainers error:error];
	*/
	
	return pcmessage;
	
}

- (NSData *) encode {
	
	NSMutableDictionary *message = [NSMutableDictionary dictionaryWithObjectsAndKeys:
								[NSDictionary dictionaryWithObjectsAndKeys:
									self.command.command, @"command",
									self.command.data,
								 nil], @"command",
							 nil];
	
	NSMutableArray *recipients = [NSMutableArray array];
	
	for(GCDAsyncSocket *socket in self.recipients){
		[recipients addObject:socket.connectedHost]
	}
	
}

- (void) addRecipient:(GCDAsyncSocket *)recipient {
	[self.recipients addObject:recipient];
}

@end