//
//  NewsCell.h
//  HHP
//
//  Created by Paul on 16/1/20.
//  Copyright © 2016年 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface NewsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *desc;
@property (nonatomic, strong) News *news; // 模型数据

+ (id)newsCell;
+ (NSString *)ID;
@end
