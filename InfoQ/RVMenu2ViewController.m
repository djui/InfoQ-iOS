//
//  RVMenu2ViewController.m
//  InfoQ
//
//  Created by 水 羽哲 on 13-8-26.
//  Copyright (c) 2013年 Macsyzer. All rights reserved.
//

#import "RVMenu2ViewController.h"
#import "RVMenu.h"
#import "RVMenuCell.h"
#import "RVContentsViewController.h"
#import "RVNavViewController.h"
@interface RVMenu2ViewController ()

@end

@implementation RVMenu2ViewController
@synthesize selectCat;
@synthesize selectCountry;
@synthesize enMenus;
@synthesize chMenus;
@synthesize  tv;
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
    
    NSLog(@"%@",self.childViewControllers);
    UITableViewController *tvc = self.childViewControllers[0];
    [self.slidingViewController setAnchorRightPeekAmount:180.0f];
    self.slidingViewController.underLeftWidthLayout = ECFullWidth;
    

    tv = tvc.view;
    
    tv.delegate=self;
    tv.dataSource=self;
    selectCountry = @"ch";
    selectCat=@"all";
    [self loadMenu];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)loadMenu{
    RVMenu *ch_news= [RVMenu new];
    ch_news.title=@"新闻";
    ch_news.content = @"news";
    
    RVMenu *ch_article = [RVMenu new];
    ch_article.title=@"文章";
    ch_article.content =@"articles";
    
    RVMenu *ch_event = [RVMenu new];
    ch_event.title=@"活动";
    ch_event.content =@"event";
    
    RVMenu * ch_all = [RVMenu new];
    ch_all.title=@"所有";
    ch_all.content=@"";
    
    RVMenu *en_news= [RVMenu new];
    en_news.title=@"News";
    en_news.content=@"news";
    
    RVMenu *en_article = [RVMenu new];
    en_article.title=@"Article";
    en_article.content=@"articles";
    
    RVMenu * en_all = [RVMenu new];
    en_all.title=@"All";
    en_all.content=@"";
    
    
    enMenus = [NSMutableArray arrayWithArray: [NSArray arrayWithObjects:en_all,en_news,en_article, nil]];
    chMenus = [NSMutableArray arrayWithArray:[NSArray arrayWithObjects:ch_all,ch_news,ch_article,ch_event, nil]];
    
    selectCountry = @"ch";
    selectCat = @"";
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if ([selectCountry isEqualToString:@"ch"]) {
        return [chMenus count];
    }
    return [enMenus count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"IDMenuCell";
    NSMutableArray *all=[NSMutableArray new];
    if ([selectCountry isEqualToString:@"ch"]) {
        all = chMenus;
    }
    else{
        all=enMenus;
    }
    
    RVMenu *menu = [all objectAtIndex:indexPath.row];
    RVMenuCell *menuCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    menuCell.title = menu.title;
    menuCell.image = [UIImage imageNamed:@"china.jpeg"];
    
    menuCell.titleLabel.text=menu.title;
    menuCell.imageImage.image= [UIImage imageNamed:@"china.jpeg"];

    return menuCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"load new view");
    NSMutableArray *all=[NSMutableArray new];
    if ([selectCountry isEqualToString:@"ch"]) {
        all = chMenus;
    }
    else{
        all=enMenus;
    }
    
    RVMenu *menu = [all objectAtIndex:indexPath.row];
    
    RVNavViewController * c= [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"TopViewController"];
    c.country=self.selectCountry;
    c.cat=menu.content;
    self.slidingViewController.topViewController = c;
    [self.slidingViewController resetTopView];
    [self presentedViewController];
    
}

- (IBAction)chinaButtonClick:(id)sender {
    selectCountry = @"ch";
    
    [tv reloadData];
    CGFloat h=284;
    CGFloat w=tv.contentSize.width;
    
    [UIView animateWithDuration:0.25 animations:^{
        CGRect frame = tv.frame;
        frame.size.height=h;
        tv.frame=frame;
    }];
}

- (IBAction)usaButtonClick:(id)sender {
    selectCountry=@"en";
    
    [tv reloadData];
    CGFloat h=213;
    CGFloat w=tv.contentSize.width;
    
    [UIView animateWithDuration:0.25 animations:^{
        CGRect frame = tv.frame;
        frame.size.height=h;
        tv.frame=frame;
    }];
}

- (IBAction)whoAreYou:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"zzZ..." message:@"Who are you?" delegate:self cancelButtonTitle:@"Go sleep~" otherButtonTitles:nil,nil];

    [alert show];
}

@end
