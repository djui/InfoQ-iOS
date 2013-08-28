//
//  RVNavViewController.m
//  InfoQ
//
//  Created by 水 羽哲 on 13-8-26.
//  Copyright (c) 2013年 Macsyzer. All rights reserved.
//

#import "RVNavViewController.h"
#import "RVMenu2ViewController.h"
#import "RVContentsViewController.h"
#import "MTA.h"

@interface RVNavViewController ()

@end

@implementation RVNavViewController
@synthesize country;
@synthesize cat;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    self.view.layer.shadowOpacity = 0.45f;
    self.view.layer.shadowRadius = 9.0f;
    self.view.layer.shadowColor = [UIColor whiteColor].CGColor;
    



}
-(void)viewDidAppear:(BOOL)animated{
    
    [MTA trackPageViewBegin:@"nav"];
}
-(void)viewDidDisappear:(BOOL)animated{
    [MTA trackPageViewEnd:@"nav"];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //[self performSegueWithIdentifier:@"IDPushContents" sender:nil];
    NSLog(@"%@",self.childViewControllers);
    RVContentsViewController *c= self.childViewControllers[0];
    if(!self.country){
        c.country=@"ch";
        c.cat=@"";

    }
    else{
    c.country=self.country;
    c.cat=self.cat;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
