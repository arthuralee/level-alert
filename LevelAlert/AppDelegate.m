//
//  LevelAlert
//
//  Created by Arthur Lee on 5/24/20.
//  Copyright © 2020 Skies Lab. All rights reserved.
//

#import "AppDelegate.h"
#import "LevelAlert-Swift.h"

@interface AppDelegate ()

@property (nonatomic, strong) NSDictionary *launchOptions;

@end

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.launchOptions = launchOptions;
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    UIViewController *rootViewController = [MainViewController new];
    self.window.rootViewController = rootViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
