//
//  RVViewController.m
//  InfoQ
//
//  Created by 水 羽哲 on 13-8-26.
//  Copyright (c) 2013年 Macsyzer. All rights reserved.
//

#import "RVViewController.h"
#import "ECSlidingViewController.h"

@interface RVViewController ()

@end

@implementation RVViewController
-(void)viewWillAppear:(BOOL)animated{
    self.view.layer.shadowOpacity = 0.45f;
    self.view.layer.shadowRadius = 9.0f;
    self.view.layer.shadowColor = [UIColor whiteColor].CGColor;
    

    
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TopViewController"];
    NSLog(@"dne");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
