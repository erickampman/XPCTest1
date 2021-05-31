//
//  AppDelegate.m
//  XPCTest1
//
//  Created by Eric Kampman on 5/31/21.
//
#import "TextServiceProtocol.h"

#import "AppDelegate.h"

@interface AppDelegate () {
//	NSMutableString *resultText;
}

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	/* Apple's comment: To use the service from an application or other process, use NSXPCConnection to establish a connection to the service by doing something like this: */

	_connectionToService = [[NSXPCConnection alloc] initWithServiceName:@"com.unlikelyware.TextService"];
	_connectionToService.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(TextServiceProtocol)];
	[_connectionToService resume];

	/* Apple's comment: Once you have a connection to the service, you can use it like this: */
	[[_connectionToService remoteObjectProxy] upperCaseString:@"hello" withReply:^(NSString *aString) {
		// Apple's comment: We have received a response. Update our text field, but do it on the main thread.
		NSLog(@"Result string was: %@", aString);
	}];

}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
	/* Apple's comment: And, when you are finished with the service, clean up the connection like this: */
	[_connectionToService invalidate];
}

- (IBAction)doProcessText:(NSButton *)sender {
	NSString *textString = [_textField stringValue];
	
	if (0 == [textString length]) {
		return;
	}
	[[_connectionToService remoteObjectProxy] upperCaseString:textString withReply:^(NSString *aString) {
		NSLog(@"Result string was: %@", aString);
		
		dispatch_async(dispatch_get_main_queue(), ^{
			[self.resultField setStringValue:aString];
			[self.resultField needsDisplay];
		});
	}];
}

@end
