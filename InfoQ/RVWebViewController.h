//
//  RVWebViewController.h
//  InfoQ
//
//  Created by 水 羽哲 on 13-8-26.
//  Copyright (c) 2013年 Macsyzer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RVWebViewController : UIViewController
@property NSString *url;
@property NSString *title;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end
