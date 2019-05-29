//
//  AppDelegate.m
//  GC3DTouchCode
//
//  Created by GarveyCalvin on 2019/5/28.
//  Copyright © 2019 GarveyCalvin. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"%s", __FUNCTION__);
    
    if (@available(iOS 9.0, *)) {
        UIApplicationShortcutIcon *searchIcon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch];
        UIApplicationShortcutItem *search = [[UIApplicationShortcutItem alloc] initWithType:@"search" localizedTitle:@"搜索" localizedSubtitle:nil icon:searchIcon userInfo:nil];
        
        UIApplicationShortcutIcon *publicIcon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"upload"];
        UIApplicationShortcutItem *public = [[UIApplicationShortcutItem alloc] initWithType:@"public" localizedTitle:@"一键发布" localizedSubtitle:nil icon:publicIcon userInfo:nil];
        
        UIApplicationShortcutItem *list = [[UIApplicationShortcutItem alloc] initWithType:@"list" localizedTitle:@"榜单" localizedSubtitle:@"全区排行" icon:nil userInfo:nil];
        
        application.shortcutItems = @[list, public, search];
    }
    
    return YES;
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler  API_AVAILABLE(ios(9.0)) {
    NSLog(@"%s", __FUNCTION__);
    
    if ([shortcutItem.type isEqualToString:@"search"]) {
        NSLog(@"用户从快捷方式“搜索”进来的");
    } else if ([shortcutItem.type isEqualToString:@"list"]) {
        NSLog(@"用户从快捷方式“榜单”进来的");
    } else if ([shortcutItem.type isEqualToString:@"public"]) {
        NSLog(@"用户从快捷方式“一键发布”进来的");
    }
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
