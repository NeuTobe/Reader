//
//  ViewController.h
//  Reader
//
//  Created by zz on 12-12-4.
//  Copyright (c) 2012年 zz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
#import "BookshelfView.h"
#import "ReadPageView.h"

@interface ViewController : UIViewController<writeOrReadOnDoc,UITableViewDataSource,UITableViewDelegate,ReadPageDelegate,BookshelfViewDelegate>

@property (strong, nonatomic) DataModel *dataModel;
@property (strong, nonatomic) BookshelfView *bookshelfView;
@property (strong, nonatomic) ReadPageView *readPageView;

@end
