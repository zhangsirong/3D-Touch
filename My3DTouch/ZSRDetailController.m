//
//  ZSRDetailController.m
//  My3DTouch
//
//  Created by admin on 16/9/7.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ZSRDetailController.h"

@implementation ZSRDetailController
-(void)viewDidLoad{
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    label.text = [NSString stringWithFormat:@"数据%ld",(long)self.index];
    label.layer.cornerRadius = 5;
    label.layer.masksToBounds = YES;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor orangeColor];
    label.center = self.view.center;
    
    [self.view addSubview:label];
    
    self.view.backgroundColor = [UIColor greenColor];
}
@end
