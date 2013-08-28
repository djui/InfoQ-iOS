//
//  RVMenu2ViewController.h
//  InfoQ
//
//  Created by 水 羽哲 on 13-8-26.
//  Copyright (c) 2013年 Macsyzer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"

@interface RVMenu2ViewController : ECSlidingViewController<UITableViewDataSource,UITableViewDelegate>
@property NSMutableArray * chMenus;
@property NSMutableArray *enMenus;
@property NSString *selectCountry;
@property NSString *selectCat;
@property UITableView *tv;
- (IBAction)chinaButtonClick:(id)sender;
- (IBAction)usaButtonClick:(id)sender;
- (IBAction)whoAreYou:(id)sender;
@end
