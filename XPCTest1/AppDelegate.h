//
//  AppDelegate.h
//  XPCTest1
//
//  Created by Eric Kampman on 5/31/21.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property NSXPCConnection *connectionToService;
@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSTextField *resultField;

@end

