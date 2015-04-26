
#import <AVFoundation/AVFoundation.h>
#import "AppData.h"

@implementation AppData {
	
	AVAudioPlayer	*_sound;
	NSArray*		soundNameArray;
}

- (id)init {
	
	[self setSoundNameArray];
	
	return self;
}

#pragma mark - Sound job


-(void)playSound:(int)index {
	
	if(_sound == nil) {
		_sound = [AVAudioPlayer alloc];
	}
	
	index -= 100;
	
	NSString *soundPath = [[NSBundle mainBundle] pathForResource:[soundNameArray objectAtIndex:index] ofType:@"m4a"];
	NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
	[_sound initWithContentsOfURL:soundURL error:nil];
//	_sound = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
	
	[_sound setCurrentTime:0.0];	// 連続再生
	[_sound setVolume:1.0];
	[_sound play];
}


#pragma mark - Initialize job

- (void)setSoundNameArray {
	
	soundNameArray = [NSArray arrayWithObjects:@"Piano-3C", @"Piano-3Cs", @"Piano-3D", @"Piano-3Ds", @"Piano-3E", @"Piano-3F", @"Piano-3Fs", @"Piano-3G", @"Piano-3Gs", @"Piano-3A", @"Piano-3As", @"Piano-3B", @"Piano-4C", nil];
}

@end
