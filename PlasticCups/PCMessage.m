//
//  PCMessage.m
//  PlasticCups
//
//  Created by Gavin Williams on 30/08/2012.
//  Copyright (c) 2012 Gavin Williams. All rights reserved.
//

#import "PCMessage.h"

@implementation PCMessage

@synthesize command = _command;
@synthesize recipients = _recipients;

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
	
	for(PCRecipient *recipient in self.recipients){
		NSDictionary *recipientDict = [NSDictionary dictionaryWithObjectsAndKeys:
									recipient.host, @"host",
									recipient.port, @"port",
									   nil];
		[recipients addObject:recipientDict];
	}
	
	[message setValue:recipients forKey:@"recipients"];
	
	return [NSJSONSerialization dataWithJSONObject:message options:NSJSONReadingMutableContainers error:nil];
	
}

- (void) addRecipient:(PCRecipient *)recipient {
	[self.recipients addObject:recipient];
}

- (void) removeRecipient:(PCRecipient *)recipient {
	[self.recipients removeObject:recipient];
}

@end