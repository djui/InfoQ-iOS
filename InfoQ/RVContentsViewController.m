//
//  RVContentsViewController.m
//  InfoQ
//
//  Created by 水 羽哲 on 13-8-26.
//  Copyright (c) 2013年 Macsyzer. All rights reserved.
//

#import "RVContentsViewController.h"
#import "AFJSONRequestOperation.h"
#import "RVContent.h"
#import "RVContentCell.h"
#import "RVWebViewController.h"
#import "RVMenu2ViewController.h"
#import "MTA.h"
@interface RVContentsViewController ()

@end

@implementation RVContentsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewDidAppear:(BOOL)animated{
    [MTA trackPageViewBegin:[self.country stringByAppendingString:self.cat]];
    NSLog(@"track begin");
    [MTA trackPageViewEnd:[self.country stringByAppendingString:self.cat]];

}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"load contents view");
    
    self.view.layer.shadowOpacity = 0.45f;
    self.view.layer.shadowRadius = 9.0f;
    self.view.layer.shadowColor = [UIColor whiteColor].CGColor;
    [self.navigationController.navigationBar setBackgroundColor:[UIColor blackColor]];

    UIImage *image= [UIImage imageNamed:@"infoQ-logo"];
    
    UIImageView *i=[[UIImageView alloc] initWithImage:image];
    i.contentMode=UIViewContentModeScaleAspectFit;
    i.frame = CGRectMake(0, 0, 30, 30);
    self.navigationItem.titleView=i;

    

        if (![self.slidingViewController.underLeftViewController isKindOfClass:[RVMenu2ViewController class]]) {
            self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"IDMenu"];
        }
        
        [self.view addGestureRecognizer:self.slidingViewController.panGesture];
        [self.slidingViewController setAnchorRightRevealAmount:260.0f];
   
    
    
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.contents = [NSMutableArray new];
    UITableViewController *tvc = self.childViewControllers[0];
    
    UITableView * tv = tvc.view;
    
    tv.delegate=self;
    tv.dataSource=self;
    NSLog(@"counrty %@ cat %@",self.country,self.cat);
    [self loadContents:self.country cat:self.cat uitableView:tv];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadContents:(NSString*)country cat:(NSString *)cat uitableView:(UITableView*)tabView{
    NSString * remoteUrl = [NSString stringWithFormat:@"http://infoqhelp.sinaapp.com/app/daily?country=%@&cat=%@",country,cat];
    NSURL *url = [NSURL URLWithString:remoteUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSDictionary * jsonDict = (NSDictionary *)JSON;
        NSArray *results = [jsonDict objectForKey:@"contents"];
        [results enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            RVContent *content = [RVContent new];
            content.title = [obj objectForKey:@"title"];
            content.summary = [obj objectForKey:@"summary"];
            content.guid = [obj objectForKey:@"guid"];
            [self.contents addObject:content];
           // NSLog(@"get %@",content.title);
            
        }];
        [tabView reloadData];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"CONTENTS OF %@ & %@ LOAD FAILED",country,cat);
    }];
    [operation start];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.contents.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RVContent *content = [self.contents objectAtIndex:indexPath.row];
    
    RVContentCell * contentCell = [tableView dequeueReusableCellWithIdentifier:@"IDContentCell" forIndexPath:indexPath];
    contentCell.titleLabel.text = content.title;
    contentCell.summaryLabel.text = content.summary;
    return contentCell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"IDPushWebView"])
    {
        // Get reference to the destination view controller
        RVWebViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        [vc setUrl:sender];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RVContent *content=[self.contents objectAtIndex:indexPath.row];
    if([self.cat isEqualToString:@"event"]){
        NSString *guid =content.guid;
        [self performSegueWithIdentifier:@"IDPushWebView" sender:guid];
        
    }else
    {
    NSString *guid=[@"http://infoqhelp.sinaapp.com/queryit?url=" stringByAppendingString: content.guid];
    NSLog(@"%@",guid);
    
    [self performSegueWithIdentifier:@"IDPushWebView" sender:guid];
    }
    
    
    
}
@end
