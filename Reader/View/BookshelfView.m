//
//  BookshelfView.m
//  Reader
//
//  Created by zz on 12-12-4.
//  Copyright (c) 2012年 zz. All rights reserved.
//

#import "BookshelfView.h"

@implementation BookshelfView

@synthesize bookList,nav;
@synthesize tableViewDelegate,tableViewDataSource;
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        bookList = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, 320, 420) style:UITableViewStylePlain];
        bookList.delegate = tableViewDelegate;
        bookList.dataSource = tableViewDataSource;
        
        nav = [[UINavigationItem alloc] initWithTitle:@"Books"];
        UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target:self.delegate action:@selector(addBook:)];
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self.delegate action:@selector(editBookList:)];
        nav.leftBarButtonItem = leftButton;
        nav.rightBarButtonItem = rightButton;
        
        NSArray *itemArray = [NSArray arrayWithObject:nav];
        UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 20, 320, 40)];
        navBar.items = itemArray;
        
        [self addSubview:bookList];
        
        [self addSubview:navBar];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


@end
