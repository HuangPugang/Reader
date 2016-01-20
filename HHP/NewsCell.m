//
//  NewsCell.m
//  HHP
//
//  Created by Paul on 16/1/20.
//  Copyright © 2016年 Paul. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(id)newsCell{
    return [[NSBundle mainBundle] loadNibNamed:@"NewsCell" owner:nil options:nil][0];
}

- (void)setNews:(News *)news
{
    // 0.保存成员变量
    _news = news;
    
    // 1.标题
    _title.text = news.title;
    
    // 2.作者
    _desc.text = news.author;
    
    [_image sd_setImageWithURL:[NSURL URLWithString:[@"http://tnfs.tngou.net/image" stringByAppendingString:news.icon]]
              placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
}
+ (NSString *)ID
{
    return @"mynews";
}

@end
