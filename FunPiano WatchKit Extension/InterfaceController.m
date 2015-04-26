
#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
}

- (void)willActivate {
    [super willActivate];
}

- (void)didDeactivate {
    [super didDeactivate];
}

#pragma mark - Piano key job

- (IBAction)keyC {
	[self playSound:100];	// ド
}
- (IBAction)keyCs {
	[self playSound:101];	// ド＃
}
- (IBAction)keyD {
	[self playSound:102];	// レ
}
- (IBAction)keyDs {			// レ＃
	[self playSound:103];
}
- (IBAction)keyE {			// ミ
	[self playSound:104];
}
- (IBAction)keyF {			// ファ
	[self playSound:105];
}
- (IBAction)keyFs {			// ファ＃
	[self playSound:106];
}
- (IBAction)keyG {			// ソ
	[self playSound:107];
}
- (IBAction)keyGs {			// ソ＃
	[self playSound:108];
}
- (IBAction)keyA {			// ラ
	[self playSound:109];
}
- (IBAction)keyAs {			// ラ＃
	[self playSound:110];
}
- (IBAction)keyB {			// シ
	[self playSound:111];
}
- (IBAction)keyCplus {		// ド（１オクターブ上）
	[self playSound:112];
}

- (void)playSound:(int)keyIndex {
	
	NSDictionary *requst = @{@"keyIndex":[NSNumber numberWithInt:keyIndex]};
	
	[InterfaceController openParentApplication:requst reply:^(NSDictionary *replyInfo, NSError *error) {
		
		if (error) {
			NSLog(@"%@", error);
		} else {
			NSLog(@"%@", [replyInfo objectForKey:@"response"]);
		}
	}];
}

@end



