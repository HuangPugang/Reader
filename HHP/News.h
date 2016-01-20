//
//  News.h
//  01-UITableView01-自定义Cell01-通过xib
//
//  Created by apple on 13-12-1.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject
@property (nonatomic, copy) NSString *title; // 标题
@property (nonatomic, copy) NSString *author; // 作者
@property (nonatomic, copy) NSString *icon; // 图片
@property (nonatomic, assign) int comments; // 评论数

- (id)initWithDict:(NSDictionary *)dict;
+ (id)newsWithDict:(NSDictionary *)dict;
@end
