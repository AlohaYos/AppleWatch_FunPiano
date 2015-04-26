
#import "AppDelegate.h"
#import "AppData.h"

@interface AppDelegate ()

@property (strong, nonatomic) AppData *appData;	// サウンド管理クラス

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	// サウンド管理クラスを生成、初期化
	_appData = [AppData new];

	return YES;
}

// WatchKit extensionとの会話
- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void (^)(NSDictionary *))reply{
	
	NSLog(@"%s",__FUNCTION__);	// このメソッド名をデバッグ出力
	
	// Apple Watchから渡されたパラメータを取得する
	NSString *requestStr = [userInfo objectForKey:@"keyIndex"];
	int keyIndex = [requestStr intValue];
	
	// 音を鳴らす
	[_appData playSound:keyIndex];

	// Apple Watchへ応答を返す
	NSDictionary *response;
	response = @{@"response" : @""};
	reply(response);
}

@end
