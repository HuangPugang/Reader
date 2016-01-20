//
//  ListViewController.h
//  HHP
//
//  Created by Paul on 16/1/20.
//  Copyright © 2016年 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *table;
@property NSInteger page;
@end
