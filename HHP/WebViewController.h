//
//  WebViewController.h
//  HHP
//
//  Created by Paul on 16/1/29.
//  Copyright © 2016年 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;
//传值属性
@property(nonatomic,copy)NSString* url;
@end
