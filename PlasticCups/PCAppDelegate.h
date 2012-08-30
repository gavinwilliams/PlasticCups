//
//  PCAppDelegate.h
//  PlasticCups
//
//  Created by Gavin Williams on 30/08/2012.
//  Copyright (c) 2012 Gavin Williams. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PCAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveAction:(id)sender;

@end
