//
//  ListViewController.m
//  HHP
//
//  Created by Paul on 16/1/20.
//  Copyright © 2016年 Paul. All rights reserved.
//

#import "ListViewController.h"
#import "News.h"
#import "NewsCell.h"
#import "AFNetworking.h"
#import <MJRefresh/MJRefresh.h>
@interface ListViewController ()
{
    NSMutableArray *_newses;
}
@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _newses = [NSMutableArray array];
    self.table.rowHeight = 100;
    [self networkRequest];
    self.table.mj_header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        NSLog(@"开始刷新！");
        [self networkRequest];
  
        
    }];
    self.table.mj_footer =[MJRefreshAutoGifFooter footerWithRefreshingBlock:^{
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        NSString *string  = @"http://www.tngou.net/api/lore/list?id=1&page=";
        NSString *str = [string stringByAppendingFormat:@"%ld", _page];
        [manager GET:str parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
            _page++;
            [self.table.mj_footer endRefreshing];
            
            //已经转为NSMutableDictionary了
            NSArray *list = [responseObject objectForKey:@"tngou"];
            
            for (NSDictionary *dict in list) {
                [_newses addObject:[News newsWithDict:dict]];
            }
            [self.table reloadData];
            
            
            //            NSLog(@"%ld",[_newses count]);
            
        } failure:^(NSURLSessionTask *operation, NSError *error) {
            NSLog(@"Error: %@", error);
            
            [self.table.mj_footer endRefreshing];
        }];
    }];

    
    
    
}

-(void)headerRereshing{
    
}
-(void)setTo: (int) n over:(int) d{
    NSLog(@"%d,%d",n,d);
}
-(void)networkRequest{
    
    _page=2;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://www.tngou.net/api/lore/list?id=1" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        //已经转为NSMutableDictionary了
        //        NSData *jsonData = [responseObject dataUsingEncoding:NSUTF8StringEncoding];
        //        NSMutableDictionary *resultDict = [str objectFromJSONString];
        NSLog(@"name is :%@",[responseObject objectForKey:@"tngou"]);
        NSArray *list = [responseObject objectForKey:@"tngou"];
        _newses = [NSMutableArray array];
        for (NSDictionary *dict in list) {
            [_newses addObject:[News newsWithDict:dict]];
        }
        [self.table reloadData];

        [self.table.mj_header endRefreshing];
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [self.table.mj_header endRefreshing];
    }];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _newses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.从缓存池中取出cell
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:[NewsCell ID]];
    
    // 2.缓存池中没有cell
    if (cell == nil) {
        // 创建一个Cell对象
        cell = [NewsCell newsCell];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // 3.传递模型数据
    [cell setNews:_newses[indexPath.row]];
    //    cell.news = _newses[indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
