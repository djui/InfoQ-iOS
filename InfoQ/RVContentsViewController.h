//
//  RVContentsViewController.h
//  InfoQ
//
//  Created by 水 羽哲 on 13-8-26.
//  Copyright (c) 2013年 Macsyzer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"

@interface RVContentsViewController : ECSlidingViewController<UITableViewDataSource,UITableViewDelegate>
@property NSMutableArray *contents;
@property NSString *country;
@property NSString *cat;

@end
