//
//  RVWebViewController.m
//  InfoQ
//
//  Created by 水 羽哲 on 13-8-26.
//  Copyright (c) 2013年 Macsyzer. All rights reserved.
//

#import "RVWebViewController.h"

@interface RVWebViewController ()

@end

@implementation RVWebViewController
@synthesize url;
@synthesize title;
@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    BOOL loadResult = [self loadWebRequest:self.url];
    NSLog(@"WEB %@ LOAD RESULT %hhd",self.url,loadResult);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)loadWebRequest:(NSString*)url{
    @try {
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url] cachePolicy:NSURLRequestReloadRevalidatingCacheData timeoutInterval:30];
        [self.webView loadRequest:request];
        return YES;
    }
    @catch (NSException *exception) {
        return NO;
        
    }
    @finally {
        return NO;
    }
}
@end
