//
//  WebViewController.m
//  HHP
//
//  Created by Paul on 16/1/29.
//  Copyright © 2016年 Paul. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@end

@implementation WebViewController
@synthesize url = _url;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = _url;
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    
    [_webView loadRequest:request];
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
