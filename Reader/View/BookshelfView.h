//
//  BookshelfView.h
//  Reader
//
//  Created by zz on 12-12-4.
//  Copyright (c) 2012年 zz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BookshelfViewDelegate <NSObject>

-(void)addBook:(id)sender;
-(void)editBookList:(id)sender;

@end

@interface BookshelfView : UIView
{
    UITableView *bookList;
    UINavigationItem *nav;
    
    id <UITableViewDataSource> tableViewDataSource;
    id <UITableViewDelegate> tableViewDelegate;
    
    id <BookshelfViewDelegate> delegate;
}

@property (strong, nonatomic) UITableView *bookList;
@property (strong, nonatomic) UINavigationItem *nav;

@property (strong, nonatomic) id <UITableViewDelegate> tableViewDelegate;
@property (strong, nonatomic) id <UITableViewDataSource> tableViewDataSource;

@property (strong, nonatomic) id <BookshelfViewDelegate> delegate;
@end
