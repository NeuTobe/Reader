//
//  DataModel.h
//  Reader
//
//  Created by zz on 12-12-4.
//  Copyright (c) 2012年 zz. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol writeOrReadOnDoc <NSObject>
@optional
-(void)writeData;
-(void)readData;


@end

@interface DataModel : NSObject
{
    NSArray *books;
    NSMutableArray *bookList;
    
    NSString *lpstr;
    NSString *bookmarks;
    
    NSArray *pageCaches;
    
    NSInteger *pageNum;
    
    id <writeOrReadOnDoc> delegate;
}

@property (strong, nonatomic) NSArray *books;
@property (strong, nonatomic) NSMutableArray *bookList;
@property (strong, nonatomic) NSString *lpstr;
@property (strong, nonatomic) NSString *bookmarks;
@property (strong, nonatomic) NSArray *pageCaches;
@property ( nonatomic) NSInteger *pageNum;

@property (strong, nonatomic) id <writeOrReadOnDoc> delegate;

+(DataModel *)shareModel;
@end
