//
//  ZSRPreviewController.m
//  My3DTouch
//
//  Created by admin on 16/9/7.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ZSRPreviewController.h"

@implementation ZSRPreviewController
-(void)viewDidLoad{
    [super viewDidLoad];
    
    CGFloat width = self.preferredContentSize.width;
    CGFloat height = self.preferredContentSize.height;

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(width * 0.5 - 50, height * 0.5 - 25, 100, 50)];
    label.text = [NSString stringWithFormat:@"数据%ld",(long)self.index];
    label.layer.cornerRadius = 5;
    label.layer.masksToBounds = YES;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:label];
    self.view.backgroundColor = [UIColor greenColor];
}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"确定" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"确定");
    }];

    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"取消" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"取消");
    }];
    
    NSArray *actions = @[action1,action2];
    return actions;
}

@end
