//
//  AppDelegate.m
//  My3DTouch
//
//  Created by admin on 16/9/7.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "AppDelegate.h"
#import "ZSRViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    ZSRViewController *vc = [[ZSRViewController alloc] init];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nvc;
    [self.window makeKeyAndVisible];
    [self createShortcutItems];
    return YES;
}

-(void)createShortcutItems{
    //自定义图片要透明的才会有图案，不然是黑色一片
    UIApplicationShortcutItem* item1 = [self createShortcutItemWithTitle:@"拍照" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCapturePhoto]];
    UIApplicationShortcutItem* item2 = [self createShortcutItemWithTitle:@"联系人" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeContact]];
    UIApplicationShortcutItem* item3 = [self createShortcutItemWithTitle:@"美化" icon:[UIApplicationShortcutIcon iconWithTemplateImageName:@"美化"]];
    UIApplicationShortcutItem* item4 = [self createShortcutItemWithTitle:@"任务" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeTask]];
    [UIApplication sharedApplication].shortcutItems = @[item1,item2,item3,item4];
}

-(UIApplicationShortcutItem *)createShortcutItemWithTitle:(NSString *)title icon:(UIApplicationShortcutIcon *)icon{
   return [[UIApplicationShortcutItem alloc]initWithType:title
                                          localizedTitle:title
                                       localizedSubtitle:nil
                                                    icon:icon
                                                userInfo:nil];
}

-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    NSArray<NSString *> *itemsNames = @[@"拍照", @"联系人", @"美化",@"任务"];
    NSUInteger index = [itemsNames indexOfObject:shortcutItem.localizedTitle];
    

    NSLog(@"%@",itemsNames[index]);
    switch (index) {
        case 0:
            
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            break;
            
        default:
            break;
    }
}

@end
