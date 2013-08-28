//
//  RVMenuCell.h
//  InfoQ
//
//  Created by 水 羽哲 on 13-8-26.
//  Copyright (c) 2013年 Macsyzer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RVMenuCell : UITableViewCell
@property NSString *title;
@property UIImage *image;
@property (weak, nonatomic) IBOutlet UIImageView *imageImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end
