//
//  DPGesturePopViewController.m
//  Gesture_Pop_iOS7+
//
//  Created by handaer on 14-6-13.
//  Copyright (c) 2014年 yes. All rights reserved.
//

#import "DPGesturePopViewController.h"

extern BOOL enableGesturePop;

@interface DPGesturePopViewController ()

@end

@implementation DPGesturePopViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        enableGesturePop = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)buttonAction:(UIButton *)sender {
    UIViewController *vv = [UIViewController new];
    [vv.view setBackgroundColor:[UIColor redColor]];
    [self.navigationController pushViewController:vv animated:YES];
}

@end

