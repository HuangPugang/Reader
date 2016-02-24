//
//  News.m
//  01-UITableView01-自定义Cell01-通过xib
//
//  Created by apple on 13-12-1.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "News.h"

@implementation News

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        // 解析字典属性
        self.title = dict[@"title"];
        
        self.author = dict[@"description"];
        
        self.icon = dict[@"img"];
        
    }
    return self;
}

+ (id)newsWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}


@end
