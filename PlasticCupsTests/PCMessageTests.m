//
//  PCMessageTests.m
//  PlasticCups
//
//  Created by Gavin Williams on 30/08/2012.
//  Copyright (c) 2012 Gavin Williams. All rights reserved.
//

#import "PCMessageTests.h"

@implementation PCMessageTests

- (void) setUp {
	[super setUp];
}

- (void) tearDown {
	[super tearDown];
}

- (void) testEncode {
	
	NSError *error = nil;
	
	PCMessage *message = [[PCMessage alloc] init];
	
	PCRecipient *recipient = [[PCRecipient alloc] init];
	recipient.host = @"testhost.local";
	recipient.port = [NSNumber numberWithInt:123];
	
	[message addRecipient:recipient];
	
	PCCommand *command = [[PCCommand alloc] init];
	command.command = @"test";
	command.data = [NSDictionary dictionaryWithObjectsAndKeys:@"testobject", @"testkey", nil];
	
	message.command = command;
	
	NSData *messageData = [message encode];
	
	NSDictionary *testData = [NSJSONSerialization JSONObjectWithData:messageData options:NSJSONReadingMutableContainers error:&error];
	
	// Begin the encode test
	STAssertNil(error, @"There should be no errors passing back data");
	STAssertNotNil(testData, @"Test data should contain a string");
	
}

@end
